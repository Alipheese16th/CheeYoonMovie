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
	<link href="${conPath}/css/insert.css" rel="stylesheet" />
</head>
<body>

<c:if test="${not empty registerMovieError}">
	<script>alert('${registerMovieError}');</script>
</c:if>
<c:if test="${not empty rigsterMovieResult}">
	<script>alert('${rigsterMovieResult}');</script>
</c:if>
<c:if test="${not empty insertTagResult}">
	<script>alert('${insertTagResult}');</script>
</c:if>
<c:if test="${not empty insertTrailerResult}">
	<script>alert('${insertTrailerResult}');</script>
</c:if>
<c:if test="${not empty refreshMovieResult}">
	<script>alert('${refreshMovieResult}');</script>
</c:if>

	<div class="d-flex bg-black" id="wrapper">
		<jsp:include page="../main/sidebar.jsp"/>
		<div id="page-content-wrapper">
			<jsp:include page="../main/header.jsp"/>
			<div class="container-fluid">
			    
			    <div class="container mt-5 card m-auto mw-75 mw-25 pb-5">
			    	
			    	<div class="row text-center card-header">
				    	<h2 class="m-0 p-2 text-white">관리자 등록 모드</h2>
				    </div>
				    
				    <div class="d-flex justify-content-end mt-2">
				    	<button class="btn btn-dark" onclick="location.href='${conPath}/refreshMovie.do'">영화 업데이트</button>
				    </div>
				    
			    	<div class="container p-3">
			    		
			    		<div class="card p-5 text-center">
			    			<h5>영화 등록</h5>
			    			<div class="d-flex justify-content-center mt-3">
					    		<button class="insertMovie btn btn-outline-dark w-50">영화 등록</button>
			    			</div>
			    		</div>
			    		
			    		<!-- 영화 등록 form -->
			    		<div class="card w-75" id="movieForm">
              				<form action="${conPath}/insertMovie.do" method="post" enctype="multipart/form-data">
              				
              					<div class="card-header text-white">
									<h3 class="text-center">영화 등록</h3>
								</div>
								
								<div class="card-body">
								
					                <div class="form-outline">
					                  <label class="form-label" for="movieTitle">영화 타이틀(한글)</label>
					                  <input type="text" name="movieTitle" id="movieTitle" class="form-control" required="required"/>
					                </div>
					
					                <div class="form-outline">
					                  <label class="form-label" for="originalTitle">영화 타이틀(원제목 영어)</label>
					                  <input type="text" name="originalTitle" id="originalTitle" class="form-control" required="required"/>
					                </div>
					
									<div class="form-outline">
					                  <label class="form-label" for="movieSummary">영화 줄거리</label>
					                  <textarea class="form-control form-control-lg" rows="3" cols="30" name="movieSummary" id="movieSummary"></textarea>
					                </div>
					
									<div class="form-outline">
					                  <label class="form-label" for="movieRunning">영화 상영시간</label>
					                  <input type="number" name="movieRunning" id="movieRunning" class="form-control" />
					                </div>
									
									<div class="form-outline">
					                  <label class="form-label" for="movieImage">영화 이미지</label>
					                  <input type="file" name="movieImage" id="movieImage" class="form-control" />
					                </div>
					
									<div class="form-outline">
					                  <label class="form-label" for="movieDate">영화 개봉일</label>
					                  <input type="text" name="movieDate" id="datepicker" class="form-control" />
					                </div>
					
									<div class="form-outline">
					                  <label class="form-label" for="movieGrade">영화 등급</label>
					                  <input type="text" name="movieGrade" id="movieGrade" list="gradeList" class="form-control" />
					                  <datalist id="gradeList">
					                  	<option value="전체 관람가"></option>
					                  	<option value="12세 관람가"></option>
					                  	<option value="15세 관람가"></option>
					                  	<option value="청소년 관람불가"></option>
					                  </datalist>
					                </div>
					
									<div class="form-outline">
					                  <label class="form-label" for="movieAudience">누적 관객</label>
					                  <input type="number" name="movieAudience" id="movieAudience" class="form-control" />
					                </div>
					
									<div class="form-outline">
					                  <label class="form-label" for="state">영화 상태</label>
					                  <select name="state" id="state">
					                  	<option value="0">미정</option>
					                  	<option value="1">개봉 예정</option>
					                  	<option value="2">상영중</option>
					                  	<option value="3">상영종료</option>
					                  </select>
					                </div>
					                
					                 <div class="d-flex justify-content-center">
									    <input type="button" value="취소" id="movieCancel" class="btn btn-outline-dark w-25 mx-2">
									    <input type="submit" value="확인" class="btn btn-dark w-25 mx-2">
								    </div>
				                
				                </div>
							</form>
			            </div>
			    		<!-- 영화 등록 form끝 -->
				    	
				    	<hr>
				    	
				    	<div class="card  p-5 text-center">
			    			<h5>태그 등록</h5>
			    			<div class="d-flex justify-content-center mt-3">
				    			<button class="insertTag btn btn-outline-dark w-50">태그 등록</button>
			    			</div>
			    		</div>
			    		
			    		<!-- 태그 등록 form -->
			    		<div class="card w-50" id="tagForm">
              				<form action="${conPath}/insertTag.do" method="post">
              				
              					<div class="card-header text-white">
									<h3 class="text-center">태그 등록</h3>
								</div>
								
								<div class="card-body">
								
									<div class="form-outline mb-3">
					                  <label class="form-label" for="tagId">영화아이디</label>
					                  <select id="tagId" name="movieId" class="selectpicker my-select" data-live-search="true">
					                  	  <c:forEach var="movie" items="${movieList}">
					                  	  	<option value="${movie.movieId}">${movie.movieTitle}</option>
					                  	  </c:forEach>
								      </select>
						            </div>
					
									<div class="form-outline mb-3">
					                  <label class="form-label" for="tag">태그</label>
					                  <input type="text" name="tag" id="tag" list="taglist" class="form-control form-control-sm w-50" />
					                  <datalist id="taglist">
					                  	<option value="공포"></option>
					                  	<option value="판타지"></option>
					                  	<option value="모험"></option>
					                  	<option value="초능력"></option>
					                  	<option value="애니메이션"></option>
					                  	<option value="일상"></option>
					                  	<option value="드라마"></option>
					                  	<option value="코미디"></option>
					                  	<option value="액션"></option>
					                  	<option value="스릴러"></option>
					                  	<option value="범죄"></option>
					                  	<option value="멜로/로맨스"></option>
					                  </datalist>
					                </div>
					                
					                 <div class="d-flex justify-content-center">
									    <input type="button" value="취소" id="tagCancel" class="btn btn-outline-dark w-25 mx-2">
									    <input type="submit" value="확인" class="btn btn-dark w-25 mx-2">
								    </div>
					                
				                
				                </div>
							</form>
			            </div>
			    		<!-- 태그 등록 form끝 -->
			    		
			    		<hr>
				    	
				    	<div class="card  p-5 text-center">
				    		<h5>트레일러 등록</h5>
				    		<div class="d-flex justify-content-center mt-3">
								<button class="insertTrailer btn btn-outline-dark w-50">예고편 등록</button>
				    		</div>
				    	</div>
				    	
				    	<!-- 트레일러 등록 form -->
			    		<div class="card w-50" id="trailerForm">
              				<form action="${conPath}/insertTrailer.do" method="post">
              				
              					<div class="card-header text-white">
									<h3 class="text-center">예고편 등록</h3>
								</div>
								
								<div class="card-body">
								
									<div class="form-outline mb-3">
					                  <label class="form-label" for="trailerId">영화아이디</label>
					                  <select id="trailerId" name="movieId" class="selectpicker my-select" data-live-search="true">
					                  	  <c:forEach var="movie" items="${movieList}">
					                  	  	<option value="${movie.movieId}">${movie.movieTitle}</option>
					                  	  </c:forEach>
								      </select>
						            </div>
						            
						            <div class="form-outline">
					                  <label class="form-label" for="trailerName">예고편 종류</label>
					                  <input type="text" name="trailerName" id="trailerName" class="form-control" required="required"/>
					                </div>
									
									<div class="form-outline">
					                  <label class="form-label" for="trailerUrl">유튜브url(v값)</label>
					                  <input type="text" name="trailerUrl" id="trailerUrl" class="form-control" required="required"/>
					                </div>
					                
					                 <div class="d-flex justify-content-center">
									    <input type="button" value="취소" id="trailerCancel" class="btn btn-outline-dark w-25 mx-2">
									    <input type="submit" value="확인" class="btn btn-dark w-25 mx-2">
								    </div>
					                
				                
				                </div>
							</form>
			            </div>
			    		<!-- 트레일러 등록 form끝 -->

			    	</div>
			    	
			    	<div class="py-5"></div>
			    
			    </div><!-- card container 끝 -->
			    
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
<script src="${conPath}/js/insert.js"></script>

</body>
</html>
