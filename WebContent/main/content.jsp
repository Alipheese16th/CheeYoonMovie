<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${conPath}/css/content.css" rel="stylesheet">
</head>
<body>

    <!-- carousel start -->
	<div class="container py-5 px-lg-5">
		<div id="myCarousel" class="carousel slide" data-bs-ride="carousel">

			<div class="carousel-inner">
			
				<c:forEach var="carousel" items="${carouselList}" begin="0" end="5" varStatus="status">
					
					<c:if test="${status.first eq true}">
					
						<div class="carousel-item active" onclick="location.href='${conPath}/movieContent.do?movieId=${carousel.movieId}'">
							<img class="bd-placeholder-img" src="https://img.youtube.com/vi/${carousel.trailerList[0].trailerUrl}/maxresdefault.jpg" width="100%" height="500px">
				       	 	<div class="container">
				         		<div class="carousel-caption sticky-bottom p-0">
				          
				           			<div class="box-container sticky-bottom p-0">
				            			<div class="box col-3">
				            				<img src="${conPath}/movieImg/${carousel.movieImage}" width="160px" height="240px">
				            			</div>
				            			<div class="box col-9">
					            			<h5>
					            			<br>
					            			${carousel.movieTitle}<br>
					            			${carousel.trailerList[0].trailerName}
					            			</h5>
				            			</div>
				            		</div>
				          		</div>
							</div>
						</div>
					
					</c:if>
					
					<c:if test="${status.first ne true}">
					
						<div class="carousel-item" onclick="location.href='${conPath}/movieContent.do?movieId=${carousel.movieId}'">
							<img class="bd-placeholder-img" src="https://img.youtube.com/vi/${carousel.trailerList[0].trailerUrl}/maxresdefault.jpg" width="100%" height="500px">
				       	 	<div class="container">
				         		<div class="carousel-caption sticky-bottom p-0">
				          
				           			<div class="box-container  sticky-bottom p-0">
				            			<div class="box col-3">
				            				<img src="${conPath}/movieImg/${carousel.movieImage}" width="160px" height="240px">
				            			</div>
				            			<div class="box col-9">
					            			<h5>
					            			<br>
					            			${carousel.movieTitle}<br>
					            			${carousel.trailerList[0].trailerName}
					            			</h5>
				            			</div>
				            		</div>
				          		</div>
							</div>
						</div>
					
					</c:if>
				
				</c:forEach>
			      
				</div>
				    <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
					    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					    <span class="visually-hidden">Previous</span>
				    </button>
				    <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
					    <span class="carousel-control-next-icon" aria-hidden="true"></span>
					    <span class="visually-hidden">Next</span>
				    </button>
				</div>
			</div>
        <!-- carousel end -->
        
        <div class="container py-2">
        	<div class="row">
        		<h1>현재 추천 영화</h1>
        	</div>
        </div>
        
        <!-- 카드리스트 -->
        <div class="album mb-5">
		    <div class="container nowplaying">
		      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 row-cols-xl-6 g-3">

				<c:forEach var="nowPlay" items="${nowPlayingList}" begin="0" end="5">
					
					<div class="col">
					
			          <div class="card shadow-sm border-0">
			          
						<img src="${conPath}/movieImg/${nowPlay.movieImage}" class="card-img-top" width="100%" height="225" 
							onclick="location.href='${conPath}/movieContent.do?movieId=${nowPlay.movieId}'">
			            <div class="card-body">
				            <h5 class="card-title">${nowPlay.movieTitle}</h5>
				            <br>
				            <div class="d-flex flex-column text-center">
					            <button class="btn w-75 m-auto gogo mb-2" onclick="location.href='${conPath}/movieContent.do?movieId=${nowPlay.movieId}'">
					            	보러가기
					            </button>
			            		<a href="https://www.youtube.com/watch?v=${nowPlay.trailerList[0].trailerUrl}"><img src="${conPath}/img/play.png">트레일러</a>
				            </div>
			            </div>
			            
			          </div>
			          
			        </div>
					
				</c:forEach>
		
		      </div>
		    </div>
		  </div>
		<!-- 카드리스트끝 -->

		<div class="container py-2">
        	<div class="row">
        		<h1 class="m-0">예고편 영상</h1>
        	</div>
        </div>
		
		<div class="album mb-3">
    		<div class="container youtube">
      			<div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-3">
      			
      			<c:forEach var="trailer" items="${trailerList}" begin="0" end="5">
      			
      				<div class="col">
					  <div class="ratio ratio-4x3">
						 <iframe src="https://www.youtube.com/embed/${trailer.trailerUrl}?rel=0" class="card-img" title="YouTube video" allowfullscreen></iframe>
					  </div>
			        </div>
			        
		        </c:forEach>
			        
		      	</div>
		    </div>
		</div>

		<div class="container pb-2">
        	<div class="row">
        		<h1>개봉 예정 영화</h1>
        	</div>
        </div>
        
        <!-- 카드리스트 -->
        <div class="album pb-5">
		    <div class="container upcoming">
		      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 row-cols-xl-6 g-3">

				<c:forEach var="upComing" items="${upComingList}" begin="0" end="5">
					
					<div class="col">
					
			          <div class="card shadow-sm border-0">
			          
						<img src="${conPath}/movieImg/${upComing.movieImage}" class="card-img-top" width="100%" height="225" 
							onclick="location.href='${conPath}/movieContent.do?movieId=${upComing.movieId}'">
			            <div class="card-body">
				            <h5 class="card-title">${upComing.movieTitle}</h5>
				            <br>
				            <div class="d-flex flex-column text-center">
					            <button class="btn w-75 m-auto gogo mb-2" onclick="location.href='${conPath}/movieContent.do?movieId=${upComing.movieId}'">
					            	보러가기
					            </button>
			            		<a href="https://www.youtube.com/watch?v=${upComing.trailerList[0].trailerUrl}"><img src="${conPath}/img/play.png"> 트레일러</a>
				            </div>
			            </div>
			            
			          </div>
			          
			        </div>
					
				</c:forEach>
		
		      </div>
		    </div>
		  </div>
		<!-- 카드리스트끝 -->

</body>
</html>