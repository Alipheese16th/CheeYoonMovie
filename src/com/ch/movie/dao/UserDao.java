package com.ch.movie.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.ch.movie.dto.UserDto;

public class UserDao {
	public static final int EXISTENT = 0;
	public static final int NONE_EXISTENT = 1;
	public static final int FAIL = 0;
	public static final int SUCCESS = 1;
	public static final int LOGIN_FAIL = 0;
	public static final int LOGIN_SUCCESS = 1;
	private DataSource ds;
	public UserDao() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
	}
	// 아이디 중복체크
	public int confirmId(String userId) {
		int result = EXISTENT;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM USERS WHERE USERID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(!rs.next()) {
				result = NONE_EXISTENT;
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("아이디중복체크실패:"+userId);
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	// 이메일 중복체크
	public int confirmEmail(String userEmail) {
		int result = EXISTENT;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM USERS WHERE USEREMAIL = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userEmail);
			rs = pstmt.executeQuery();
			if(!rs.next()) {
				result = NONE_EXISTENT;
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("이메일중복체크실패:"+userEmail);
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	// 회원가입
	public int registerUser(UserDto dto) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO USERS(USERID, USERPW, USERNAME, USERBIRTH, USERGENDER, USEREMAIL, USERTEL) " + 
				"  VALUES(?,?,?,?,?,?,?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserId());
			pstmt.setString(2,dto.getUserPw());
			pstmt.setString(3,dto.getUserName());
			pstmt.setDate(4,dto.getUserBirth());
			pstmt.setString(5,dto.getUserGender());
			pstmt.setString(6,dto.getUserEmail());
			pstmt.setString(7,dto.getUserTel());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("회원가입실패:"+dto);
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	// 로그인체크
	public int loginUser(String userId, String userPw) {
		int result = LOGIN_FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM USERS WHERE USERID = ? AND USERPW = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userId);
			pstmt.setString(2,userPw);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = LOGIN_SUCCESS;
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("로그인체크 에러:"+userId+userPw);
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	// userId로 UserDto 가져오기
	public UserDto getUser(String userId) {
		UserDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM USERS WHERE USERID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String userPw = rs.getString("userPw");
				String userName = rs.getString("userName");
				Date userBirth = rs.getDate("userBirth");
				String userGender = rs.getString("userGender");
				String userEmail = rs.getString("userEmail");
				String userTel = rs.getString("userTel");
				Timestamp userDate = rs.getTimestamp("userDate");
				Timestamp userLimit = rs.getTimestamp("userLimit");
				dto = new UserDto(userId, userPw, userName, userBirth, userGender, userEmail, userTel, userDate, userLimit);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("userId로 dto가져오는중 에러:"+userId);
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return dto;
	}
	// 회원정보 수정
	public int modifyUser(UserDto dto) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE USERS " + 
				"  SET USERPW = ?, " + 
				"      USERNAME = ?, " + 
				"      USERBIRTH = ?, " + 
				"      USERGENDER = ?, " + 
				"      USEREMAIL = ?, " + 
				"      USERTEL = ? " + 
				"  WHERE USERID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getUserPw());
			pstmt.setString(2,dto.getUserName());
			pstmt.setDate(3,dto.getUserBirth());
			pstmt.setString(4,dto.getUserGender());
			pstmt.setString(5,dto.getUserEmail());
			pstmt.setString(6,dto.getUserTel());
			pstmt.setString(7, dto.getUserId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("회원정보수정에러:"+dto);
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	
	// 회원 리스트 보기 (top-N)
	public ArrayList<UserDto> getUserList(int startRow, int endRow) {
		ArrayList<UserDto> dtos = new ArrayList<UserDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM " + 
				"  (SELECT ROW_NUMBER() OVER(ORDER BY USERDATE DESC) RN, U.* FROM USERS U) " + 
				"  WHERE RN BETWEEN ? AND ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,startRow);
			pstmt.setInt(2,endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String userId = rs.getString("userId");
				String userPw = rs.getString("userPw");
				String userName = rs.getString("userName");
				Date userBirth = rs.getDate("userBirth");
				String userGender = rs.getString("userGender");
				String userEmail = rs.getString("userEmail");
				String userTel = rs.getString("userTel");
				Timestamp userDate = rs.getTimestamp("userDate");
				Timestamp userLimit = rs.getTimestamp("userLimit");
				dtos.add(new UserDto(userId, userPw, userName, userBirth, userGender, userEmail, userTel, userDate, userLimit));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("회원리스트 에러:"+dtos);
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return dtos;
	}
	// 전체 등록된 회원수
	public int totalUser() {
		int total = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM USERS";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			total = rs.getInt(1);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("전체회원수 에러:"+total);
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return total;
	}
	// 회원 탈퇴
	public int withdrawalUser(String userId) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM USERS WHERE USERID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("회원탈퇴중에러:"+userId);
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	
	
	
}
