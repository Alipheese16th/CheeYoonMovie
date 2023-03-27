<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<style>
/* #adminLogin{ */
/* 	position:fixed; */
/* 	bottom:0%; */
/* 	left:12.5%; */
/* 	display:none; */
/* } */

</style>

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
		    	<small class="text-muted">
		    	<span class="text-decoration-none text-secondary adminLogin">관리자모드</span>
		    	</small>
	    	</p>
	    </div>
	    
	    <!-- 관리자로그인창 -->
<!-- 	    <div class="card w-75" id="adminLogin"> -->
<%-- 		  <form action="${conPath}/adminLogin.do"> --%>
		  
<!-- 			  <div class="card-header bg-black text-white"> -->
<!-- 			   관리자 로그인 -->
<!-- 			  </div> -->
<!-- 			  <div class="card-body"> -->
<!-- 			  	<div class="justify-content-center"> -->
<!-- 					<h3 class="card-title text-center"> -->
<!-- 					<b> -->
<!-- 					asdfasdf -->
<!-- 					</b> -->
<!-- 					<br> -->
<!-- 					<small>asdfasfd</small> -->
<!-- 					</h3> -->
<!-- 					<div class="d-flex mx-5 justify-content-center"> -->
<!-- 						<p>asdfasdf</p> -->
<!-- 				    </div> -->
<!-- 			  	</div> -->
<!-- 			    <hr> -->
<!-- 			    <p class="card title border-0"> -->
<!-- 			    	감상평을 남겨주세요. 영화와 상관없는 내용은 약관에 의해 제재를 받을 수 있습니다. -->
<!-- 			    </p> -->
<!-- 			    <textarea name="ratingContent" class="w-100 mb-2" rows="5">asdfasdfasdf</textarea> -->
<!-- 			    <br> -->
<!-- 			    <br> -->
<!-- 			    <div class="d-flex justify-content-center mb-2"> -->
<!-- 				    <input type="button" value="취소" id="loginCancel" class="btn btn-outline-dark w-25 mx-2"> -->
<!-- 				    <input type="submit" value="확인" class="btn btn-dark w-25 mx-2"> -->
<!-- 			    </div> -->
<!-- 			  </div> -->
<!-- 		  </form> -->
<!-- 		</div> -->
	    <!-- 관리자로그인창 끝 -->
	    
	    
	</footer>
	
<script>
// $(function(){
	
// 	$('.adminLogin').click(function(){
// 		if ($('#adminLogin').css('display') == 'none') {
// 	        $('#adminLogin').css('display', 'block');
// 	    }
// 	});
	
// 	$('#loginCancel').click(function(){
// 		if ($('#adminLogin').css('display') == 'block') {
// 	        $('#adminLogin').css('display', 'none');
// 	    }
// 	});
	
// });

</script>

</body>
</html>