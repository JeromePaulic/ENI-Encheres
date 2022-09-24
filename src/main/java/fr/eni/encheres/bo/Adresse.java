package fr.eni.encheres.bo;

public class Adresse {

	private Integer noAdresse;
	private Utilisateur utilisateur;
	private String rue;
	private String codePostal;
	private String ville;
	
	public Adresse(Integer noAdresse, Utilisateur utilisateur, String rue, String codePostal, String ville) {
		this.noAdresse = noAdresse;
		this.utilisateur = utilisateur;
		this.rue = rue;
		this.codePostal = codePostal;
		this.ville = ville;
	}
	
	public Adresse(Utilisateur utilisateur, String rue, String codePostal, String ville) {
		this(null, utilisateur, rue, codePostal, ville);
	}
	
	public Adresse(String rue, String codePostal, String ville) {
		this(null, null, rue, codePostal, ville);
	}

	@Override
	public String toString() {
		int noUtilisateur = utilisateur == null ? -1 : utilisateur.getNoUtilisateur();
		return String.format("Adresse noAdresse=%d, noUtilisateur=%d, rue=%s, cp=%s, ville=%s%n", noAdresse, noUtilisateur, rue, codePostal, ville);
	}
	
	public String formatted() {
		return String.format("%s %s %s", rue, codePostal, ville);
	}
	
	public boolean equals(Adresse adresse) {
		if (
//			utilisateur.getNoUtilisateur() != adresse.getUtilisateur().getNoUtilisateur() ||
			!this.rue.equals(adresse.getRue()) ||
			!this.codePostal.equals(adresse.getCodePostal()) ||
			!this.ville.equals(adresse.getVille())
		) {
			return false;
		}
		return true;
	}

	public Integer getNoAdresse() {
		return noAdresse;
	}

	public void setNoAdresse(Integer noAdresse) {
		this.noAdresse = noAdresse;
	}

	public Utilisateur getUtilisateur() {
		return utilisateur;
	}

	public void setUtilisateur(Utilisateur utilisateur) {
		this.utilisateur = utilisateur;
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
