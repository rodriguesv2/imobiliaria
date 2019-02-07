<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<%@ include file="/WEB-INF/views/templates/cabecalho.jsp"%>

<c:if test="${corretor == null}">
	<h1>Novo Corretor</h1>
</c:if>
<c:if test="${corretor != null}">
	<h1>Alterar Corretor</h1>
</c:if>

<br>

<div>
	<form action="${s:mvcUrl('CC#salvar').build()}" method="post" enctype="multipart/form-data">
		<div>
			<label>Nome: </label> 
			<input type="text" name="nome" value="${corretor.nome}">
		</div>
		<div>
			<label>Data de Nascimento: </label> 
			<!-- <input type="text" name="dataNascimento" pattern="\d{1,2}/\d{1,2}/\d{4}"> -->
			<input type="date" name="dataNascimento" value='<fmt:formatDate value="${corretor.dataNascimento}" pattern="yyyy-MM-dd"/>'>
		</div>
		<div>
			<label>Cidade: </label> 
			<input type="text" name="cidade" value="${corretor.cidade}">
		</div>
		<div>
			<label>UF: </label> 
			<select name="uf">
				<c:forEach items="${listaUF}" var="uf">
					<option value="${uf}"
						<c:if test="${uf == corretor.uf}">
							selected
						</c:if>
					>${uf}</option>
				</c:forEach>
			</select>
		</div>
		<div>
			<label>Telefone Primario:</label>
			<input type="tel" name="telefone1" value="${corretor.telefone1}">
		</div>
		<div>
			<label>Telefone Secundario:</label>
			<input type="tel" name="telefone2" value="${corretor.telefone2}">
		</div>
		<div>
			<label>E-mail:</label>
			<input type="email" name="email" value="${corretor.email}">
		</div>
		<div>
			<label>Foto:</label>
			<input type="file" name="arquivo" accept=".png,.jpg">
		</div>
		<security:authorize access="hasRole('ROLE_ADMIN')">
			<div>
				<label>Perfil:</label>
				<select name="nomeRole">
					<option value="ROLE_CORRETOR" <c:if test="${corretor.roles.get(0).nome == 'ROLE_CORRETOR'}">selected</c:if> >Corretor</option>
					<option value="ROLE_ADMIN" <c:if test="${corretor.roles.get(0).nome == 'ROLE_ADMIN'}">selected</c:if> >Admin</option>
				</select>
			</div>
		</security:authorize>
		<security:authorize access="hasRole('ROLE_CORRETOR')">
			<input type="hidden" name="nomeRole" value="ROLE_CORRETOR">
		</security:authorize>
		<input type="hidden" name="id" value="${corretor.id}">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
		<button class="btn btn-primary" type="submit">Salvar</button>
	</form>
</div>

<%@ include file="/WEB-INF/views/templates/rodape.jsp"%>

