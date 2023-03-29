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
	<!-- datepicker -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

	<style>
	#movieForm{
		position:fixed;
		top:0%;
		left:12.5%;
		display:none;
		z-index:9;
	}
	.card-header{
		background-color:#444444;
	}
	</style>
	
</head>
<body>

	<div class="d-flex bg-black" id="wrapper"> <!-- bg-black text-white -->
		<jsp:include page="../main/sidebar.jsp"/>
		<div id="page-content-wrapper">
			<jsp:include page="../main/header.jsp"/>
			<div class="container-fluid">
			    
			    <div class="container mt-5 card m-auto mw-75 mw-25 pb-5">
			    	
			    	<div class="row text-center card-header">
				    	<h2 class="m-0 p-2 text-white">관리자 등록 모드</h2>
				    </div>
				    
			    	<div class="container p-3">
			    		
			    		<div class="card">
			    			<h5>영화 등록(태그포함)</h5>
				    		<button class="insertMovie btn btn-outline-dark">영화 등록</button>
			    		</div>
			    		
			    		<!-- 영화 등록 form -->
			    		<div class="card w-75" id="movieForm">
              				<form action="${conPath}/insertMovie.do" method="post" enctype="multipart/form-data">
              				
              					<div class="card-header text-white">
									<h3 class="text-center">영화등록 form</h3>
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
				    	
				    	<div class="card">
				    		<h5>트레일러 등록</h5>
							<button class="insertTrailer btn btn-outline-dark">예고편 등록</button>
				    	</div>
				    	
				    	<hr>

			    	</div>
			    	
			    	
			    	<div class="py-5"></div>
			    
			    </div><!-- card container 끝 -->
			    
			</div>
			<jsp:include page="../main/footer.jsp"/>
		</div>
		
	</div>
	
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="${conPath}/js/scripts.js"></script>
<script>

$(function() {
	
	$('.insertMovie').click(function(){
		if ($('#movieForm').css('display') == 'none') {
	        $('#movieForm').css('display', 'block');
	    }
	});
	
	$('#movieCancel').click(function(){
		if ($('#movieForm').css('display') == 'block') {
	        $('#movieForm').css('display', 'none');
	    }
	});
	
	
	$("#datepicker").datepicker({
		dateFormat: "yy-mm-dd",
		dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
		monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		yearSuffix: '년',
		changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
		changeYear: true,  // 년을 바꿀수 있는 셀렉트 박스를 표시한다.
		showMonthAfterYear: true,
		showOtherMonths: true,  // 현재 달이 아닌 달의 날짜도 회색으로 표시
		//minDate: '-100y', // 현재날짜로부터 100년이전까지 년을 표시한다.
		minDate: new Date(1900, 1 - 1, 1), // 1900년 1월 1일을 최소날짜로 세팅
		maxDate: new Date(2100, 1 - 1, 1),	// 2100년 1월 1일을 최대날짜로 세팅
		yearRange: 'c-100:c+100', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
	});
	
       
});

</script>

</body>
</html>
