<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<c:url value="/resources/css" var="cssPath"/>
<c:url value="/resources/js" var="jsPath"/>

<%@ include file="/WEB-INF/views/templates/cabecalho.jsp" %>
	
	<h1>Detalhe do Imóvel - Nº Ref: ${imovel.referencia}</h1>
	<h2><span class="label">Valor: </span>R$ ${imovel.valor}</h2>
	
	<div class="row">
		<div class="container col-7" id="body">
			<h2>Localização</h2>
			<span class="label" >Endereço: </span>${imovel.endereco}, ${imovel.numero}<br>
			<span class="label" >Bairro: </span>${imovel.bairro}<br>
			<span class="label" >Cidade: </span>${imovel.cidade} - ${imovel.uf}<br>
			
			<div id="body">
				<h2>Descrição</h2>
				<p>${imovel.descricao}</p>
			</div>
		</div>
		<div class="container col-4 bg-secondary rounded" id="body">
			<h2>Corretor</h2>
			<span class="label" >Nome: </span>${imovel.corretor.nome}<br>
			<span class="label" >Telefone: </span>${imovel.corretor.telefone1}<br>
			<c:if test="${imovel.corretor.telefone2 != null}"><span class="label" >Telefone: </span>${imovel.corretor.telefone2}<br></c:if>
			<span class="label" >E-mail: </span>${imovel.corretor.email}<br>
		</div>
	</div>
	
	<div class="container" id="body">
			<h2>Fotos</h2>
			
			<%@ include file="/WEB-INF/views/templates/nova-galeria-imagens.jsp" %>
			
	</div>
	
<%@ include file="/WEB-INF/views/templates/rodape.jsp" %>