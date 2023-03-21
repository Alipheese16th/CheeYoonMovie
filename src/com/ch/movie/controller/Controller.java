package com.ch.movie.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ch.movie.service.RegisterService;
import com.ch.movie.service.Service;
import com.ch.movie.service.UserEmailConfirmService;
import com.ch.movie.service.UserIdConfirmService;

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
		 * * * * * * * * user 관련 요청 * * * * * * * * 
		 * * * * * * * * * * * * * * * * * * * * * */
		}else if(command.equals("/loginView.do")){
			viewPage = "user/login.jsp";
			
		}else if(command.equals("/registerView.do")){
			viewPage = "user/register.jsp";
			
		}else if(command.equals("/register.do")){
			service = new RegisterService();
			service.execute(request, response);
			viewPage = "loginView.do";
			
		}else if(command.equals("/userIdConfirm.do")){
			service = new UserIdConfirmService();
			service.execute(request, response);
			viewPage = "user/userIdConfirm.jsp";
			
		}else if(command.equals("/userEmailConfirm.do")){
			service = new UserEmailConfirmService();
			service.execute(request, response);
			viewPage = "user/userEmailConfirm.jsp";
			
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
