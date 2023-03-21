<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>
        
        <!-- carousel start -->
	<div class="container py-5 px-lg-5">
		<div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
<!-- 				<div class="carousel-indicators"> -->
<!-- 			      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="" aria-label="Slide 1"></button> -->
<!-- 			      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2" class=""></button> -->
<!-- 			      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3" class="active" aria-current="true"></button> -->
<!--     			</div> -->
			<div class="carousel-inner">
   			
				<div class="carousel-item">
      				<div class="container">
      					<div class="row justify-content-evenly">
				      		<div class="col-3">
							    <img src="${conPath}/img/dduk.jpg" class="m-0 d-block" width="200px" height="200px">
				      		</div>
				      		<div class="col-3">
						      	<img src="${conPath}/img/dduk.jpg" class="m-0 d-block" width="200px" height="200px">
				      		</div>
				      		<div class="col-3">
						      	<img src="${conPath}/img/dduk.jpg" class="m-0 d-block" width="200px" height="200px">
				      		</div>
				      		<div class="col-3">
						      	<img src="${conPath}/img/dduk.jpg" class="m-0 d-block" width="200px" height="200px">
				      		</div>
				      	</div>
				      	<div class="row justify-content-end">
				      		<div class="col-3">
						      	<img src="${conPath}/img/dduk.jpg" width="200px" height="200px">
				      		</div>
				      		<div class="col-3">
						      	<img src="${conPath}/img/dduk.jpg" width="200px" height="200px">
				      		</div>
				      		<div class="col-3">
						      	<img src="${conPath}/img/dduk.jpg" width="200px" height="200px">
				      		</div>
				      		<div class="col-3">
						      	<img src="${conPath}/img/dduk.jpg" width="200px" height="200px">
				      		</div>
				      	</div>
					</div>
				</div>
			      
			      <div class="carousel-item">
			        <svg class="bd-placeholder-img" width="100%" height="400px" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"></rect></svg>
			        <div class="container">
			          <div class="carousel-caption">
			            <h1>asdfasdfasdf</h1>
			            <p>Some representative placeholder content for the second slide of the carousel.</p>
			            <p><a class="btn btn-lg btn-primary" href="#">Learn more</a></p>
			          </div>
			        </div>
			      </div>
			      
			      <div class="carousel-item active">
			        <svg class="bd-placeholder-img" width="100%" height="400px" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"></rect></svg>
			        <div class="container">
			          <div class="carousel-caption text-end">
			            <h1>One more for good measure.</h1>
			            <p>Some representative placeholder content for the third slide of this carousel.</p>
			            <p><a class="btn btn-lg btn-primary" href="#">Browse gallery</a></p>
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
        
        
        <div class="container text-center">
        	<div class="row">
        		<div class="col-4">
        			<h1>힘드네</h1>
        			<p>개힘들어</p>
        		</div>
        		<div class="col-4">
        			<h1>힘드네</h1>
        			<p>개힘들어</p>
        		</div>
        		<div class="col-4">
        			<h1>힘드네</h1>
        			<p>개힘들어</p>
        		</div>
        	</div>
        </div>
      
</body>
</html>