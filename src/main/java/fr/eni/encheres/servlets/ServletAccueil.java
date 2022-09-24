package fr.eni.encheres.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.eni.encheres.bll.ArticleManager;
import fr.eni.encheres.bll.CategorieManager;
import fr.eni.encheres.bo.Article;

@WebServlet("/accueil")
public class ServletAccueil extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("articles", ArticleManager.getInstance().getArticles());
		request.setAttribute("categories", CategorieManager.getInstance().selectAll());
		request.getRequestDispatcher("/WEB-INF/jsp/accueil.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String recherche = request.getParameter("recherche");
		String categorie = request.getParameter("categorie");
		Integer noCategorie = categorie.isEmpty() ? null : Integer.parseInt(request.getParameter("categorie"));
		List<Article> articles = ArticleManager.getInstance().getArticlesFiltres(recherche, noCategorie);
		request.setAttribute("articles", articles);
		request.setAttribute("categories", CategorieManager.getInstance().selectAll());
		request.getRequestDispatcher("/WEB-INF/jsp/accueil.jsp").forward(request, response);
	}

}
