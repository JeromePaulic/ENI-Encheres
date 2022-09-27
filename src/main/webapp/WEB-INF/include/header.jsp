<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<a href="accueil"><img class="logo" src="img/logo.png" alt="logo"></a>
 
		
		<nav>
		<label for="toggle">☰</label>
    	<input type="checkbox" id="toggle">
    	<div class="main_pages">
			<c:choose> 
				<c:when test="${empty utilisateur}">
					<a href="${pageContext.request.contextPath}/connexion">S'inscrire- Se connecter</a> 
				</c:when>
		 		<c:otherwise>
		 			
		 					<a href="${pageContext.request.contextPath}/enchere">Enchère</a> 
		 				
							<a href ="${pageContext.request.contextPath}/vente">Vendre un Article</a>
		 				
							<a href ="${pageContext.request.contextPath}/profil?id=${sessionScope.utilisateur.noUtilisateur}">Mon Profil</a>
		 				
							<a href ="${pageContext.request.contextPath}/deconnexion">Déconnexion</a>
		 				
		 		</c:otherwise>
			</c:choose>
			</div> 
		</nav>
		
		
		
		
		
		
		
		
		