<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Inserir Imoveis</title>
		<c:url value="/resources/css" var="cssPath"/>
		<c:url value="/resources/js" var="jsPath"/>
		<link rel="stylesheet" href="${cssPath}/bootstrap.min.css"/>
	</head>
	<body>
		<div class="container">
			<h1>Formulario</h1>
			<form action="${s:mvcUrl('IC#salvarImovel').build() }" method="post">
				<div class="form-group">
					<label>Nº de referência</label>
					<input type="text" name="referencia"/>
				</div>
				<div>
					<label>Descrição</label>
					<textarea rows="8" cols="40" name="descricao"></textarea>
				</div>
				<div>
					<label>Valor</label>
					<input type="text" name="valor" placeholder="0,00"/>
				</div>
				<div>
					<label>CEP</label>
					<input id="cep" type="text" name="cep" pattern="[0-9]{8}"/>
				</div>
				<div>
					<label>Endereço</label>
					<input id="endereco" type="text" name="endereco"/>
					<label>Numero</label>
					<input type="number" name="numero"/>
				</div>
				<div>
					<label>Complemento</label>
					<input type="text" name="complemento"/>
				</div>
				<div>
					<label>Bairro</label>
					<input id="bairro" type="text" name="bairro"/>
				</div>
				<div>
					<label>Cidade</label>
					<input id="cidade" type="text" name="cidade"/>
					<label>UF</label>
					<input id="uf" type="text" name="uf" maxlength="2"/>
				</div>
				<div>
					<label>Tipo</label>
					<select name="tipo">
						<c:forEach items="${tipoImovel}" var="tipo">
							<option value="${tipo}">${tipo}</option>
						</c:forEach>
					</select>
				</div>
				<button type="submit">Enviar</button>
			</form>
		</div>
		<script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>
		<script src="${jsPath}/cep.js"></script>
	</body>
</html>










