<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>

<%@ include file="/WEB-INF/views/templates/cabecalho.jsp" %>

		<h1>Inserir imagem</h1>
		<br>
		<form action="${s:mvcUrl('IC#salvarFotos').build() }" method="post" enctype="multipart/form-data" >
			<label>Arquivo:</label>
			<input type="file" multiple="multiple" name="arquivos" accept=".jpg,.jpeg,.gif,.png"/>
			<button type="submit">Enviar</button>
		</form>

<%@ include file="/WEB-INF/views/templates/rodape.jsp" %>