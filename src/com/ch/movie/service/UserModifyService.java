package com.ch.movie.service;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ch.movie.dao.UserDao;
import com.ch.movie.dto.UserDto;

public class UserModifyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		
		String oldPw = request.getParameter("oldPw");
		String newPw = request.getParameter("newPw");
		String userPw = null;
		if("".equals(newPw)) {
			userPw = oldPw;
		}else {
			userPw = newPw;
		}
		String birthStr = request.getParameter("userBirth");
		Date userBirth = Date.valueOf(birthStr);
		String userGender = request.getParameter("userGender");
		String userEmail = request.getParameter("userEmail");
		String tel1  = request.getParameter("tel1");
		String tel2  = request.getParameter("tel2");
		String tel3  = request.getParameter("tel3");
		String userTel = tel1 + "-" + tel2 + "-" + tel3;
		
		UserDao user = new UserDao();
		UserDto dto = new UserDto(userId, userPw, userName, userBirth, userGender, userEmail, userTel, null, null);
		int result = user.modifyUser(dto);
		if(result == UserDao.SUCCESS) {
			request.getSession().setAttribute("user", dto);
			request.setAttribute("modifyResult", "회원정보 수정 성공");
		}else {
			request.setAttribute("modifyError", "회원정보 수정 실패");
			
		}
		
		
	}

}
