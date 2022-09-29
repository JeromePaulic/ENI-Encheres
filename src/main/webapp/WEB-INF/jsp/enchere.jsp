<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
	<meta charset="UTF-8">
	<title>Enchère</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/base-styles.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/enchere.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	
	<main>
		<h1>Détail vente</h1>
		<c:if test="${!empty article}">
			<h3>${article.getNomArticle()}</h3>
			<p>
				<span>Description : </span>
				<span> ${article.getDescription()}</span>
			</p>
			<p>
				<span>Catégorie : </span>
				<span> ${article.getCategorie().getLibelle()}</span>
			</p>
			<p>
				<span>Meilleure offre : </span>
				<span> /</span>
			</p>
			<p>
				<span>Mise à prix : </span>
				<span> ${article.getPrixInitial()} points</span>
			</p>
			<p>
				<span>Début de l'enchère : </span>
				<span> ${article.getFormattedDateDebutEncheres()}</span>
			</p>
			<p>
				<span>Fin de l'enchère : </span>
				<span> ${article.getFormattedDateFinEncheres()}</span>
			</p>
			<p>
				Retrait :
				<c:choose>
					<c:when test="${!empty article.getAdresseRetrait()}">
						${article.getAdresseRetrait().formatted()}
					</c:when>
					<c:otherwise>
						${article.getVendeur().getAdresse().formatted()}
					</c:otherwise>
				</c:choose>
			</p>
			<p>
				<span>Vendeur : </span>
				<span> ${article.getVendeur().getPseudo()}</span>
			</p>
			<c:choose>
				<c:when test="${utilisateur.getNoUtilisateur() == article.getVendeur().getNoUtilisateur()}">
					<c:if test="${article.estModifiable()}">
						<a class="btn" href="${pageContext.request.contextPath}/modifierVente?id=${article.getNoArticle()}">
							Modifier la vente
						</a>
					</c:if>
				</c:when>
				<c:otherwise>
					<form action="${pageContext.request.contextPath}/enchere" method="post">
						<label>Ma proposition :	</label>
						<input type="number" name="enchere">
						<div class="break"></div>
						<input type="submit" class="btn" value="Enchérir">
					</form>
				</c:otherwise>
			</c:choose>
		</c:if>
	</main>
	<jsp:include page="../include/footer.jsp"></jsp:include>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/responsiveNav.js"></script>
</body>
</html>