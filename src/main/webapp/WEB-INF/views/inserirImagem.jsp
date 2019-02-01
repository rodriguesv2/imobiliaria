<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h1>Inserir imagem</h1>
		<br>
		<form action="${s:mvcUrl('IC#gravar').build() }" method="post" enctype="multipart/form-data" >
			<label>Arquivo:</label>
			<input type="file" name="arquivo"/>
			<button type="submit">Enviar</button>
		</form>
		
	</body>
</html>