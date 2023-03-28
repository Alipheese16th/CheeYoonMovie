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
		a{
			text-decoration:none;
			color:black;
		}
		
		.nav-tabs .nav-item .nav-link {
		  background-color: #FFFFFF;
		  color: #000000;
		}
		
		.nav-tabs .nav-item .nav-link.active {
		  background-color: #444444;
		  color: #FFFFFF;
		}
		
		.pagination > li > a{
		    background-color: white;
		    color: #5A4181;
		}
		
		.pagination > li > a:focus,
		.pagination > li > a:hover,
		.pagination > li > span:focus,
		.pagination > li > span:hover{
		    color: #5a5a5a;
		    background-color: #eee;
		    border-color: #ddd;
		}
		
		.pagination > .active > a{
		    color: white;
		    background-color: #444444 !Important;
		    border: solid 1px #444444 !Important;
		}
		
		.pagination > .active > a:hover{
		    background-color: #444444 !Important;
		    border: solid 1px #444444;
		}
		
	</style>
	
</head>
<body>

	<div class="d-flex" id="wrapper"> <!-- bg-black text-white -->
		<jsp:include page="../main/sidebar.jsp"/>
		<div id="page-content-wrapper">
			<jsp:include page="../main/header.jsp"/>
			
			<div class="container">
			
				<div class="container pb-5">
				
			    	<h2 class="my-5 text-center">영화 순위</h2>
			    	
			    	<div class="container">
			    	
				    	<div>
					    	<ul class="nav nav-tabs">
							  <li class="nav-item">
							    <a class="nav-link <c:if test="${type eq 'default'}">active</c:if>" href="${conPath}/movieRanking.do?type=default">관람객순(현재 상영중)</a>
							  </li>
							  <li class="nav-item">
							    <a class="nav-link <c:if test="${type eq 'cur'}">active</c:if>" href="${conPath}/movieRanking.do?type=cur">평점순(현재 상영중)</a>
							  </li>
							  <li class="nav-item">
							    <a class="nav-link <c:if test="${type eq 'all'}">active</c:if>" href="${conPath}/movieRanking.do?type=all">평점순(모든영화)</a>
							  </li>
							</ul>
				    	</div>
				    	<div class="d-flex justify-content-between m-3">
				    		<div>순위</div>
				    		<div>영화명</div>
				    		<div>
				    			<jsp:useBean id="now" class="java.util.Date"/>
								<fmt:formatDate  value="${now}" pattern="yyyy.MM.dd" />
				    		</div>
				    	</div>
						<hr>
						<ol class="pe-3">
							<c:forEach var="movie" items="${list}" varStatus="i">
								<li class="py-2">
									<div class="d-flex justify-content-between">
										<div class="text-truncate">
											<a href="${conPath}/movieContent.do?movieId=${movie.movieId}">
												${movie.movieTitle} (${movie.originalTitle})
											</a>
										</div>
										<div>
											<c:if test="${type ne 'default'}">
												<div class="d-flex">
													<div>
														<input type="text" class="kv-fa rating-loading" value="${movie.avgScore/2}" data-size="xs">
													</div>
													&nbsp;
													<div class="text-bottom">
														<small>
														${movie.avgScore}
														</small>
													</div>
												</div>
											</c:if>
										</div>
									</div>
								</li>
								
								<c:if test="${i.count eq 10}">
									<hr>
								</c:if>
								
							</c:forEach>
						</ol>
						
					</div>
					
					
				
					<!-- 페이징 시작 -->
				    <nav aria-label="Page navigation example">
					  <ul class="pagination justify-content-center pb-2">
					  	<c:if test="${startPage <= BLOCKSIZE }">
						    <li class="page-item disabled">
							    <a class="page-link">
							    <span aria-hidden="true">&laquo;</span>
							    </a>
						    </li>
				   	 	</c:if>
				   	 	<c:if test="${startPage > BLOCKSIZE }">
						    <li class="page-item">
							    <a class="page-link" href="${conPath}/movieRanking.do?pageNum=${startPage-1}&type=${type}">
							    <span aria-hidden="true">&laquo;</span>
							    </a>
						    </li>
				    	</c:if>
				   	 	
				   	 	<c:forEach var="i" begin="${startPage}" end="${endPage}">
				   	 		<c:if test="${i eq currentPage }">
								<li class="page-item active"><a class="page-link">${i}</a></li>
							</c:if>
				   	 		<c:if test="${i ne currentPage }">
								<li class="page-item"><a class="page-link" href="${conPath}/movieRanking.do?pageNum=${i}&type=${type}">${i}</a></li>
							</c:if>
				   	 	</c:forEach>
				   	 	
				   	 	<c:if test="${endPage < pageCnt }">
							<li class="page-item">
								<a class="page-link" href="${conPath}/movieRanking.do?pageNum=${endPage+1}&type=${type}">
								<span aria-hidden="true">&raquo;</span>
								</a>
							</li>
						</c:if>
				   	 	<c:if test="${endPage >= pageCnt }">
							<li class="page-item disabled">
								<a class="page-link">
								<span aria-hidden="true">&raquo;</span>
								</a>
							</li>
						</c:if>
					    
					  </ul>
					</nav>
					<!-- 페이징 끝 -->
			
				
		    	</div>
				<!-- card -->
			    
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
