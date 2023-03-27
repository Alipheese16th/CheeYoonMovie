package com.ch.movie.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ch.movie.dao.CommentDao;
import com.ch.movie.dto.CommentDto;

public class CommentWriteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String boardNoStr = request.getParameter("boardNo");
		int boardNo = Integer.parseInt(boardNoStr);
		String userId = request.getParameter("userId");
		String commentContent = request.getParameter("commentContent");
		CommentDto dto = new CommentDto(0, boardNo, userId, commentContent, null, null);
		CommentDao comment = new CommentDao();
		int result = comment.writeComment(dto);
		if(result != CommentDao.SUCCESS) {
			request.setAttribute("commentWriteError", "댓글 등록 오류");
		}
		
	}

}
