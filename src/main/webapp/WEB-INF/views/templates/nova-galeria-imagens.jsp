<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:url value="/arquivos-carregados" var="imgPath"></c:url>
<c:url value="/resources/js" var="jsPath"></c:url>

<div id="carouselExampleControls" class="carousel slide bordered" data-ride="carousel">
  <div class="carousel-inner">
  	<c:forEach items="${imovel.fotos}" var="foto">
	    <div class="carousel-item <c:if test='${imovel.fotos.get(0).nomeArquivo == foto.nomeArquivo}'>active</c:if>">
	      <img class="d-block w-100" src="${imgPath}/${foto.nomeArquivo}" alt="Primeiro Slide">
	    </div>
    </c:forEach>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Anterior</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Próximo</span>
  </a>
</div>

<script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>
<script src="${jsPath}/bootstrap.bundle.js"></script>