<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	
	<div class="border-end bg-white" id="sidebar-wrapper">
		<div class="sidebar-heading border-bottom bg-light">사이드바 개어려움</div>
		<div class="list-group list-group-flush">
		    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="${conPath}/main.do">영화 홈</a>
		    
		     <a class="list-group-item list-group-item-action list-group-item-light p-3" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
			 	영화리스트
			 </a>
			 
		    <div class="collapse" id="collapseExample">
		    	<ul class="list-group list-group-flush">
				  <li class="list-group-item list-group-item-action list-group-item-dark p-3" onclick="location.href='${conPath}/main.do'">현재 상영영화</li>
				  <li class="list-group-item list-group-item-action list-group-item-dark p-3" onclick="location.href='${conPath}/main.do'">개봉 예정영화</li>
				  <li class="list-group-item list-group-item-action list-group-item-dark p-3" onclick="location.href='${conPath}/main.do'">예고편</li>
				</ul>
			</div>
		    
		    <a class="list-group-item list-group-item-action list-group-item-light p-3 active" href="#!">영화 랭킹</a>
		    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">자유게시판</a>
		    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">평점리스트</a>
		    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">디렉토리</a>
		    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">credit</a>
		</div>
	</div>

</body>
</html>