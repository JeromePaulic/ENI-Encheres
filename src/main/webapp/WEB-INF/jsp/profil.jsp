<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="fr.eni.encheres.bll.UtilisateurManager"%>
<%@page import="fr.eni.encheres.bo.Utilisateur"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profil</title>
</head>
<body>




 <h1>Profil</h1>
	<div>
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
			<input type="submit" name="modifier" value="Modifier">
		</form>
	</div>




</body>
</html>