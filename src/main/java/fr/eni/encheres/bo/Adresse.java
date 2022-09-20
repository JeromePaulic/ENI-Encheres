package fr.eni.encheres.bo;

public class Adresse {

	private Integer noAdresse;
	private Integer noUtilisateur;
	private String rue;
	private String codePostal;
	private String ville;
	
	public Adresse(Integer noAdresse, Integer noUtilisateur, String rue, String codePostal, String ville) {
		this.noAdresse = noAdresse;
		this.noUtilisateur = noUtilisateur;
		this.rue = rue;
		this.codePostal = codePostal;
		this.ville = ville;
	}
	
	public Adresse(Integer noUtilisateur, String rue, String codePostal, String ville) {
		this(null, noUtilisateur, rue, codePostal, ville);
	}
	
	public Adresse(String rue, String codePostal, String ville) {
		this(null, null, rue, codePostal, ville);
	}

	public int getNoAdresse() {
		return noAdresse;
	}

	public void setNoAdresse(int noAdresse) {
		this.noAdresse = noAdresse;
	}

	public int getNoUtilisateur() {
		return noUtilisateur;
	}

	public void setNoUtilisateur(int noUtilisateur) {
		this.noUtilisateur = noUtilisateur;
	}

	public String getRue() {
		return rue;
	}

	public void setRue(String rue) {
		this.rue = rue;
	}

	public String getCodePostal() {
		return codePostal;
	}

	public void setCodePostal(String codePostal) {
		this.codePostal = codePostal;
	}

	public String getVille() {
		return ville;
	}

	public void setVille(String ville) {
		this.ville = ville;
	}
	
}
