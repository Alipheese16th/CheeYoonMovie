package com.ch.movie.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ch.movie.dao.CommentDao;

public class commentModifyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String commentNoStr = request.getParameter("commentNo");
		int commentNo = Integer.parseInt(commentNoStr);
		String commentContent = request.getParameter("commentContent");
		CommentDao comment = new CommentDao();
		comment.modifyComment(commentNo, commentContent);

	}

}
