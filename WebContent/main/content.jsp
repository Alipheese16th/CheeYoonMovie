<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	#myCarousel{ /*캐러샐 크기 고정 */
		width:900px;
		margin:0 auto;
	}

	.box-container{ /* 캐러셀 안에 설명 넣기 (가장 아래쪽에)  */
		display:flex;
		align-items:flex-end;
		text-align: center;
	}
	.box a{	/* 캐러샐 a태그설명 폰트색상 */
		text-decoration:none;
		color:white;
	}
	.carousel-item:hover{
		filter: brightness(80%);
		cursor:pointer;
	}
	
	.nowplaying .card{	/* 현재상영작 카드높이 고정 */
		height:400px;
	}
	.trailer .card{	/* 예고편 카드높이 고정 */
		height:250px;
	}
	.upcoming .card{	/* 상영예고작 카드높이 고정 */
		height:400px;
	}
	
 	.nowplaying .card-body,.upcoming .card-body{ /* 카드배경색 폰트색 */
 		background-color:#262626; 
 		color:white;
	} 
	.gogo{		/* 카드 보러가기 배경색 폰트색 */
		background-color:#444444;
		color:white;
	}
	.gogo:hover{	/* 카드 보러가기 호버 */
		background-color:#DDDDDD;
	}
	.card a{
		text-decoration:none;
		color:white;
	}
	
	.nowplaying .card img:hover{
		transform: scale(1.1);
  		transition: transform 2s;
 		filter: brightness(80%);
 		cursor:pointer;
	}
	.trailer .card img:hover{
 		transform: scale(1.1);
  		transition: transform 2s;
 		filter: brightness(80%);
 		cursor:pointer;
	}
	.upcoming .card img:hover{
		transform: scale(1.1);
  		transition: transform 2s;
 		filter: brightness(80%);
 		cursor:pointer;
	}
	.card{
		overflow:hidden;
	}
</style>
</head>
<body>
        
        <!-- carousel start -->
	<div class="container py-5 px-lg-5">
		<div id="myCarousel" class="carousel slide" data-bs-ride="carousel">

			<div class="carousel-inner">
			
				<c:forEach var="carousel" items="${carouselList}" begin="0" end="5" varStatus="status">
					
					<c:if test="${status.first eq true}">
					
						<div class="carousel-item active" onclick="location.href='${conPath}/movieContent.do?movieId=${carousel.movieId}'">
							<img class="bd-placeholder-img" src="https://img.youtube.com/vi/${carousel.trailerList[0].trailerUrl}/mqdefault.jpg" width="100%" height="400px">
				        	
				       		<rect width="100%" height="100%" fill="#777"></rect>
				       	 	<div class="container">
				         		<div class="carousel-caption sticky-bottom p-0">
				          
				           			<div class="box-container row">
				            			<div class="box col-3">
				            				<img src="${conPath}/movieImg/${carousel.movieImage}" width="120px" height="180px">
				            			</div>
				            			<div class="box col-9">
					            			<h3>
					            			${carousel.movieTitle}
					            			</h3>
				            			</div>
				            		</div>
				          		</div>
							</div>
						</div>
					
					</c:if>
					
					<c:if test="${status.first ne true}">
					
						<div class="carousel-item" onclick="location.href='${conPath}/movieContent.do?movieId=${carousel.movieId}'">
							<img class="bd-placeholder-img" src="https://img.youtube.com/vi/${carousel.trailerList[0].trailerUrl}/mqdefault.jpg" width="100%" height="400px">
				        	
				       		<rect width="100%" height="100%" fill="#777"></rect>
				       	 	<div class="container">
				         		<div class="carousel-caption sticky-bottom p-0">
				          
				           			<div class="box-container row">
				            			<div class="box col-3">
				            				<img src="${conPath}/movieImg/${carousel.movieImage}" width="120px" height="180px">
				            			</div>
				            			<div class="box col-9">
					            			<h3>
					            			${carousel.movieTitle}
					            			</h3>
				            			</div>
				            		</div>
				          		</div>
							</div>
						</div>
					
					</c:if>
				
				</c:forEach>
   			
<%-- 				<div class="carousel-item active" onclick="location.href='${conPath}/loginView.do'"> --%>
<%-- 					<img class="bd-placeholder-img" width="100%" height="400px" src="${conPath}/img/sample.jpg"> --%>
<!-- 		       		<rect width="100%" height="100%" fill="#777"></rect> -->
<!-- 			        <div class="container"> -->
<!-- 		         		<div class="carousel-caption sticky-bottom p-0"> -->
		          
