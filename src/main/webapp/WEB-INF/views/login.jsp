<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
	<head>
		<c:url value="/resources/css" var="cssPath"></c:url>
		<meta charset="UTF-8">
		<title>Login</title>
		<link rel="stylesheet" href="${cssPath}/bootstrap.min.css">
		<link rel="stylesheet" href="${cssPath}/login.css">
		<link rel="stylesheet" href="${cssPath}/estilos.css">
	</head>
	<body>
		<div class="container">
			<h1>Login - Imobiliaria</h1>
			
			<form action="/login" method="post">
				<div id="body">
					<div class="form-group">
						<input class="form-control" type="email" name="username" placeholder="username@provedor.com.br" required="required">
					</div>
					<div class="form-group">
						<input class="form-control" type="password" name="password" required="required" placeholder="Senha">
					</div>
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
					<button type="submit" class="btn btn-primary form-control">Entrar</button>
				</div>
			</form>
		</div>
	</body>
</html>