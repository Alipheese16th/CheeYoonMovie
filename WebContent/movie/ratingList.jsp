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
	<!-- 부트스트랩 아이콘 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
	<style>
	.trailer img{
		height:200px;
	}
	.line{
		height:1px;
		background-color:gray;
	}
	.blank{
		height:5px;
	}
	label span{
		color:#FE5D00;
	}
	.mycard{
		width:550px;
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
	
	</style>
</head>
<body>

	<div class="d-flex" id="wrapper"> <!-- bg-black text-white -->
		<jsp:include page="../main/sidebar.jsp"/>
		<div id="page-content-wrapper">
			<jsp:include page="../main/header.jsp"/>
			<div class="container-fluid">
			
				<!-- card 시작 -->
				<div class="container pb-5">
					
					<div class="card m-auto my-5 mycard">
						<div class="card-header text-center">
							<h3>네티즌 관람객 평점</h3>
						</div>
						<c:if test="${not empty movie}">
							<div class="d-flex p-3">
								<div class="trailer">
									<img src="${conPath}/movieImg/${movie.movieImage}">
								</div>
								<div>
									<table class="ms-2 mt-1">
										<thead>
											<tr>
												<th colspan="2">
													<h2>
													${movie.movieTitle}
													</h2>
												</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th>기본정보</th>
												<td>
													<small>
													<c:forEach var="tag" items="${movie.tagList}" varStatus="i">
													${tag}<c:if test="${i.last eq false}">,</c:if>
													</c:forEach>
													|
													${movie.movieRunning}분
													|
													개봉
													${movie.movieDate}
													</small>
												</td>
											</tr>
											<tr>
												<th>감독</th>
												<td>
													<small>
													<c:forEach var="person" items="${movie.personList}">
														<c:if test="${person.casting eq '감독'}">
															${person.personName}
														</c:if>
													</c:forEach>
													</small>
												</td>
											</tr>
											<tr>
												<th>출연</th>
												<td>
													<small>
													<c:forEach var="person" items="${movie.personList}" varStatus="i">
														<c:if test="${person.casting ne '감독'}">
															${person.personName}<c:if test="${i.last eq false}">,</c:if>
														</c:if>
													</c:forEach>
													</small>
												</td>
											</tr>
											<tr><td colspan="2" class="blank"></td></tr>
											<tr><td colspan="2" class="line"></td></tr>
											<tr><td colspan="2" class="blank"></td></tr>
											<tr>
												<th>개봉후 평점</th>
												<td>
												<div class="d-flex">
													<div>
														<input type="text" class="kv-fa rating-loading" value="${movie.avgScore/2}" data-size="xs">
													</div>
													<div>
														&nbsp; <b>${movie.avgScore} / 10</b>
													</div>
												</div>
												
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</c:if>
						
						<div class="container p-3">
							<label for="selectId"><span>현재 상영작</span> 평점보기</label>
							<br>
							<form action="${conPath}/ratingList.do" id="selectForm">
								<select name="selectId" id="selectId">
									<option>현재 상영작</option>
									<c:forEach var="nowp" items="${nowPlayingList}">
										<option value="${nowp.movieId}">${nowp.movieTitle}</option>
									</c:forEach>
								</select>						
							</form>
						
						</div>
						
					</div>
				
					<!-- 평점 리스트 -->
		    		<table class="table caption-top">
		    			<caption class="justify-content-between">
		    				<b>
			    				<c:if test="${selectId eq 'default'}">전체리스트</c:if>
			    				<c:if test="${selectId ne 'default'}">${movie.movieTitle} 평점 리스트</c:if>
		    				</b>
		    				<i class="bi bi-search"></i>
		    				총 <b>${totCnt}</b>개의 평점이 있습니다.
		    			</caption>
						<thead>
							<tr>
								<td><i class="bi bi-person-fill"></i> 글쓴이</td>
								<td><i class="bi bi-chat-left-dots-fill"></i> 감상평</td>
								<td><i class="bi bi-calendar3"></i> 날짜</td>
							</tr>
						</thead>
						<tbody class="table-group-divider">
							<c:forEach var="rating" items="${list}">
								<tr>
									<td>
										${rating.userName}<br>
										<small>(${rating.userId})</small>
									</td>
									<td class="w-75">
										<div class="d-flex">
											<div class="pt-1">
												<a class="link-dark text-decoration-none fw-bold" href="${conPath}/ratingList.do?selectId=${rating.movieId}">${rating.movieTitle}</a>
											</div>
											&nbsp;
											<div>
												<input type="text" class="kv-fa rating-loading" value="${rating.ratingScore/2}" data-size="xs">
											</div>
											&nbsp;
											<b class="pt-1"><small>${rating.ratingScore}</small></b>
										</div>
										<pre class="fs-6">${rating.ratingContent}</pre>
										
										<c:if test="${user.userId eq rating.userId and selectId ne 'default'}">
											<button type="button" class="btn btn-sm btn-outline-dark modify">수정</button>
											<button type="button" class="btn btn-sm btn-outline-dark" onclick="ratingDelete()">삭제</button>
											
											<div class="card w-75" id="modifyForm">
											  <form action="${conPath}/ratingModify.do" method="post">
											  
											  	  <input type="hidden" name="selectId" value="${movie.movieId}">
	      										  <input type="hidden" name="next" value="ratingList.do">
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
										
										
									</td>
									<td>
										<fmt:formatDate value="${rating.ratingDate}" pattern="yy.MM.dd"/>
									</td>
								</tr>
							</c:forEach>
							
						</tbody>
					</table>
				    <!-- 평점리스트끝 -->
				    <c:if test="${not empty user and selectId ne 'default'}">
				    	<div>
						    <button class="write btn btn-outline-dark">내 평점 등록</button>
					    </div>
				    </c:if>
				    
		    		 <!-- 평점리스트 페이징 -->
				    <nav aria-label="Page navigation example">
					  <ul class="pagination justify-content-center pagination-sm py-2">
					  	<c:if test="${startPage <= BLOCKSIZE }">
						    <li class="page-item disabled">
						    	<a class="page-link">
							    <span aria-hidden="true">&laquo;</span>
						    	</a>
						    </li>
				   	 	</c:if>
				   	 	<c:if test="${startPage > BLOCKSIZE }">
						    <li class="page-item">
						    	<a class="page-link" href="${conPath}/ratingList.do?pageNum=${startPage-1}&selectId=${selectId}">
							    <span aria-hidden="true">&laquo;</span>
						    	</a>
						    </li>
				    	</c:if>
				   	 	
				   	 	<c:forEach var="i" begin="${startPage}" end="${endPage}">
				   	 		<c:if test="${i eq currentPage }">
								<li class="page-item active"><a class="page-link">${i}</a></li>
							</c:if>
				   	 		<c:if test="${i ne currentPage }">
								<li class="page-item"><a class="page-link" href="${conPath}/ratingList.do?pageNum=${i}&selectId=${selectId}">${i}</a></li>
							</c:if>
				   	 	</c:forEach>
				   	 	
				   	 	<c:if test="${endPage < pageCnt }">
							<li class="page-item">
								<a class="page-link" href="${conPath}/ratingList.do?pageNum=${endPage+1}&selectId=${selectId}">
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
				<!-- card 끝 -->
			    
			</div>
			<jsp:include page="../main/footer.jsp"/>
		</div>
	</div>
	
	<div class="card w-75" id="ratingForm">
	  <form action="${conPath}/ratingWrite.do" method="post">
	      <input type="hidden" name="selectId" value="${movie.movieId}">
	      <input type="hidden" name="next" value="ratingList.do">
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
	    location.href = "${conPath}/ratingDelete.do?userId=${user.userId}&movieId=${movie.movieId}&pageNum=${pageNum}&next=ratingList.do&selectId=${movie.movieId}";
	  }
	}

	$(document).on('ready', function () {
		
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
		
		$('select').change(function(){
			$('#selectForm').submit();
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
