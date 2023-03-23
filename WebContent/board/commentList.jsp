<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8" />
</head>
<body>
	
	<div class="commentList">
		    		
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
	
	
	
</body>
</html>