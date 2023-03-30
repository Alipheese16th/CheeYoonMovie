package com.ch.movie.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ch.movie.dao.AdminDao;

public class InsertTag implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String movieId = request.getParameter("movieId");
		String tag = request.getParameter("tag");
		AdminDao admin = new AdminDao();
		int result = admin.insertTag(movieId, tag);
		if(result==0) {
			request.setAttribute("insertTagResult", "태그 등록 실패");
		}else {
			request.setAttribute("insertTagResult", "태그 등록 성공!");
		}
		
	}
}
