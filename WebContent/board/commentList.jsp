<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8" />
	<title>CheeYoonMovie</title>
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="${conPath}/assets/favicon.ico" />
	<!-- Core theme CSS (includes Bootstrap)-->
	<link href="${conPath}/css/styles.css" rel="stylesheet" />
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
</head>
<body>
	
	<div class="commentList" id="commentList">
		    		
   		<c:if test="${commentList.size() ne 0}">
   			<c:forEach var="dto" items="${commentList}">
   			
   				<div class="card mb-3" id="comment${dto.commentNo}">
				  <div class="card-header d-flex justify-content-between py-0">
				  	<div>${dto.userId}</div>
				  	<div>
				  		<small><fmt:formatDate value="${dto.commentDate}" pattern="yy/MM/dd HH:mm:ss"/></small>
				  		<c:if test="${user.userId eq dto.userId}">
					  		<button type="button" id="${dto.commentNo}" class="btn btn-sm btn-outline-dark py-0 px-1 ms-2 commentModifyView">수정</button>
					  		<button type="button" class="btn btn-sm btn-outline-dark py-0 px-1">삭제</button>
				  		</c:if>
				  		
				  	</div>
				  </div>
				  <div class="card-body">
				    <pre class="card-text">${dto.commentContent}</pre>
				  </div>
				</div>
   			
   			</c:forEach>
   		</c:if>
   		
   	</div>
   	
   	<c:if test="${not empty commentPaging}">
					
		<div class="paging text-center">
			<c:if test="${commentStartPage > commentBLOCKSIZE }">
				<a href="${conPath}/boardContent.do?commentPageNum=${commentStartPage-1}&boardNo=${board.boardNo}&pageNum=${pageNum}">[ 이전 ]</a>
			</c:if>
			
			<c:forEach var="i" begin="${commentStartPage}" end="${commentEndPage}">
				<c:if test="${i eq commentCurrentPage }">
					[ <b>${i}</b> ]
				</c:if>
				<c:if test="${i ne commentCurrentPage }">
					<a href="${conPath}/boardContent.do?commentPageNum=${i}&boardNo=${board.boardNo}&pageNum=${pageNum}">[ ${i} ]</a>
				</c:if>
			</c:forEach>
			
			<c:if test="${commentEndPage < commentPageCnt }">
				<a href="${conPath}/boardContent.do?commentPageNum=${commentEndPage+1}&boardNo=${board.boardNo}&pageNum=${pageNum}">[ 다음 ]</a>
			</c:if>
		</div>
		
	</c:if>
	
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="${conPath}/js/scripts.js"></script>
	
</body>
</html>