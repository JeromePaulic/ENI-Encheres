package fr.eni.encheres.dal;

import fr.eni.encheres.bo.Utilisateur;

public interface UtilisateurDAO {
	
	Utilisateur getUtilisateurByEmail(String email);
	
	Utilisateur getUtilisateurByPseudo(String pseudo);
}
