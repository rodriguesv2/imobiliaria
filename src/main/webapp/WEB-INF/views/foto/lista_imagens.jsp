<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/templates/cabecalho.jsp" %>

<c:url value="/arquivos-carregados" var="imgPath"></c:url>

		<h1>Lista de Imagens</h1>
		<hr>
		<c:forEach items="${fotos}" var="foto">
			<h3>${foto.nomeArquivo}</h3>
			<img src="${imgPath}/${foto.nomeArquivo}"/>
			<hr>
		</c:forEach>

<%@ include file="/WEB-INF/views/templates/rodape.jsp" %>