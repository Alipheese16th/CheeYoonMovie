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
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>날짜</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody class="table-group-divider">
					<c:if test="${list.size() eq 0}">
						<tr><td colspan="5">해당 페이지의 글이 없습니다</td></tr>
					</c:if>
					<c:if test="${list.size() ne 0}">
						<c:forEach var="dto" items="${list}">
						
						<tr>
							<td>${dto.boardNo }</td>
							
							<td class="w-50">
								<c:forEach var="i" begin="1" end="${dto.boardIndent }"><!-- 답글 들여쓰기 처리 -->
									<c:if test="${i ne dto.boardIndent }">
										&nbsp; &nbsp; 
									</c:if>
									<c:if test="${i eq dto.boardIndent }">
										└─
									</c:if>
								</c:forEach>
									${dto.boardTitle }
								<c:if test="${dto.commentCnt ne 0}">
									[${dto.commentCnt}]
								</c:if>
								<c:if test="${dto.boardHit > 10 }">
									<img src="${conPath}/img/hot.gif">
								</c:if>
							</td>
							
							<td>${dto.userId }</td>
							
							<td>
								<fmt:formatDate value="${dto.boardDate }" pattern="yy/MM/dd"/>
							</td>
							
							<td>${dto.boardHit }</td>
							
						</tr>
						
						</c:forEach>
					
					</c:if>
					
				</tbody>
			</table>
		    <button class="write btn btn-outline-dark">글쓰기</button>
		    
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
					    <a class="page-link" href="${conPath}/boardList.do?pageNum=${startPage-1}">
					    <span aria-hidden="true">&laquo;</span>
					    </a>
				    </li>
		    	</c:if>
		   	 	
		   	 	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		   	 		<c:if test="${i eq currentPage }">
						<li class="page-item active"><a class="page-link">${i}</a></li>
					</c:if>
		   	 		<c:if test="${i ne currentPage }">
						<li class="page-item"><a class="page-link" href="${conPath}/boardList.do?pageNum=${i}">${i}</a></li>
					</c:if>
		   	 	
		   	 	</c:forEach>
		   	 	
		   	 	<c:if test="${endPage < pageCnt }">
					<li class="page-item">
						<a class="page-link" href="${conPath}/boardList.do?pageNum=${endPage+1}">
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
