package com.ch.movie.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ch.movie.dao.UserDao;
import com.ch.movie.dto.UserDto;

public class PasswordResultService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String userId = request.getParameter("userId");
		UserDao user = new UserDao();
		UserDto dto = user.getUser(userId);
		if(dto == null) {
			request.setAttribute("passwordReuslt", "해당 아이디의 회원은 존재하지 않습니다");
		}else {
			request.setAttribute("passwordReuslt", "해당 아이디의 비밀번호는 ' "+dto.getUserPw()+" ' 입니다");
		}
		
	}

}
