<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>

<%@ include file="/WEB-INF/views/templates/cabecalho.jsp"%>

<h1>Novo Corretor</h1>
<br>

<div>
	<form action="${s:mvcUrl('CC#salvar').build()}" method="post" enctype="multipart/form-data">
		<div>
			<label>Nome: </label> 
			<input type="text" name="nome">
		</div>
		<div>
			<label>Data de Nascimento: </label> 
			<!-- <input type="text" name="dataNascimento" pattern="\d{1,2}/\d{1,2}/\d{4}"> -->
			<input type="date" name="dataNascimento">
		</div>
		<div>
			<label>Cidade: </label> 
			<input type="text" name="cidade">
		</div>
		<div>
			<label>UF: </label> 
			<select name="uf">
						<option value="AC">AC</option>
						<option value="AL">AL</option>
						<option value="AM">AM</option>
						<option value="AP">AP</option>
						<option value="BA">BA</option>
						<option value="CE">CE</option>
						<option value="DF">DF</option>
						<option value="ES">ES</option>
						<option value="GO">GO</option>
						<option value="MA">MA</option>
						<option value="MG">MG</option>
						<option value="MS">MS</option>
						<option value="MT">MT</option>
						<option value="PA">PA</option>
						<option value="PB">PB</option>
						<option value="PE">PE</option>
						<option value="PI">PI</option>
						<option value="PR">PR</option>
						<option value="RJ">RJ</option>
						<option value="RN">RN</option>
						<option value="RO">RO</option>
						<option value="RR">RR</option>
						<option value="RS">RS</option>
						<option value="SC">SC</option>
						<option value="SE">SE</option>
						<option value="SP">SP</option>
						<option value="TO">TO</option>
			</select>
		</div>
		<div>
			<label>Telefone Primario:</label>
			<input type="tel" name="telefone1">
		</div>
		<div>
			<label>Telefone Secundario:</label>
			<input type="tel" name="telefone2">
		</div>
		<div>
			<label>E-mail:</label>
			<input type="email" name="email">
		</div>
		<div>
			<label>Foto:</label>
			<input type="file" name="arquivo" accept=".png,.jpg">
		</div>
		<button class="btn btn-primary" type="submit">Salvar</button>
	</form>
</div>

<%@ include file="/WEB-INF/views/templates/rodape.jsp"%>