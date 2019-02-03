<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Imobiliaria</title>
		<c:url value="/resources/css" var="cssPath"/>
		<link rel="stylesheet" href="${cssPath}/bootstrap.min.css">
		<link rel="stylesheet" href="${cssPath}/distancia-bordas.css">
	</head>
	<body>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		    <a class="navbar-brand" href="${s:mvcUrl('HC#index').build()}">Imobiliaria</a>
		    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		
		    <div class="collapse navbar-collapse" id="navbarColor01">
		      <ul class="navbar-nav mr-auto">
		        <li class="nav-item">
		          <a class="nav-link" href="${s:mvcUrl('HC#index').build()}">Home <span class="sr-only">(current)</span></a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="${s:mvcUrl('IC#formImagem').build()}">Inserir Imovel</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="${s:mvcUrl('FC#listar').build()}">Lista de Fotos</a>
		        </li>
		      </ul>
		    </div>
	  	</nav>
	  <div id="body" class="container">