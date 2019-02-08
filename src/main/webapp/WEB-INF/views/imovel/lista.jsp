<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<c:url value="/imagens-sistema" var="imgSisPath"></c:url>

<%@ include file="/WEB-INF/views/templates/cabecalho.jsp" %>

<!-- Começo da paginação superior -->		
	<nav aria-label="Navegação da Home" style="display: inline:block;">
		<ul class="pagination justify-content-end">
			<li>
				<form action="/imovel/lista/paginacao" method="post">				
					<label>Imóveis por Página: </label>
					<select name="quantItens" onchange="this.form.submit()">
						<option value="5" <c:if test="${porPaginaTabela == 5}">selected</c:if> >5</option>
						<option value="10" <c:if test="${porPaginaTabela == 10}">selected</c:if> >10</option>
						<option value="15" <c:if test="${porPaginaTabela == 15}">selected</c:if> >15</option>
						<option value="30" <c:if test="${porPaginaTabela == 30}">selected</c:if> >30</option>
						<option value="45" <c:if test="${porPaginaTabela == 45}">selected</c:if> >45</option>
						<option value="60" <c:if test="${porPaginaTabela == 60}">selected</c:if> >60</option>
						<option value="75" <c:if test="${porPaginaTabela == 75}">selected</c:if> >75</option>
						<option value="90" <c:if test="${porPaginaTabela == 90}">selected</c:if> >90</option>
					</select> 
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
				</form>
			</li>
		</ul>
		
		<ul class="pagination justify-content-center">
		
			<li class="page-item <c:if test="${pageImovel.isFirst()}">disabled</c:if>">
				<a class="page-link" href="?pagina=1" >Primeiro</a>
			</li>
			
			<li class="page-item">
				<a class="page-link" href="
					<c:if test="${!pageImovel.isFirst()}">
						?pagina=${pageImovel.number}
					</c:if>
				">
					<c:if test="${!pageImovel.isFirst()}">
						${pageImovel.number}
					</c:if>
					<c:if test="${pageImovel.isFirst()}">
						*
					</c:if>
				</a>
			</li>
			
			<li class="page-item active">
				<a class="page-link" href="#">${pageImovel.number + 1}
						<span class="sr-only">(atual)</span>
				</a>
			</li>
			
			<li class="page-item">
				<a class="page-link" href="
					<c:if test="${!pageImovel.isLast()}">
						?pagina=${pageImovel.number + 2}
					</c:if>
				">
					<c:if test="${!pageImovel.isLast()}">
						${pageImovel.number + 2}
					</c:if>
					<c:if test="${pageImovel.isLast()}">
						*
					</c:if>
				</a>
			</li>
			
			<li class="page-item<c:if test="${pageImovel.isLast()}">disabled</c:if>">
				<a class="page-link" href="?pagina=${pageImovel.getTotalPages()}">Ultimo</a>
			</li>
			
		</ul>
		
	</nav>
	<!-- Fim da paginação superior -->	

	<div>
		<table class="table table-striped">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Referência</th>
					<th scope="col">Endereço</th>
					<th scope="col">Cidade</th>
					<th scope="col">Ultima Modificação</th>
					<th scope="col">Tipo</th>
					<th scope="col">Situação</th>
					<th scope="col">Negócio</th>
					<th scope="col">Valor</th>
					<th scope="col">Corretor</th>
					<th scope="col">Ações<th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${pageImovel.content}" var="imovel">
					<tr>
						<td>${imovel.referencia}</td>
						<td>${imovel.endereco}, ${imovel.numero}</td>
						<td>${imovel.cidade} - ${imovel.uf}</td>
						<td><fmt:formatDate value="${imovel.dataModificacao.time}" pattern="dd/MM/yyyy HH:mm"/></td>
						<td>${imovel.tipo}</td>
						<td>${imovel.estado}</td>
						<td>${imovel.negocio}</td>
						<td>R$ ${imovel.valor}</td>
						<td>${imovel.corretor.nome}</td>
						<td>
							<ul class="list-inline">
								<li class="list-inline-item"><a href="#"><img height="20px" width="20px" alt="Alterar" src="${imgSisPath}/glyphicons-edit.png"></a></li>
								<li class="list-inline-item"><a href="/imovel/remover/${imovel.id}"><img height="20px" width="20px" alt="Remover" src="${imgSisPath}/glyphicons-trash.png"></a></li> 
							</ul>
							<a class="btn btn-success" href="/imovel/detalhe/${imovel.id}">Detalhe</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<!-- Começo da paginação inferior -->
	<nav aria-label="Navegação da Home">
		<ul class="pagination justify-content-center">
		
			<li class="page-item <c:if test="${pageImovel.isFirst()}">disabled</c:if>">
				<a class="page-link" href="?pagina=1" >Primeiro</a>
			</li>
			
			<li class="page-item">
				<a class="page-link" href="
					<c:if test="${!pageImovel.isFirst()}">
						?pagina=${pageImovel.number}
					</c:if>
				">
					<c:if test="${!pageImovel.isFirst()}">
						${pageImovel.number}
					</c:if>
					<c:if test="${pageImovel.isFirst()}">
						*
					</c:if>
				</a>
			</li>
			
			<li class="page-item active">
				<a class="page-link" href="">${pageImovel.number + 1}
						<span class="sr-only">(atual)</span>
				</a>
			</li>
			
			<li class="page-item">
				<a class="page-link" href="
					<c:if test="${!pageImovel.isLast()}">
						?pagina=${pageImovel.number + 2}
					</c:if>
				">
					<c:if test="${!pageImovel.isLast()}">
						${pageImovel.number + 2}
					</c:if>
					<c:if test="${pageImovel.isLast()}">
						*
					</c:if>
				</a>
			</li>
			
			<li class="page-item <c:if test="${pageImovel.isLast()}">disabled</c:if>">
				<a class="page-link" href="?pagina=${pageImovel.getTotalPages()}">Ultimo</a>
			</li>
			
		</ul>
	</nav>
	<!-- Fim da paginação inferior -->

<%@ include file="/WEB-INF/views/templates/rodape.jsp" %>



