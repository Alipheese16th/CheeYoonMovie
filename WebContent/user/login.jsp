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

<c:if test="${not empty registerResult}">
	<script>
		alert('${registerResult}');
	</script>
</c:if>
<c:if test="${not empty registerError}">
	<script>
		alert('${registerError}');
		history.back();
	</script>
</c:if>

<section class="h-100 gradient-form bg-dark">
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
	                <h4 class="mt-1 mb-5 pb-1">CheeYoonMovie</h4>
                </div>

                <form action="${conPath}/login.do" method="post">
                  <input type="hidden" name="next" value="${param.next}">
                  <input type="hidden" name="boardNo" value="${param.boardNo}">
                  <input type="hidden" name="movieId" value="${param.movieId}">
                
                  <p>소유하신 계정으로 로그인하세요</p>

                  <div class="form-outline mb-4">
                    <label class="form-label" for="userId">아이디</label>
                    <input type="text" name="userId" id="userId" class="form-control"
                      placeholder="아이디" value="${userId}"/>
                  </div>

                  <div class="form-outline mb-4">
                    <label class="form-label" for="userPw">비밀번호</label>
                    <input type="password" name="userPw" id="userPw" class="form-control" 
                    	placeholder="비밀번호"/>
                  </div>

                  <div class="text-center pt-1 mb-5 pb-1">
                  	<input type="submit" class="btn btn-primary btn-block fa-lg gradient-custom-1 mb-3" value="로그인">
                    <hr>
                    <a class="text-muted findPw" onclick="openPop()">비밀번호를 잊으셨나요?</a>
                  </div>

                  <div class="d-flex align-items-center justify-content-center pb-4">
                    <p class="mb-0 me-2">계정이 없으신가요?</p>
                    <input type="button" class="btn btn-outline-dark" value="회원가입"  onclick="location.href='${conPath}/registerView.do'">
                  </div>

                </form>

              </div>
            </div>
            <div class="col-lg-6 d-flex align-items-center gradient-custom-1">
              <div class="text-white px-3 py-4 p-md-5 mx-md-4">
                <h5 class="mb-4">저희는 영화 전문 리뷰사이트입니다</h5>
                <p class="small mb-0"><p>방문해 주셔서 감사합니다.<br>
							본 웹사이트는 이젠 아카데미에서 운영하는<br>
							"디지털컨버전스 풀스택 웹개발자 과정"<br>
							훈련생 신치윤이 만든 첫 개별 프로젝트입니다.<br>
							 미흡하지만 열심히 만들었습니다. 감사합니다.</p></p>
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

<script>
	function openPop(){
	    var popup = window.open('${conPath}/findPassword.do', '비밀번호찾기', 'width=500px,height=300px,top=450,left=220,scrollbars=yes');
	 }
</script>

</body>
</html>