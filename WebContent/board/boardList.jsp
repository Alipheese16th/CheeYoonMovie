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
	
</head>
<body>

<c:if test="${not empty boardWriteError}">
	<script>
		alert('${boardWriteError}');
	</script>
</c:if>
<c:if test="${not empty boardDeleteError}">
	<script>
		alert('${boardWriteError}');
	</script>
</c:if>

	<div class="d-flex" id="wrapper"> <!-- bg-black text-white -->
	
		<jsp:include page="../main/sidebar.jsp"/>
		
		<div id="page-content-wrapper">
		
			<jsp:include page="../main/header.jsp"/>
			
			<div class="container pb-5">
			
			    <h1 class="my-5 text-center"><a href="${conPath}/boardList.do" class="text-decoration-none text-black"><b>자유게시판</b></a></h1>
			    
				<jsp:include page="list.jsp"/>
			    
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
