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
		text-align: start;
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
		transform: scale(1.2);
  		transition: transform 1s;
 		filter: brightness(70%);
 		cursor:pointer;
	}
	.trailer .card img:hover{
 		filter: brightness(80%);
 		cursor:pointer;
	}
	.upcoming .card img:hover{
		transform: scale(1.2);
  		transition: transform 1s;
 		filter: brightness(70%);
 		cursor:pointer;
	}
	
</style>
</head>
<body>

<div class="ratio ratio-1x1">
  <iframe src="https://www.youtube.com/embed/zpOULjyy-n8?rel=0" title="YouTube video" allowfullscreen></iframe>
</div>
<div class="ratio ratio-4x3">
  <iframe src="https://www.youtube.com/embed/zpOULjyy-n8?rel=0" title="YouTube video" allowfullscreen></iframe>
</div>
<<div class="ratio ratio-16x9">
  <iframe src="https://www.youtube.com/embed/zpOULjyy-n8?rel=0" title="YouTube video" allowfullscreen></iframe>
</div>
   <div class="ratio ratio-21x9">
  <iframe src="https://www.youtube.com/embed/zpOULjyy-n8?rel=0" title="YouTube video" allowfullscreen></iframe>
</div>     
        
        <!-- carousel start -->
	<div class="container py-5 px-lg-5">
		<div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
