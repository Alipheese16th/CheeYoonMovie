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
	<link href="${conPath}/css/boardContent.css" rel="stylesheet" />
	
</head>
<body>
<c:if test="${not empty commentWriteError}">
	<script>
		alert('${commentWriteError}');
	</script>
</c:if>
<c:if test="${not empty boardModifyError}">
	<script>
		alert('${boardModifyError}');
	</script>
</c:if>

<input type="hidden" name="commentPageNum" id="commentPageNum" value="${commentPageNum}">

	<div class="d-flex " id="wrapper"> <!-- bg-black text-white -->
	
		<jsp:include page="../main/sidebar.jsp"/>
		
		<div id="page-content-wrapper">
		
			<jsp:include page="../main/header.jsp"/>
			
			<div class="container">
			
		    <div class="container">
		    
			    <h1 class="my-5 text-center"><a href="${conPath}/boardList.do" class="text-decoration-none text-black"><b>자유게시판</b></a></h1>

			    <hr>
			    <div class="mx-2">
			    	<h5>${board.boardTitle}</h5>
			    </div>
			    <hr>
			    <div class="d-flex justify-content-between mx-2">
			    	<div >
			    		<small>${board.userName}(${board.userId})</small>
			    	</div>
			    	<div >
				    	<small>댓글 ${board.commentCnt}</small>
				    	<small>조회수 ${board.boardHit}</small>
				    	<small>작성일 <fmt:formatDate value="${board.boardDate}" pattern="yy/MM/dd HH:mm:ss"/></small>
				    	<c:if test="${not empty board.boardUpdate}">
					    	<small>수정일 <fmt:formatDate value="${board.boardUpdate}" pattern="yy/MM/dd HH:mm:ss"/></small>
				    	</c:if>
			    	</div>
			    </div>
			    <hr>
		    	<div class="row mx-2">
		    		<pre id="content" class="fs-6">${board.boardContent}</pre>
		    	</div>
		    	
		    	<hr>
		    	전체 댓글 <b style="color:red;">${board.commentCnt}</b>개
		    	<hr>
		    	
		    	<!-- 댓글리스트 시작 -->
		    	<div class="commentList" id="commentList">
		    		
			   		<c:if test="${commentList.size() ne 0}">
			   			<c:forEach var="dto" items="${commentList}">
			   			
			   				<div class="card mb-3" id="comment${dto.commentNo}">
							  <div class="card-header d-flex justify-content-between py-0">
							  	<div><small>${dto.userName}(${dto.userId})</small></div>
							  	<div>
							  		<small><fmt:formatDate value="${dto.commentDate}" pattern="yy/MM/dd HH:mm:ss"/></small>
							  		<c:if test="${user.userId eq dto.userId or not empty admin}">
								  		<button type="button" id="${dto.commentNo}" class="btn btn-sm btn-outline-dark py-0 px-1 ms-2 commentModifyView">수정</button>
								  		<button type="button" class="btn btn-sm btn-outline-dark py-0 px-1" onclick="commentDelete()">삭제</button>
							  		</c:if>
							  		
							  	</div>
							  </div>
							  <div class="card-body">
							    <pre class="card-text">${dto.commentContent}</pre>
							  </div>
							</div>
			   			
			   			</c:forEach>
			   		</c:if>
			   		
			   	</div>
			   	<!-- 댓글리스트 끝 -->
			   	
			   	<!-- 댓글페이징 시작 -->
			   	<c:if test="${not empty commentPaging}">
								
					<div class="paging text-center">
						<c:if test="${commentStartPage > commentBLOCKSIZE }">
							<a href="${conPath}/boardContent.do?commentPageNum=${commentStartPage-1}&boardNo=${board.boardNo}&pageNum=${pageNum}&search=${param.search}&type=${type}">[ 이전 ]</a>
						</c:if>
						
						<c:forEach var="i" begin="${commentStartPage}" end="${commentEndPage}">
							<c:if test="${i eq commentCurrentPage }">
								[ <b>${i}</b> ]
							</c:if>
							<c:if test="${i ne commentCurrentPage }">
								<a href="${conPath}/boardContent.do?commentPageNum=${i}&boardNo=${board.boardNo}&pageNum=${pageNum}&search=${param.search}&type=${type}">[ ${i} ]</a>
							</c:if>
						</c:forEach>
						
						<c:if test="${commentEndPage < commentPageCnt }">
							<a href="${conPath}/boardContent.do?commentPageNum=${commentEndPage+1}&boardNo=${board.boardNo}&pageNum=${pageNum}&search=${param.search}&type=${type}">[ 다음 ]</a>
						</c:if>
					</div>
					
				</c:if>
		    	<!-- 댓글페이징 끝 -->
		    	
		    	
		    	<c:if test="${empty user}">
		    		<h4>댓글 작성 권한이 없습니다 <button class="nextlogin btn btn-outline-dark" onclick="location.href='${conPath}/loginView.do?next=boardContent.do&boardNo=${board.boardNo}'">로그인</button></h4>
		    	</c:if>
		    	
		    	<c:if test="${not empty user}">
		    		<div class="card mt-2">
					  <div class="card-header">
						댓글 작성 &nbsp; ${user.userName}님
					  </div>
					  <div class="card-body">
					    <form action="${conPath}/commentWrite.do" method="post">
					    	<input type="hidden" name="pageNum" id="pageNum" value="${pageNum}">
					    	<input type="hidden" name="search" value="${param.search}">
					    	<input type="hidden" name="type" value="${type}">
					    	<input type="hidden" name="boardNo" value="${board.boardNo}">
					    	<input type="hidden" name="userId" value="${user.userId}">
					    	<textarea name="commentContent" class="form-control ml-1 shadow-none textarea"></textarea>
					    	<input type="submit" class="btn btn-dark mt-3" value="댓글 등록">
					    </form>
					  </div>
					</div>
		    	</c:if>
	    		

		    	<div class="d-flex justify-content-between my-3">
			    	<div >
			    		<button type="button" class="btn btn-outline-dark" onclick="location='${conPath}/boardList.do'">전체글 보기</button>
			    	</div>
			    	<div >
			    		<c:if test="${user.userId eq board.userId or not empty admin}">
			    			<button type="button" class="btn btn-dark" 
			    				onclick="location.href='${conPath}/boardModifyView.do?boardNo=${board.boardNo}&pageNum=${pageNum}&search=${param.search}&type=${type}'">
			    				수정
			    			</button>
			    			<button type="button" class="btn btn-dark" onclick="boardDelete()">
			    				삭제
			    			</button>
			    		</c:if>
				    	<c:if test="${not empty user}">
				    		<button type="button" class="btn btn-dark" 
				    		onclick="location.href='${conPath}/boardReplyView.do?boardNo=${board.boardNo}&pageNum=${pageNum}&search=${param.search}&type=${type}'">답변글</button>
				    	</c:if>
			    	</div>
			    </div>
			    
		    </div>
		    
			<jsp:include page="list.jsp"/>
			    
			</div>
			<jsp:include page="../main/footer.jsp"/>
		</div>
		
	</div>
			
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="${conPath}/js/scripts.js"></script>

