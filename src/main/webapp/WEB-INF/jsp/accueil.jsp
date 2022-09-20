<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html lang="fr">
<head>
	<meta charset="UTF-8">
	<title>Accueil enchères</title>
</head>
<body>
	<header>
		<h1>ENI-Enchères</h1>
		<nav>
			<a href="${pageContext.request.contextPath}/connexion">S'inscrire - Se connecter</a>
		</nav>
	</header>
	
	<main>
		<h2>Liste des enchères</h2>
		<form action="${pageContext.request.contextPath}/encheres?filtres=true" method="get">
			<label for="filtres">Filtres : </label>
			<input type="text" name="filtres" id="filtres" placeholder="Le nom de l'article contient">
			<label for="categorie">Catégorie : </label>
			<select>
				<option value="-1">Toutes</option>
				<c:forEach var="categorie" items="${categories}">
					<option value="${categorie.getNoCategorie()}">${categorie.getLibelle()}</option>
				</c:forEach>
			</select>
			<input type="submit" value="Rechercher">
		</form>
	</main>
</body>
</html>