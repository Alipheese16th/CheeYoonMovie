<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8" />
</head>
<body>
	<div class="card">
	  <div class="card-header">
		${param.commentNo}번 댓글 수정
	  </div>
	  <div class="card-body">
	  	<form action="${conPath}/commentModify.do">
	  		<input type="hidden" name="commentPageNum" value="${param.commentPageNum}">
	  		<input type="hidden" name="pageNum" value="${param.pageNum}">
	  		<input type="hidden" name="search" value="${param.search}">
	  		<input type="hidden" name="type" value="${param.type}">
	  		<input type="hidden" name="commentNo" value="${comment.commentNo}">
	  		<input type="hidden" name="boardNo" value="${comment.boardNo}">
	  		<textarea name="commentContent" class="form-control ml-1 shadow-none textarea">${comment.commentContent}</textarea>
			<input type="submit" class="btn btn-outline-dark" value="댓글수정">
	  	</form>
	  </div>
	</div>
	
</body>
</html>