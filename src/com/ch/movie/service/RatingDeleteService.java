package com.ch.movie.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ch.movie.dao.RatingDao;

public class RatingDeleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String userId = request.getParameter("userId");
		String movieId = request.getParameter("movieId");
		RatingDao rating = new RatingDao();
		int result = rating.deleteRating(movieId, userId);
		if(result == RatingDao.FAIL) {
			request.setAttribute("ratingDeleteError", "평점 삭제 오류");
		}
	}

}
