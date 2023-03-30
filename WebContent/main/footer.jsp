<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${conPath}/css/footer.css" rel="stylesheet" />
</head>
<body>
<!-- Footer-->
	<footer class="pt-5 mt-5 bg-black text-white sticky-bottom">
	    <div class="container">
	    	<p class="text-center">
	    		Copyright &copy; CheeYoon_Movie 2023
	    	</p>
	    	<p class="text-center">
	    	  제작자 : 신치윤 (CheeYoon Shin)
	    	</p>
	    	<br class="py-1">
	    	<p class="text-end m-0">
	    		<c:if test="${empty admin}">
	    			<small class="text-muted">
			    	<span class="text-decoration-none text-secondary adminLogin">관리자모드</span>
			    	</small>
	    		</c:if>
	    	</p>
	    </div>
	    
	    <!-- 관리자로그인창 -->
	    <div class="card w-50" id="adminLogin">
		  <form action="${conPath}/adminLogin.do" method="post">
	  
			  <div class="card-header bg-black text-white">
			  	 관리자 로그인
			  </div>
			  <div class="card-body text-black">
			  	<div class="d-flex justify-content-center">
			  		<p class="me-3">관리자 아이디</p>
			  		<input type="text" name="adminId" class="form-control form-control-sm w-50 h-50" required/>
			  	</div>
			  	<div class="d-flex justify-content-center">
			  		<p class="me-3">관리자 비밀번호</p>
			  		<input type="password" name="adminPw" class="form-control form-control-sm w-50 h-50" required/>
			  	</div>
			    <hr>
			    <div class="d-flex justify-content-center mb-2">
				    <input type="button" value="취소" id="loginCancel" class="btn btn-outline-dark w-25 mx-2">
				    <input type="submit" value="확인" class="btn btn-dark w-25 mx-2">
			    </div>
			    
			  </div>
		  </form>
		</div>
	    <!-- 관리자로그인창 끝 -->
	    
	</footer>
	
<script src="${conPath}/js/footer.js"></script>
</body>
</html>