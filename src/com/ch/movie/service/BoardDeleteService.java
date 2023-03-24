package com.ch.movie.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ch.movie.dao.BoardDao;

public class BoardDeleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String boardNoStr = request.getParameter("boardNo");
		int boardNo = Integer.parseInt(boardNoStr);
		BoardDao board = new BoardDao();
		int result = board.deleteBoard(boardNo);
		if(result == BoardDao.FAIL) {
			request.setAttribute("boardDeleteError", "글 삭제 에러");
		}
		
	}

}
