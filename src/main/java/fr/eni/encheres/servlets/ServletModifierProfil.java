package fr.eni.encheres.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ServletModifierProfil
 */
@WebServlet("/ServletModifierProfil")
public class ServletModifierProfil extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletModifierProfil() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		String nextPage = "/WEB-INF/modifierProfil.jsp";

		request.getRequestDispatcher(nextPage).forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String nextPage = "/WEB-INF/modifierProfil.jsp";
		boolean isConnecte = true;
		
		// Modifier profil
		if (request.getParameter("enregistrer") != null) {
			try {
				try {
					if (manager.verifInscription(request.getParameter("mdp"), request.getParameter("confirmation"),
							request.getParameter("pseudo"), request.getParameter("email"))) {
						utilisateur.getPseudo().setPseudo(request.getParameter("pseudo"));
						utilisateur.getUtilisateur().setPrenom(request.getParameter("prenom"));
						utilisateur.getUtilisateur().setTelephone(request.getParameter("telephone"));
						utilisateur.getUtilisateur().setCodePostal(request.getParameter("codePostal"));
						utilisateur.getUtilisateur().setMotDePasse(request.getParameter("mdp"));
						utilisateur.getUtilisateur().setNom(request.getParameter("nom"));
						utilisateur.getUtilisateur().setEmail(request.getParameter("email"));
						utilisateur.getUtilisateur().setRue(request.getParameter("rue"));
						utilisateur.getUtilisateur().setVille(request.getParameter("ville"));
						manager.updateUtilisateur(utilisateur.getUtilisateur());
						request.setAttribute("msgModif", "Votre profil à été modifié");
						nextPage = "/WEB-INF/modifierProfil.jsp";
					}
				}  {
					request.setAttribute("erreurs", e.getMessages());
					nextPage = "/WEB-INF/modifierProfil.jsp";
					e.printStackTrace();
				}
			}  {
				request.setAttribute("erreur", e.getMessage());
				;
			}
	
		
		
		
		
		
	}

}
