<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Inserir Imoveis</title>
	</head>
	<body>
		<div>
			<h1>Formulario</h1>
			<form action="" method="post">
				<div>
					<label>Nº de referência</label>
					<input type="text" name="referencia"/>
				</div>
				<div>
					<label>Descrição</label>
					<textarea rows="8" cols="40" name="descricao"></textarea>
				</div>
				<div>
					<label>CEP</label>
					<input type="number" name="cep"/>
				</div>
				<div>
					<label>Endereço</label>
					<input type="text" name="endereco"/>
					<label>Numero</label>
					<input type="number" name="numero"/>
				</div>
				<div>
					<label>Complemento</label>
					<input type="text" name="complemento"/>
				</div>
				<div>
					<label>Bairro</label>
					<input type="text" name="bairro"/>
				</div>
				<div>
					<label>Cidade</label>
					<input type="text" name="cidade"/>
					<label>UF</label>
					<select name="UF">
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
				<button type="submit">Enviar</button>
			</form>
		</div>
	</body>
</html>










