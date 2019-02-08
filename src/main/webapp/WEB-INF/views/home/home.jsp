<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<c:url value="/arquivos-carregados" var="imgPath"></c:url>

<%@ include file="/WEB-INF/views/templates/cabecalho.jsp" %>
		
			<h1>Imobiliaria</h1> 
	
	<!-- Começo da paginação superior -->		
	<nav aria-label="Navegação da Home" style="display: inline:block;">
		<ul class="pagination justify-content-end">
			<li>
				<form action="/paginacao" method="post">				
					<label>Imóveis por Página: </label>
					<select name="quantItens" onchange="this.form.submit()">
						<option value="5" <c:if test="${porPagina == 5}">selected</c:if> >5</option>
						<option value="10" <c:if test="${porPagina == 10}">selected</c:if> >10</option>
						<option value="15" <c:if test="${porPagina == 15}">selected</c:if> >15</option>
						<option value="20" <c:if test="${porPagina == 20}">selected</c:if> >20</option>
						<option value="25" <c:if test="${porPagina == 25}">selected</c:if> >25</option>
						<option value="30" <c:if test="${porPagina == 30}">selected</c:if> >30</option>
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
		
<c:forEach items="${pageImovel.content}" var="imovel">
	<a id="link-imovel" href="${s:mvcUrl('IC#detalhe').arg(0, imovel.id).build()}">
	<!-- Footer -->
		<div class="rounded">
			<footer id="imovel" class="page-footer font-small mdb-color pt-4 bg-secondary text-white rounded border border-dark">
			
			  <div class="container cidade-uf">
			    <span>${imovel.cidade} - ${imovel.uf}  -  Corretor: ${imovel.corretor.nome }</span>
			  </div>
			
			  <!-- Footer Elements -->
			  <div class="container">
				
			    <!--Grid row-->
			    <div class="row">
			
				<c:forEach items="${imovel.seisFotos() }" var="fotos">
			      <!--Grid column-->
			      <div class="col-lg-2 mb-4">
			
			        <!--Image-->
			        <div class="view overlay z-depth-1-half">
			          <img src="${imgPath}/${fotos.nomeArquivo}" class="img-fluid" alt="">
			        </div>
			      </div>
			      <!--Grid column-->
				</c:forEach>
			
			    </div>
			    <!--Grid row-->
			
			  </div>
			  <!-- Footer Elements -->
			
			  <div class="container">
			    <span>R$ ${imovel.valor}</span>
			  </div>
			  
			</footer>
		</div>
	</a>
	<!-- Footer -->
	<br>
</c:forEach>


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