<!-- 		           			<div class="box-container row"> -->
<!-- 		            			<div class="box col-3"> -->
<%-- 		            				<img src="${conPath}/img/sample2.jpg" width="120px" height="180px"> --%>
<!-- 		            			</div> -->
<!-- 		            			<div class="box col-9"> -->
<!-- 			            			<b> -->
<!-- 			            			예고편을 확인하시려면 클릭하세asdf<br> -->
<!-- 			            			이 영화의 예고편으로 이동합니다 감사합니다 -->
<!-- 			            			</b> -->
<!-- 		            			</div> -->
<!-- 		            		</div> -->
<!-- 		          		</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
			      
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
        
        <div class="container mt-5 py-2">
        	<div class="row">
        		<h1 class="">현재 추천 영화들 !</h1>
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
		       
<!-- 		        <div class="col"> -->
<!-- 		        	<div class="card shadow-sm border-0"> -->
<%-- 						<img src="${conPath}/img/harry.jpg" class="card-img-top" width="100%" height="225" onclick="location.href='${conPath}/loginView.do'"> --%>
<!-- 			            <div class="card-body"> -->
<!-- 				            <h5 class="card-title">해리포터</h5> -->
<!-- 				            <p class="card-text">1편 머시기</p> -->
<!-- 				            <div class="d-flex flex-column justify-content-end text-center"> -->
<!-- 					            <button class="btn w-75 m-auto gogo mb-2">보러가기</button> -->
<%-- 		            			<a href="#"><img src="${conPath}/img/play.png"> 트레일러</a> --%>
<!-- 				            </div> -->
<!-- 			            </div> -->
<!-- 		        	</div> -->
<!-- 		        </div> -->
		
		      </div>
		    </div>
		  </div>
		<!-- 카드리스트끝 -->

		<div class="container py-2">
        	<div class="row">
        		<h1 class="">예고편</h1>
        	</div>
        </div>
		
		<div class="album mb-5">
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


		<div class="container mt-5 pb-2">
        	<div class="row">
        		<h1 class="">상영 예고 작품</h1>
        	</div>
        </div>
        <!-- 카드리스트 -->
        <div class="album pb-5 mb-5">
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


		<div class="container mt-5 py-2">
        	<div class="row">
        		<h1 class="">예고편</h1>
        	</div>
        </div>
		
		<div class="album pb-5 mb-5">
    		<div class="container trailer mb-5">
      			<div class="row row-cols-1 row-cols-sm-1 row-cols-md-2 row-cols-lg-3 g-3">
		        
			        <div class="col">
			          	<div class="card border-0">
						  <img src="${conPath}/img/harry.jpg" class="card-img" width="100%" height="100%" onclick="location.href='${conPath}/loginView.do'"> 
						  
						  <div class="card-body">
				            <p class="card-text">
				            	<a href="#">1편 머시기 이것이 예고편이다. 웅남이를 다같이 보러가자 아싸리바이 ㅎㄴㅁ아ㅣ럼닝ㄹ</a>
				            </p>
			              </div>
			              
						</div>
			        </div>
			        
			        <div class="col">
			          	<div class="card border-0">
						  <img src="${conPath}/img/ungnam.jpg" class="card-img" width="100%" height="100%" onclick="location.href='${conPath}/loginView.do'">
						  
						  <div class="card-body">
				            <p class="card-text">
				            	<a href="#">1편 머시기 이것이 예고편이다. 웅남이를 다같이 보러가자 아싸리바이 ㅎㄴㅁ아ㅣ럼닝ㄹ</a>
				            </p>
			              </div>
			              
						</div>
			        </div>
		
			        <div class="col">
			          	<div class="card border-0">
						  <img src="${conPath}/img/sample.jpg" class="card-img" width="100%" height="100%" onclick="location.href='${conPath}/loginView.do'">
						  
						  <div class="card-body">
				            <p class="card-text">
				            	<a href="#">1편 머시기 이것이 예고편이다. 웅남이를 다같이 보러가자 아싸리바이 ㅎㄴㅁ아ㅣ럼닝ㄹ</a>
				            </p>
			              </div>
			              
						</div>
			        </div>
			        
		      	</div>
		    </div>
		</div>





</body>
</html>