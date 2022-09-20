package fr.eni.encheres.bll;

import fr.eni.encheres.BusinessException;
import fr.eni.encheres.bo.Adresse;
import fr.eni.encheres.bo.Utilisateur;
import fr.eni.encheres.dal.DAOFactory;
import fr.eni.encheres.dal.UtilisateurDAO;

public class UtilisateurManager {
	
	private static UtilisateurManager instance;
	private UtilisateurDAO utilisateurDAO;
	
	private UtilisateurManager() {
		utilisateurDAO = DAOFactory.getUtilisateurDAO();
	}
	
	public static UtilisateurManager getInstance() {
		if (instance == null) {
			instance = new UtilisateurManager();
		}
		return instance;
	}
	
	public Utilisateur seConnecter(String login, String mdp) throws BusinessException {
		Utilisateur utilisateur = null;
		BusinessException be = null;
		
		if (login.contains("@")) {
			utilisateur = utilisateurDAO.getUtilisateurByEmail(login);
		} else {
			utilisateur = utilisateurDAO.getUtilisateurByPseudo(login);
		}
		if (utilisateur == null || !utilisateur.getMotDePasse().equals(mdp)) {
			be = new BusinessException();
			be.ajouterErreur(CodesResultatBLL.LOGIN_MDP_KO);
			throw be;
		}
		return utilisateur;
	}
	
	public Utilisateur creerCompte(String pseudo, String nom, String prenom, String email, String telephone,
			String motDePasse, String confirmationMotDePasse, String rue, String codePostal, String ville, int credit, boolean administrateur) throws BusinessException {
		
		Adresse adresse = new Adresse(rue, codePostal, ville);
		Utilisateur utilisateur = new Utilisateur(pseudo, nom, prenom, email, telephone, motDePasse, 0, false, adresse);
		try {
			validerUtilisateur(utilisateur, confirmationMotDePasse);
			utilisateur = utilisateurDAO.insertUtilisateur(utilisateur);
		} catch (BusinessException e) {
			throw e;
		}
		return utilisateur;
	}
	
	private boolean validerUtilisateur(Utilisateur utilisateur, String confirmationMotDePasse) throws BusinessException {
		BusinessException be = null;
		return true;
	}
}
