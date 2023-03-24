package com.ch.movie.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ch.movie.dao.BoardDao;
import com.ch.movie.dto.BoardDto;

public class BoardModifyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String boardNoStr = request.getParameter("boardNo");
		int boardNo = Integer.parseInt(boardNoStr);
		String boardTitle = request.getParameter("boardTitle");
		String boardContent = request.getParameter("boardContent");
		String boardIp = request.getRemoteAddr();
		BoardDto dto = new BoardDto(boardNo, null, boardTitle, boardContent, 0, null, null, 0, 0, 0, boardIp);
		BoardDao board = new BoardDao();
		int result = board.modifyBoard(dto);
		if(result == BoardDao.FAIL) {
			request.setAttribute("boardModifyError", "글수정 에러");
		}
		
	}

}
