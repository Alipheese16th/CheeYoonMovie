<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!-- 부트스트랩 아이콘 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
	<link href="${conPath}/css/sidebar.css" rel="stylesheet" />
</head>
<body class="sb-sidenav-toggled"> <!-- sb-sidnav || sb-sidnav-toggled -->
	
	<div class="bg-black text-center" id="sidebar-wrapper">
		<div class="sidebar-heading p-0">
			<a href="${conPath}/main.do"><i class="bi bi-camera-fill"></i></a>
		</div>
		<div class="list-group list-group-flush">
		    <a class="list-group-item list-group-item-action p-3 mt-3" href="${conPath}/main.do">영화 홈</a><!-- list-group-item-dark -->
		    
		     <a class="list-group-item list-group-item-action p-3 mt-3" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
			 	영화리스트
			 </a>
			 
		    <div class="collapse" id="collapseExample">
		    	<ul class="list-group list-group-flush">
				  <li class="list-group-item list-group-item-action p-3" onclick="location.href='${conPath}/nowPlayingList.do'">현재 상영영화</li>
				  <li class="list-group-item list-group-item-action p-3" onclick="location.href='${conPath}/upComingList.do'">개봉 예정영화</li>
				</ul>
			</div>
		    
		    <a class="list-group-item list-group-item-action p-3 mt-3" href="${conPath}/movieRanking.do">영화 랭킹</a>
		    <a class="list-group-item list-group-item-action p-3 mt-3" href="${conPath}/boardList.do">자유게시판</a>
		    <a class="list-group-item list-group-item-action p-3 mt-3" href="${conPath}/ratingList.do">평점리스트</a>
		    <a class="list-group-item list-group-item-action p-3 mt-3" href="${conPath}/credit.do">credit</a>
		</div>
	</div>

</body>
</html>