<script>

$(document).ready(function(){
	
	$('.commentModifyView').click(function(){
		var commentNo = $(this).attr('id');
		var commentPageNum = $('#commentPageNum').val();
		var pageNum = "<c:out value='${pageNum}'/>";
		var search = "<c:out value='${param.search}'/>";
		var type = "<c:out value='${type}'/>";
		
		$.ajax({
			url : '${conPath}/commentModifyView.do',
			type : 'post',
			data : 'commentNo='+commentNo+'&commentPageNum='+commentPageNum+'&pageNum='+pageNum+'&search='+search+'&type='+type,
			dataType : 'html',
			success : function(data){
				$('#comment'+commentNo).html(data);
			}
		});
		
	});
});

function boardDelete() {
	
  if (confirm("글 삭제를 진행하시겠습니까?")) {
    location.href = "${conPath}/boardDelete.do?boardGroup=${board.boardGroup}&boardStep=${board.boardStep}&boardIndent=${board.boardIndent}&pageNum=${pageNum}&search=${param.search}&type=${type}";
  }
}

function commentDelete() {

	if (confirm("댓글 삭제를 진행하시겠습니까?")) {
	location.href='${conPath}/commentDelete.do?boardNo=${dto.boardNo}&commentNo=${dto.commentNo}&commentPageNum=${commentPageNum}&pageNum=${pageNum}&search=${param.search}&type=${type}';
	}
}

</script>

</body>
</html>
