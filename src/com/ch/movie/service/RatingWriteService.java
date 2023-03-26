package com.ch.movie.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ch.movie.dao.RatingDao;
import com.ch.movie.dto.RatingDto;

public class RatingWriteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String movieId = request.getParameter("movieId");
		String userId = request.getParameter("userId");
		String ratingScoreStr = request.getParameter("ratingScore");
		int ratingScore = 2 * Integer.parseInt(ratingScoreStr);
		String ratingContent = request.getParameter("ratingContent");
		
		RatingDao rating = new RatingDao();
		int result = rating.writeRating(new RatingDto(userId, movieId, ratingContent, ratingScore, null, null));
		if(result == RatingDao.FAIL) {
			request.setAttribute("ratingWriteError", "평점 등록 실패 오류 - 글이 너무 깁니다");
		}
	}

}
