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
		<form action="${s:mvcUrl('IC#salvarFotos').build() }" method="post" enctype="multipart/form-data" >
			<label>Arquivo:</label>
			<input type="file" multiple="multiple" name="arquivos" accept=".jpg,.jpeg,.gif,.png"/>
			<button type="submit">Enviar</button>
		</form>
		
	</body>
</html>