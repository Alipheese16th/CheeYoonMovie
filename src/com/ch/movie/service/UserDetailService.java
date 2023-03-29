package com.ch.movie.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ch.movie.dao.UserDao;

public class UserDetailService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String userId = request.getParameter("userId");
		UserDao user = new UserDao();
		request.setAttribute("userDetail", user.getUser(userId));
	}

}
