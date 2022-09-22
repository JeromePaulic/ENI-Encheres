package fr.eni.encheres.dal.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import fr.eni.encheres.bo.Adresse;
import fr.eni.encheres.bo.Utilisateur;
import fr.eni.encheres.dal.ConnectionProvider;
import fr.eni.encheres.dal.UtilisateurDAO;

public class UtilisateurDAOJdbcImpl implements UtilisateurDAO {
	
	private final String INSERT_UTILISATEUR = "INSERT INTO UTILISATEURS (pseudo, nom, prenom, email, telephone, mot_de_passe, credit, administrateur) VALUES (?,?,?,?,?,?,?,?);";
	private final String INSERT_ADRESSE = "INSERT INTO ADRESSES (rue, code_postal, ville, no_utilisateur) VALUES (?,?,?,?);";
	private final String SELECT_BY_EMAIL = "SELECT u.no_utilisateur, no_adresse, pseudo, nom, prenom, email, telephone, rue, code_postal, ville, mot_de_passe, credit, administrateur FROM UTILISATEURS u JOIN ADRESSES a ON u.no_utilisateur = a.no_utilisateur WHERE email = ?;";
	private final String SELECT_BY_PSEUDO = "SELECT u.no_utilisateur, no_adresse, pseudo, nom, prenom, email, telephone, rue, code_postal, ville, mot_de_passe, credit, administrateur FROM UTILISATEURS u JOIN ADRESSES a ON u.no_utilisateur = a.no_utilisateur WHERE pseudo = ?;";

	private Utilisateur getUtilisateurByLogin(String login, String requete) {
		Utilisateur utilisateur = null;
		try (Connection cnx = ConnectionProvider.getConnection();
				PreparedStatement pstmt = cnx.prepareStatement(requete)) {
			pstmt.setString(1, login);
			try (ResultSet rs = pstmt.executeQuery()) {				
				if (rs.next()) {
					Adresse adresse = new Adresse(
							rs.getInt("no_adresse"),
							rs.getInt("no_utilisateur"),
							rs.getString("rue"),
							rs.getString("code_postal"),
							rs.getString("ville")
					);
					utilisateur = new Utilisateur(
							rs.getInt("no_utilisateur"),
							rs.getString("pseudo"),
							rs.getString("nom"),
							rs.getString("prenom"),
							rs.getString("email"),
							rs.getString("telephone"),
							rs.getString("mot_de_passe"),
							rs.getInt("credit"),
							rs.getBoolean("administrateur"),
							adresse
					);
				}
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return utilisateur;
	}

	@Override
	public Utilisateur getUtilisateurByPseudo(String pseudo) {
		return getUtilisateurByLogin(pseudo, SELECT_BY_PSEUDO);
	}

	@Override
	public Utilisateur getUtilisateurByEmail(String email) {
		return getUtilisateurByLogin(email, SELECT_BY_EMAIL);
	}

	@Override
	public Utilisateur insertUtilisateur(Utilisateur utilisateur) {
		int noUtilisateur = 0;
		try (Connection cnx = ConnectionProvider.getConnection();
				PreparedStatement pstmt = cnx.prepareStatement(INSERT_UTILISATEUR, PreparedStatement.RETURN_GENERATED_KEYS)) {
			pstmt.setString(1, utilisateur.getPseudo());
			pstmt.setString(2, utilisateur.getNom());
			pstmt.setString(3, utilisateur.getPrenom());
			pstmt.setString(4, utilisateur.getEmail());
			pstmt.setString(5, utilisateur.getTelephone());
			pstmt.setString(6, utilisateur.getMotDePasse());
			pstmt.setInt(7, utilisateur.getCredit());
			pstmt.setBoolean(8, utilisateur.isAdministrateur());
			pstmt.execute();
			try (ResultSet keys = pstmt.getGeneratedKeys();
					PreparedStatement pstmt2 = cnx.prepareStatement(INSERT_ADRESSE)) {		
				if (keys.next()) {
					noUtilisateur = keys.getInt(1);
					utilisateur.setNoUtilisateur(noUtilisateur);
					pstmt2.setString(1, utilisateur.getAdresse().getRue());
					pstmt2.setString(2, utilisateur.getAdresse().getCodePostal());
					pstmt2.setString(3, utilisateur.getAdresse().getVille());
					pstmt2.setInt(4, noUtilisateur);
					pstmt2.execute();
				}
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return utilisateur;
	}

}
