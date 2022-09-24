<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="fr">
<head>
	<meta charset="UTF-8">
	<title>Accueil enchères</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
</head>
<body>

	<header>
		<h1>ENI-Enchères</h1>
		<nav>
			<c:choose> 
				<c:when test="${empty utilisateur}">
					<a href="${pageContext.request.contextPath}/connexion">S'inscrire- Se connecter</a> 
				</c:when>
		 		<c:otherwise>
		 			<ul>
		 				<li>
		 					<a href="${pageContext.request.contextPath}/enchere">Enchère</a> 
		 				</li>
		 				<li>
							<a href ="${pageContext.request.contextPath}/vente">Vendre un Article</a>
		 				</li>
		 				<li>
							<a href ="${pageContext.request.contextPath}/profil">Mon Profil</a>
		 				</li>
		 				<li>
							<a href ="${pageContext.request.contextPath}/deconnexion">Déconnexion</a>
		 				</li>
		 			</ul>
		 		</c:otherwise>
			</c:choose> 
		</nav>
	</header>

	<main>
		<h2>Liste des enchères</h2>
		<form action="${pageContext.request.contextPath}/accueil" method="post">
			<p>Filtres : </p> 
			
			<input type="text" name="recherche" placeholder="Le nom de l'article contient"> 
				
			<label for="categorie">Catégorie : </label> 
			<select name="categorie">
				<option value="">Toutes</option>
				<c:forEach var="categorie" items="${categories}">
					<option value="${categorie.getNoCategorie()}">${categorie.getLibelle()}</option>
				</c:forEach>
			</select>
			
			<c:if test="${!empty utilisateur}">
	      		<label>
					<input type="radio" id="achat" name="transaction" value="achat" checked>
	      			Achats
	      		</label>
				<label>
				 <input type="checkbox" id="ouvertes" class="achats" name="achats" value="ouvertes" checked>
					enchères ouvertes
				</label>
				<label>
				 <input type="checkbox" id="encours" class="achats" name="achats" value="encours">
					mes enchères en cours
				</label>
				<label>
				 <input type="checkbox" id="remportees" class="achats" name="achats" value="remportees">
					mes enchères remportées
				</label>
			      
				<label for="vente">
					<input type="radio" id="vente" name="transaction" value="vente">
					Mes Ventes
				</label>
				<label for="encours">
					<input type="checkbox" id="encours" class="ventes" name="ventes" value="encours">
					mes ventes en cours
				</label>
				<label for="nondebute">
					<input type="checkbox" id="nondebute" class="ventes" name="ventes" value="nondebute">
					ventes non débutées
				</label>
				<label for="terminees">
					<input type="checkbox" id="terminees" class="ventes" name="ventes" value="terminees">
					ventes terminées
				</label>
			</c:if>
			<input type="submit" value="Rechercher">
		</form>
		
		<c:if test="${!empty articles}">
			<c:forEach var="article" items="${articles}">
				<article>
					<h3>
						<c:choose>
							<c:when test="${empty utilisateur}">
								${article.getNomArticle()}
							</c:when>
							<c:otherwise>
								<a href="${pageContext.request.contextPath}/enchere?id=${article.getNoArticle()}">
									${article.getNomArticle()}
								</a>
							</c:otherwise>
						</c:choose>
					</h3>
					<p>Prix : ${article.getPrixInitial()} points</p>
					<p>Fin de l'enchère : ${article.getFormattedDateFinEncheres()}</p>
					<p>
						<c:choose>
							<c:when test="${empty utilisateur}">
								${article.getVendeur().getPseudo()}
							</c:when>
							<c:otherwise>
								<a href="${pageContext.request.contextPath}/profil?id=${article.getVendeur().getNoUtilisateur()}">
									Vendeur : ${article.getVendeur().getPseudo()}
								</a>
							</c:otherwise>
						</c:choose>
					</p>
				</article>
			</c:forEach>
		</c:if>
		<c:if test="${empty articles}">
			<p>Aucun article mis aux enchères n'a été trouvé</p>
		</c:if>
	</main>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/accueil.js"></script>
</body>
</html>