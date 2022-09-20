package fr.eni.encheres.dal.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import fr.eni.encheres.bo.Utilisateur;
import fr.eni.encheres.dal.ConnectionProvider;
import fr.eni.encheres.dal.UtilisateurDAO;

public class UtilisateurDAOJdbcImpl implements UtilisateurDAO {

	private final String SELECT_BY_EMAIL = "SELECT no_utilisateur, pseudo, nom, prenom, email, telephone, rue, code_postal, ville, mot_de_passe, credit, administrateur FROM UTILISATEURS WHERE email = ?;";
	private final String SELECT_BY_PSEUDO = "SELECT no_utilisateur, pseudo, nom, prenom, email, telephone, rue, code_postal, ville, mot_de_passe, credit, administrateur FROM UTILISATEURS WHERE pseudo = ?;";

	private Utilisateur getUtilisateurByLogin(String login, String requete) {
		Utilisateur utilisateur = null;
		try (Connection cnx = ConnectionProvider.getConnection();
				PreparedStatement pstmt = cnx.prepareStatement(requete)) {
			pstmt.setString(1, login);
			try (ResultSet rs = pstmt.executeQuery()) {				
				if (rs.next()) {
					utilisateur = new Utilisateur(
							rs.getInt("no_utilisateur"),
							rs.getString("pseudo"),
							rs.getString("nom"),
							rs.getString("prenom"),
							rs.getString("email"),
							rs.getString("telephone"),
							rs.getString("rue"),
							rs.getString("code_postal"),
							rs.getString("ville"),
							rs.getString("mot_de_passe"),
							rs.getInt("credit"),
							rs.getBoolean("administrateur")
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

}
