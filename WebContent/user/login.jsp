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
	<link href="${conPath}/css/login.css" rel="stylesheet"/>
</head>
<body>

<section class="h-100 gradient-form" style="background-color:black;">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-xl-10">
        <div class="card rounded-3 text-black border-0">
          <div class="row g-0">
            <div class="col-lg-6">
              <div class="card-body p-md-5 mx-md-4">

                <div class="text-center">
	                <a href="${conPath}/main.do">
	                  <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/lotus.webp"
	                    style="width: 185px;" alt="logo">
	                </a>
	                <h4 class="mt-1 mb-5 pb-1">영화 리뷰 사이트</h4>
                </div>

                <form action="${conPath}/login.do">
                  <p>소유하신 계정으로 로그인하세요</p>

                  <div class="form-outline mb-4">
                    <label class="form-label" for="form2Example11">아이디</label>
                    <input type="email" id="form2Example11" class="form-control"
                      placeholder="아이디" />
                  </div>

                  <div class="form-outline mb-4">
                    <label class="form-label" for="form2Example22">비밀번호</label>
                    <input type="password" id="form2Example22" class="form-control" 
                    	placeholder="비밀번호"/>
                  </div>

                  <div class="text-center pt-1 mb-5 pb-1">
                    <button class="btn btn-primary btn-block fa-lg gradient-custom-1 mb-3" type="button">
					로그인
                    </button>
                    <a class="text-muted" href="#!">비밀번호를 잊으셨나요?</a>
                  </div>

                  <div class="d-flex align-items-center justify-content-center pb-4">
                    <p class="mb-0 me-2">계정이 없으신가요?</p>
                    <button type="button" class="btn btn-outline-dark" onclick="location.href='${conPath}/registerView.do'">
					회원가입
					</button>
                  </div>

                </form>

              </div>
            </div>
            <div class="col-lg-6 d-flex align-items-center gradient-custom-1">
              <div class="text-white px-3 py-4 p-md-5 mx-md-4">
                <h4 class="mb-4">저희는 영화 전문 리뷰사이트입니다</h4>
                <p class="small mb-0">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                  exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
              </div>
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