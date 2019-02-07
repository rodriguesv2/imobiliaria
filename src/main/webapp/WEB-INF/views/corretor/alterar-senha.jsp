<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<!DOCTYPE html>
<html>
	<head>
		<c:url value="/resources/css" var="cssPath"></c:url>
		<c:url value="/resources/js" var="jsPath"></c:url>
		<meta charset="UTF-8">
		<title>Alterar Senha</title>
		<link rel="stylesheet" href="${cssPath}/bootstrap.min.css">
		<link rel="stylesheet" href="${cssPath}/login.css">
		<link rel="stylesheet" href="${cssPath}/estilos.css">
	</head>
	<body>
		<div class="container">
			<h1>Alterar Senha - <security:authentication property="principal.nome"/></h1>
			
			<form id="formulario" action="${s:mvcUrl('CC#novaSenha').build()}" method="post">
				<div id="body">
					<div class="form-group">
						<input class="form-control" id="senha1" type="password" name="senha" placeholder="Senha" required="required">
					</div>
					<div class="form-group">
						<input class="form-control" id="senha2" type="password" required="required" placeholder="Repita a senha">
					</div>
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
					<button type="submit" class="btn btn-primary form-control">Salvar</button>
				</div>
			</form>
		</div>
		
		<script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>
		<script src="${jsPath}/validador.senha.js"></script>
	</body>
</html>