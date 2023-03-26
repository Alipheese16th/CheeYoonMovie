package com.ch.movie.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ch.movie.dao.RatingDao;

public class RatingConfirmService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String movieId = request.getParameter("movieId");
		String userId = request.getParameter("userId");
		RatingDao rating = new RatingDao();
		int result = rating.ratingConfirm(movieId, userId);
		if(result == RatingDao.EXISTENT) {
			request.setAttribute("ratingConfirmResult", "이미존재하는평점");
		}else {
			request.setAttribute("ratingConfirmResult", "평점등록가능");
		}
	}

}
