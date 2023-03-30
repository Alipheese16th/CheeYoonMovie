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
	
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	<script src="${conPath}/js/summernote.js"></script>
	<style>
		div.note-popover{
		display:none;
		}
	</style>
</head>
<body>

	<div class="d-flex " id="wrapper">
	
		<jsp:include page="../main/sidebar.jsp"/>
		
		<div id="page-content-wrapper">
		
			<jsp:include page="../main/header.jsp"/>
			
			<div class="container">
			
				<form action="${conPath}/boardWrite.do" method="post">
				<input type="hidden" name="pageNum" value="${param.pageNum}">
				<input type="hidden" name="userId" value="${user.userId}">
				
					<h1 class="my-5">자유게시판</h1>
				    
				    <hr>
				    
				    <h5>글쓰기</h5>
				    
				    <hr>
				    
				    <div class="card mb-3 bg-light">
					  <div class="row align-items-center mx-2">
					    <div class="col-1 text-center fw-bold px-0 pb-1">
					      	제목
					    </div>
					    <div class="col-11 px-0">
					      <div class="card-body">
					        <input type="text" name="boardTitle" class="form-control form-control-sm" required="required">
					      </div>
					    </div>
					  </div>
					</div>
				    
				    
					<div class="card bg-light mb-3">
						<div class="card-body">
							<textarea id="summernote" name="boardContent" class="mb-0" required="required"></textarea>
						</div>
					</div>
					
					<div class="d-flex justify-content-center">
						<input type="submit" value="글쓰기" class="btn btn-dark mx-1">
					  	<input type="reset" value="취소" class="btn btn-dark mx-1" onclick="history.back()">
					</div>
			    </form>
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
