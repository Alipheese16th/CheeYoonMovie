package com.ch.movie.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ch.movie.service.BoardContentService;
import com.ch.movie.service.BoardDeleteService;
import com.ch.movie.service.BoardListService;
import com.ch.movie.service.BoardModifyService;
import com.ch.movie.service.BoardModifyViewService;
import com.ch.movie.service.BoardReplyService;
import com.ch.movie.service.BoardReplyViewService;
import com.ch.movie.service.BoardWriteService;
import com.ch.movie.service.CommentDeleteService;
import com.ch.movie.service.CommentWriteService;
import com.ch.movie.service.MainService;
import com.ch.movie.service.MovieContentService;
import com.ch.movie.service.NowPlayingListService;
import com.ch.movie.service.RatingConfirmService;
import com.ch.movie.service.RatingDeleteService;
import com.ch.movie.service.RatingModifyService;
import com.ch.movie.service.RatingWriteService;
import com.ch.movie.service.RegisterService;
import com.ch.movie.service.SearchMovieService;
import com.ch.movie.service.Service;
import com.ch.movie.service.UserEmailConfirmService;
import com.ch.movie.service.UserIdConfirmService;
import com.ch.movie.service.UserLoginService;
import com.ch.movie.service.UserLogoutService;
import com.ch.movie.service.UserModifyService;
import com.ch.movie.service.UserWithdrawalService;
import com.ch.movie.service.commentModifyService;
import com.ch.movie.service.UpComingListService;
import com.ch.movie.service.CommentModifyViewService;

