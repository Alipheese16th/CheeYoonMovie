package com.ch.movie.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ch.movie.dao.AdminDao;

public class AdminLoginService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String adminId = request.getParameter("adminId");
		String adminPw = request.getParameter("adminPw");
		AdminDao admin = new AdminDao();
		int result = admin.adminLogin(adminId, adminPw);
		
		if(result == AdminDao.FAIL) {
			request.setAttribute("adminLoginError", "관리자 로그인 실패 - 아이디와 비번을 확인하세요");
		}else {
			request.getSession().invalidate();
			request.getSession().setAttribute("admin", admin.getAdmin(adminId));
		}

	}

}
