package com.ch.movie.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ch.movie.dao.MovieDao;

public class UpdateMovieView implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String movieId = request.getParameter("movieId");
		MovieDao movie = new MovieDao();
		request.setAttribute("movie", movie.getMovie(movieId));
		
	}

}