@WebServlet("*.do")
public class Controller extends HttpServlet{
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		actionDo(request,response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String command = uri.substring(conPath.length());
		String viewPage = null;
		Service service = null;
		
		if(command.equals("/main.do")) {
			service = new MainService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
		
		}else if(command.equals("/search.do")){
			service = new SearchMovieService();
			service.execute(request, response);
			viewPage = "main/search.jsp";
			
		/* * * * * * * * * * * * * * * * * * * * * *
		 * * * * * * * * 비회원 관련 요청 * * * * * * * * 
		 * * * * * * * * * * * * * * * * * * * * * */
		}else if(command.equals("/registerView.do")){	// 회원가입 뷰 페이지
			viewPage = "user/register.jsp";
		
		}else if(command.equals("/userIdConfirm.do")){	// 아이디 중복확인 ajax
			service = new UserIdConfirmService();
			service.execute(request, response);
			viewPage = "user/userIdConfirm.jsp";
			
		}else if(command.equals("/userEmailConfirm.do")){	// 이메일 중복확인 ajax
			service = new UserEmailConfirmService();
			service.execute(request, response);
			viewPage = "user/userEmailConfirm.jsp";
		
		}else if(command.equals("/register.do")){		// 회원가입 처리
			service = new RegisterService();
			service.execute(request, response);
			viewPage = "loginView.do";
		
		/* * * * * * * * * * * * * * * * * * * * * *
		 * * * * * * * * user 관련 요청 * * * * * * * * 
		 * * * * * * * * * * * * * * * * * * * * * */
		}else if(command.equals("/loginView.do")){		// 로그인 뷰 페이지
			viewPage = "user/login.jsp";
			
		}else if(command.equals("/login.do")){
			service = new UserLoginService();
			service.execute(request, response);
			viewPage = "main.do";
			
		}else if(command.equals("/logout.do")){
			service = new UserLogoutService();
			service.execute(request, response);
			viewPage = "main.do";
			
		}else if(command.equals("/modifyView.do")){
			viewPage = "user/modify.jsp";
			
		}else if(command.equals("/modify.do")){
			service = new UserModifyService();
			service.execute(request, response);
			viewPage = "main.do";
			
		}else if(command.equals("/withdrawal.do")){
			service = new UserWithdrawalService();
			service.execute(request, response);
			viewPage = "main.do";
		
			
		/* * * * * * * * * * * * * * * * * * * * * *
		 * * * * * * * * board 관련 요청 * * * * * * * * 
		 * * * * * * * * * * * * * * * * * * * * * */
		}else if(command.equals("/boardList.do")){
			service = new BoardListService();
			service.execute(request, response);
			viewPage = "board/boardList.jsp";
			
		}else if(command.equals("/boardContent.do")){
			service = new BoardContentService();
			service.execute(request, response);
			viewPage = "board/boardContent.jsp";
			
		}else if(command.equals("/boardWriteView.do")){
			viewPage = "board/boardWrite.jsp";
			
		}else if(command.equals("/boardWrite.do")){
			service = new BoardWriteService();
			service.execute(request, response);
			viewPage = "boardList.do";
			
		}else if(command.equals("/boardModifyView.do")){
			service = new BoardModifyViewService();
			service.execute(request, response);
			viewPage = "board/boardModify.jsp";
			
		}else if(command.equals("/boardModify.do")){
			service = new BoardModifyService();
			service.execute(request, response);
			viewPage = "boardContent.do";
			
		}else if(command.equals("/boardDelete.do")){
			service = new BoardDeleteService();
			service.execute(request, response);
			viewPage = "boardList.do";
		
		}else if(command.equals("/boardReplyView.do")){
			service = new BoardReplyViewService();
			service.execute(request, response);
			viewPage = "board/boardReply.jsp";
			
		}else if(command.equals("/boardReply.do")){
			service = new BoardReplyService();
			service.execute(request, response);
			viewPage = "boardList.do";
		
		/* * * * * * * * * * * * * * * * * * * * * *
		 * * * * * * *  comment 관련 요청  * * * * * * *
		 * * * * * * * * * * * * * * * * * * * * * */
		}else if(command.equals("/commentWrite.do")){
			service = new CommentWriteService();
			service.execute(request, response);
			viewPage = "boardContent.do";
			
		}else if(command.equals("/commentModifyView.do")){	// boardContent 자유게시판 상세보기페이지에서 ajax로 요청
			service = new CommentModifyViewService();
			service.execute(request, response);
			viewPage = "board/commentModify.jsp";
			
		}else if(command.equals("/commentModify.do")){
			service = new commentModifyService();
			service.execute(request, response);
			viewPage = "boardContent.do";
			
		}else if(command.equals("/commentDelete.do")){
			service = new CommentDeleteService();
			service.execute(request, response);
			viewPage = "boardContent.do";
			
			
		/* * * * * * * * * * * * * * * * * * * * * *
		 * * * * * * * * movie 관련 요청  * * * * * * *
		 * * * * * * * * * * * * * * * * * * * * * */
		}else if(command.equals("/nowPlayingList.do")){
			service = new NowPlayingListService();
			service.execute(request, response);
			viewPage = "movie/nowPlayingList.jsp";
			
		}else if(command.equals("/upComingList.do")){
			service = new UpComingListService();
			service.execute(request, response);
			viewPage = "movie/upComingList.jsp";
			
		}else if(command.equals("/movieContent.do")){
			service = new MovieContentService();
			service.execute(request, response);
			viewPage = "movie/movieContent.jsp";
		
		/* * * * * * * * * * * * * * * * * * * * * *
		 * * * * * * * * rating 관련 요청  * * * * * * *
		 * * * * * * * * * * * * * * * * * * * * * */
		}else if(command.equals("/ratingConfirm.do")){
			service = new RatingConfirmService();
			service.execute(request, response);
			viewPage = "movie/ratingConfirm.jsp";
			
		}else if(command.equals("/ratingWrite.do")){
			service = new RatingWriteService();
			service.execute(request, response);
			viewPage = "movieContent.do";
			
		}else if(command.equals("/ratingModify.do")){
			service = new RatingModifyService();
			service.execute(request, response);
			viewPage = "movieContent.do";
			
		}else if(command.equals("/ratingDelete.do")){
			service = new RatingDeleteService();
			service.execute(request, response);
			viewPage = "movieContent.do";
			
		
		}else if(command.equals("/")){
		}else if(command.equals("/")){
		}else if(command.equals("/")){
		}else if(command.equals("/")){
		}else if(command.equals("/")){
		}else if(command.equals("/")){
		}else if(command.equals("/")){
			
		}
		
		
		
		
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}
	
}
