<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<c:url value="/imagens-sistema" var="imgSisPath"></c:url>

<%@ include file="/WEB-INF/views/templates/cabecalho.jsp" %>

	<div>
		<table class="table table-striped">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Referência</th>
					<th scope="col">Endereço</th>
					<th scope="col">Cidade</th>
					<th scope="col">Data de Criação</th>
					<th scope="col">Ultima Modificação</th>
					<th scope="col">Tipo</th>
					<th scope="col">Situação</th>
					<th scope="col">Negócio</th>
					<th scope="col">Valor</th>
					<th scope="col">Ações<th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${imoveis}" var="imovel">
					<tr>
						<td>${imovel.referencia}</td>
						<td>${imovel.endereco}, ${imovel.numero}</td>
						<td>${imovel.cidade} - ${imovel.uf}</td>
						<td><fmt:formatDate value="${imovel.dataCriacao.time}" pattern="dd/MM/yyyy HH:mm"/></td>
						<td><fmt:formatDate value="${imovel.dataModificacao.time}" pattern="dd/MM/yyyy HH:mm"/></td>
						<td>${imovel.tipo}</td>
						<td>${imovel.estado}</td>
						<td>${imovel.negocio}</td>
						<td>R$ ${imovel.valor}</td>
						<td>
							<ul class="list-inline">
								<li class="list-inline-item"><a href="#"><img height="20px" width="20px" alt="Alterar" src="${imgSisPath}/glyphicons-edit.png"></a></li>
								<li class="list-inline-item"><a href="/imovel/remover-por-corretor/${imovel.id}"><img height="20px" width="20px" alt="Remover" src="${imgSisPath}/glyphicons-trash.png"></a></li> 
							</ul>
							<a class="btn btn-success" href="/imovel/detalhe/${imovel.id}">Detalhe</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

<%@ include file="/WEB-INF/views/templates/rodape.jsp" %>



