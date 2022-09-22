package fr.eni.encheres.dal.jdbc;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import fr.eni.encheres.bo.Article;
import fr.eni.encheres.dal.ArticleDAO;
import fr.eni.encheres.dal.ConnectionProvider;

public class ArticleDAOJdbcImpl implements ArticleDAO {
	
	private final String INSERT_ARTICLE = "INSERT INTO ARTICLES (no_adresse, nom_article, description, date_debut_encheres, date_fin_encheres, prix_initial, no_vendeur, no_categorie) VALUES (?,?,?,?,?,?,?,?);";

	@Override
	public void insertArticle(Article article) {
		try(Connection cnx = ConnectionProvider.getConnection();
				PreparedStatement pstmt = cnx.prepareStatement(INSERT_ARTICLE, PreparedStatement.RETURN_GENERATED_KEYS)) {
			pstmt.setInt(1, article.getNoAdresse());
			pstmt.setString(2, article.getNomArticle());
			pstmt.setString(3, article.getDescription());
			pstmt.setDate(4, Date.valueOf(article.getDateDebutEncheres()));
			pstmt.setDate(5, Date.valueOf(article.getDateFinEncheres()));
			pstmt.setInt(6, article.getPrixInitial());
			pstmt.setInt(7, article.getNoVendeur());
			pstmt.setInt(8, article.getNoCategorie());
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

}
