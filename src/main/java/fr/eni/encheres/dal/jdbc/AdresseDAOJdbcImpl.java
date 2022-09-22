package fr.eni.encheres.dal.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import fr.eni.encheres.bo.Adresse;
import fr.eni.encheres.dal.AdresseDAO;
import fr.eni.encheres.dal.ConnectionProvider;

public class AdresseDAOJdbcImpl implements AdresseDAO {
	
	private final String INSERT_ADRESSE = "INSERT INTO ADRESSES (no_utilisateur, rue, code_postal, ville) VALUES (?,?,?,?);";

	@Override
	public Adresse insert(Adresse adresse) {
		try(Connection cnx = ConnectionProvider.getConnection();
				PreparedStatement pstmt = cnx.prepareStatement(INSERT_ADRESSE, PreparedStatement.RETURN_GENERATED_KEYS)) {
			pstmt.setInt(1, adresse.getNoUtilisateur());
			pstmt.setString(2, adresse.getRue());
			pstmt.setString(3, adresse.getCodePostal());
			pstmt.setString(4, adresse.getVille());
			pstmt.execute();
			try (ResultSet keys = pstmt.getGeneratedKeys()) {
				if (keys.next()) {
					adresse.setNoAdresse(keys.getInt(1));
				}
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return adresse;
	}

}
