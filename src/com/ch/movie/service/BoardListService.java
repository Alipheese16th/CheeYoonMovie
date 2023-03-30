package com.ch.movie.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ch.movie.dao.BoardDao;

public class BoardListService implements Service {

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
		final int PAGESIZE = 10, BLOCKSIZE = 10;
		int startRow = (currentPage-1)*PAGESIZE + 1;
		int endRow = startRow + PAGESIZE - 1;
		BoardDao board = new BoardDao();
		int totCnt = 0;
		
		if(type.equals("default")) { // 검색안한경우
			request.setAttribute("list", board.getBoardList(startRow, endRow));
			totCnt = board.totalBoard();
			
		}else if(type.equals("full")) { // 전체 검색
			String searchFull = request.getParameter("search").trim();
			request.setAttribute("list", board.searchBoardFull(searchFull, startRow, endRow));
			totCnt = board.totalsearchFull(searchFull);
			
		}else if(type.equals("title")) { // 제목 검색
			
			String searchTitle = request.getParameter("search").trim();
			request.setAttribute("list", board.searchBoardTitle(searchTitle, startRow, endRow));
			totCnt = board.totalsearchTitle(searchTitle);
			
		}else if(type.equals("content")) { // 내용 검색
			String searchContent = request.getParameter("search").trim();
			request.setAttribute("list", board.searchBoardContent(searchContent, startRow, endRow));
			totCnt = board.totalsearchContent(searchContent);
			
		}else if(type.equals("user")) {
			String searchUserName = request.getParameter("search").trim();
			request.setAttribute("list", board.searchBoardUserName(searchUserName, startRow, endRow));
			totCnt = board.totalsearchUserName(searchUserName);
			
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
