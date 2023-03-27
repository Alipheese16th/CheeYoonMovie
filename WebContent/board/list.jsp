<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8" />
</head>
<body>

	<table class="table table-hover table-striped caption-top mx-2">
		<caption>자유롭게 원하시는 글을 작성하세요</caption>
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
					
					<td>${dto.userName}(${dto.userId})</td>
					
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
    
    <!-- 자유게시판 페이징 -->
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
			    <a class="page-link" href="${conPath}/boardList.do?pageNum=${startPage-1}&search=${param.search}&type=${type}">
			    <span aria-hidden="true">&laquo;</span>
			    </a>
		    </li>
    	</c:if>
   	 	
   	 	<c:forEach var="i" begin="${startPage}" end="${endPage}">
   	 		<c:if test="${i eq currentPage }">
				<li class="page-item active"><a class="page-link">${i}</a></li>
			</c:if>
   	 		<c:if test="${i ne currentPage }">
				<li class="page-item"><a class="page-link" href="${conPath}/boardList.do?pageNum=${i}&search=${param.search}&type=${type}">${i}</a></li>
			</c:if>
   	 	
   	 	</c:forEach>
   	 	
   	 	<c:if test="${endPage < pageCnt }">
			<li class="page-item">
				<a class="page-link" href="${conPath}/boardList.do?pageNum=${endPage+1}&search=${param.search}&type=${type}">
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
	<!-- 자유게시판 페이징 끝 -->
	
	<div class="container my-2 text-center">
		<p>자유게시판 글검색</p>
		<form action="${conPath}/boardList.do" class="d-flex forma" role="search">
		<input type="hidden" name="pageNum" value="${pageNum}">
			<div class="d-flex w-75 m-auto">
			
				<select name="type" class="form-select w-25">
				  <option <c:if test="${type eq 'full'}">selected="selected"</c:if> value="full">전체</option>
				  <option <c:if test="${type eq 'title'}">selected="selected"</c:if> value="title">제목</option>
				  <option <c:if test="${type eq 'content'}">selected="selected"</c:if> value="content">내용</option>
				  <option <c:if test="${type eq 'user'}">selected="selected"</c:if> value="user">작성자</option>
				</select>
				
				<input class="form-control mx-2" type="search" name="search" id="qa" value="${param.search}">
				
				<input type="submit" class="btn btn-primary" value="검색">
				
			</div>
		</form>
	</div>
	
</body>
</html>