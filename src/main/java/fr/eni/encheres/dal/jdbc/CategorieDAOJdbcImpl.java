package fr.eni.encheres.dal.jdbc;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import fr.eni.encheres.bo.Categorie;
import fr.eni.encheres.dal.CategorieDAO;
import fr.eni.encheres.dal.ConnectionProvider;

public class CategorieDAOJdbcImpl implements CategorieDAO {
	
	private final String SELECT_ALL = "SELECT * FROM CATEGORIES";

	@Override
	public List<Categorie> selectAll() {
		List<Categorie> categories = new ArrayList<>();
		try (Connection cnx = ConnectionProvider.getConnection();
				Statement stmt = cnx.createStatement()) {
			try (ResultSet rs = stmt.executeQuery(SELECT_ALL)) {				
				while (rs.next()) {
					categories.add(new Categorie(
							rs.getInt("no_categorie"),
							rs.getString("libelle")
							));
				}
			}
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return categories;
	}

}
