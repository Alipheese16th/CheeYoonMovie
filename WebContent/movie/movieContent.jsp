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
			width: 24rem; min-width: 10rem;
		}
		.personcard{
			width: 8.5rem;
		}
		.personimg{
			height:10rem;
		}
		#ratingForm{
			position:fixed;
			bottom:30%;
			left:12.5%;
			display:none;
			z-index:9;
		}
		#modifyForm{
			position:fixed;
			bottom:30%;
			left:12.5%;
			display:none;
			z-index:8;
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
		.btn-dark:hover{
			background-color:white;
			color:#242424;
		}
		
	</style>
</head>
<body>

<c:if test="${not empty ratingWriteError}">
	<script>
		alert('${ratingWriteError}');
	</script>
</c:if>
<c:if test="${not empty ratingModifyError}">
	<script>
		alert('${ratingModifyError}');
	</script>
</c:if>
<c:if test="${not empty ratingDeleteError}">
	<script>
		alert('${ratingDeleteError}');
	</script>
</c:if>
<c:if test="${not empty param.next}">
	<script>
		location.href="${conPath}/${param.next}?selectId=${param.selectId}";
	</script>
</c:if>

	<div class="d-flex bg-black" id="wrapper"> <!-- bg-black text-white -->
	
		<jsp:include page="../main/sidebar.jsp"/>
		
		<div id="page-content-wrapper">
		
			<jsp:include page="../main/header.jsp"/>
			
			<div class="container-fluid">
			    
			    <div class="container mt-5 card m-auto mw-75 mw-25">
			    
				    <div class="row text-center card-header">
				    	<div class="d-flex justify-content-center align-items-center">
				    		<h1>
				    		${movie.movieTitle}
				    		</h1>
				    		<c:if test="${movie.state eq 2}">
				    			&nbsp;
				    			<a href="${conPath}/nowPlayingList.do">
				    				<span class="badge badge-sm bg-primary">
						    			상영중
						    		</span>
				    			</a>
				    		</c:if>
				    	</div>
				    	<c:if test="${movie.state eq 1}">
			    			<a href="${conPath}/upComingList.do">
			    				<span class="badge bg-secondary">
				    			개봉예정
				    			D -
								<jsp:useBean id="nows" class="java.util.Date"/>
								<fmt:formatDate var="todays" value="${nows}" pattern="yyyyMMdd000000" />
								<fmt:parseDate var="nowfmt" value="${todays}" pattern="yyyyMMddHHmmss"/>
								<fmt:parseNumber var="nowfmtTime" value="${nowfmt.time / (1000*60*60*24)}" integerOnly="true" scope="request"/>
								<fmt:parseNumber var="dbDtParse" value="${movie.movieDate.time / (1000*60*60*24)}" integerOnly="true" scope="request"/>
								${dbDtParse - nowfmtTime}
					    		</span>
			    			</a>
			    		</c:if>
				    	<h5 class="text-truncate">${movie.originalTitle}</h5>
				    </div>
				    
				    <div class="row mx-2">
				    	<div class="col-md-3">
				    		<img class="img-fluid myHeight" src="${conPath}/movieImg/${movie.movieImage}">
				    	</div>
				    	<div class="col-md-9">
						  
					  	  <div class="ratio ratio-16x9 myHeight mw-50">
						 	<iframe class="mw-50" src="https://www.youtube.com/embed/${movie.trailerList[0].trailerUrl}" title="YouTube video" allowfullscreen></iframe>
						  </div>
						  
				    	</div>
				    </div>
				    <br>
				    <c:if test="${movie.state ne 1}">
				    	<div class="d-flex mx-5 justify-content-center align-items-center">
						    <div class="fs-3">
								네티즌 평점 &nbsp;
						    </div>
						    <div>
						    	<input type="text" class="kv-fa rating-loading" value="${movie.avgScore / 2}" data-size="sm">
						    </div>
						    <div class="progress w-50 ms-3 mt-1" style="height:25px">
				    			<div class="progress-bar bg-danger progress-bar-striped progress-bar-animated" style="width:${movie.avgScore * 10}%">평점 ${movie.avgScore}</div>
				    		</div>
					    </div>
				    </c:if>
				    
				    <hr>
				    
				    <div class="d-flex justify-content-between mx-5" style="padding:0 1rem;">
				    	<div>
				    		<b>개요</b> &nbsp; 
				    		<c:forEach var="tag" items="${movie.tagList}" varStatus="i">
							${tag}<c:if test="${i.last eq false}">,</c:if>
							</c:forEach>
				    	</div>
				    	<div>
				    		${movie.movieDate} <b>개봉</b>
				    	</div>
				    </div>
				    
				    <div class="row mx-5">
					    <div>
				    		<b>상영시간</b> &nbsp;
				    		${movie.movieRunning}분
				    	</div>
				    </div>
				    
				    <div class="row mx-5">
				    	<div>
				    		<b>감독</b>  &nbsp;
							<c:forEach var="person" items="${movie.personList}">
								<c:if test="${person.casting eq '감독'}">
									${person.personName}
								</c:if>
							</c:forEach>
				    	</div>
				    	
				    </div>
				    
				    <div class="row mx-5">
				    	<div>
				    		<b>출연</b>  &nbsp;
							<c:forEach var="person" items="${movie.personList}" varStatus="i">
								<c:if test="${person.casting ne '감독'}">
									${person.personName}<c:if test="${i.last eq false}">,</c:if>
								</c:if>
							</c:forEach>
				    	</div>
				    </div>
				    
				    <div class="row mx-5">
				    	<div>
				    		<b>등급</b>  &nbsp;
				    		${movie.movieGrade}
				    	</div>
				    </div>
				    
				    <c:if test="${movie.state ne 1}">
				    	<div class="row mx-5">
					    	<div>
					    		<b>흥행</b> &nbsp; 누적관객 
						    	${movie.movieAudience}명
						    	<jsp:useBean id="now" class="java.util.Date"/>
								<fmt:formatDate var="today" value="${now}" pattern="MM.dd"/>
								<small>(${today} 기준)</small>
					    	</div>
					    </div>
				    </c:if>
				    
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
									  		<b>${person.personName}</b>
									  	</p>
									    <p class="card-text my-1">
									    	<small>
									    		<b class="text-danger">
										    	${person.casting}
										    	</b>
										    	<c:if test="${not empty person.role}">
											    	${person.role} 역
										    	</c:if>
									    	</small>
									    </p>
									  </div>
									</div>
					    			
					    		</c:forEach>
				    		</div>
				    	</div>
				    </div>
				    
				    <hr>
				    
				    <div class="row mx-5">
				    	<div>
				    		<h3>동영상</h3>
				    		<div class="d-flex row g-3">
				    			<c:forEach var="trailer" items="${movie.trailerList}">
				    			
				    				  <div class="card trailercard border-0">
										  <div class="ratio ratio-4x3">
											 <iframe src="https://www.youtube.com/embed/${trailer.trailerUrl}?rel=0" class="card-img" allowfullscreen></iframe>
										  </div>
										  <div class="card-body">
										    <h4 class="card-title text-center">
										    	${trailer.trailerName}
										    </h4>
										  </div>
									  </div>
									  
				    			</c:forEach>
				    			
				    		</div>
				    	</div>
				    </div>
				    
				    <hr>
				    
				    <div class="row mx-5 mb-5">
				    	<div>
				    		<h3>평점</h3>
				    		 <p class="my-2">네티즌 평점</p>
			    			<div class="progress" style="height:30px;">
				    			<div class="progress-bar progress-bar-striped progress-bar-animated" style="width:${movie.avgScore * 10}%">평점 ${movie.avgScore}</div>
				    		</div>
				    	</div>
				    	
			    		<!-- 평점 리스트 -->
			    		<table class="table caption-top">
							<caption class="text-black py-3">
								관람객 평점 <b>${totCnt}</b>건 
								&nbsp;
								<button class="write btn btn-outline-dark btn-sm">내 평점 등록</button>
							</caption>
							<thead>
								<tr>
									<td colspan="2">이 영화에 대한 의견을 들려주세요.</td>
								</tr>
							</thead>
							<tbody class="table-group-divider">
								<c:forEach var="rating" items="${list}">
									<tr>
										<td><input type="text" class="kv-fa rating-loading" value="${rating.ratingScore/2}" data-size="xs"></td>
										<td class="w-100 d-flex justify-content-between m-0">
											<div>
												${rating.ratingContent}
												<br>
												<small class="text-muted">
												${rating.userName}(${rating.userId}) &nbsp;
												| &nbsp;
												<span style="font-size:12px"><fmt:formatDate value="${rating.ratingDate}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
												</small>
											</div>
											<div>
												<c:if test="${user.userId eq rating.userId}">
													<button type="button" class="btn btn-sm btn-outline-dark modify">수정</button>
													<button type="button" class="btn btn-sm btn-outline-dark" onclick="ratingDelete()">삭제</button>
													
													<div class="card w-75" id="modifyForm">
													  <form action="${conPath}/ratingModify.do" method="post">
													  
													      <input type="hidden" name="movieId" value="${movie.movieId}">
													      <input type="hidden" name="userId" value="${user.userId}">
													      <input type="hidden" name="pageNum" value="${pageNum}">
													      
														  <div class="card-header bg-black text-white">
														    내 평점 수정
														  </div>
														  <div class="card-body">
														  	<div class="justify-content-center">
																<h3 class="card-title text-center">
																<b>
																${movie.movieTitle}
																</b>
																<br>
																<small>${movie.originalTitle}</small>
																</h3>
																<div class="d-flex mx-5 justify-content-center">
																    <div>
																    	<input type="text" class="kv-fas rating-loading" name="ratingScore" value="${rating.ratingScore / 2}" data-size="lg">
																    </div>
															    </div>
														  	</div>
														    <hr>
														    <p class="card title border-0">
														    	감상평을 남겨주세요. 영화와 상관없는 내용은 약관에 의해 제재를 받을 수 있습니다.
														    </p>
														    <textarea name="ratingContent" class="w-100 mb-2" rows="5">${rating.ratingContent}</textarea>
														    <br>
														    <br>
														    <div class="d-flex justify-content-center mb-2">
															    <input type="button" value="취소" id="modifycancel" class="btn btn-outline-dark w-25 mx-2">
															    <input type="submit" value="확인" class="btn btn-dark w-25 mx-2">
														    </div>
														  </div>
													  </form>
													</div>
													
												</c:if>
											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					    <!-- 평점리스트끝 -->
			    		 <!-- 평점리스트 페이징 -->
					    <nav aria-label="Page navigation example">
						  <ul class="pagination justify-content-center pagination-sm">
						  	<c:if test="${startPage <= BLOCKSIZE }">
							    <li class="page-item disabled">
							    	<a class="page-link">
								    <span aria-hidden="true">&laquo;</span>
							    	</a>
							    </li>
					   	 	</c:if>
					   	 	<c:if test="${startPage > BLOCKSIZE }">
							    <li class="page-item">
							    	<a class="page-link" href="${conPath}/movieContent.do?pageNum=${startPage-1}">
								    <span aria-hidden="true">&laquo;</span>
							    	</a>
							    </li>
					    	</c:if>
					   	 	
					   	 	<c:forEach var="i" begin="${startPage}" end="${endPage}">
					   	 		<c:if test="${i eq currentPage }">
									<li class="page-item active"><a class="page-link">${i}</a></li>
								</c:if>
					   	 		<c:if test="${i ne currentPage }">
									<li class="page-item"><a class="page-link" href="${conPath}/movieContent.do?pageNum=${i}">${i}</a></li>
								</c:if>
					   	 	
					   	 	</c:forEach>
					   	 	
					   	 	<c:if test="${endPage < pageCnt }">
								<li class="page-item">
									<a class="page-link" href="${conPath}/movieContent.do?pageNum=${endPage+1}">
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
						<!-- 평점리스트 페이징 끝 -->
				    	
				    </div>
			    
			    </div><!-- card container 끝 -->
			    
			</div>
			<jsp:include page="../main/footer.jsp"/>
		</div>
		
	</div>
			
	<div class="card w-75" id="ratingForm">
	  <form action="${conPath}/ratingWrite.do" method="post">
	  
	      <input type="hidden" id="movieId" name="movieId" value="${movie.movieId}">
	      <input type="hidden" id="userId" name="userId" value="${user.userId}">
	      
		  <div class="card-header bg-black text-white">
		    내 평점 등록
		  </div>
		  <div class="card-body">
		  	<div class="justify-content-center">
				<h3 class="card-title text-center">
				<b>
				${movie.movieTitle}
				</b>
				<br>
				<small>${movie.originalTitle}</small>
				</h3>
				<div class="d-flex mx-5 justify-content-center">
				    <div>
				    	<input type="text" class="kv-fas rating-loading" name="ratingScore" value="0" data-size="lg">
				    </div>
			    </div>
		  	</div>
		    <hr>
		    <p class="card title border-0">
		    	감상평을 남겨주세요. 영화와 상관없는 내용은 약관에 의해 제재를 받을 수 있습니다.
		    </p>
		    <textarea name="ratingContent" class="w-100 mb-2" rows="5"></textarea>
		    <br>
		    <br>
		    <div class="d-flex justify-content-center mb-2">
			    <input type="button" value="취소" id="cancel" class="btn btn-outline-dark w-25 mx-2">
			    <input type="submit" value="확인" class="btn btn-dark w-25 mx-2">
		    </div>
		  </div>
	  </form>
	</div>
	
	<div id="result" style="display:none"></div>
	
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="${conPath}/js/scripts.js"></script>
<script>

