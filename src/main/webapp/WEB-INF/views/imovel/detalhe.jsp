<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<c:url value="/resources/css" var="cssPath"/>
<c:url value="/resources/js" var="jsPath"/>

<%@ include file="/WEB-INF/views/templates/cabecalho.jsp" %>
	
	<h1>Detalhe do Imóvel - Nº Ref: ${imovel.referencia}</h1>
	<h2><span class="label">Valor: </span>R$ ${imovel.valor}</h2>
	
	<div>
		<div class="container" id="body">
			<h2>Localização</h2>
			<span class="label" >Endereço: </span>${imovel.endereco}, ${imovel.numero}<br>
			<span class="label" >Bairro: </span>${imovel.bairro}<br>
			<span class="label" >Cidade: </span>${imovel.cidade} - ${imovel.uf}<br>
		</div>
		<div class="container" id="body">
			<h2>Descrição</h2>
			<p>${imovel.descricao}</p>
		</div>
		<div class="container" id="body">
			<h2>Fotos</h2>
			<script src="${jsPath}/bootstrap.min.js"></script>
			<script src="${jsPath}/jquery.min.js"></script>
			<%@ include file="/WEB-INF/views/templates/galeria_imagens.jsp" %>
			
		</div>
	</div>
	
<%@ include file="/WEB-INF/views/templates/rodape.jsp" %>