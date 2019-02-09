<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>

<c:url value="/resources/js" var="jsPath"/>

<%@ include file="/WEB-INF/views/templates/cabecalho.jsp" %>

			<h1>Formulario</h1>
			<form action="${s:mvcUrl('IC#alteraImovel').build()}" method="post">
				<div class="form-group">
					<label>Nº de referência</label>
					<input type="text" name="referencia" value="${imovel.referencia}"/>
				</div>
				<div>
					<label>Descrição</label>
					<textarea rows="8" cols="40" name="descricao">${imovel.descricao}</textarea>
				</div>00.0
				<div>
					<label>Valor R$</label>
					<input type="text" name="valor" placeholder="0,00" value="${imovel.valor}"/>
				</div>
				<div>
					<label>CEP</label>
					<input id="cep" type="text" name="cep" pattern="[0-9]{8}" value="${imovel.cep}"/>
				</div>
				<div>
					<label>Endereço</label>
					<input id="endereco" type="text" name="endereco" value="${imovel.endereco}"/>
					<label>Numero</label>
					<input type="number" name="numero" value="${imovel.numero}"/>
				</div>
				<div>
					<label>Complemento</label>
					<input type="text" name="complemento" value="${imovel.complemento}"/>
				</div>
				<div>
					<label>Bairro</label>
					<input id="bairro" type="text" name="bairro" value="${imovel.bairro}"/>
				</div>
				<div>
					<label>Cidade</label>
					<input id="cidade" type="text" name="cidade" value="${imovel.cidade}"/>
					<label>UF</label>
					<input id="uf" type="text" name="uf" maxlength="2" value="${imovel.uf}"/>
				</div>
				<div>
					<label>Tipo</label>
					<select name="tipo">
						<c:forEach items="${tipoImovel}" var="tipo">
							<option <c:if test="${imovel.tipo == tipo }">selected</c:if> value="${tipo}">${tipo}</option>
						</c:forEach>
					</select>
				</div>
				<div>
					<label>Situação</label>
					<select name="estado">
						<c:forEach items="${estadoImovel}" var="estado">
							<option <c:if test="${imovel.estado == estado }">selected</c:if> value="${estado}">${estado}</option>
						</c:forEach>
					</select>
				</div>
				<div>
					<label>Tipo de Negócio</label>
					<select name="negocio">
						<c:forEach items="${tipoNegocio}" var="negocio">
							<option <c:if test="${imovel.negocio == negocio}">selected</c:if> value="${negocio}">${negocio}</option>
						</c:forEach>
					</select>
				</div>
				<input type="hidden" name="id" value="${imovel.id}"/>
				<input type="hidden" name="idCorretor" value='<security:authentication property="principal.id"/>'/>
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
				<button type="submit">Enviar</button>
			</form>
			<br>
			<br>
		<a href="${s:mvcUrl('IC#gerenciarFotos').arg(0, imovel.id).build()}"><h2>Gerenciar imagens</h2></a>	
			
		<script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>
		<script src="${jsPath}/cep.js"></script>

<%@ include file="/WEB-INF/views/templates/rodape.jsp" %>










