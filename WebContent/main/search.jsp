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
	<!-- star-rating -->
	
	
	<style>
		.card img {
			width: 70px;
			height: 105px;
			object-fit: cover;
		}
		.card img, .card-title, .card-text{
			cursor:pointer;
		}
		
		.trailercard{
			width: 20rem; min-width: 10rem;
		}
		
	</style>
	<script>
		
		$(function(){
			
			$('.card img, .card-title, .card-text').click(function(){
				var movieId = $(this).parents('.card').attr('id');
				location.href = '${conPath}/movieContent.do?movieId='+movieId;
			});
			
		});
	
	</script>
	
</head>
<body>

	<div class="d-flex" id="wrapper"> <!-- bg-black text-white -->
		<jsp:include page="../main/sidebar.jsp"/>
		<div id="page-content-wrapper">
			<jsp:include page="../main/header.jsp"/>
			
			<div class="container">
			
				<div class="container pb-5">
				
		    	<h2 class="my-5 text-center">&#39;<span class="text-danger">${param.q}</span>&#39;에 대한 영화 통합검색결과 입니다.</h2>
		    	
		    	<p class="text-center"> 영화 | 태그 | 동영상 </p>
		    	
		    	<c:if test="${empty titleResultList and empty tagResultList and empty trailerResultList}">
		    		<hr>
		    		<br class="py-5">
					<h3 class="py-5 text-center">&#39;<span class="text-danger">${param.q}</span>&#39;에 대한 검색 결과가 없습니다</h3>
					<br class="py-5">
		    		<hr>
				</c:if>
				
		    	<!-- 이름검색 영화리스트 시작 -->
	    		<c:if test="${not empty titleResultList}">
	    		
	    		<hr>
			    	<div class="container px-5 pb-3">
					
			    		<p class="pb-2"><b>영화</b> (${titleResultList.size()}건) : 최근 제작년도순</p>
			    		<c:forEach var="movie" items="${titleResultList}">
			    			
				    		<div class="card mb-3 border-0" id="${movie.movieId}">
								<div class="d-flex">
								
									<div class="">
										<img src="${conPath}/movieImg/${movie.movieImage}">
									</div>
									
									<div class="ms-2 ps-2">
										<div class="card-body p-0">
												
											<p class="card-title m-0">${movie.movieTitle}(${movie.originalTitle})</p>
											<input type="text" class="kv-fa rating-loading" value="${movie.avgScore/2}" data-size="xs">
											
											<p class="card-text m-0">
												<small class="text-muted">
													<c:forEach var="tag" items="${movie.tagList}" varStatus="i">
													${tag}<c:if test="${i.last eq false}">,</c:if>
													</c:forEach>
													|
													${movie.movieRunning}분
													|
													${movie.movieDate}
												</small>
											</p>
											<p class="card-text">
												<small class="text-muted">
													감독:
													<c:forEach var="person" items="${movie.personList}">
													<c:if test="${person.casting eq '감독'}">
													${person.personName}
													</c:if>
													</c:forEach>
													|
													출연:
													<c:forEach var="person" items="${movie.personList}" varStatus="i">
													<c:if test="${person.casting ne '감독'}">
													${person.personName}<c:if test="${i.last eq false}">,</c:if>
													</c:if>
													</c:forEach>
												</small>
											</p>
											
										</div>
									</div>
								</div>
							</div>
							
			    		</c:forEach>
		    	
			    	</div>
		    	</c:if>
				<!-- 이름검색 영화리스트 끝 -->
				
				<!-- 태그 검색 영화리스트 시작 -->
		    	<c:if test="${not empty tagResultList}">
		    	
		    	<hr>
			    	<div class="container px-5 pb-3">
						<p class="pb-2">태그 검색 : <b>${param.q}</b> (${tagResultList.size()}건)</p>
						
			    		<c:forEach var="movie" items="${tagResultList}">
			    			
				    		<div class="card mb-3 border-0" id="${movie.movieId}">
								<div class="d-flex">
								
									<div class="">
										<img src="${conPath}/movieImg/${movie.movieImage}">
									</div>
									
									<div class="ms-2 ps-2">
										<div class="card-body p-0">
												
											<p class="card-title m-0">${movie.movieTitle}(${movie.originalTitle})</p>
											<input type="text" class="kv-fa rating-loading" value="${movie.avgScore/2}" data-size="xs">
											
											<p class="card-text m-0">
												<small class="text-muted">
													<c:forEach var="tag" items="${movie.tagList}" varStatus="i">
													${tag}<c:if test="${i.last eq false}">,</c:if>
													</c:forEach>
													|
													${movie.movieRunning}분
													|
													${movie.movieDate}
												</small>
											</p>
											<p class="card-text">
												<small class="text-muted">
													감독:
													<c:forEach var="person" items="${movie.personList}">
													<c:if test="${person.casting eq '감독'}">
													${person.personName}
													</c:if>
													</c:forEach>
													|
													출연:
													<c:forEach var="person" items="${movie.personList}" varStatus="i">
													<c:if test="${person.casting ne '감독'}">
													${person.personName}<c:if test="${i.last eq false}">,</c:if>
													</c:if>
													</c:forEach>
												</small>
											</p>
											
										</div>
									</div>
								</div>
							</div>
							
			    		</c:forEach>
		    	
			    	</div>
		    	</c:if>
				<!-- 태그검색 영화리스트 끝 -->
				
				
				<!-- 트레일러 검색 영화리스트 시작 -->
		    	<c:if test="${not empty trailerResultList}">
		    	
		    	<hr>
			    	<div class="container px-5 pb-3">
						<p class="pb-2"><b>동영상</b> (${trailerResultList.size()}건)</p>
						
			    		<c:forEach var="trailer" items="${trailerResultList}">
			    			
				    		<div class="card mb-3 border-0" id="${traier.movieId}">
								<div class="d-flex">
								
									<div class="ratio ratio-4x3 trailercard">
									  <iframe src="https://www.youtube.com/embed/${trailer.trailerUrl}?rel=0" class="card-img" allowfullscreen></iframe>
								    </div>
									
									<div class="d-flex align-items-center">
									
										<div class="card-body">
												
											<h4 class="card-title">${trailer.movieTitle}</h4>
											
											<p class="card-text">
												${trailer.trailerName}
											</p>
											
										</div>
										
									</div>
									
								</div>
							</div>
							
			    		</c:forEach>
			    	</div>
		    	
		    	</c:if>
				<!-- 트레일러검색 영화리스트 끝 -->
				
				<div class="container my-5 text-center">
					<p>영화정보의 수정이나 신규생성이 필요한 경우 운영자에게 제보로 문의해주세요</p>
					<form action="${conPath}/search.do" class="d-flex forms" role="search">
						<div class="d-flex w-75 m-auto">
							<input class="form-control mx-2" type="search" name="q" id="qs" placeholder="영화 통합 검색">
							<button class="btn w-25" id="submit" type="submit">검색</button>
						</div>
					</form>
				</div>
				
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
	$(document).on('ready', function () {
			
		$('.forms').submit(function(){
			var qs = $('#qs').val();
			if(qs.trim() == ''){
				alert('빈칸은 검색할 수 없습니다');
				return false;
			}
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
