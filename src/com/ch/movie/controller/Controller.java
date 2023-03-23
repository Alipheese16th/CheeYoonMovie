package com.ch.movie.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ch.movie.service.BoardContentService;
import com.ch.movie.service.BoardListService;
import com.ch.movie.service.CommentWriteService;
import com.ch.movie.service.RegisterService;
import com.ch.movie.service.Service;
import com.ch.movie.service.UserEmailConfirmService;
import com.ch.movie.service.UserIdConfirmService;
import com.ch.movie.service.UserLoginService;
import com.ch.movie.service.UserLogoutService;
import com.ch.movie.service.UserModifyService;
import com.ch.movie.service.UserWithdrawalService;
import com.ch.movie.service.commentModifyService;
import com.ch.movie.service.CommentListService;

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
			viewPage = "main/main.jsp";
		
			
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
			
		}else if(command.equals("/boardList.do")){
			service = new BoardListService();
			service.execute(request, response);
			viewPage = "board/boardList.jsp";
			
		}else if(command.equals("/boardContent.do")){
			service = new BoardContentService();
			service.execute(request, response);
			Service service2 = new CommentListService();
			service2.execute(request, response);
			viewPage = "board/boardContent.jsp";
			
		}else if(command.equals("/commentWrite.do")){
			service = new CommentWriteService();
			service.execute(request, response);
			viewPage = "boardContent.do";
			
		}else if(command.equals("/commentModifyView.do")){
			viewPage = "board/commentModify.jsp";
			
		}else if(command.equals("/commentModify.do")){
			service = new commentModifyService();
			service.execute(request, response);
			viewPage = "main.do";
			
		
		}else if(command.equals("/commentList.do")){
			service = new CommentListService();
			service.execute(request, response);
			viewPage = "board/commentList.jsp";
			
			
		}else if(command.equals("/")){
		}else if(command.equals("/")){
		}else if(command.equals("/")){
		}else if(command.equals("/")){
		}else if(command.equals("/")){
		}else if(command.equals("/")){
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
