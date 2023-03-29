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
<style>
	#submit{
		font-size:14px;
	}
	.navbar{
		background-color:#181818;
		color:white;
	}
	.navbar a{
		color:white;
	}
	.navbar a:hover{
		background-color:white;
		color:black;
	}
	.navbar #main:hover{
		background-color:white;
		color:black;
	}
	#submit{
		background-color:#444444;
		color:white;
	}
	#submit:hover{
		background-color:white;
		color:black;
	}
	
</style>

<script>
function withdrawal() {
	if (confirm("정말로 회원 탈퇴를 진행하시겠습니까?")) {
	   location.href = "${conPath}/withdrawal.do";
	}
}

$(function(){
	
	$('.form').submit(function(){
		var q = $('#q').val();
		if(q.trim() == ''){
			alert('빈칸은 검색할 수 없습니다');
			return false;
		}
	});
	
});

</script>
</head>
<body>
	
		<nav class="navbar navbar-expand-lg"> <!-- navbar-light bg-light border-bottom -->
	
			<div class="container-fluid">
			
				<!-- 사이드바 토글 버튼 -->
				<button class="btn p-0" id="sidebarToggle">
					<i class="bi bi-layout-sidebar-inset" style="color:white; font-size:24px;"></i>
				</button>
				
				<a class="navbar-brand ms-5" id="main" href="${conPath}/main.do">
				CheeYoonM<i class="bi bi-circle-fill" style="font-size:12px;"></i>vie
				</a>
			
				<!-- 글로벌바 토글 버튼 -->
				<button class="navbar-toggler me-2" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
					<img src="${conPath}/img/toggle.png">
				</button>
			
			<c:if test="${empty user and empty admin}"><%--로그인 전 화면 --%>
			
				<div class="collapse navbar-collapse" id="navbarCollapse">
			
					<ul class="navbar-nav me-auto mb-2 mb-md-0">
						<li class="nav-item">
							<a class="nav-link" href="${conPath}/registerView.do">회원가입</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="${conPath}/loginView.do">로그인</a>
						</li>
					</ul>
				
					<form action="${conPath}/search.do" class="d-flex form" role="search">
						<input class="form-control me-2" type="search" name="q" id="q" placeholder="영화 통합검색" aria-label="검색">
						<button class="btn w-25" id="submit" type="submit">검색</button>
					</form>
				
				</div>
			
			</c:if> 
			
			<c:if test="${not empty user and empty admin}"> <%--사용자 화면 --%>
			
				<div class="collapse navbar-collapse" id="navbarCollapse">
			
					<ul class="navbar-nav me-auto mb-2 mb-md-0">
						<li class="nav-item">
							<a class="nav-link" href="${conPath}/userDetail.do?userId=${user.userId}">마이메뉴</a>
						</li>
					</ul>
				
					<div class="dropdown me-2">
						<button class="btn btn-dark dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
						<i class="bi bi-emoji-smile"></i> ${user.userName}님 
						</button>
						<ul class="dropdown-menu dropdown-menu-dark">
							<li><a class="dropdown-item active" href="${conPath}/modifyView.do">정보수정</a></li>
							<li><a class="dropdown-item" onclick="withdrawal()">회원탈퇴</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="${conPath}/logout.do">로그아웃</a></li>
						</ul>
					</div>
				
					<form action="${conPath}/search.do" class="d-flex form" role="search">
						<input class="form-control me-2" type="search" name="q" id="q" placeholder="영화 통합검색" aria-label="검색">
						<button class="btn w-25" id="submit" type="submit">검색</button>
					</form>
				
				</div>
			
			</c:if>
			
			<c:if test="${empty user and not empty admin}"> <%--관리자 화면 --%>
			
				<div class="collapse navbar-collapse" id="navbarCollapse">
			
					<ul class="navbar-nav me-auto mb-2 mb-md-0">
						<li class="nav-item">
							<a class="nav-link" href="${conPath}/insert.do">등록페이지</a>
						</li>
					</ul>
				
					<div class="dropdown me-2">
						<button class="btn btn-dark dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
						<i class="bi bi-emoji-smile-fill"></i> ${admin.adminName}님 
						</button>
						<ul class="dropdown-menu dropdown-menu-dark">
							<li><a class="dropdown-item" href="${conPath}/userList.do">회원목록</a></li>
							<li><a class="dropdown-item" href="#">임시버튼</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="${conPath}/logout.do">로그아웃</a></li>
						</ul>
					</div>
				
					<form action="${conPath}/search.do" class="d-flex form" role="search">
						<input class="form-control me-2" type="search" name="q" id="q" placeholder="영화 통합검색" aria-label="검색">
						<button class="btn w-25" id="submit" type="submit">검색</button>
					</form>
				
				</div>
				
			</c:if>
			
			
			</div>
		
		</nav>
		

	
</body>
</html>