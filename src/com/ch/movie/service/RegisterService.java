package com.ch.movie.service;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ch.movie.dao.UserDao;
import com.ch.movie.dto.UserDto;

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
		int result = user.registerUser(new UserDto(userId, userPw, userName, userBirth, userGender, userEmail, userTel, null));
		if(result == UserDao.SUCCESS) {
			request.setAttribute("userId", userId);
			request.setAttribute("registerResult", "회원가입이 완료되었습니다. 감사합니다.");
		}else {
			request.setAttribute("registerError", "회원가입 실패");
		}
		
	}

}
