package com.ch.movie.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ch.movie.dao.MovieDao;

public class MovieRankingService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String type = request.getParameter("type");
		if(type == null || type.equals("")) {
			type = "default";
		}
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		final int PAGESIZE = 50, BLOCKSIZE = 10;
		int startRow = (currentPage-1)*PAGESIZE + 1;
		int endRow = startRow + PAGESIZE - 1;
		MovieDao movie = new MovieDao();
		int totCnt = 0;
		
		if(type.equals("default")) { //관람객순 현재상영영화
			request.setAttribute("list", movie.nowPlayingByAudience(startRow,endRow)); 
			totCnt = movie.totalNowPlaying();
			
		}else if(type.equals("cur")) { // 평점순 현재영화
			request.setAttribute("list", movie.nowPlayingByAvgScore(startRow,endRow)); 
			totCnt = movie.totalNowPlaying();
			
		}else if(type.equals("all")) { // 평점순 모든영화
			request.setAttribute("list", movie.allMovieByAvgScore(startRow,endRow));	
			totCnt = movie.totalAllMovie();
		}
		
		// 페이지 관련 항목들
		int pageCnt = (int)Math.ceil((double)totCnt/PAGESIZE);
		int startPage = ((currentPage-1)/BLOCKSIZE)*BLOCKSIZE + 1;
		int endPage = startPage + BLOCKSIZE - 1;
		if(endPage > pageCnt) {
			endPage = pageCnt;
		}
		request.setAttribute("type", type);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("pageCnt", pageCnt);
		request.setAttribute("BLOCKSIZE", BLOCKSIZE);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		

	}

}
