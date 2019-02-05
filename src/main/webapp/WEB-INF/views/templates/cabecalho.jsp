<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Imobiliaria</title>
		<c:url value="/resources/css" var="cssPath"/>
		<link rel="stylesheet" href="${cssPath}/bootstrap.min.css">
		<link rel="stylesheet" href="${cssPath}/estilos.css">
	</head>
	<body>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		    <a class="navbar-brand" href="${s:mvcUrl('HC#index').build()}">Imobiliaria</a>
		    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		
			<!-- Lado esquerdo do Navbar -->
		    <div class="collapse navbar-collapse" id="navbarColor01">
		      <ul class="navbar-nav mr-auto">
		        <li class="nav-item">
		          <a class="nav-link" href="${s:mvcUrl('HC#index').build()}">Home <span class="sr-only">(current)</span></a>
		        </li>
		        <security:authorize access="hasRole('ROLE_CORRETOR')">
			        <li class="nav-item">
			          <a class="nav-link" href="${s:mvcUrl('IC#formImagem').build()}">Inserir Imovel</a>
			        </li>
		        </security:authorize>
		        <security:authorize access="hasRole('ROLE_ADMIN')">
			        <li class="nav-item">
			          <a class="nav-link" href="${s:mvcUrl('CC#form').build()}">Inserir Corretor</a>
			        </li>
		        </security:authorize>
		      </ul>
		      
		      <!-- Lado direiro do Navbar -->
		      <div class="navbar-collapse collapse order-3">
			      <ul class="navbar-nav ml-auto">
			      	<li class="nav-item">
			      		<security:authorize access="isAuthenticated()">
			      			<span class="navbar-brand"><security:authentication property="principal.nome"/></span>
			      		</security:authorize>
			      	</li>
			      	<li class="nav-item">
			      		<security:authorize access="!isAuthenticated()">
			      			<a class="nav-link" href="/login">Login</a>
			      		</security:authorize>
			      		<security:authorize access="isAuthenticated()">
			      			<a class="nav-link" href="/logout">Logout</a>
			      		</security:authorize>
			      	</li>
			      </ul>
		      </div>
		    </div>
	  	</nav>
	  <div id="body" class="container">
	  
	  
	  
	  