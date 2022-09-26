<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="fr.eni.encheres.messages.LecteurMessage" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Modifier le profil</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/Modification.css">
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
		
		<form action="${pageContext.request.contextPath}/modifier" method="post">
			<label>
				Pseudo :
				<input type="text" name="pseudo" required value= "${utilisateur.getPseudo()}">
			</label>
			<label>
				Nom :
				<input type="text" name="nom" required value="${utilisateur.getNom()}">
			</label>
			<label>
				Prénom :
				<input type="text" name="prenom" required value="${utilisateur.getPrenom()}">
			</label>
			<label>
				Email :
				<input type="text" name="email" required value="${utilisateur.getEmail()}">
			</label>
			<label>
				Téléphone :
				<input type="text" name="telephone" value="${utilisateur.getTelephone()}">
			</label>
			<label>
				Rue :
				<input type="text" name="rue" required value="${utilisateur.getAdresse().getRue()}">
			</label>
			<label>
				Code postal :
				<input type="text" name="codePostal" required value="${utilisateur.getAdresse().getCodePostal()}">
			</label>
			<label>
				Ville :
				<input type="text" name="ville" required value="${utilisateur.getAdresse().getVille()}">
			</label>
			<label>
				 Mot de passe actuel :
				<input type="password" name="motDePasseAncien" required>
			</label>
			<label>
				 Nouveau mot de passe :
				<input type="password" name="motDePasseNew">
			</label>
			<label>
				Confirmation :
				<input type="password" name="confirmationMotDePasse" >
			</label>
			
			<div>
				<p><span>Crédit: </span><span>${utilisateur.getCredit()}</span></p>
			</div>
			<input type="submit" value="Enregister">
			
	
		<input type="submit" name="supprimermoncompte" value="Supprimer mon compte">
		</form>
	</main>
</body>
</html>