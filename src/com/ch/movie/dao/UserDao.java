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

import com.ch.movie.dto.BoardDto;
import com.ch.movie.dto.CommentDto;
import com.ch.movie.dto.RatingDto;
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
				dto = new UserDto(userId, userPw, userName, userBirth, userGender, userEmail, userTel, userDate, userBoardList(userId),userCommentList(userId),userRatingList(userId));
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
				dtos.add(new UserDto(userId, userPw, userName, userBirth, userGender, userEmail, userTel, userDate));
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
	
	/////////////////////
	//특정유저의 최근 자유게시판 글 목록
	private ArrayList<BoardDto> userBoardList(String userId){
		ArrayList<BoardDto> dtos = new ArrayList<BoardDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT B.*,(SELECT COUNT(*) FROM COMMENTS WHERE BOARDNO = B.BOARDNO) COMMENTCNT  FROM BOARD B " + 
				"      WHERE USERID = ? ORDER BY BOARDDATE DESC";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int boardNo = rs.getInt("boardNo");
				String boardTitle = rs.getString("boardTitle");
				String boardContent = rs.getString("boardContent");
				int boardHit = rs.getInt("boardHit");
				Timestamp boardDate = rs.getTimestamp("boardDate");
				Timestamp boardUpdate = rs.getTimestamp("boardUpdate");
				int boardGroup = rs.getInt("boardGroup");
				int boardStep = rs.getInt("boardStep");
				int boardIndent = rs.getInt("boardIndent");
				String boardIp = rs.getString("boardIp");
				int commentCnt = rs.getInt("commentCnt");
				dtos.add(new BoardDto(boardNo, userId, boardTitle, boardContent, boardHit, boardDate, boardUpdate, boardGroup, boardStep, boardIndent, boardIp, commentCnt));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
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
	
	//특정유저의 댓글리스트
	private ArrayList<CommentDto> userCommentList(String userId){
		ArrayList<CommentDto> dtos = new ArrayList<CommentDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM COMMENTS WHERE USERID = ? ORDER BY COMMENTDATE DESC";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int commentNo = rs.getInt("commentNo");
				int boardNo = rs.getInt("boardNo");
				String commentContent = rs.getString("commentContent");
				Timestamp commentDate = rs.getTimestamp("commentDate");
				dtos.add(new CommentDto(commentNo, boardNo, userId, commentContent, commentDate));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
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
	// 특정 유저의 평점리스트
	private ArrayList<RatingDto> userRatingList(String userId){
		ArrayList<RatingDto> dtos = new ArrayList<RatingDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT MOVIETITLE, R.* FROM RATING R, MOVIE M WHERE R.MOVIEID = M.MOVIEID AND USERID = ? ORDER BY RATINGDATE DESC";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String movieId = rs.getString("movieId");
				String ratingContent = rs.getString("ratingContent");
				int ratingScore = rs.getInt("ratingScore");
				Timestamp ratingDate = rs.getTimestamp("ratingDate");
				String movieTitle = rs.getString("movieTitle");
				dtos.add(new RatingDto(userId, movieId, ratingContent, ratingScore, ratingDate,null,movieTitle));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
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
	
	// userId 로 회원검색
	public ArrayList<UserDto> searchUser(String search, int startRow, int endRow) {
		ArrayList<UserDto> dtos = new ArrayList<UserDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM " + 
				"  (SELECT ROWNUM RN ,U.* FROM USERS U WHERE USERID LIKE '%' || ? || '%') " + 
				"  WHERE RN BETWEEN ? AND ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,search);
			pstmt.setInt(2,startRow);
			pstmt.setInt(3,endRow);
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
				dtos.add(new UserDto(userId, userPw, userName, userBirth, userGender, userEmail, userTel, userDate));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
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
	// userId로 회원검색 페이징 갯수
	public int totalSearchUser(String search) {
		int total = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM USERS WHERE USERID LIKE '%' || ? || '%'";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, search);
			rs = pstmt.executeQuery();
			rs.next();
			total = rs.getInt(1);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
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
	
}
