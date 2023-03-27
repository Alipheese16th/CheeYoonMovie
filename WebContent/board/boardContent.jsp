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
	<style>
	#content{
		min-height:200px;
	}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script>
	
	$(document).ready(function(){
		$('.write').click(function(){
			var user = "<c:out value='${user}'/>";
			if(!user){
				alert('글쓰기는 로그인한 회원만 가능합니다');
			}else{
				location.href ="${conPath}/boardWriteView.do";
			}
		});
		
		$('tr').css('cursor','pointer').click(function(){
			var boardNo = $(this).children().eq(0).text();
			if(!isNaN(boardNo)){
				location.href = "${conPath}/boardContent.do?boardNo="+boardNo+"&pageNum=${pageNum}&search=${param.search}&type=${type}";
			}
		});
		
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

	    location.href = "${conPath}/boardDelete.do?boardNo=${board.boardNo}&pageNum=${pageNum}&search=${param.search}&type=${type}";

	  }

	}
	
	function commentDelete() {
	
		if (confirm("댓글 삭제를 진행하시겠습니까?")) {
			
		location.href='${conPath}/commentDelete.do?boardNo=${dto.boardNo}&commentNo=${dto.commentNo}&commentPageNum=${commentPageNum}&pageNum=${pageNum}&search=${param.search}&type=${type}';

		}
	}
	</script>
	
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
		    
			    <h1 class="my-5 text-center"><a href="${conPath}/boardList.do" class="text-decoration-none text-black">자유게시판</a></h1>

			    <hr>
			    <div>
			    	${board.boardTitle}
			    </div>
			    <hr>
			    <div class="d-flex justify-content-between">
			    	<div >
			    		${board.userName}(${board.userId})
			    	</div>
			    	<div >
				    	<small>댓글 12</small>
				    	<small>조회수 ${board.boardHit}</small>
				    	<small>작성일 <fmt:formatDate value="${board.boardDate}" pattern="yy/MM/dd HH:mm:ss"/></small>
				    	<small>수정일 <fmt:formatDate value="${board.boardUpdate}" pattern="yy/MM/dd HH:mm:ss"/></small>
			    	</div>
			    </div>
			    <hr>
		    	<div class="row">
		    		<pre id="content">${board.boardContent}</pre>
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
							  	<div>${dto.userName}(${dto.userId})</div>
							  	<div>
							  		<small><fmt:formatDate value="${dto.commentDate}" pattern="yy/MM/dd HH:mm:ss"/></small>
							  		<c:if test="${user.userId eq dto.userId}">
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
		    		<h3>댓글 작성 권한이 없습니다</h3>
		    	</c:if>
		    	
		    	<c:if test="${not empty user}">
		    		<div class="card mt-2">
					  <div class="card-header">
						댓글 작성 ${user.userName}님
					  </div>
					  <div class="card-body">
					    <form action="${conPath}/commentWrite.do" method="post">
					    	<input type="hidden" name="pageNum" id="pageNum" value="${pageNum}">
					    	<input type="hidden" name="search" value="${param.search}">
					    	<input type="hidden" name="type" value="${type}">
					    	<input type="hidden" name="boardNo" value="${board.boardNo}">
					    	<input type="hidden" name="userId" value="${user.userId}">
					    	<textarea name="commentContent" class="form-control ml-1 shadow-none textarea"></textarea>
					    	<input type="submit" class="btn btn-primary" value="댓글 등록">
					    </form>
					  </div>
					</div>
		    	</c:if>
	    		

		    	<div class="d-flex justify-content-between">
			    	<div >
			    		<button type="button" class="btn btn-primary">전체글</button>
		    			<button type="button" class="btn btn-primary">개념글</button>
			    	</div>
			    	<div >
			    		<c:if test="${user.userId eq board.userId}">
			    			<button type="button" class="btn btn-primary" 
			    				onclick="location.href='${conPath}/boardModifyView.do?boardNo=${board.boardNo}&pageNum=${pageNum}&search=${param.search}&type=${type}'">
			    				수정
			    			</button>
			    			<button type="button" class="btn btn-primary" onclick="boardDelete()">
			    				삭제
			    			</button>
			    		</c:if>
				    	<c:if test="${not empty user}">
				    		<button type="button" class="btn btn-primary" 
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

</body>
</html>
