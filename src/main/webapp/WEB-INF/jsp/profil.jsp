<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="fr.eni.encheres.bll.UtilisateurManager"%>
<%@page import="fr.eni.encheres.bo.Utilisateur"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="${pageContext.request.contextPath}/css/profil.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/header.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/base-styles.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/footer.css" rel="stylesheet">
	<title>Profil</title>
</head>
<body>

	<%@ include file="../include/header.jsp" %>
	
	<main>
	 	<h1 id="profil">Profil</h1>
		<form method="POST">
	
			<div>
			<p><span class="info">Pseudo :</span><span class="utilisateur">${utilisateur.getPseudo()}</span></p>
			</div>
			<div>
				<p><span class="info">Nom : </span><span class="utilisateur">${utilisateur.getNom()}</span></p>
			</div>
			<div>
				<p><span class="info">Prénom : </span><span class="utilisateur">${utilisateur.getPrenom()}</span></p>
			</div>
			<div> 
				<p><span class="info">Email : </span><span class="utilisateur">${utilisateur.getEmail()}</span></p>
			</div>
			<div>
				<p><span class="info">Téléphone : </span><span class="utilisateur">${utilisateur.getTelephone()}</span></p>
			</div>
			<div>
				<p><span class="info">Rue : </span><span class="utilisateur">${utilisateur.getAdresse().getRue()}</span></p>
			</div>
			<div>
				<p><span class="info">Code Postal : </span><span class="utilisateur">${utilisateur.getAdresse().getCodePostal()}</span></p>
			</div>
			<div>
				<p><span class="info">Ville : </span><span class="utilisateur">${utilisateur.getAdresse().getVille()}</span></p>
			</div>
			<c:if test= "${requestScope.utilisateur.noUtilisateur==sessionScope.utilisateur.noUtilisateur }"> 
			<a class="btn"id="btn-modifier" href="${pageContext.request.contextPath}/modifier">Modifier</a>
			</c:if>
			
		</form>
	</main>		
	
	<%@ include file="../include/footer.jsp" %>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/responsiveNav.js"></script>
</body>
</html>