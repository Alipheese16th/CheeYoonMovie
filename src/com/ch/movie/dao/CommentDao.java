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

import com.ch.movie.dto.CommentDto;

public class CommentDao {
	public static final int FAIL = 0;
	public static final int SUCCESS = 1;
	private DataSource ds;

	public CommentDao() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
	}
	// 댓글 리스트 출력 (특정 글번호의 댓글, 탑앤구문 시작행,끝행 번호 필요)
	public ArrayList<CommentDto> getCommentList(int boardNo,int startRow, int endRow){
		ArrayList<CommentDto> dtos = new ArrayList<CommentDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM " + 
				"  (SELECT ROW_NUMBER() OVER(ORDER BY COMMENTDATE DESC) RN, C.* FROM COMMENTS C WHERE BOARDNO = ?) " + 
				"  WHERE RN BETWEEN ? AND ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,boardNo);
			pstmt.setInt(2,startRow);
			pstmt.setInt(3,endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int commentNo = rs.getInt("commentNo");
				String userId = rs.getString("userId");
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
	// 전체 글 갯수(페이징)
	public int totalComment(int boardNo) {
		int total = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM COMMENTS WHERE BOARDNO = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			rs = pstmt.executeQuery();
			rs.next();
			total = rs.getInt(1);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("전체 댓글갯수 에러:"+total);
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
	// 댓글 작성
	public int writeComment(CommentDto dto) {
		int 			 result = FAIL;
		Connection 		   conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO COMMENTS(COMMENTNO, BOARDNO, USERID, COMMENTCONTENT) " + 
				"  VALUES(COMMENTS_SEQ.NEXTVAL, ?, ?, ?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getBoardNo());
			pstmt.setString(2, dto.getUserId());
			pstmt.setString(3, dto.getCommentContent());
			pstmt.executeUpdate();
			result = SUCCESS;
			System.out.println("댓글쓰기 성공");
		} catch (SQLException e) {
			System.out.println(e.getMessage()+"댓글쓰기 실패:"+dto);
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
	// 댓글 수정
	public int modifyComment(int commentNo, String commentContent) {
		int 			 result = FAIL;
		Connection 		   conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE COMMENTS SET COMMENTCONTENT = ? WHERE COMMENTNO = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, commentNo);
			pstmt.setString(2, commentContent);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("댓글수정 실패");
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
	// 댓글 삭제
	public int deleteComment(int CommentNo) {
		int 			 result = FAIL;
		Connection 		   conn = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM COMMENTS WHERE COMMENTNO = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, CommentNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("댓글삭제 실패:"+CommentNo);
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