<!-- 				<div class="carousel-indicators"> -->
<!-- 			      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="" aria-label="Slide 1"></button> -->
<!-- 			      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2" class=""></button> -->
<!-- 			      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3" class="active" aria-current="true"></button> -->
<!--     			</div> -->
			<div class="carousel-inner">
   			
				<div class="carousel-item" onclick="location.href='${conPath}/loginView.do'">
		        	<img class="bd-placeholder-img" width="100%" height="400px" src="${conPath}/img/CheeYoonMovie.PNG" >
		       		<rect width="100%" height="100%" fill="#777"></rect>
		       	 	<div class="container">
		         		<div class="carousel-caption sticky-bottom p-0">
		          
		           			<div class="box-container row">
		            			<div class="box col-3">
		            				<img src="${conPath}/img/CheeYoonMovie.PNG" width="120px" height="180px">
		            			</div>
		            			<div class="box col-9">
			            			<b>
			            			예고편을 확인하시려면 클릭하세asdf<br>
			            			이 영화의 예고편으로 이동합니다 감사합니다
			            			</b>
		            			</div>
		            		</div>
		          		</div>
					</div>
				</div>
			      
				<div class="carousel-item" onclick="location.href='${conPath}/loginView.do'">
					<img class="bd-placeholder-img" width="100%" height="400px" src="${conPath}/img/sample2.jpg">
		       		<rect width="100%" height="100%" fill="#777"></rect>
			        <div class="container">
		         		<div class="carousel-caption sticky-bottom p-0">
		          
		           			<div class="box-container row">
		            			<div class="box col-3">
		            				<img src="${conPath}/img/harry.jpg" width="120px" height="180px">
		            			</div>
		            			<div class="box col-9">
			            			<b>
			            			예고편을 확인하시려면 클릭하세asdf<br>
			            			이 영화의 예고편으로 이동합니다 감사합니다
			            			</b>
		            			</div>
		            		</div>
		          		</div>
					</div>
		      	</div>
			      
				<div class="carousel-item active" onclick="location.href='${conPath}/loginView.do'">
					<img class="bd-placeholder-img" width="100%" height="400px" src="${conPath}/img/sample.jpg">
		       		<rect width="100%" height="100%" fill="#777"></rect>
			        <div class="container">
		         		<div class="carousel-caption sticky-bottom p-0">
		          
		           			<div class="box-container row">
		            			<div class="box col-3">
		            				<img src="${conPath}/img/sample2.jpg" width="120px" height="180px">
		            			</div>
		            			<div class="box col-9">
			            			<b>
			            			예고편을 확인하시려면 클릭하세asdf<br>
			            			이 영화의 예고편으로 이동합니다 감사합니다
			            			</b>
		            			</div>
		            		</div>
		          		</div>
					</div>
				</div>
			      
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
        <div class="album pb-5 mb-5">
		    <div class="container nowplaying">
		      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 row-cols-xl-6 g-3">

		        <div class="col">
		          <div class="card shadow-sm border-0">
					<img src="${conPath}/img/harry.jpg" class="card-img-top" width="100%" height="225" onclick="location.href='${conPath}/loginView.do'">
		            <div class="card-body">
			            <h5 class="card-title">해리포터</h5>
			            <p class="card-text">1편 머시기</p>
			            <div class="d-flex flex-column justify-content-end text-center">
				            <button class="btn w-75 m-auto gogo mb-2">보러가기</button>
		            		<a href="#"><img src="${conPath}/img/play.png"> 트레일러</a>
			            </div>
		            </div>
		          </div>
		        </div>
		        <div class="col">
		        	<div class="card shadow-sm border-0">
						<img src="${conPath}/img/harry.jpg" class="card-img-top" width="100%" height="225" onclick="location.href='${conPath}/loginView.do'">
			            <div class="card-body">
				            <h5 class="card-title">해리포터</h5>
				            <p class="card-text">1편 머시기</p>
				            <div class="d-flex flex-column justify-content-end text-center">
					            <button class="btn w-75 m-auto gogo mb-2">보러가기</button>
		            			<a href="#"><img src="${conPath}/img/play.png"> 트레일러</a>
				            </div>
			            </div>
		        	</div>
		        </div>
		        <div class="col">
		        	<div class="card shadow-sm border-0">
						<img src="${conPath}/img/harry.jpg" class="card-img-top" width="100%" height="225" onclick="location.href='${conPath}/loginView.do'">
			            <div class="card-body">
				            <h5 class="card-title">해리포터</h5>
				            <p class="card-text">1편 머시기</p>
				            <div class="d-flex flex-column justify-content-end text-center">
					            <button class="btn w-75 m-auto gogo mb-2">보러가기</button>
		            			<a href="#"><img src="${conPath}/img/play.png"> 트레일러</a>
				            </div>
			            </div>
		        	</div>
		        </div>
		
		        <div class="col">
		        	<div class="card shadow-sm border-0">
						<img src="${conPath}/img/harry.jpg" class="card-img-top" width="100%" height="225" onclick="location.href='${conPath}/loginView.do'">
			            <div class="card-body">
				            <h5 class="card-title">해리포터</h5>
				            <p class="card-text">1편 머시기</p>
				            <div class="d-flex flex-column justify-content-end text-center">
					            <button class="btn w-75 m-auto gogo mb-2">보러가기</button>
		            			<a href="#"><img src="${conPath}/img/play.png"> 트레일러</a>
				            </div>
			            </div>
		        	</div>
		        </div>
		        <div class="col">
					<div class="card shadow-sm border-0">
						<img src="${conPath}/img/harry.jpg" class="card-img-top" width="100%" height="225" onclick="location.href='${conPath}/loginView.do'">
			            <div class="card-body">
				            <h5 class="card-title">해리포터</h5>
				            <p class="card-text">1편 머시기</p>
				            <div class="d-flex flex-column justify-content-end text-center">
					            <button class="btn w-75 m-auto gogo mb-2">보러가기</button>
		            			<a href="#"><img src="${conPath}/img/play.png"> 트레일러</a>
				            </div>
			            </div>
		        	</div>
		        </div>
		        <div class="col">
		        	<div class="card shadow-sm border-0">
						<img src="${conPath}/img/harry.jpg" class="card-img-top" width="100%" height="225" onclick="location.href='${conPath}/loginView.do'">
			            <div class="card-body">
				            <h5 class="card-title">해리포터</h5>
				            <p class="card-text">1편 머시기</p>
				            <div class="d-flex flex-column justify-content-end text-center">
					            <button class="btn w-75 m-auto gogo mb-2">보러가기</button>
		            			<a href="#"><img src="${conPath}/img/play.png"> 트레일러</a>
				            </div>
			            </div>
		        	</div>
		        </div>
		
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
    		<div class="container trailer">
      			<div class="row row-cols-1 row-cols-sm-1 row-cols-md-2 row-cols-lg-3 g-3">
		        
			        <div class="col">
			          	<div class="card border-0">
