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
		console.log('1');
		$('.write').click(function(){
			var user = "<c:out value='${user}'/>";
			console.log('2');
			if(!user){
				alert('글쓰기는 로그인한 회원만 가능합니다');
				console.log('3');
			}else{
				location.href ="${conPath}/boardWriteView.do?pageNum=${pageNum}";
				console.log('4');
			}
		});
		
		$('tr').css('cursor','pointer').click(function(){
			var boardNo = $(this).children().eq(0).text();
			if(!isNaN(boardNo)){
				location.href = "${conPath}/boardContent.do?boardNo="+boardNo+"&pageNum=${pageNum}";
			}
		});
		
		$('.commentModifyView').click(function(){
			var commentNo = $(this).attr('id');
			$.ajax({
				url : '${conPath}/commentModifyView.do',
				type : 'post',
				data : 'commentNo='+commentNo,
				dataType : 'html',
				success : function(data){
					$('#comment'+commentNo).html(data);
				}
			});
			
		});
		
		$('.commentModify').click(function(){
			var commentContent = $('#commentContent').val();
			var commentNo = $('#commentNo').val();
			var boardNo = "<c:out value='${board.boardNo}'/>";
			
			$.ajax({
				url : '${conPath}/commentModify.do',
				type : 'post',
				data : 'commentNo='+commentNo+'&commentContent='+commentContent,
				dataType : 'html',
				success : function(data){
					alert('good');
					getCommentList(boardNo);
				}
			});
			
		});
		
		var getCommentList = function(boardNo){
			$.ajax({
				url : '${conPath}/commentList.do',
				type : 'post',
				data : 'boardNo='+boardNo,
				dataType : 'html',
				success : function(data){
					$('.commentList').html(data);
				}
			});
			
		};
		
		
		
	});
	</script>
	
</head>
<body>

<c:if test="${not empty commentWriteError}">
<script>
	alert('${commentWriteError}');
</script>
</c:if>

	<div class="d-flex " id="wrapper"> <!-- bg-black text-white -->
	
		<jsp:include page="../main/sidebar.jsp"/>
		
		<div id="page-content-wrapper">
		
			<jsp:include page="../main/header.jsp"/>
			
			<div class="container-fluid">
			
		    <div class="container">
			    <div>
			    	<h1>
			    		자유게시판
			    	</h1>
			    </div>
			    <hr>
			    <div>
			    	${board.boardTitle}
			    </div>
			    <hr>
			    <div class="d-flex justify-content-between">
			    	<div >
			    		${board.userId}
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
		    	<hr>
		    	
		    	<jsp:include page="commentList.jsp"/>
		    	
		    	<c:if test="${not empty commentPaging}">
					
					<div class="paging text-center">
						<c:if test="${commentStartPage > commentBLOCKSIZE }">
							<a href="${conPath}/boardContent.do?commentPageNum=${commentStartPage-1}&boardNo=${board.boardNo}&pageNum=${pageNum}">[ 이전 ]</a>
						</c:if>
						
						<c:forEach var="i" begin="${commentStartPage}" end="${commentEndPage}">
							<c:if test="${i eq commentCurrentPage }">
								[ <b>${i}</b> ]
							</c:if>
							<c:if test="${i ne commentCurrentPage }">
								<a href="${conPath}/boardContent.do?commentPageNum=${i}&boardNo=${board.boardNo}&pageNum=${pageNum}">[ ${i} ]</a>
							</c:if>
						</c:forEach>
						
						<c:if test="${commentEndPage < commentPageCnt }">
							<a href="${conPath}/boardContent.do?commentPageNum=${commentEndPage+1}&boardNo=${board.boardNo}&pageNum=${pageNum}">[ 다음 ]</a>
						</c:if>
					</div>
					
				</c:if>
		    	
		    	
		    	<c:if test="${empty user}">
		    		<h3>댓글 작성 권한이 없습니다</h3>
		    	</c:if>
		    	
		    	<c:if test="${not empty user}">
		    		<div class="card mt-2">
					  <div class="card-header">
						댓글 작성 ${user.userName}님
					  </div>
					  <div class="card-body">
					    <form action="${conPath}/commentWrite.do">
					    	<input type="hidden" name="pageNum" value="${pageNum}">
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
				    	<button type="button" class="btn btn-primary">수정</button>
			    		<button type="button" class="btn btn-primary">삭제</button>
			    		<button type="button" class="btn btn-primary">답변글</button>
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
