package com.ch.movie.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ch.movie.dao.AdminDao;

public class InsertTrailer implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String movieId = request.getParameter("movieId");
		String trailerName = request.getParameter("trailerName");
		String trailerUrl = request.getParameter("trailerUrl");
		AdminDao admin = new AdminDao();
		int result = admin.insertTrailer(movieId, trailerName, trailerUrl);
		if(result==0) {
			request.setAttribute("insertTrailerResult", "트레일러 등록 실패");
		}else {
			request.setAttribute("insertTrailerResult", "트레일러 등록 성공!");
		}
		

	}

}
