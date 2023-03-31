package com.ch.movie.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ch.movie.dao.BoardDao;

public class BoardDeleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String boardGroupStr = request.getParameter("boardGroup");
		int boardGroup = Integer.parseInt(boardGroupStr);
		String boardStepStr = request.getParameter("boardStep");
		int boardStep = Integer.parseInt(boardStepStr);
		String boardIndentStr = request.getParameter("boardIndent");
		int boardIndent = Integer.parseInt(boardIndentStr);
		BoardDao board = new BoardDao();
		int count = board.deleteBoard(boardGroup, boardStep, boardIndent);
		board.afterdelete(count, boardGroup, boardStep);
		request.setAttribute("deleteBoardResult", count+"개 글 삭제 완료");
		
	}

}
