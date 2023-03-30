<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${conPath}/css/styles.css" rel="stylesheet" />
<style>
 .btn-dark:hover{
 	background-color:white;
 	color:black;
 }
</style>
</head>
<body>

	<div class="container justify-content-center mt-5">
		<h3 class="pb-2">
			${passwordReuslt}
		</h3>
		<button onclick="history.back()" type="button" class="btn btn-outline-dark ms-5">뒤로가기</button>
		<button onclick="window.close()" type="button" class="btn btn-dark ms-3">종료</button>
	</div>
	
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="${conPath}/js/scripts.js"></script>
</body>
</html>