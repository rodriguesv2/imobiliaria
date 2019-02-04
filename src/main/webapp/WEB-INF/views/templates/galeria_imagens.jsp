<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:url value="/arquivos-carregados" var="imgPath"></c:url>

<link rel="stylesheet" href="${cssPath}/all.css">
<link rel="stylesheet" href="${cssPath}/thumbnail.css">

<div class="container" id="galeria">
	<div class="row container">
		<div class="row">
			<c:forEach items="${imovel.fotos}" var="foto">
				<div class="col-lg-3 col-md-4 col-xs-6 thumb">
					<a class="thumbnail" href="${imgPath}/${foto.nomeArquivo}" target="blank"
						data-image-id="" data-toggle="modal"
						data-title=""
						data-image="${imgPath}/${foto.nomeArquivo}"
						data-target="#image-gallery"> <img class="img-thumbnail"
						src="${imgPath}/${foto.nomeArquivo}"
						alt="Nome da Foto">
					</a>
				</div>
			</c:forEach>

		</div>


		<div class="modal fade" id="image-gallery" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="image-gallery-title"></h4>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
					</div>
					<div class="modal-body">
						<img id="image-gallery-image" class="img-responsive col-md-12"
							src="">
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary float-left"
							id="show-previous-image">
							<i class="fa fa-arrow-left"></i>
						</button>

						<button type="button" id="show-next-image"
							class="btn btn-secondary float-right">
							<i class="fa fa-arrow-right"></i>
						</button>
					</div>
				</div>
			</div>
		</div>
		<script src="${jsPath}/thumbnail.js"></script>
	</div>
</div>