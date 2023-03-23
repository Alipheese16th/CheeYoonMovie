<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<link href="${conPath}/css/modify.css" rel="stylesheet" />
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script src="${conPath}/js/modify.js"></script>
	
</head>
<body>

<section class="h-100 bg-dark">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col">
        <div class="card card-registration my-4 border-0 rounded-3">
          <div class="row g-0">
          
            <div class="col-xl-6 d-none d-xl-block">
              <img src="${conPath}/img/register2.jpg" class="img-fluid h-100"/>
            </div>
            
            <div class="col-xl-6">
            
            <form action="${conPath}/modify.do" method="post">
            
              <div class="card-body p-md-5 text-black">
              
                <h3 class="mb-5 text-center">${user.userId} 회원정보 수정</h3>
				<input type="hidden" name="userId" value="${user.userId}">
				<input type="hidden" name="sessionPw" id="sessionPw" value="${user.userPw}">
				<input type="hidden" name="sessionTel" id="sessionTel" value="${user.userTel}">
				
				<div class="form-outline  mb-2">
                  <label class="form-label" for="userName">이름</label>
                  <input type="text" name="userName" id="userName" value="${user.userName}" class="form-control form-control-lg" />
                  <div id="userNameConfirmResult" class="form-text"> &nbsp; &nbsp; &nbsp; </div>
                </div>

				<div class="form-outline  mb-2">
                  <label class="form-label" for="oldPw">현 비밀번호</label>
                  <input type="password" name="oldPw" id="oldPw" class="form-control form-control-lg" />
                </div>

				<div class="form-outline  mb-2">
                  <label class="form-label" for="newPw">새 비밀번호</label>
                  <input type="password" name="newPw" id="newPw" class="form-control form-control-lg" />
                  <div id="newPwChkResult" class="form-text"> &nbsp; &nbsp; &nbsp; </div>
                </div>

				<div class="form-outline mb-4">
                  <label class="form-label" for="datepicker">생일</label>
                  <input type="text" name="userBirth" value="${user.userBirth}" id="datepicker" class="form-control form-control-lg" />
                  <div id="userBirthConfirmResult" class="form-text"> &nbsp; &nbsp; &nbsp; </div>
                </div>


                <div class="d-md-flex justify-content-start align-items-center mb-4 py-2">

                  <h6 class="me-4">성별 : </h6>

				  <c:if test="${user.userGender eq 'm'}">
				  	<div class="form-check form-check-inline me-4">
	                    <input class="form-check-input" type="radio" name="userGender" id="maleGender" checked
	                      value="m" />
	                    <label class="form-check-label" for="maleGender">남자</label>
                    </div>
				  </c:if>
                  <c:if test="${user.userGender ne 'm'}">
				  	<div class="form-check form-check-inline me-4">
	                    <input class="form-check-input" type="radio" name="userGender" id="maleGender"
	                      value="m" />
	                    <label class="form-check-label" for="maleGender">남자</label>
                    </div>
				  </c:if>
                  
                  <c:if test="${user.userGender eq 'f'}">
				  	<div class="form-check form-check-inline me-4">
	                    <input class="form-check-input" type="radio" name="userGender" id="femaleGender" checked
	                      value="f" />
	                    <label class="form-check-label" for="femaleGender">여자</label>
                    </div>
				  </c:if>
				  <c:if test="${user.userGender ne 'f'}">
				  	<div class="form-check form-check-inline me-4">
	                    <input class="form-check-input" type="radio" name="userGender" id="femaleGender"
	                      value="f" />
	                    <label class="form-check-label" for="femaleGender">여자</label>
                    </div>
				  </c:if>

                </div>

                
                <div class="form-outline  mb-2">
                  <label class="form-label" for="userEmail">이메일</label>
                  <input type="email" name="userEmail" id="userEmail" value="${user.userEmail}" class="form-control form-control-lg" />
                  <div id="userEmailConfirmResult" class="form-text"> &nbsp; &nbsp; &nbsp; </div>
                </div>
                
                <c:set var="telarr" value="${fn:split(user.userTel,'-') }"/>
                <div class="container">
	                <div class="row">
	                	<label class="form-label ms-5" for="tel1">전화번호</label>
	                </div>
	                <div class="row justify-content-evenly">
	                  <div class="col-md-3">
	                    <div class="form-outline">
	                      <input type="tel" name="tel1" id="tel1" value="${telarr[0]}" class="form-control form-control-lg" maxlength="3"/>
	                    </div>
	                  </div>
	                  _
	                  <div class="col-md-3">
	                    <div class="form-outline">
	                      <input type="tel" name="tel2" id="tel2" value="${telarr[1]}" class="form-control form-control-lg" maxlength="4"/>
	                    </div>
	                  </div>
	                  _
	                  <div class="col-md-3">
	                    <div class="form-outline">
	                      <input type="tel" name="tel3" id="tel3" value="${telarr[2]}" class="form-control form-control-lg" maxlength="4"/>
	                    </div>
	                  </div>
	                </div>
	                <div class="row">
		                <div id="userTelConfirmResult" class="form-text ms-5"> &nbsp; &nbsp; &nbsp; </div>
	                </div>
				</div>

                <div class="d-flex justify-content-end pt-3">
					<input type="reset" value="취소" class="btn btn-outline-dark btn-lg" onclick="history.back()">
					<input type="submit" value="정보수정" class="btn btn-dark btn-lg ms-2">
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