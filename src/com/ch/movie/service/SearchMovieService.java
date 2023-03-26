package com.ch.movie.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SearchMovieService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String q = request.getParameter("q");
		
	}

}
