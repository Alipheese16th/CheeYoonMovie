package com.ch.movie.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.ch.movie.dto.RatingDto;

public class RatingDao {
	public static final int FAIL = 0;
	public static final int SUCCESS = 1;
	public static final int EXISTENT = 0;
	public static final int NONE_EXISTENT = 1;
	private DataSource ds;

	public RatingDao() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
	}
	
	// 평점 중복 확인
	public int confirmId(String movieId, String userId) {
		int result = EXISTENT;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM RATING WHERE MOVIEID = ? AND USERID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, movieId);
			pstmt.setString(2, userId);
			rs = pstmt.executeQuery();
			if(!rs.next()) {
				result = NONE_EXISTENT;
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("평점중복체크실패:"+movieId+userId);
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
	
	// 평점 리스트(영화아이디에 해당하는 평점들만 출력)
	public ArrayList<RatingDto> movieHasRating(String movieId, int startRow, int endRow){
		ArrayList<RatingDto> dtos = new ArrayList<RatingDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM " + 
				"  (SELECT ROW_NUMBER() OVER(ORDER BY RATINGDATE DESC) RN, R.* FROM RATING R WHERE MOVIEID = ?) " + 
				"  WHERE RN BETWEEN ? AND ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,movieId);
			pstmt.setInt(2,startRow);
			pstmt.setInt(3,endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String userId = rs.getString("userId");
				String ratingContent = rs.getString("ratingContent");
				int ratingScore = rs.getInt("ratingScore");
				Timestamp ratingDate = rs.getTimestamp("ratingDate");
				dtos.add(new RatingDto(userId, movieId, ratingContent, ratingScore, ratingDate));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage()+"평점리스트에러:"+movieId);
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
	// 평점 갯수 (페이징) (영화 아이디에 해당하는 평점만)
	public int totalComment(String movieId) {
		int total = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM RATING WHERE MOVIEID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, movieId);
			rs = pstmt.executeQuery();
			rs.next();
			total = rs.getInt(1);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("평점갯수 에러:"+movieId);
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
	// 평점 작성
	public int writeRating(RatingDto dto) {
		int 			 result = FAIL;
		Connection 		   conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO RATING (USERID, MOVIEID, RATINGCONTENT, RATINGSCORE) " + 
				"  VALUES(?,?,?,?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserId());
			pstmt.setString(2, dto.getMovieId());
			pstmt.setString(3, dto.getRatingContent());
			pstmt.setInt(3, dto.getRatingScore());
			result = pstmt.executeUpdate();
			System.out.println("평점 작성 성공");
		} catch (SQLException e) {
			System.out.println(e.getMessage()+"평점작성 에러:"+dto);
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
	// 평점 수정
	public int modifyRating(RatingDto dto) {
		int 			 result = FAIL;
		Connection 		   conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE RATING " + 
				"  SET RATINGCONTENT = ?, " + 
				"      RATINGSCORE = ? " + 
				"  WHERE USERID = ? AND MOVIEID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getRatingContent());
			pstmt.setInt(2, dto.getRatingScore());
			pstmt.setString(2, dto.getUserId());
			pstmt.setString(2, dto.getMovieId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("평점수정 실패");
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
	// 평점삭제
	public int deleteComment(String movieId, String userId) {
		int 			 result = FAIL;
		Connection 		   conn = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM RATING WHERE USERID = ? AND MOVIEID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, movieId);
			pstmt.setString(2, userId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("평점삭제 실패:"+movieId+userId);
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
