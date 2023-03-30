package com.ch.movie.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ch.movie.dao.MovieDao;

public class RefreshMovie implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		MovieDao movie = new MovieDao();
		int result = movie.refreshMovie();
		request.setAttribute("refreshMovieResult", "개봉 예정 -> 상영중 업데이트 ("+result+")개 업데이트 완료");
	}

}
