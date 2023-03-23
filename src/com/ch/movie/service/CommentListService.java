package com.ch.movie.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ch.movie.dao.CommentDao;

public class CommentListService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String commentPageNum = request.getParameter("commentPageNum");
		if(commentPageNum == null || commentPageNum.equals("")) {
			commentPageNum = "1";
		}
		String _boardNo = request.getParameter("boardNo");
		int boardNo = Integer.parseInt(_boardNo);
		
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
