package fr.eni.encheres.dal;

import java.util.List;

import fr.eni.encheres.bo.Article;

public interface ArticleDAO {
	
	Article getArticleById(int id);

	List<Article> getArticlesFiltres(String recherche, Integer noCategorie);
	
	void insertArticle(Article article);
	
	List<Article> selectAll();

}
