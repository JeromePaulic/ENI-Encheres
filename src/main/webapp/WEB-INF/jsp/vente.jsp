<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="fr.eni.encheres.messages.LecteurMessage" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
	<title>Nouvelle vente</title>
</head>
<body>
	<header>
		<%@ include file="../include/header.jsp" %>
		
	</header>
	<h1>Nouvelle vente</h1>
	<main>
		<c:if test="${!empty listeCodesErreur}">
			<div class="alert alert-danger" role="alert">
			  <strong>Erreur!</strong>
			  <ul>
			  	<c:forEach var="code" items="${listeCodesErreur}">
			  		<li>${LecteurMessage.getMessageErreur(code)}</li>
			  	</c:forEach>
			  </ul>
			</div>
		</c:if>
		<form action="${pageContext.request.contextPath}/vente" method="post">
			<label2>
				Article : 
				<input type="text" name="nomArticle" required>
			</label2>
			<label2>
				Description : 
				<textarea name="description" rows="5" cols="20" required></textarea>
			</label2>
			<label2>
				Catégorie 
				<select name="noCategorie">
					<c:forEach var="categorie" items="${categories}">
						<option value="${categorie.getNoCategorie()}">${categorie.getLibelle()}</option>
					</c:forEach>
				</select>
			</label2>
			<label2>
				Mise à prix : 
				<input type="number" name="prixInitial">
			</label2>
			<label2>
				Début de l'enchère
				<input type="date" name="dateDebutEncheres" required>
			</label2>
			<label2>
				Fin de l'enchère
				<input type="date" name="dateFinEncheres" required>
			</label2>
			<fieldset>
				<legend>Retrait</legend>
				<label2>
					Rue : 
					<input type="text" name="rue" value="${utilisateur.getAdresse().getRue()}">
				</label2>
				<label2>
					Code Postal : 
					<input type="text" name="codePostal" value="${utilisateur.getAdresse().getCodePostal()}">
				</label2>
				<label2>
					Ville : 
					<input type="text" name="ville" value="${utilisateur.getAdresse().getVille()}">
				</label2>
			</fieldset>
			<input class="button" type="submit" value="Enregistrer">
			<a class="button" href="${pageContext.request.contextPath}/">Annuler</a>
		</form>
	</main>
	<%@ include file="../include/footer.html" %>	
</body>
</html>