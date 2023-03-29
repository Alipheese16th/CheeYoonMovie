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
	<!-- 부트스트랩 아이콘 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
</head>
<body style="background-color:#000508;">
	
	
	<div class="d-flex bg-black text-white" id="wrapper"> <!--  -->
	
		<jsp:include page="../main/sidebar.jsp"/>
		
		<div id="page-content-wrapper">
		
			<jsp:include page="../main/header.jsp"/>
			
			<div class="container-fluid">
			
				<section class="container text-white">
					<div class="row vh-100 justify-content-center align-items-center">
						<div class="col-md-5 col-xl-4">
							<img class="img-fluid" src="${conPath}/personImg/cheeyoon.png" alt="프로필사진">
						</div>
						<div class="col-md-7 col-xl-6">
							<h1 class="fw-bold text-info">신치윤</h1>
							<p class="text-muted">공부중인 개발자 지망생</p>
							
							<p>방문해 주셔서 감사합니다.<br>
							본 웹사이트는 이젠 아카데미에서 운영하는<br>
							"디지털컨버전스 풀스택 웹개발자 과정"<br>
							훈련생 신치윤이 만든 첫 개별 프로젝트입니다.<br>
							 미흡하지만 열심히 만들었습니다. 감사합니다.</p>
							 
							<p class="text-muted">email | shwoo1103@gmail.com</p>
							
							<a href="https://github.com/Alipheese16th" target="_blank" class="btn btn-lg btn-outline-info mt-3 rounded-pill">GitHub <i class="bi bi-github"></i></a>
						</div>
					</div>
				</section>
			
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