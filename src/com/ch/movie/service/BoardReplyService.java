package com.ch.movie.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ch.movie.dao.BoardDao;
import com.ch.movie.dto.BoardDto;

public class BoardReplyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String boardGroupStr = request.getParameter("boardGroup");
		String boardStepStr = request.getParameter("boardStep");
		String boardIndentStr = request.getParameter("boardIndent");
		int boardGroup = Integer.parseInt(boardGroupStr);
		int boardStep = Integer.parseInt(boardStepStr);
		int boardIndent = Integer.parseInt(boardIndentStr);
		String userId = request.getParameter("userId");
		String boardTitle = request.getParameter("boardTitle");
		String boardContent = request.getParameter("boardContent");
		String boardIp = request.getRemoteAddr();
		
		BoardDto dto = new BoardDto(0, userId, boardTitle, boardContent, 0, null, null, boardGroup, boardStep, boardIndent, boardIp, 0, null);
		BoardDao board = new BoardDao();
		int result = board.replyBoard(dto);
		if(result == BoardDao.FAIL) {
			request.setAttribute("boardReplyError", "답변글 쓰기 에러");
		}
		
	}

}
