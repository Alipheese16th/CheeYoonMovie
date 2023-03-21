<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8" />
	<title>CheeYoonMovie</title>
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="${conPath}/assets/favicon.ico" />
	<!-- Core theme CSS (includes Bootstrap)-->
	<link href="${conPath}/css/styles.css" rel="stylesheet" />
	
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<link href="${conPath}/css/login.css" rel="stylesheet"/>
</head>
<body>

<!------ Include the above in your HEAD tag ---------->
	<div class="sidenav">
	     <div class="login-main-text">
	        <h2>Application<br> Login Page</h2>
	        <p>Login or register from here to access.</p>
	     </div>
	</div>
	
	<div class="main container">
	
		<div class="row">
		
			<div class="col-md-10 col-sm-12">
	            <div class="login-form text-center">
	               <form action="${conPath}/login.do">
	                  <div class="form-group">
	                     <label>아이디</label>
	                     <input type="text" name="userId" class="form-control w-75 mx-auto" placeholder="아이디">
	                  </div>
	                  <div class="form-group">
	                     <label>비밀번호</label>
	                     <input type="password" name="userPw" class="form-control w-75 mx-auto" placeholder="비밀번호">
	                  </div>
	                  <button type="submit" class="btn btn-black btn-lg w-75">Login</button>
	                  <hr>
	                  <p>
						  아이디 찾기 / 비밀번호 찾기 / <a href="${conPath}/joinView.do">회원가입</a>
	                  </p>
	               </form>
	            </div>
         	</div>
         
		</div>
		
		<div class="row">
		</div>
        <div class="row">
		</div>
		<div class="row">
		</div>
        
        
        
	</div>
	
	
	
	
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="${conPath}/js/scripts.js"></script>

</body>
</html>
