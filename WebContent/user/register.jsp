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
	<link href="${conPath}/css/register.css" rel="stylesheet" />
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script>
	  $( function() {
	    $( "#datepicker" ).datepicker({
	    	dateFormat: "yy-mm-dd",
	    	dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
	    	monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    	yearSuffix: '년',
	    	changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
	    	changeYear: true,  // 년을 바꿀수 있는 셀렉트 박스를 표시한다.
	    	showMonthAfterYear: true,
	    	showOtherMonths: true,  // 현재 달이 아닌 달의 날짜도 회색으로 표시
	    	//minDate: '-100y', // 현재날짜로부터 100년이전까지 년을 표시한다.
	    	minDate: new Date(1950, 1 - 1, 1), // 1950년 1월 1일을 최소날짜로 세팅
	    	maxDate: 'y',					// 현재 날짜 이전만 선택
	    	yearRange: 'c-100:c+10', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
	    });
	  } );
	</script>
	<script>
  	$(function(){
  		
  		$('input[name="userId"]').keyup(function(){
  			var userId = $(this).val();
  			var num = userId.search(/[0-9]/g);
 			var eng = userId.search(/[a-z]/ig);
 			
 			if(userId==""){
  				$('#userIdConfirmResult').html(' &nbsp; ');
  			}else if(userId.length < 2){
  				$('#userIdConfirmResult').text('아이디는 2글자 이상');
  			}else if(userId.search(/\s/)!=-1){
  				$('#userIdConfirmResult').text('공백 입력 금지');
  			}else if(num < 0 || eng < 0){
  				$('#userIdConfirmResult').text('아이디는 영문자와 숫자 혼합으로 입력해주세요');
  			}else{
  				$.ajax({
  					url : '${conPath}/userIdConfirm.do',
  					type : 'get',
  					data : 'userId='+userId,
  					dataType : 'html',
  					success : function(data){
  						$('#userIdConfirmResult').html(data);
  					},
  				});
  			}
  		}); // 아이디 유효성검사 + 중복검사(ajax)
  		
  		$('#userPw, #userPwChk').keyup(function(){
  			var userPw = $('#userPw').val();
  			var userPwChk = $('#userPwChk').val();
 			var num = userPw.search(/[0-9]/g);
 			var eng = userPw.search(/[a-z]/ig);
 			var spe = userPw.search(/[`~!@@#$%^&*|\\\'\";:\/?]/gi);
 			
 			if(userPw=="" && userPwChk==""){
  				$('#userPwChkResult').html(' &nbsp; ');
 			}else if(userPw.search(/\s/)!=-1){
  				$('#userPwChkResult').text('비밀번호는 공백 없이 입력해주세요');
  			}else if(userPw.length < 4 || userPw.length > 20){
  				$('#userPwChkResult').text('4자리 ~ 20자리 이내로 입력해주세요');
  			}else if(num < 0 || eng < 0 || spe < 0 ){
  				$('#userPwChkResult').text('영문,숫자,특수문자를 혼합하여 입력하세요');
  			}else{
  				if(userPw == userPwChk){
 	  				$('#userPwChkResult').text('비밀번호 일치');
 	  			}else{
 	  				$('#userPwChkResult').text('비밀번호 불일치');
 	  			}
  			}
  		}); // 비밀번호 유효성 검사
  		
  		$('input[name="userName"]').keyup(function(){
  			var userName = $(this).val();
 			if(userName==""){
  				$('#userNameConfirmResult').html(' &nbsp; ');
  			}else if(userName.length < 2){
  				$('#userNameConfirmResult').text('이름은 2글자 이상');
  			}else if(userName.search(/\s/)!=-1){
  				$('#userNameConfirmResult').text('공백 입력 금지');
  			}else{
  				$('#userNameConfirmResult').html('완벽합니다');
  			}
  		}); // 이름 유효성 검사
  		
  		var patternMail = /^\w+@\w+(\.\w+){1,2}$/;
  		$('#userEmail').keyup(function(){
  			var userEmail = $(this).val();
  			
  			if(userEmail==""){
  				$('#userEmailConfirmResult').html(' &nbsp; ');
  			}else if(userEmail.match(patternMail)){
  				$.ajax({
  					url : '${conPath}/userEmailConfirm.do',
  					type : 'get',
  					data : 'userEmail='+userEmail,
  					dataType : 'html',
  					success : function(data){
  						$('#userEmailConfirmResult').html(data);
  					},
  				});
  			}else{
  				$('#userEmailConfirmResult').text('올바르지 않은 이메일 형식입니다');
  			}
  		}); // email 유효성검사 + 중복검사
  		
  		$('input[name="userName"]').keyup(function(){
  			var userName = $(this).val();
 			if(userName==""){
  				$('#userNameConfirmResult').html(' &nbsp; ');
  			}else if(userName.length < 2){
  				$('#userNameConfirmResult').text('이름은 2글자 이상');
  			}else if(userName.search(/\s/)!=-1){
  				$('#userNameConfirmResult').text('공백 입력 금지');
  			}else{
  				$('#userNameConfirmResult').html('완벽합니다');
  			}
  		}); // 이름 유효성 검사
  		

  		
  		var patternTell1 = /^[0-9]{3}$/;
  		var patternTell2 = /^[0-9]{3,4}$/;
  		var patternTell3 = /^[0-9]{4}$/;
  		$('input[type="tel"]').keyup(function(){
  			var tel1 = $('#tel1').val();
  			var tel2 = $('#tel2').val();
  			var tel3 = $('#tel3').val();
  			
  			if(tel1.match(patternTell1))
  			
  			
  			
  		}); // 전화번호 유효성검사
  		
  		
  		
  		
  		
  		
  		// submit검사 "사용가능한 아이디입니다","비밀번호 일치","사용가능한 이메일입니다"가 출력되었을 경우만 submit 가능
  		$('form').submit(function(){
  			var userIdConfirmResult = $('#userIdConfirmResult').text().trim();
  			var userPwChkResult = $('#userPwChkResult').text().trim();
  			var userNameConfirmResult = $('#userNameConfirmResult').text().trim();
  			var userBirth = $('input[name="userBirth"]').val();
  			var userGender = $('input[name="userGender"]:radio:checked');
  			var userEmailConfirmResult = $('#userEmailConfirmResult').text().trim();
  			
  			var tel1 = $('#tel1').val();
  			var tel2 = $('#tel2').val();
  			var tel3 = $('#tel3').val();
  			
  			if(userIdConfirmResult != '사용가능한 아이디입니다'){
  				alert('사용 가능한 ID인지 확인하세요');
  				$('#userId').focus();
  				return false; // submit 제한
  			}else if(userPwChkResult != '비밀번호 일치'){
  				alert('비밀번호를 확인하세요');
  				$('#userPw').focus();
  				return false;
  			}else if(userNameConfirmResult != '완벽합니다'){
  				alert('이름을 확인하세요');
  				$('#userName').focus();
  				return false;
  			}else if(userBirth.length < 1){
  				alert('생일을 입력하세요');
  				return false;
  			}else if(userGender.length < 1){
  				alert('성별을 선택하세요');
  				return false;
  			}else if(userEmailConfirmResult != "" && userEmailConfirmResult != '사용가능한 이메일입니다'){
  				alert('이메일이 잘못되었습니다');
  				$('#userEmail').focus();
  				return false;
  			}
  			
  		}); //submit 검사
  		
  	});
  </script>
	
</head>
<body>

<section class="h-100 bg-dark">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col">
        <div class="card card-registration my-4">
          <div class="row g-0">
          
            <div class="col-xl-6 d-none d-xl-block">
              <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/img4.webp"
                alt="Sample photo" class="img-fluid"
                style="border-top-left-radius: .25rem; border-bottom-left-radius: .25rem;" />
            </div>
            
            <div class="col-xl-6">
            
            <form action="${conPath}/register.do" method="post">
            
              <div class="card-body p-md-5 text-black">
              
                <h3 class="mb-5 text-center">회원가입 form</h3>


                <div class="form-outline">
                  <label class="form-label" for="userId">아이디</label>
                  <input type="text" name="userId" id="userId" class="form-control form-control-lg" />
                  <div id="userIdConfirmResult"> &nbsp; &nbsp; &nbsp; </div>
                </div>


				<div class="cotainer">
				
	                <div class="row">
	                  <div class="col-md-6">
	                    <div class="form-outline">
	                      <label class="form-label" for="userPw">비밀번호</label>
	                      <input type="text" name="userPw" id="userPw" class="form-control form-control-lg" />
	                    </div>
	                  </div>
	                  <div class="col-md-6">
	                    <div class="form-outline">
	                      <label class="form-label" for="userPwChk">비밀번호 확인</label>
	                      <input type="text" name="userPwChk" id="userPwChk" class="form-control form-control-lg" />
	                    </div>
	                  </div>
	                </div>
	                
	                <div class="row">
		            	<div id="userPwChkResult"> &nbsp; &nbsp; &nbsp; </div>
	                </div>
	                
                </div>
                

                <div class="form-outline">
                  <label class="form-label" for="userName">이름</label>
                  <input type="text" name="userName" id="userName" class="form-control form-control-lg" />
                  <div id="userNameConfirmResult"> &nbsp; &nbsp; &nbsp; </div>
                </div>


				<div class="form-outline mb-4">
                  <label class="form-label" for="datepicker">생일</label>
                  <input type="text" name="userBirth" id="datepicker" class="form-control form-control-lg" />
                </div>



                <div class="d-md-flex justify-content-start align-items-center mb-4 py-2">

                  <h6 class="me-4">성별 : </h6>

                  <div class="form-check form-check-inline me-4">
                    <input class="form-check-input" type="radio" name="userGender" id="femaleGender"
                      value="m" />
                    <label class="form-check-label" for="femaleGender">여자</label>
                  </div>

                  <div class="form-check form-check-inline me-4">
                    <input class="form-check-input" type="radio" name="userGender" id="maleGender"
                      value="f" />
                    <label class="form-check-label" for="maleGender">남자</label>
                  </div>

                </div>

                
                <div class="form-outline">
                  <label class="form-label" for="userEmail">이메일(선택)</label>
                  <input type="text" name="userEmail" id="userEmail" class="form-control form-control-lg" />
                  <div id="userEmailConfirmResult"> &nbsp; &nbsp; &nbsp; </div>
                </div>
                
                <div class="container">
	                <div class="row">
	                	<label class="form-label" for="tel1">전화번호</label>
	                </div>
	                <div class="row justify-content-evenly">
	                  <div class="col-md-3">
	                    <div class="form-outline">
	                      <input type="tel" name="tel1" id="tel1" class="form-control form-control-lg" maxlength="3"/>
	                    </div>
	                  </div>
	                  _
	                  <div class="col-md-3">
	                    <div class="form-outline">
	                      <input type="tel" name="tel2" id="tel2" class="form-control form-control-lg" maxlength="4"/>
	                    </div>
	                  </div>
	                  _
	                  <div class="col-md-3">
	                    <div class="form-outline">
	                      <input type="tel" name="tel3" id="tel3" class="form-control form-control-lg" maxlength="4"/>
	                    </div>
	                  </div>
	                </div>
	                <div class="row">
		                <div id="userTellConfirmResult"> &nbsp; &nbsp; &nbsp; </div>
	                </div>
				</div>

<!--                 <div class="row"> -->
<!--                   <div class="col-md-6 mb-4"> -->

<!--                     <select class="select"> -->
<!--                       <option value="1">State</option> -->
<!--                       <option value="2">Option 1</option> -->
<!--                       <option value="3">Option 2</option> -->
<!--                       <option value="4">Option 3</option> -->
<!--                     </select> -->

<!--                   </div> -->
<!--                   <div class="col-md-6 mb-4"> -->

<!--                     <select class="select"> -->
<!--                       <option value="1">City</option> -->
<!--                       <option value="2">Option 1</option> -->
<!--                       <option value="3">Option 2</option> -->
<!--                       <option value="4">Option 3</option> -->
<!--                     </select> -->

<!--                   </div> -->
<!--                 </div> -->


                <div class="d-flex justify-content-end pt-3">
					<input type="reset" value="취소" class="btn btn-light btn-lg" onclick="history.back()">
					<input type="submit" value="회원가입" class="btn btn-warning btn-lg ms-2">
                </div>

              </div>
              </form>
              
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="${conPath}/js/scripts.js"></script>
	
</body>
</html>