function ratingDelete() {
	
  if (confirm("평점 삭제를 진행하시겠습니까?")) {

    location.href = "${conPath}/ratingDelete.do?userId=${user.userId}&movieId=${movie.movieId}&pageNum=${pageNum}";

  }

}

$(function(){
	
	$('.modify').click(function(){
		if ($('#modifyForm').css('display') == 'none') {
	        $('#modifyForm').css('display', 'block');
	    }
	});
	
	$('#modifycancel').click(function(){
		if ($('#modifyForm').css('display') == 'block') {
	        $('#modifyForm').css('display', 'none');
	    }
	});
	
	$('.write').click(function(){
		var user = "<c:out value='${user}'/>";
		if(!user){
			alert('평점등록은 로그인한 회원만 가능합니다');
		}else{
			var movieId = $('#movieId').val();
			var userId = $('#userId').val();
			
			$.ajax({
				url : '${conPath}/ratingConfirm.do',
				type : 'get',
				data : 'movieId='+movieId+'&userId='+userId,
				dataType : 'html',
				success : function(data){
					$('#result').html(data);
					if($('#result').text().trim() == '이미존재하는평점'){
						alert('이미 평점을 등록하셨습니다');
					}else{
						if ($('#ratingForm').css('display') == 'none') {
					        $('#ratingForm').css('display', 'block');
					    }
					}
				}
			});
			
		}
	});
	
	$('#cancel').click(function(){
		if ($('#ratingForm').css('display') == 'block') {
	        $('#ratingForm').css('display', 'none');
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
	
    $('.kv-fas').rating({
        theme: 'krajee-fa',
        filledStar: '<i class="fa fa-star"></i>',
        emptyStar: '<i class="fa fa-star-o"></i>',
        stars:5,
        max:5,
        step:0.5,
        starCaptions:{
           	0: '0',
           	0.5: '1',
           	1: '2',
           	1.5: '3',
           	2: '4',
           	2.5: '5',
           	3: '6',
           	3.5: '7',
           	4: '8',
           	4.5: '9',
           	5: '10'
           }
    });

    $('.rating,.kv-fa,.kv-fas').on(
            'change', function () {
                console.log('Rating selected: ' + $(this).val());
    });
       
});

</script>
</body>
</html>
