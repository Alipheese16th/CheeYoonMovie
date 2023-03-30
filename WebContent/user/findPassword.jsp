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
</head>
<body>
	<div class="container justify-content-center mt-5">
		<h1 class="ms-3">아이디를 입력하세요</h1>
		<form action="${conPath}/passwordResult.do">
			<div class="d-flex">
				<input type="text" name="userId" class="form-control w-75 ms-3">
				<input type="submit" class="btn btn-outline-dark ms-3" value="찾기">
			</div>
		</form>
	</div>

<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="${conPath}/js/scripts.js"></script>
</body>
</html>