package com.ch.movie.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ch.movie.dao.UserDao;

public class UserEmailConfirmService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String userEmail = request.getParameter("userEmail");
		UserDao user = new UserDao();
		int result = user.confirmEmail(userEmail);
		if(result == UserDao.EXISTENT) {
			request.setAttribute("userEmailConfirmResult", "중복된 이메일 입니다");
		}else {
			request.setAttribute("userEmailConfirmResult", "사용가능한 이메일입니다");
		}
		
	}

}
