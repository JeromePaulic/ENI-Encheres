<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="fr.eni.encheres.messages.LecteurMessage" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Créer un compte</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/CreationCompte.css">
</head>
<body>
	<header>
		<h1>ENI-Enchères</h1>
	</header>
	<main>
		<h2>Mon profil</h2>
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
		<form action="${pageContext.request.contextPath}/creationCompte" method="post">
			<label>
				Pseudo :
				<input type="text" name="pseudo" required>
			</label>
			<label>
				Nom :
				<input type="text" name="nom" required>
			</label>
			<label>
				Prénom :
				<input type="text" name="prenom" required>
			</label>
			<label>
				Email :
				<input type="text" name="email" required>
			</label>
			<label>
				Telephone :
				<input type="text" name="telephone">
			</label>
			<label>
				Rue :
				<input type="text" name="rue" required>
			</label>
			<label>
				Code postal :
				<input type="text" name="codePostal" required>
			</label>
			<label>
				Ville :
				<input type="text" name="ville" required>
			</label>
			<label>
				Mot de passe :
				<input type="password" name="motDePasse" required>
			</label>
			<label>
				Confirmation :
				<input type="password" name="confirmationMotDePasse" required>
			</label>
			<input type="submit" value="Créer">
			<a href="${pageContext.request.contextPath}/">Annuler</a>
		</form>
	</main>
</body>
</html>