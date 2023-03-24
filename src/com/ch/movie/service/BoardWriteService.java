package com.ch.movie.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ch.movie.dao.BoardDao;
import com.ch.movie.dto.BoardDto;

public class BoardWriteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String userId = request.getParameter("userId");
		String boardTitle = request.getParameter("boardTitle");
		String boardContent = request.getParameter("boardContent");
		String boardIp = request.getRemoteAddr();
		BoardDto dto = new BoardDto(0, userId, boardTitle, boardContent, 0, null, null, 0, 0, 0, boardIp);
		BoardDao board = new BoardDao();
		int result = board.writeBoard(dto);
		if(result == BoardDao.FAIL) {
			request.setAttribute("boardWriteError", "글쓰기 오류");
		}
	}

}
