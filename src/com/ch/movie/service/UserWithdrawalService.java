package com.ch.movie.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ch.movie.dao.UserDao;
import com.ch.movie.dto.UserDto;

public class UserWithdrawalService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		UserDto dto = (UserDto)request.getSession().getAttribute("user");
		String userId = null;
		if(dto != null) {
			userId = dto.getUserId();
		}
		UserDao user = new UserDao();
		int result = user.withdrawalUser(userId);
		if(result == UserDao.SUCCESS) {
			request.getSession().invalidate();
			request.setAttribute("withdrawalResult", "회원 탈퇴 성공. 안녕히가세요");
		}else {
			request.setAttribute("withdrawalResult", "회원 탈퇴가 정상적으로 처리되지 않았습니다");
		}

	}
}
