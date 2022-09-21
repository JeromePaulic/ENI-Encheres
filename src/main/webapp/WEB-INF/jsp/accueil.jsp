<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8">
<title>Accueil enchères</title>
</head>
<body>
	<c:choose> 
		<c:when test="${!empty utilisateur}">	

	<header>
		<h1>ENI-Enchères</h1>
		<nav>
			<a href="${pageContext.request.contextPath}/enchere">Enchère</a> 
			<a href ="${pageContext.request.contextPath}/vente">Vendre un Article</a>
			<a href ="${pageContext.request.contextPath}/profil">Mon Profil</a>
			<a href ="${pageContext.request.contextPath}/deconnexion">Déconnexion</a>
			
		</nav>
	</header>

	<main>


		<h2>Liste des enchères</h2>
		<form
			action="${pageContext.request.contextPath}/encheres?filtres=true"
			method="get">
			<label for="filtres">Filtres : </label> <input type="text"
				name="filtres" id="filtres"
				placeholder="Le nom de l'article contient"> <label
				for="categorie">Catégorie : </label> <select>
				<option value="-1">Toutes</option>
				<c:forEach var="categorie" items="${categories}">
					<option value="${categorie.getNoCategorie()}">${categorie.getLibelle()}</option>
				</c:forEach>
			</select> <input type="submit" value="Rechercher">
		</form>
		
		<div>
      <input type="radio" id="achat" name="transaction" value="achat"checked>
      <label for="achat">Achats</label>
    </div>
    
    <div>
      <input type="checkbox" id="ouvertes" name="encheres"value="ouvertes"checked>
      <label for="ouvertes">enchères ouvertes</label>
    </div>
    <div>
      <input type="checkbox" id="encours" name="encheres"value="encours">
      <label for="encours">mes enchères en cours</label>
    </div>
    <div>
      <input type="checkbox" id="remportees" name="encheres"value="remportees">
      <label for="renportees">mes enchères remportées</label>
    </div>
    
    
  
		<div>
      <input type="radio" id="vente" name="transaction" value="vente"checked>
      <label for="vente">Mes Ventes</label>
    </div>
     <div>
      <input type="checkbox" id="encours" name="ventes"value="encours">
      <label for="encours">mes ventes en cours</label>
    </div>
    <div>
      <input type="checkbox" id="nondebute" name="ventes"value="nondebute">
      <label for="nondebute">ventes non débutées</label>
    </div>
    <div>
      <input type="checkbox" id="terminees" name="ventes"value="terminees">
      <label for="terminees">ventes terminées</label>
    </div>
   
		
	</main>
	</c:when>
	 <c:otherwise>
	<header>
		<h1>ENI-Enchères</h1>
		<nav>
			<a href="${pageContext.request.contextPath}/connexion">S'inscrire- Se connecter</a> 
				
		</nav>
	</header>

	<main>


		<h2>Liste des enchères</h2>
		<form
			action="${pageContext.request.contextPath}/encheres?filtres=true"
			method="get">
			<label for="filtres">Filtres : </label> <input type="text"
				name="filtres" id="filtres"
				placeholder="Le nom de l'article contient"> <label
				for="categorie">Catégorie : </label> <select>
				<option value="-1">Toutes</option>
				<c:forEach var="categorie" items="${categories}">
					<option value="${categorie.getNoCategorie()}">${categorie.getLibelle()}</option>
				</c:forEach>
			</select> <input type="submit" value="Rechercher">
		</form>
	</main>
	
	
	 </c:otherwise>
	</c:choose> 
</body>
</html>