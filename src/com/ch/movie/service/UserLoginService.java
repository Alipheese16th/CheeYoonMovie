package com.ch.movie.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ch.movie.dao.UserDao;

public class UserLoginService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		UserDao user = new UserDao();
		int result = user.loginUser(userId, userPw);
		if(result == UserDao.LOGIN_SUCCESS) {
			request.getSession().setAttribute("user", user.getUser(userId));
			// 로그인시 세션에 user 정보 추가
		}else {
			request.setAttribute("loginError", "로그인 실패. 아이디와 비밀번호 확인 요망");
		}

	}

}
