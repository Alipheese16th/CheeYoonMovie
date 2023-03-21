package com.ch.movie.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ch.movie.dao.UserDao;

public class UserIdConfirmService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String userId = request.getParameter("userId");
		UserDao user = new UserDao();
		int result = user.confirmId(userId);
		if(result == UserDao.EXISTENT) {
			request.setAttribute("userIdConfirmResult", "이미 존재하는 아이디입니다");
		}else if(result == UserDao.NONE_EXISTENT) {
			request.setAttribute("userIdConfirmResult", "사용가능한 아이디입니다");
		}
		
	}

}
