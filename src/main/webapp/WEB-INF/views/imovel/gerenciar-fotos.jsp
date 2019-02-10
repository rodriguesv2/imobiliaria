<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>

<c:url value="/arquivos-carregados" var="imgPath"></c:url>

<%@ include file="/WEB-INF/views/templates/cabecalho.jsp" %>

	<h1>Gerenciar Fotos</h1>
	<c:if test="${flag != 'admin'}"><a href="/imovel/por-corretor/alterar/${idImovel}">Voltar</a></c:if>
	<c:if test="${flag == 'admin'}"><a href="/imovel/alterar/${idImovel}">Voltar</a></c:if>
	<div class="row container">
		<div class="row">
			<c:forEach items="${fotos}" var="foto">
				<div class="col-lg-3 col-md-4 col-xs-6 thumb">
					<a class="thumbnail" href="${imgPath}/${foto.nomeArquivo}" target="blank"> 
						<img class="img-thumbnail" src="${imgPath}/${foto.nomeArquivo}" alt="Nome da Foto">
					</a>
					<form 
						<c:if test="${flag == 'admin'}">action="${s:mvcUrl('IC#excluirFoto').build()}"</c:if> 
						<c:if test="${flag != 'admin'}">action="${s:mvcUrl('IC#excluirFotoPorCorretor').build()}"</c:if>
						method="post">
							<input type="hidden" name="idImovel" value="${idImovel}">
							<input type="hidden" name="id" value="${foto.id}">
							<input type="hidden" name="nomeArquivo" value="${foto.nomeArquivo}">
							<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
							<button type="submit">Apagar</button>	
					</form>
				</div>
			</c:forEach>

		</div>
	</div>

<%@ include file="/WEB-INF/views/templates/rodape.jsp" %>