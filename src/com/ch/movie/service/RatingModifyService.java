package com.ch.movie.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ch.movie.dao.RatingDao;
import com.ch.movie.dto.RatingDto;

public class RatingModifyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String movieId = request.getParameter("movieId");
		String userId = request.getParameter("userId");
		String ratingScoreStr = request.getParameter("ratingScore");
		int ratingScore = (int)(2*Double.parseDouble(ratingScoreStr));
		String ratingContent = request.getParameter("ratingContent");
		
		RatingDao rating = new RatingDao();
		int result = rating.modifyRating(new RatingDto(userId, movieId, ratingContent, ratingScore, null, null));
		if(result == RatingDao.FAIL) {
			request.setAttribute("ratingModifyError", "평점 수정 실패 오류");
		}

	}

}
