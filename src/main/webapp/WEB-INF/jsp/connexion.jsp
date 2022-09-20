<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="fr.eni.encheres.messages.LecteurMessage" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Se connecter</title>
</head>
<body>
	<header>
		<h1>ENI-Enchères</h1>
	</header>
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
		<form action="${pageContext.request.contextPath}/connexion" method="post">
			<label>
				Identifiant : 
				<input type="text" name="login" required>
			</label>
			<label>
				Mot de passe : 
				<input type="password" name="motDePasse" required>
			</label>
			<div>
				<input type="submit" value="Connexion">
				<label>
					<input type="checkbox" name="sauvegarder">
					Se souvenir de moi
				</label>
				<a href="">Mot de passe oublié</a>
			</div>
		</form>
		<a href="${pageContext.request.contextPath}/creationCompte">Créer un compte</a>
	</main>
</body>
</html>