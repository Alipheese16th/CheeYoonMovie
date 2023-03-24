package com.ch.movie.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ch.movie.dao.MovieDao;

public class NowPlayingListService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		MovieDao movie = new MovieDao();
		request.setAttribute("nowPlayingList", movie.nowPlayingMovie());
		
	}

}
