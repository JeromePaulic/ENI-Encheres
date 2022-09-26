<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="fr.eni.encheres.bll.UtilisateurManager"%>
<%@page import="fr.eni.encheres.bo.Utilisateur"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
<title>Profil</title>
</head>
<body>


 <header>
		<a href="accueil"><img class="logo" src="img/logo.png" alt="logo"></a>
 
		<nav>
		<label for="toggle">☰</label>
    	<input type="checkbox" id="toggle">
		<div class="main_pages">
			<a href="${pageContext.request.contextPath}/enchere">Enchère</a> 
			<a href ="${pageContext.request.contextPath}/vente">Vendre un Article</a>
			<a href ="${pageContext.request.contextPath}/profil">Mon Profil</a>
			<a href ="${pageContext.request.contextPath}/deconnexion">Déconnexion</a>
			</div>
		</nav>
	</header>
 
 <h1>Profil</h1>
 
 
	<div><center>
		<form method="POST">
			<div>
				<p><span>Pseudo : </span><span>${utilisateur.getPseudo()}</span></p>
			</div>
			<div>
				<p><span>Nom : </span><span>${utilisateur.getNom()}</span></p>
			</div>
			<div>
				<p><span>Prénom : </span><span>${utilisateur.getPrenom()}</span></p>
			</div>
			<div> 
				<p><span>Email : </span><span>${utilisateur.getEmail()}</span></p>
			</div>
			<div>
				<p><span>Telephone : </span><span>${utilisateur.getTelephone()}</span></p>
			</div>
			<div>
				<p><span>Rue : </span><span>${utilisateur.getAdresse().getRue()}</span></p>
			</div>
			<div>
				<p><span>Code Postal : </span><span>${utilisateur.getAdresse().getCodePostal()}</span></p>
			</div>
			<div>
				<p><span>Ville : </span><span>${utilisateur.getAdresse().getVille()}</span></p>
			</div>
			<a class="button" href="${pageContext.request.contextPath}/modifier">Modifier</a>
		</form></center>
	</div>
	
			
		 <footer>

<p>Développé par Elodie, Quentin, Jérôme - ENI Ecole</p>

</footer>

</body>
</html>