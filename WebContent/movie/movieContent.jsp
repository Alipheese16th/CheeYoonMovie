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
		.myHeight{
			height:300px;
		}
		.myWidth{
			width:200px;
		}
		.trailercard{
			width: 20rem; min-width: 10rem;
		}
		.personcard{
			width: 8rem;
		}
		.personimg{
			height:10rem;
		}
	</style>
</head>
<body>

	<div class="d-flex" id="wrapper"> <!-- bg-black text-white -->
	
		<jsp:include page="../main/sidebar.jsp"/>
		
		<div id="page-content-wrapper">
		
			<jsp:include page="../main/header.jsp"/>
			
			<div class="container-fluid">
			    
			    
			    <div class="container mt-5 card w-75 m-auto">
			    
				    <div class="row text-center card-header">
				    	<h1>${movie.movieTitle}</h1>
				    	<h5 class="text-truncate">${movie.originalTitle}</h5>
				    </div>
				    
				    <div class="row mx-2">
				    	<div class="col-md-4">
				    		<img class="img-fluid myHeight" src="${conPath}/movieImg/${movie.movieImage}">
				    	</div>
				    	<div class="col-md-8">
						  
						  <c:forEach var="trailer" items="${movie.trailerList}">
						  	<c:if test="${trailer.trailerName eq '메인 예고편'}">
						  	  <div class="ratio ratio-16x9 myHeight">
							 	<iframe src="https://www.youtube.com/embed/${trailer.trailerUrl}" title="YouTube video" allowfullscreen></iframe>
							  </div>
						  	</c:if>
						  </c:forEach>
						  
				    	</div>
				    </div>
				    <div class="d-flex mx-5">
					    <div class="fs-3">
							네티즌 평점 : 
					    </div>
					    <div class="">
					    	<input type="text" class="kv-fa rating-loading" name="avgScore" value="${movie.avgScore}" data-size="sm" readonly>
					    </div>
				    </div>
				    
				    <hr>
				    
				    <div class="d-flex justify-content-between mx-5" style="padding:0 1rem;">
				    	<div>
				    		개요 : &nbsp; 
				    		<c:forEach var="tag" items="${movie.tagList}" varStatus="i">
							${tag}<c:if test="${i.last eq false}">,</c:if>
							</c:forEach>
				    	</div>
				    	<div>
				    		개봉일 : 
				    		${movie.movieDate} 개봉
				    	</div>
				    </div>
				    
				    <div class="row mx-5">
					    <div>
				    		상영시간 : 
				    		${movie.movieRunning}분
				    	</div>
				    </div>
				    
				    <div class="row mx-5">
				    	<div>
				    		감독 : 
							<c:forEach var="person" items="${movie.personList}">
								<c:if test="${person.casting eq '감독'}">
									${person.personName}
								</c:if>
							</c:forEach>
				    	</div>
				    	
				    </div>
				    
				    <div class="row mx-5">
				    	<div>
				    		출연 : 
							<c:forEach var="person" items="${movie.personList}" varStatus="i">
								<c:if test="${person.casting ne '감독'}">
									${person.personName}<c:if test="${i.last eq false}">,</c:if>
								</c:if>
							</c:forEach>
				    	</div>
				    </div>
				    
				    <div class="row mx-5">
				    	<div>
				    		등급 : 
				    		${movie.movieGrade}
				    	</div>
				    </div>
				    
				    <div class="row mx-5">
				    	<div>
				    		흥행 &nbsp; 누적관객 
					    	${movie.movieAudience}명
					    	<jsp:useBean id="now" class="java.util.Date"/>
							<fmt:formatDate var="today" value="${now}" pattern="MM.dd"/>
							<small>(${today} 기준)</small>
				    	</div>
				    </div>
				    
				    <hr>
				    
				    <div class="row mx-5">
				    	<div>
				    		<h3>줄거리</h3>
				    		<pre>${movie.movieSummary}</pre>
				    	</div>
				    </div>
				    
				    <hr>
				    
				    <div class="row mx-5">
				    	<div>
				    		<h3>배우/제작진</h3>
				    		<div class="d-flex">
				    			<c:forEach var="person" items="${movie.personList}">
				    			
					    			<div class="card me-2 mr-2 personcard">
									  <img src="${conPath}/personImg/${person.personImage}" class="card-img-top personimg">
									  <div class="card-body py-0">
									  	<p class="card-title my-1">
									  		${person.personName}
									  	</p>
									    <p class="card-text my-1">
									    	${person.casting}
									    	${person.role}
									    </p>
									  </div>
									</div>
					    			
					    		</c:forEach>
				    		</div>
				    	</div>
				    </div>
				    
				    <div class="row mx-5">
				    	<div>
				    		<h3>동영상</h3>
				    		<div class="d-flex ">
				    			<c:forEach var="trailer" items="${movie.trailerList}">
				    			
				    				  <div class="card trailercard">
										  <div class="ratio ratio-4x3">
											 <iframe src="https://www.youtube.com/embed/${trailer.trailerUrl}?rel=0" class="card-img" allowfullscreen></iframe>
										  </div>
										  <div class="card-body">
										    <p class="card-text">
										    	${trailer.trailerName}
										    </p>
										  </div>
									  </div>
									  
				    			</c:forEach>
				    			
				    		</div>
				    	</div>
				    </div>
				    
				    <div class="row"></div>
				    <div class="row"></div>
			    
			    </div>
			    
			    
			    
		        
			    
			    
			    
			    
<!-- 		        <form action="asdf.do"> -->
<!-- 		        	<input type="text" class="kv-fa rating-loading" name="star1" value="3.75" data-size="xl" title=""> -->
<!-- 			        <br> -->
<!-- 			        <input type="text" class="kv-fa rating-loading" name="star2" value="2.5" data-size="lg" title=""> -->
<!-- 			        <br> -->
<!-- 			        <input type="text" class="kv-fa rating-loading" name="star3" value="1.75" data-size="md" title=""> -->
<!-- 			        <br> -->
<!-- 			        <input type="text" class="kv-fa rating-loading" name="star4" value="4" data-size="sm" title=""> -->
<!-- 			        <br> -->
<!-- 			        <input type="text" class="kv-fa rating-loading" name="star5" value="2" data-size="xs" title=""> -->
<!-- 			        <br> -->
<!-- 			        <input type="submit"> -->
<!-- 		        </form> -->
			    
			    
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
		//별점기능 추가
        $('.kv-fa').rating({
            theme: 'krajee-fa',
            filledStar: '<i class="fa fa-star"></i>',
            emptyStar: '<i class="fa fa-star-o"></i>',
            stars:10,
            max:10,
            step:1,
            starCaptions:{
            	0: '0',
            	1: '1',
            	2: '2',
            	3: '3',
            	4: '4',
            	5: '5',
            	6: '6',
            	7: '7',
            	8: '8',
            	9: '9',
            	10: '10'
            }
        });
        $('.rating,.kv-fa').on(
                'change', function () {
                    console.log('Rating selected: ' + $(this).val());
        });
    });
</script>
</body>
</html>
