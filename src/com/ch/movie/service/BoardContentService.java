package com.ch.movie.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ch.movie.dao.BoardDao;
import com.ch.movie.dao.CommentDao;

public class BoardContentService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		// 자유게시판 리스트 항목
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		final int PAGESIZE = 10, BLOCKSIZE = 10;
		int startRow = (currentPage-1)*PAGESIZE + 1;
		int endRow = startRow + PAGESIZE - 1;
		BoardDao board = new BoardDao();
		request.setAttribute("list", board.getBoardList(startRow, endRow));
		// 자유게시판 페이징 관련 항목들
		int totCnt = board.totalBoard();
		int pageCnt = (int)Math.ceil((double)totCnt/PAGESIZE);
		int startPage = ((currentPage-1)/BLOCKSIZE)*BLOCKSIZE + 1;
		int endPage = startPage + BLOCKSIZE - 1;
		if(endPage > pageCnt) {
			endPage = pageCnt;
		}
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("pageCnt", pageCnt);
		request.setAttribute("BLOCKSIZE", BLOCKSIZE);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		// 상세보기 항목
		String _boardNo = request.getParameter("boardNo");
		int boardNo = Integer.parseInt(_boardNo);
		board.hitUp(boardNo);
		request.setAttribute("board", board.getBoard(boardNo));
		
		
		// 댓글 리스트 항목
		String cpageNum = request.getParameter("cpageNum");
		if(cpageNum == null || cpageNum.equals("")) {
			cpageNum = "1";
		}
		int ccurrentPage = Integer.parseInt(cpageNum);
		final int cPAGESIZE = 10, cBLOCKSIZE = 10;
		int cstartRow = (ccurrentPage-1)*cPAGESIZE + 1;
		int cendRow = cstartRow + cPAGESIZE - 1;
		CommentDao comment = new CommentDao();
		request.setAttribute("commentList", comment.getCommentList(boardNo, cstartRow, cendRow));
		// 댓글 페이징 항목
		int ctotCnt = comment.totalComment(boardNo);
		int cpageCnt = (int)Math.ceil((double)ctotCnt/cPAGESIZE);
		int cstartPage = ((ccurrentPage-1)/cBLOCKSIZE)*cBLOCKSIZE + 1;
		int cendPage = cstartPage + cBLOCKSIZE - 1;
		if(cendPage > cpageCnt) {
			cendPage = cpageCnt;
		}
		
		request.setAttribute("cpageNum", cpageNum);
		request.setAttribute("cPAGESIZE", cPAGESIZE);
		request.setAttribute("ccurrentPage", ccurrentPage);
		request.setAttribute("cpageCnt", cpageCnt);
		request.setAttribute("cBLOCKSIZE", cBLOCKSIZE);
		request.setAttribute("cstartPage", cstartPage);
		request.setAttribute("cendPage", cendPage);
		
		

	}

}
