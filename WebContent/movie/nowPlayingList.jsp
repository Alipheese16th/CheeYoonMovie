<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>CheeYoonMovie</title>
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="${conPath}/assets/favicon.ico" />
	<!-- Core theme CSS (includes Bootstrap)-->
	<link href="${conPath}/css/styles.css" rel="stylesheet" />
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	
	<style>
		.card img {
			width: 100px;
			height: 150px;
			object-fit: cover;
		}
		.card img:hover, .card-title, .card-text{
			cursor:pointer;
		}
		
		
	</style>
	<script>
		
		$(function(){
			$('.card img, .card-title, .card-text').click(function(){
				location.href = '${conPath}/nowPlayingContent.do';
			});
		});
	
	</script>
	
</head>
<body>

	<div class="d-flex " id="wrapper"> <!-- bg-black text-white -->
	
		<jsp:include page="../main/sidebar.jsp"/>
		
		<div id="page-content-wrapper">
		
			<jsp:include page="../main/header.jsp"/>
			
			<div class="container">
			
			
		    	<h1 class="my-5">현재상영작 영화 리스트</h1>
		    	
		    	<hr>
		    	
		    	
		    	<!-- 영화리스트 시작 -->
		    	<div class="container px-5">
		    	

					<c:if test="${empty nowPlayingList}">
						<h1>현재 상영중인 영화가 없습니다</h1>
					</c:if>
					
			    	<c:if test="${not empty nowPlayingList}">
			    		<c:forEach var="movie" items="${nowPlayingList}">
			    			
				    		<div class="card mb-3 border-0">
								<div class="row g-0">
									<div class="col-3">
										<img src="${conPath}/movieImg/${movie.movieImage}">
									</div>
									<div class="col-9">
										<div class="card-body">
											
											<div class="container">
												<div class="row">
													<div class="col-md-8">
														<h5 class="card-title">${movie.movieName}</h5>
														<p class="card-text">줄거리 : ${movie.movieSummary}</p>
														<p class="card-text"><small class="text-muted">개봉일 : ${movie.movieDate}</small></p>
													</div>
													<div class="col-md-4 d-flex align-items-center">
														<p class="card-text">네티즌 평점 : ${movie.avgScore}</p>
													</div>
												</div>
											</div>
											
										</div>
									</div>
								</div>
							</div>
							
							<hr>
			    			
			    		</c:forEach>
			    	</c:if>
		    	
		    	</div>
				<!-- 영화리스트 끝 -->
			    
			</div>
			<jsp:include page="../main/footer.jsp"/>
		</div>
		
	</div>
			
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="${conPath}/js/scripts.js"></script>

</body>
</html>
