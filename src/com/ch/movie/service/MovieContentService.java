package com.ch.movie.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ch.movie.dao.MovieDao;
import com.ch.movie.dao.RatingDao;

public class MovieContentService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		// 영화 상세정보 가져오기
		String movieId = request.getParameter("movieId");
		MovieDao movie = new MovieDao();
		request.setAttribute("movie", movie.getMovie(movieId));
		
		
		// 해당 영화의 평점 리스트
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		final int PAGESIZE = 10, BLOCKSIZE = 10;
		int startRow = (currentPage-1)*PAGESIZE + 1;
		int endRow = startRow + PAGESIZE - 1;
		RatingDao rating = new RatingDao();
		request.setAttribute("list",rating.ratingList(movieId, startRow, endRow));
		
		// 평점 페이징 관련 항목들
		int totCnt = rating.totalRating(movieId);
		int pageCnt = (int)Math.ceil((double)totCnt/PAGESIZE);
		int startPage = ((currentPage-1)/BLOCKSIZE)*BLOCKSIZE + 1;
		int endPage = startPage + BLOCKSIZE - 1;
		if(endPage > pageCnt) {
			endPage = pageCnt;
		}
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("pageCnt", pageCnt);
		request.setAttribute("BLOCKSIZE", BLOCKSIZE);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totCnt", totCnt);

	}

}
