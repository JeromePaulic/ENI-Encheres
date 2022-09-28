<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="fr.eni.encheres.messages.LecteurMessage" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/base-styles.css">
	<link href="${pageContext.request.contextPath}/css/vente.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
    
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
			
			<label>	 Article : </label>
				<input type="text" name="nomArticle" required>
			
			
			<label>	Description : </label>
				<textarea name="description" rows="5" required></textarea>
			
			
			<label>	Catégorie 	</label>
				<select name="noCategorie">
					<c:forEach var="categorie" items="${categories}">
						<option value="${categorie.getNoCategorie()}">${categorie.getLibelle()}</option>
					</c:forEach>
				</select>
		
			
			<label>	Mise à prix : </label>
				<input type="number" name="prixInitial">
			
			
			<label>	Début de  </label>
				<input type="date" name="dateDebutEncheres" required>
			
			
			<label>	Fin de l'enchère </label>
				<input type="date" name="dateFinEncheres" required>
			
			<fieldset>
				<legend>Retrait</legend>
					
					<label> Rue : </label>
					<input type="text" name="rue" value="${utilisateur.getAdresse().getRue()}">
				
				
				<label>	Code Postal : </label>
					<input type="text" name="codePostal" value="${utilisateur.getAdresse().getCodePostal()}">
				
				
					<label> Ville : </label>
					<input type="text" name="ville" value="${utilisateur.getAdresse().getVille()}">
				
			</fieldset>
			<div class="button-article">
			<input class="btn" type="submit" value="Enregistrer">
			<a class="btn" href="${pageContext.request.contextPath}/">Annuler</a>
			</div>
		</form>
	</main>
	 <%@ include file="../include/footer.jsp" %>	
</body>
</html>