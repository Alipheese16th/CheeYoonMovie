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
	<!-- 별점기능추가 -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${conPath}/css/star-rating.css" media="all" type="text/css"/>
    <link rel="stylesheet" href="${conPath}/css/theme.css" media="all" type="text/css"/>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="${conPath}/js/star-rating.js" type="text/javascript"></script>
    <script src="${conPath}/js/theme.js" type="text/javascript"></script>
	<!-- 부트스트랩 아이콘 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
	<link rel="stylesheet" href="${conPath}/css/nowPlayingList.css" type="text/css"/>
	
</head>
<body>

	<div class="d-flex " id="wrapper"> <!-- bg-black text-white -->
	
		<jsp:include page="../main/sidebar.jsp"/>
		
		<div id="page-content-wrapper">
		
			<jsp:include page="../main/header.jsp"/>
			
			<div class="container">
			
				<div class="container">
				
		    	<h1 class="my-5 text-center">
		    	<i class="bi bi-camera-reels"></i>
		    	
		    	현재상영작 영화 리스트
		    	</h1>
		    	
		    	<hr>
		    	
		    	<!-- 영화리스트 시작 -->
		    	<div class="container px-5">
		    	

					<c:if test="${empty nowPlayingList}">
						<h1>현재 상영중인 영화가 없습니다</h1>
					</c:if>
					
			    	<c:if test="${not empty nowPlayingList}">
			    		<c:forEach var="movie" items="${nowPlayingList}">
			    			
				    		<div class="card mb-3 border-0" id="${movie.movieId}">
								<div class="row g-0">
									<div class="col-3">
										<img src="${conPath}/movieImg/${movie.movieImage}">
									</div>
									<div class="col-9">
										<div class="card-body p-0">
											
											<div class="container">
												<div class="row">
													<div class="col-md-8">
														<h5 class="card-title">${movie.movieTitle}</h5>
														<p class="card-text mb-1">
															개요:
															<c:forEach var="tag" items="${movie.tagList}" varStatus="i">
															${tag}<c:if test="${i.last eq false}">,</c:if>
															</c:forEach>
														</p>
														<p class="card-text mb-1">
															감독:
															<c:forEach var="person" items="${movie.personList}">
																<c:if test="${person.casting eq '감독'}">
																	${person.personName}
																</c:if>
															</c:forEach>
														</p>
														<p class="card-text mb-1">
															출연:
															<c:forEach var="person" items="${movie.personList}" varStatus="i">
																<c:if test="${person.casting ne '감독'}">
																	${person.personName}<c:if test="${i.last eq false}">,</c:if>
																</c:if>
															</c:forEach>
														</p>
														<p class="card-text mb-1">
															<small class="text-muted">개봉일 : ${movie.movieDate}</small>
														</p>
													</div>
													<div class="col-md-4 d-flex align-items-center">
														<p>
															네티즌 평점 : 
															<input type="text" class="kv-fa rating-loading" value="${movie.avgScore/2}" data-size="sm">
														</p>
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
			    
			</div>
			<jsp:include page="../main/footer.jsp"/>
		</div>
		
	</div>
			
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="${conPath}/js/scripts.js"></script>
<script>

	$(function () {
		$('.card img, .card-title, .card-text').click(function(){
			var movieId = $(this).parents('.card').attr('id');
			location.href = '${conPath}/movieContent.do?movieId='+movieId;
		});
		
		//별점기능 추가
        $('.kv-fa').rating({
            theme: 'krajee-fa',
            filledStar: '<i class="fa fa-star"></i>',
            emptyStar: '<i class="fa fa-star-o"></i>',
            stars:5,
            max:5,
            step:0.5,
            showCaption:false,
            displayOnly:true,
        });
        $('.rating,.kv-fa').on(
                'change', function () {
                    console.log('Rating selected: ' + $(this).val());
        });
    });
</script>
</body>
</html>
