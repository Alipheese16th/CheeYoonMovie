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
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	
</head>
<body>

<c:if test="${not empty adminLoginError}">
	<script>
		alert('${adminLoginError}');
		history.back();
	</script>
</c:if>

	<div class="d-flex" id="wrapper"> <!-- bg-black text-white -->
	
		<jsp:include page="../main/sidebar.jsp"/>
		
		<div id="page-content-wrapper">
		
			<jsp:include page="../main/header.jsp"/>
			
			<div class="container">
			
			    <h1 class="my-5 text-center">회원 목록</h1>
			    
				<table class="table table-hover caption-top mx-2">
					<caption>회원리스트를 조회 할수 있습니다.</caption>
					<thead>
						<tr>
							<th>아이디</th>
							<th>이름</th>
							<th>이메일</th>
							<th>전화번호</th>
							<th>가입일</th>
						</tr>
					</thead>
					<tbody class="table-group-divider">
						<c:if test="${userList.size() eq 0}">
							<tr><td colspan="5"></td></tr>
						</c:if>
						<c:if test="${userList.size() ne 0}">
							<c:forEach var="user" items="${userList}">
								<tr>
									<td>${user.userId}</td>
									<td>${user.userName}</td>
									<td>${user.userEmail}</td>
									<td>${user.userTel}</td>
									<td>
										<fmt:formatDate value="${user.userDate}" pattern="yy/MM/dd"/>
									</td>
								</tr>
							</c:forEach>
						
						</c:if>
						
					</tbody>
				</table>
			    
			    <!-- 페이징 시작 -->
			    <nav aria-label="Page navigation example">
				  <ul class="pagination justify-content-center">
				  
				  	<c:if test="${startPage <= BLOCKSIZE }">
					    <li class="page-item disabled">
						    <a class="page-link">
						    <span aria-hidden="true">&laquo;</span>
						    </a>
					    </li>
			   	 	</c:if>
			   	 	<c:if test="${startPage > BLOCKSIZE }">
					    <li class="page-item">
						    <a class="page-link" href="${conPath}/userList.do?pageNum=${startPage-1}">
						    <span aria-hidden="true">&laquo;</span>
						    </a>
					    </li>
			    	</c:if>
			   	 	
			   	 	<c:forEach var="i" begin="${startPage}" end="${endPage}">
			   	 		<c:if test="${i eq currentPage }">
							<li class="page-item active"><a class="page-link">${i}</a></li>
						</c:if>
			   	 		<c:if test="${i ne currentPage }">
							<li class="page-item"><a class="page-link" href="${conPath}/userList.do?pageNum=${i}">${i}</a></li>
						</c:if>
			   	 	</c:forEach>
			   	 	
			   	 	<c:if test="${endPage < pageCnt }">
						<li class="page-item">
							<a class="page-link" href="${conPath}/userList.do?pageNum=${endPage+1}">
							<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</c:if>
			   	 	<c:if test="${endPage >= pageCnt }">
						<li class="page-item disabled">
							<a class="page-link">
							<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</c:if>
				    
				  </ul>
				</nav>
				<!-- 페이징 끝 -->
				
				<br class="my-5">
				
				<div class="container my-2 text-center">
					<form action="${conPath}/userList.do" class="d-flex" role="search">
					<input type="hidden" name="pageNum" value="${pageNum}">
						<div class="d-flex w-75 m-auto justify-content-center">
						
							<select name="type" class="form-select" style="width:100px">
							  <option <c:if test="${type eq 'full'}">selected="selected"</c:if> value="full">전체</option>
							  <option <c:if test="${type eq 'id'}">selected="selected"</c:if> value="id">아이디</option>
							  <option <c:if test="${type eq 'name'}">selected="selected"</c:if> value="name">이름</option>
							</select>
							
							<input class="form-control mx-2 w-25" type="search" name="search" value="${param.search}">
							<input type="submit" class="btn btn-outline-primary" value="검색">
							
						</div>
					</form>
				</div>
			
			</div>
			<jsp:include page="../main/footer.jsp"/>
		</div>
	</div>
			
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="${conPath}/js/scripts.js"></script>

</body>
</html>
