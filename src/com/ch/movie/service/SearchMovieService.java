package com.ch.movie.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ch.movie.dao.MovieDao;

public class SearchMovieService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String q_ = request.getParameter("q");
		if(q_ == null || q_.equals("")) {
			q_ = (String)request.getAttribute("q");
		}
		String q = q_.trim();
		MovieDao movie = new MovieDao();
		request.setAttribute("q", q);
		request.setAttribute("titleResultList", movie.searchMovieTitle(q));
		request.setAttribute("tagResultList", movie.searchMovieTag(q));
		request.setAttribute("trailerResultList", movie.searchTrailerList(q));
		
		
	}

}
