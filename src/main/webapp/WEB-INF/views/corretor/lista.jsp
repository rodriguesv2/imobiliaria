<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="/WEB-INF/views/templates/cabecalho.jsp" %>

	<div>
		<table class="table table-striped">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Foto</th>
					<th scope="col">Nome</th>
					<th scope="col">Cidade</th>
					<th scope="col">Telefone 1</th>
					<th scope="col">Telefone 2</th>
					<th scope="col">Email</th>
					<th scope="col">Data de Nascimento</th>
					<th scope="col">Tipo Perfil</th>
					<th scope="col"><th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${corretores}" var="corretor">
					<tr>
						<td>Foto</td>
						<td>${corretor.nome}</td>
						<td>${corretor.cidade} - ${corretor.uf}</td>
						<td>${corretor.telefone1}</td>
						<td>${corretor.telefone2}</td>
						<td>${corretor.email}</td>
						<td><fmt:formatDate value="${corretor.dataNascimento}" pattern="dd/MM/yyyy"/></td>
						<td>${corretor.listaPerfil()}</td>
						<td><a href="#">Remover</a> <a href="#">Alterar</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

<%@ include file="/WEB-INF/views/templates/rodape.jsp" %>