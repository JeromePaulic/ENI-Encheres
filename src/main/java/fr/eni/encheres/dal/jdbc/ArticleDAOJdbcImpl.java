package fr.eni.encheres.dal.jdbc;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import fr.eni.encheres.bo.Adresse;
import fr.eni.encheres.bo.Article;
import fr.eni.encheres.dal.AdresseDAO;
import fr.eni.encheres.dal.ArticleDAO;
import fr.eni.encheres.dal.CategorieDAO;
import fr.eni.encheres.dal.ConnectionProvider;
import fr.eni.encheres.dal.DAOFactory;
import fr.eni.encheres.dal.UtilisateurDAO;

public class ArticleDAOJdbcImpl implements ArticleDAO {
	
	private final String INSERT_ARTICLE = "INSERT INTO ARTICLES (no_adresse, nom_article, description, date_debut_encheres, date_fin_encheres, prix_initial, no_vendeur, no_categorie) VALUES (?,?,?,?,?,?,?,?);";
	private final String SELECT_ALL = "SELECT no_article, no_adresse, nom_article, description, date_debut_encheres, date_fin_encheres, prix_initial, prix_vente, no_vendeur, no_categorie FROM ARTICLES;";
	private final String SELECT_BY_ID = "SELECT no_article, no_adresse, nom_article, description, date_debut_encheres, date_fin_encheres, prix_initial, prix_vente, no_vendeur, no_categorie FROM ARTICLES WHERE no_article = ?;";
	private final String SELECT_FILTRES = "SELECT no_article, no_adresse, nom_article, description, date_debut_encheres, date_fin_encheres, prix_initial, prix_vente, no_vendeur, no_categorie FROM ARTICLES WHERE ";
	
	@Override
	public Article getArticleById(int id) {
		Article article = null;
		try(Connection cnx = ConnectionProvider.getConnection();
				PreparedStatement pstmt = cnx.prepareStatement(SELECT_BY_ID)) {
			pstmt.setInt(1, id);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					article = buildArticle(rs);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return article;
	}

	@Override
	public List<Article> getArticlesFiltres(String recherche, Integer noCategorie) {
		List<Article> articles = new ArrayList<>();
		Map<String, Object> params = new HashMap<>();
		String rechercheParam = "";
		String noCategorieParam = "";
		
		if (recherche != null) {
			rechercheParam = "nom_article LIKE CONCAT('%',?,'%')";
			params.put("string", recherche);
		}
		if (noCategorie != null) {
			String and = rechercheParam.isEmpty() ? "" : " AND "; 
			noCategorieParam = and + "no_categorie = ?";
			params.put("int", noCategorie);
		}
		String requete = String.format("%s%s%s", SELECT_FILTRES, rechercheParam, noCategorieParam);
		try(Connection cnx = ConnectionProvider.getConnection();
				PreparedStatement pstmt = cnx.prepareStatement(requete)) {
			int index = 1;
			for (String cle : params.keySet()) {
				if (cle.equals("string")) {
					pstmt.setString(index, (String) params.get(cle));
				} else if (cle.equals("int")) {
					pstmt.setInt(index, (Integer) params.get(cle));
				}
				index++;
			}

			try (ResultSet rs = pstmt.executeQuery()) {
				while (rs.next()) {
					articles.add(buildArticle(rs));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return articles;
	}

	@Override
	public void insertArticle(Article article) {
		try(Connection cnx = ConnectionProvider.getConnection();
				PreparedStatement pstmt = cnx.prepareStatement(INSERT_ARTICLE, PreparedStatement.RETURN_GENERATED_KEYS)) {
			if (article.getAdresseRetrait() == null) {				
				pstmt.setNull(1, Types.INTEGER);
			} else {				
				pstmt.setInt(1, article.getAdresseRetrait().getNoAdresse());
			}
			pstmt.setString(2, article.getNomArticle());
			pstmt.setString(3, article.getDescription());
			pstmt.setDate(4, Date.valueOf(article.getDateDebutEncheres()));
			pstmt.setDate(5, Date.valueOf(article.getDateFinEncheres()));
			pstmt.setInt(6, article.getPrixInitial());
			pstmt.setInt(7, article.getVendeur().getNoUtilisateur());
			pstmt.setInt(8, article.getCategorie().getNoCategorie());
			pstmt.execute();
			try (ResultSet keys = pstmt.getGeneratedKeys()) {
				if (keys.next()) {
					article.setNoArticle(keys.getInt(1));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Article> selectAll() {
		List<Article> articles = new ArrayList<>();
		try(Connection cnx = ConnectionProvider.getConnection();
				Statement stmt = cnx.createStatement()) {
			ResultSet rs = stmt.executeQuery(SELECT_ALL);
			while (rs.next()) {
				articles.add(buildArticle(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return articles;
	}
	
	private Article buildArticle(ResultSet rs) {
		AdresseDAO adresseDAO = DAOFactory.getAdresseDAO();
		CategorieDAO categorieDAO = DAOFactory.getCategorieDAO();
		UtilisateurDAO utilisateurDAO = DAOFactory.getUtilisateurDAO();
		Article article = null;
		Adresse adresse = null;
		try {
			if (rs.getInt("no_adresse") != 0) {
				adresse = adresseDAO.getById(rs.getInt("no_adresse"));
			}
			article = new Article(
					rs.getInt("no_article"),
					adresse,
					rs.getString("nom_article"),
					rs.getString("description"),
					rs.getDate("date_debut_encheres").toLocalDate(),
					rs.getDate("date_fin_encheres").toLocalDate(),
					rs.getInt("prix_initial"),
					rs.getInt("prix_vente"),
					utilisateurDAO.getUtilisateurByNo(rs.getInt("no_vendeur")),
					categorieDAO.getById(rs.getInt("no_categorie"))
			);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return article;
	}
}