<%-- 						  <img src="${conPath}/img/ungnam.jpg" class="card-img" width="100%" height="100%" onclick="location.href='${conPath}/loginView.do'"> --%>
						  
						  <div class="ratio ratio-4x3">
							 <iframe src="https://www.youtube.com/embed/zpOULjyy-n8?rel=0" class="card-img" title="YouTube video" allowfullscreen></iframe>
						  </div>
													  
						  
						  
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
						  <img src="${conPath}/img/ungnam.jpg" class="card-img" width="100%" height="100%" onclick="location.href='${conPath}/loginView.do'">
						  
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


		<div class="container mt-5 pt-5 pb-2">
        	<div class="row">
        		<h1 class="">상영 예고 작품</h1>
        	</div>
        </div>
        <!-- 카드리스트 -->
        <div class="album pb-5 mb-5">
		    <div class="container upcoming">
		      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 row-cols-xl-6 g-3">

		        <div class="col">
		          <div class="card shadow-sm border-0">
					<img src="${conPath}/img/harry.jpg" class="card-img-top" width="100%" height="225" onclick="location.href='${conPath}/loginView.do'">
		            <div class="card-body">
			            <h5 class="card-title">해리포터</h5>
			            <p class="card-text">1편 머시기</p>
			            <div class="d-flex flex-column justify-content-end text-center">
				            <button class="btn w-75 m-auto gogo mb-2">보러가기</button>
		            		<a href="#"><img src="${conPath}/img/play.png"> 트레일러</a>
			            </div>
		            </div>
		          </div>
		        </div>
		        <div class="col">
		        	<div class="card shadow-sm border-0">
						<img src="${conPath}/img/harry.jpg" class="card-img-top" width="100%" height="225" onclick="location.href='${conPath}/loginView.do'">
			            <div class="card-body">
				            <h5 class="card-title">해리포터</h5>
				            <p class="card-text">1편 머시기</p>
				            <div class="d-flex flex-column justify-content-end text-center">
					            <button class="btn w-75 m-auto gogo mb-2">보러가기</button>
		            			<a href="#"><img src="${conPath}/img/play.png"> 트레일러</a>
				            </div>
			            </div>
		        	</div>
		        </div>
		        <div class="col">
		        	<div class="card shadow-sm border-0">
						<img src="${conPath}/img/harry.jpg" class="card-img-top" width="100%" height="225" onclick="location.href='${conPath}/loginView.do'">
			            <div class="card-body">
				            <h5 class="card-title">해리포터</h5>
				            <p class="card-text">1편 머시기</p>
				            <div class="d-flex flex-column justify-content-end text-center">
					            <button class="btn w-75 m-auto gogo mb-2">보러가기</button>
		            			<a href="#"><img src="${conPath}/img/play.png"> 트레일러</a>
				            </div>
			            </div>
		        	</div>
		        </div>
		
		        <div class="col">
		        	<div class="card shadow-sm border-0">
						<img src="${conPath}/img/harry.jpg" class="card-img-top" width="100%" height="225" onclick="location.href='${conPath}/loginView.do'">
			            <div class="card-body">
				            <h5 class="card-title">해리포터</h5>
				            <p class="card-text">1편 머시기</p>
				            <div class="d-flex flex-column justify-content-end text-center">
					            <button class="btn w-75 m-auto gogo mb-2">보러가기</button>
		            			<a href="#"><img src="${conPath}/img/play.png"> 트레일러</a>
				            </div>
			            </div>
		        	</div>
		        </div>
		        <div class="col">
					<div class="card shadow-sm border-0">
						<img src="${conPath}/img/harry.jpg" class="card-img-top" width="100%" height="225" onclick="location.href='${conPath}/loginView.do'">
			            <div class="card-body">
				            <h5 class="card-title">해리포터</h5>
				            <p class="card-text">1편 머시기</p>
				            <div class="d-flex flex-column justify-content-end text-center">
					            <button class="btn w-75 m-auto gogo mb-2">보러가기</button>
		            			<a href="#"><img src="${conPath}/img/play.png"> 트레일러</a>
				            </div>
			            </div>
		        	</div>
		        </div>
		        <div class="col">
		        	<div class="card shadow-sm border-0">
						<img src="${conPath}/img/harry.jpg" class="card-img-top" width="100%" height="225" onclick="location.href='${conPath}/loginView.do'">
			            <div class="card-body">
				            <h5 class="card-title">해리포터</h5>
				            <p class="card-text">1편 머시기</p>
				            <div class="d-flex flex-column justify-content-end text-center">
					            <button class="btn w-75 m-auto gogo mb-2">보러가기</button>
		            			<a href="#"><img src="${conPath}/img/play.png"> 트레일러</a>
				            </div>
			            </div>
		        	</div>
		        </div>
		
		      </div>
		    </div>
		  </div>
		<!-- 카드리스트끝 -->




</body>
</html>