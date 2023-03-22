package com.ch.movie.service;

import java.sql.Date;

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
		Date userBirth = Date.valueOf(birthStr);
		
		String userGender = request.getParameter("userGender");
		String userEmail = request.getParameter("userEmail");
		
		
		String tel1  = request.getParameter("tel1");
		String tel2  = request.getParameter("tel2");
		String tel3  = request.getParameter("tel3");
		
		String userTel = tel1 + "-" + tel2 + "-" + tel3;
		
		
		
		UserDao user = new UserDao();
		// 작업 추가
		
		
		
		
		System.out.println("----------------------------------");
		System.out.println("userId:"+userId);
		System.out.println("userPw:"+userPw);
		System.out.println("userName:"+userName);
		System.out.println("birthStr:"+userBirth);
		System.out.println("userGender:"+userGender);
		System.out.println("userEmail:"+userEmail);
		System.out.println("userTel:"+userTel);

	}

}
