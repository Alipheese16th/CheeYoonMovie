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
		.card a{
			text-decoration:none;
			color:black;
		}
		.card a:hover{
			text-decoration:underline;
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
				    	<h2 class="m-0 p-2">${userDetail.userName}의 사용자 정보</h2>
				    </div>
				    
			    	<div class="container p-3">
				    	<h5>최근 작성 글</h5>
				    	<c:forEach var="board" items="${userDetail.boardList}" begin="0" end="6">
				    		<div class="d-flex justify-content-between mb-1">
				    			<div>
				    				<a href="${conPath}/boardContent.do?boardNo=${board.boardNo}">
						    		${board.boardTitle} [${board.commentCnt}]
						    		</a>
				    			</div>
					    		<div>
					    		 	<fmt:formatDate value="${board.boardDate}" pattern="yy/MM/dd HH:mm:ss"/>
					    		</div>
				    		</div>
				    	</c:forEach>
				    	
				    	<hr>
				    	
				    	<h5>최근 작성 댓글</h5>
				    	<c:forEach var="comment" items="${userDetail.commentList}" begin="0" end="6">
				    		<div class="d-flex justify-content-between mb-1">
				    			<div>
					    			<a href="${conPath}/boardContent.do?boardNo=${comment.boardNo}">
					    			${comment.commentContent}
					    			</a>
				    			</div>
				    			<div>
				    				<fmt:formatDate value="${comment.commentDate}" pattern="yy/MM/dd HH:mm:ss"/>
				    			</div>
				    		</div>
				    	</c:forEach>
				    	
				    	<hr>
				    	
				    	<h5>최근 작성 평점</h5>
				    	<c:forEach var="rating" items="${userDetail.ratingList}" begin="0" end="6">
				    		<div class="d-flex justify-content-between mb-1">
				    			<div>
				    				<a href="${conPath}/movieContent.do?movieId=${rating.movieId}">
				    				${rating.ratingContent}
				    				</a>
				    				&nbsp;
				    				<small>(${rating.movieTitle} : ${rating.ratingScore}점)</small>
				    			</div>
				    			<div>
				    				<fmt:formatDate value="${rating.ratingDate}" pattern="yy/MM/dd HH:mm:ss"/>
				    			</div>
				    		</div>
				    	</c:forEach>
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
</body>
</html>
