package com.ch.movie.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ch.movie.dao.BoardDao;
import com.ch.movie.dao.CommentDao;

public class BoardContentService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		// 자유게시판 리스트 관련 항목 시작
		String type = request.getParameter("type");
		if(type == null || type.equals("")) {
			type = "default";
		}
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		final int PAGESIZE = 10, BLOCKSIZE = 10;
		int startRow = (currentPage-1)*PAGESIZE + 1;
		int endRow = startRow + PAGESIZE - 1;
		BoardDao board = new BoardDao();
		int totCnt = 0;
		
		if(type.equals("default")) { // 검색안한경우
			request.setAttribute("list", board.getBoardList(startRow, endRow));
			totCnt = board.totalBoard();
			
		}else if(type.equals("full")) { // 전체 검색
			String searchFull = request.getParameter("search").trim();
			request.setAttribute("list", board.searchBoardFull(searchFull, startRow, endRow));
			totCnt = board.totalsearchFull(searchFull);
			
		}else if(type.equals("title")) { // 제목 검색
			
			String searchTitle = request.getParameter("search").trim();
			request.setAttribute("list", board.searchBoardTitle(searchTitle, startRow, endRow));
			totCnt = board.totalsearchTitle(searchTitle);
			
		}else if(type.equals("content")) { // 내용 검색
			String searchContent = request.getParameter("search").trim();
			request.setAttribute("list", board.searchBoardContent(searchContent, startRow, endRow));
			totCnt = board.totalsearchContent(searchContent);
			
		}else if(type.equals("user")) {
			String searchUserName = request.getParameter("search").trim();
			request.setAttribute("list", board.searchBoardUserName(searchUserName, startRow, endRow));
			totCnt = board.totalsearchUserName(searchUserName);
			
		}
		// 페이지 관련 항목들
		int pageCnt = (int)Math.ceil((double)totCnt/PAGESIZE);
		int startPage = ((currentPage-1)/BLOCKSIZE)*BLOCKSIZE + 1;
		int endPage = startPage + BLOCKSIZE - 1;
		if(endPage > pageCnt) {
			endPage = pageCnt;
		}
		request.setAttribute("type", type);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("pageCnt", pageCnt);
		request.setAttribute("BLOCKSIZE", BLOCKSIZE);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		// 자유게시판 리스트 관련 항목 끝
		
		
		// 상세보기 항목
		String _boardNo = request.getParameter("boardNo");
		int boardNo = Integer.parseInt(_boardNo);
		board.hitUp(boardNo);
		request.setAttribute("board", board.getBoard(boardNo));
		
		// 댓글 리스트 , 댓글 페이징 항목
		String commentPageNum = request.getParameter("commentPageNum");
		if(commentPageNum == null || commentPageNum.equals("")) {
			commentPageNum = "1";
		}
		int commentCurrentPage = Integer.parseInt(commentPageNum);
		final int commentPAGESIZE = 10, commentBLOCKSIZE = 10;
		int commentStartRow = (commentCurrentPage-1)*commentPAGESIZE + 1;
		int commentEndRow = commentStartRow + commentPAGESIZE - 1;
		
		CommentDao comment = new CommentDao();
		request.setAttribute("commentList", comment.getCommentList(boardNo, commentStartRow, commentEndRow));
		
		// 댓글 페이징 항목
		int commentTotCnt = comment.totalComment(boardNo);
		int commentPageCnt = (int)Math.ceil((double)commentTotCnt/commentPAGESIZE);
		int commentStartPage = ((commentCurrentPage-1)/commentBLOCKSIZE)*commentBLOCKSIZE + 1;
		int commentEndPage = commentStartPage + commentBLOCKSIZE - 1;
		if(commentEndPage > commentPageCnt) {
			commentEndPage = commentPageCnt;
		}
		if(commentTotCnt > commentPAGESIZE) { // 총 댓글 갯수가 페이지사이즈보다 클경우만 페이징함
			request.setAttribute("commentPaging", "go");
			request.setAttribute("commentCurrentPage", commentCurrentPage);
			request.setAttribute("commentPageCnt", commentPageCnt);
			request.setAttribute("commentBLOCKSIZE", commentBLOCKSIZE);
			request.setAttribute("commentStartPage", commentStartPage);
			request.setAttribute("commentEndPage", commentEndPage);
		}
		request.setAttribute("commentPageNum", commentPageNum);

	}

}
