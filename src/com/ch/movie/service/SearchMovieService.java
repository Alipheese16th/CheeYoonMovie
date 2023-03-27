package com.ch.movie.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ch.movie.dao.MovieDao;

public class SearchMovieService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String q = request.getParameter("q");
		MovieDao movie = new MovieDao();
		request.setAttribute("titleResultList", movie.searchMovieTitle(q));
		request.setAttribute("tagResultList", movie.searchMovieTag(q));
		request.setAttribute("trailerResultList", movie.searchTrailerList(q));
		
		
	}

}
