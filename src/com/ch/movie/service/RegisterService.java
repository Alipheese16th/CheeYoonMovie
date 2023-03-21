package com.ch.movie.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ch.movie.dao.UserDao;

public class RegisterService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		String userName = request.getParameter("userName");
		
		String birthStr = request.getParameter("userBirth");
//		if("".equals(birthStr)) {
//			
//		}
		
		String userGender = request.getParameter("userGender");
		String userEmail = request.getParameter("userEmail");
		String userTell = request.getParameter("userTell");
		
		UserDao user = new UserDao();
		
		System.out.println("----------------------------------");
		System.out.println("userId:"+userId);
		System.out.println("userPw:"+userPw);
		System.out.println("userName:"+userName);
		System.out.println("birthStr:"+birthStr);
		System.out.println("userGender:"+userGender);
		System.out.println("userEmail:"+userEmail);
		System.out.println("userTell:"+userTell);

	}

}
