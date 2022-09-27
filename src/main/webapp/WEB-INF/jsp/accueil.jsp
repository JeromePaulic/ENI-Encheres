<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="fr">
<head>
	<meta charset="UTF-8">
	<title>Accueil enchères</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/base-styles.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
</head>
<body>

	<%@ include file="../include/header.jsp" %>
	
	<h1>Accueil</h1>
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
					<input type="radio" id="achat" name="transaction" value="achat" 
						<c:choose>
							<c:when test="${empty transaction}">class="checked"</c:when>
							<c:when test="${!empty transaction && transaction.equals('achat')}">class="checked"</c:when>
							<c:otherwise>class="unchecked"</c:otherwise>
						</c:choose>
					>
	      			Achats
	      		</label>
				<label>
					 <input type="checkbox" id="ouvertes" name="achats" value="ouvertes" 
					 	<c:choose>
							<c:when test="${!empty filtresAchats && filtresAchats.contains('ouvertes')}">class="achats checked"</c:when>
							<c:otherwise>class="achats unchecked"</c:otherwise>
						</c:choose>
					 >
					enchères ouvertes
				</label>
				<label>
				 <input type="checkbox" id="encours" name="achats" value="encours"
				 	<c:choose>
						<c:when test="${!empty filtresAchats && filtresAchats.contains('encours')}">class="achats checked"</c:when>
						<c:otherwise>class="achats unchecked"</c:otherwise>
					</c:choose>
				 >
					mes enchères en cours
				</label>
				<label>
				 <input type="checkbox" id="remportees" name="achats" value="remportees"
				 	<c:choose>
						<c:when test="${!empty filtresAchats && filtresAchats.contains('remportees')}">class="achats checked"</c:when>
						<c:otherwise>class="achats unchecked"</c:otherwise>
					</c:choose>
				 >
					mes enchères remportées
				</label>
				<label for="vente">
					<input type="radio" id="vente" name="transaction" value="vente"
						<c:choose>
							<c:when test="${!empty transaction && transaction.equals('vente')}">class="checked"</c:when>
							<c:otherwise>class="unchecked"</c:otherwise>
						</c:choose>
					>
					Mes Ventes
				</label>
				<label for="encours">
					<input type="checkbox" id="encours" name="ventes" value="encours"
						<c:choose>
							<c:when test="${!empty filtresVentes && filtresVentes.contains('encours')}">class="ventes checked"</c:when>
							<c:otherwise>class="ventes unchecked"</c:otherwise>
						</c:choose>
					>
					mes ventes en cours
				</label>
				<label for="nondebute">
					<input type="checkbox" id="nondebutees" name="ventes" value="nondebutees"
						<c:choose>
							<c:when test="${!empty filtresVentes && filtresVentes.contains('nondebute')}">class="ventes checked"</c:when>
							<c:otherwise>class="ventes unchecked"</c:otherwise>
						</c:choose>
					>
					ventes non débutées
				</label>
				<label for="terminees">
					<input type="checkbox" id="terminees" name="ventes" value="terminees"
						<c:choose>
							<c:when test="${!empty filtresVentes && filtresVentes.contains('terminees')}">class="ventes checked"</c:when>
							<c:otherwise>class="ventes unchecked"</c:otherwise>
						</c:choose>
					>
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
					<p>Début de l'enchère : ${article.getFormattedDateDebutEncheres()}</p>
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
	
	<%@ include file="../include/footer.jsp" %>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/accueil.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/responsiveNav.js"></script>
</body>
</html>