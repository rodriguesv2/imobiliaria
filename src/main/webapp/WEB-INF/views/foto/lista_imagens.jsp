<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Lista de Imagens</title>
		<c:url value="/arquivos-carregados" var="imgPath"></c:url>
	</head>
	<body>
		<h1>Lista de Imagens</h1>
		<hr>
		<c:forEach items="${fotos}" var="foto">
			<h3>${foto.nomeArquivo}</h3>
			<img src="${imgPath}/${foto.nomeArquivo}"/>
			<hr>
		</c:forEach>
	</body>
</html>