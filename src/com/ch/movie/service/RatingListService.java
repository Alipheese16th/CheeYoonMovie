package com.ch.movie.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ch.movie.dao.MovieDao;
import com.ch.movie.dao.RatingDao;

public class RatingListService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String selectId = request.getParameter("selectId");
		if(selectId == null || selectId.equals("")) {
			selectId = "default";
		}
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		final int PAGESIZE = 10, BLOCKSIZE = 10;
		int startRow = (currentPage-1)*PAGESIZE + 1;
		int endRow = startRow + PAGESIZE - 1;
		
		RatingDao rating = new RatingDao();
		MovieDao movie = new MovieDao();
		int totCnt = 0;
		
		if(selectId.equals("default")) {	// 전체 평점리스트
			request.setAttribute("list", rating.allRatingList(startRow, endRow)); 
			totCnt = rating.allTotalRating();
			
		}else { 							// 특정 영화의 평점리스트, 해당 영화정보
			request.setAttribute("list", rating.ratingList(selectId, startRow, endRow)); 
			totCnt = rating.totalRating(selectId);
			request.setAttribute("movie", movie.getMovie(selectId));
		}
		request.setAttribute("nowPlayingList",movie.nowPlayingMovie()); // select 선택지 현재상영작들
		
		// 페이지 관련 항목들
		int pageCnt = (int)Math.ceil((double)totCnt/PAGESIZE);
		int startPage = ((currentPage-1)/BLOCKSIZE)*BLOCKSIZE + 1;
		int endPage = startPage + BLOCKSIZE - 1;
		if(endPage > pageCnt) {
			endPage = pageCnt;
		}
		
		request.setAttribute("selectId", selectId);
		request.setAttribute("totCnt", totCnt);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("pageCnt", pageCnt);
		request.setAttribute("BLOCKSIZE", BLOCKSIZE);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		

	}

}
