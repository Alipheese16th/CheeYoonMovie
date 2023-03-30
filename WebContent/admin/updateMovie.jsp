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
	<!-- bootstrap-select -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.14.0-beta2/dist/css/bootstrap-select.min.css">
	<!-- datepicker -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
	
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	
	<style>
	</style>
</head>
<body>
	
	<div class="d-flex bg-dark" id="wrapper">
	
		<jsp:include page="../main/sidebar.jsp"/>
		
		<div id="page-content-wrapper">
		
			<jsp:include page="../main/header.jsp"/>
			
			<div class="container-fluid">
				
				<!-- 영화 수정 form -->
	    		<div class="card w-75 m-auto">
         			<form action="${conPath}/updateMovie.do" method="post" enctype="multipart/form-data">
         			<input type="hidden" name="oldImage" value="${movie.movieImage}">
         			<input type="hidden" name="movieId" value="${movie.movieId}">
         			<input type="hidden" name="q" value="${param.q}">
         			
            			<div class="row g-0">
            			
            				<div class="col-md-4">
			           			<img src="${conPath}/movieImg/${movie.movieImage}" class="card-img-top myimg">
            				</div>
		           			
		           			<div class="col-md-8">
								
								<div class="card-body">
								
					                <div class="form-outline">
					                  <label class="form-label" for="movieTitle">영화 타이틀(한글)</label>
					                  <input type="text" name="movieTitle" id="movieTitle" class="form-control" required="required" value="${movie.movieTitle}"/>
					                </div>
					
					                <div class="form-outline">
					                  <label class="form-label" for="originalTitle">영화 타이틀(원제목 영어)</label>
					                  <input type="text" name="originalTitle" id="originalTitle" class="form-control" required="required" value="${movie.originalTitle}"/>
					                </div>
					
									<div class="form-outline">
					                  <label class="form-label" for="movieSummary">영화 줄거리</label>
					                  <textarea class="form-control form-control-lg" rows="3" cols="30" name="movieSummary" id="movieSummary">${movie.movieSummary}</textarea>
					                </div>
					
									<div class="form-outline">
					                  <label class="form-label" for="movieRunning">영화 상영시간</label>
					                  <input type="number" name="movieRunning" id="movieRunning" class="form-control" value="${movie.movieRunning}"/>
					                </div>
									
									<div class="form-outline">
					                  <label class="form-label" for="movieImage">영화 이미지</label>
					                  <input type="file" name="movieImage" id="movieImage" class="form-control"/>
					                </div>
					
									<div class="form-outline">
					                  <label class="form-label" for="movieDate">영화 개봉일</label>
					                  <input type="text" name="movieDate" id="datepicker" class="form-control" value="${movie.movieDate}"/>
					                </div>
					
									<div class="form-outline">
					                  <label class="form-label" for="movieGrade">영화 등급</label>
					                  <input type="text" name="movieGrade" id="movieGrade" list="gradeList" class="form-control" value="${movie.movieGrade}"/>
					                  <datalist id="gradeList">
					                  	<option value="전체 관람가"></option>
					                  	<option value="12세 관람가"></option>
					                  	<option value="15세 관람가"></option>
					                  	<option value="청소년 관람불가"></option>
					                  </datalist>
					                </div>
					
									<div class="form-outline">
					                  <label class="form-label" for="movieAudience">누적 관객</label>
					                  <input type="number" name="movieAudience" id="movieAudience" class="form-control" value="${movie.movieAudience}"/>
					                </div>
					
									<div class="form-outline">
					                  <label class="form-label" for="state">영화 상태</label>
					                  <select name="state" id="state">
					                  	<option value="0" <c:if test="${movie.state eq '0'}">checked="checked"</c:if>>미정</option>
					                  	<option value="1" <c:if test="${movie.state eq '1'}">checked="checked"</c:if>>개봉 예정</option>
					                  	<option value="2" <c:if test="${movie.state eq '2'}">checked="checked"</c:if>>상영중</option>
					                  	<option value="3" <c:if test="${movie.state eq '3'}">checked="checked"</c:if>>상영종료</option>
					                  </select>
					                </div>
					                
					                 <div class="d-flex justify-content-center">
									    <input type="button" value="취소" class="btn btn-outline-dark w-25 mx-2" onclick="history.back()">
									    <input type="submit" value="확인" class="btn btn-dark w-25 mx-2">
								    </div>
				                
				                </div>
			                
			                </div>
		                
		                </div>
					</form>
	            </div>
	    		<!-- 영화 수정 form끝 -->
			
			</div>
			<jsp:include page="../main/footer.jsp"/>
		</div>
		
	</div>
	
<!-- datepicker -->
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="${conPath}/js/scripts.js"></script>
<!-- bootstrap-select -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.14.0-beta2/dist/js/bootstrap-select.min.js"></script>
</body>
</html>