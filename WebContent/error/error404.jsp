<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<% response.setStatus(200); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
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
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
</head>
<body>

	<div class="d-flex" id="wrapper">
	
		<jsp:include page="../main/sidebar.jsp"/>
		
		<div id="page-content-wrapper">
		
			<jsp:include page="../main/header.jsp"/>
			
			<div class="container-fluid">
			    
			    <div class="d-flex justify-content-center text-center m-5 pt-5">
			    
				    <h1>
				    	<i class="bi bi-exclamation-triangle-fill"></i>
				    	죄송합니다<br>
				    	페이지를 찾을 수 없습니다<br>
				    	불편을 드려 죄송합니다<br>
				    </h1>
			    
			    </div>
			    <div class="d-flex justify-content-center py-5 m-5">
				    <button type="button" class="btn btn-outline-dark btn-lg" 
					    	onclick="history.back()">뒤로가기</button>
					    	&nbsp;  	&nbsp;  	&nbsp;
					<button type="button" class="btn btn-outline-dark btn-lg" 
					    	onclick="location.href='${conPath}/main.do'">홈페이지</button>
			    </div>
			    
			    <div class="py-3"></div>
			    <div class="py-5"></div>
			    
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