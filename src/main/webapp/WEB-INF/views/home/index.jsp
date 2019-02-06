<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<c:url value="/arquivos-carregados" var="imgPath"></c:url>

<%@ include file="/WEB-INF/views/templates/cabecalho.jsp" %>
		
			<h1>Imobiliaria</h1> 
			
<c:forEach items="${imoveis}" var="imovel">
	<a id="link-imovel" href="${s:mvcUrl('IC#detalhe').arg(0, imovel.id).build()}">
	<!-- Footer -->
		<div>
			<footer id="imovel" class="page-footer font-small mdb-color pt-4 bg-secondary text-white">
			
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
		
<%@ include file="/WEB-INF/views/templates/rodape.jsp" %>