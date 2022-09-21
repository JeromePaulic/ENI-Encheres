package fr.eni.encheres.bll;

/**
 * Les codes disponibles sont entre 20000 et 29999
 */
public abstract class CodesResultatBLL {
	
	/**
	 * Echec connexion : le pseudo, l'email ou le mot de passe est incorrect
	 */
	public static final int LOGIN_MDP_KO = 20000;
	/**
	 * Echec création compte : le pseudo est déjà utilisé par un utilisateur
	 */
	public static final int PSEUDO_DEJA_EXISTANT = 20001;
	/**
	 * Echec création compte : l'email est déjà utilisé par un utilisateur
	 */
	public static final int EMAIL_DEJA_EXISTANT = 20002;
	/**
	 * Echec création compte : le mdp et sa confirmation sont différents
	 */
	public static final int ERREUR_CONFIRMATION_MDP = 20003;
	/**
	 * Echec création compte : ce pseudo existe déjà en BDD
	 */
	public static final int PSEUDO_NON_VALIDE = 20004;
	/**
	 * Echec création compte : le nom contient des caractères interdits
	 */
	public static final int NOM_NON_VALIDE = 20005;
	/**
	 * Echec création compte : le prénom contient des caractères interdits
	 */
	public static final int PRENOM_NON_VALIDE = 20006;
	/**
	 * Echec création compte : le code postal n'est pas valide
	 */
	public static final int CP_NON_VALIDE = 20007;
}
