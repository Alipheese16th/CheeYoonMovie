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

import com.ch.movie.dto.BoardDto;

public class BoardDao {
	public static final int FAIL = 0;
	public static final int SUCCESS = 1;
	private DataSource ds;

	public BoardDao() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
	}
	// 글목록 출력 (댓글 갯수 서브쿼리 추가)
	public ArrayList<BoardDto> getBoardList(int startRow, int endRow){
		ArrayList<BoardDto> dtos = new ArrayList<BoardDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM " + 
				"  (SELECT ROW_NUMBER() OVER(ORDER BY BOARDGROUP DESC, BOARDSTEP) RN,USERNAME ,B.*, " + 
				"      (SELECT COUNT(*) FROM COMMENTS WHERE BOARDNO = B.BOARDNO) COMMENTCNT  FROM BOARD B, USERS U " + 
				"      WHERE B.USERID = U.USERID) " + 
				"  WHERE RN BETWEEN ? AND ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,startRow);
			pstmt.setInt(2,endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int boardNo = rs.getInt("boardNo");
				String userId = rs.getString("userId");
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
				String userName = rs.getString("userName");
				dtos.add(new BoardDto(boardNo, userId, boardTitle, boardContent, boardHit, boardDate, boardUpdate, boardGroup, boardStep, boardIndent, boardIp, commentCnt,userName));
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
	public int totalBoard() {
		int total = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM BOARD";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			total = rs.getInt(1);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("자유게시판 페이징 에러:"+total);
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
	// 글쓰기 (원글쓰기)
	public int writeBoard(BoardDto dto) {
		int 			 result = FAIL;
		Connection 		   conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO BOARD(BOARDNO, USERID, BOARDTITLE, BOARDCONTENT, BOARDGROUP, BOARDSTEP, BOARDINDENT, BOARDIP)\r\n" + 
				"  VALUES(BOARD_SEQ.NEXTVAL, ?, ?, ?, BOARD_SEQ.CURRVAL, 0, 0, ?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserId());
			pstmt.setString(2, dto.getBoardTitle());
			pstmt.setString(3, dto.getBoardContent());
			pstmt.setString(4, dto.getBoardIp());
			pstmt.executeUpdate();
			result = SUCCESS;
			System.out.println("원글쓰기 성공");
		} catch (SQLException e) {
			System.out.println(e.getMessage()+"원글쓰기 실패"+dto);
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
	// 조회수 1 up (private으로 따로 호출안할것이기에 service클래스에서 호출할것)
	public void hitUp(int boardNo) {
		Connection 		   conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE BOARD SET BOARDHIT = BOARDHIT + 1 WHERE BOARDNO = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage()+"조회수 up 실패");
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
	}
	// 글상세보기 (boardNo로 dto가져오기)
	public BoardDto getBoard(int boardNo) {
		BoardDto dto = null;
		Connection 		   conn = null;
		PreparedStatement pstmt = null;
		ResultSet 			 rs = null;
		String sql = "SELECT USERNAME, B.*,(SELECT COUNT(*) FROM COMMENTS WHERE BOARDNO = B.BOARDNO) COMMENTCNT " + 
				"  FROM BOARD B, USERS U WHERE B.USERID = U.USERID AND BOARDNO = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String userId = rs.getString("userId");
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
				String userName = rs.getString("userName");
				dto = new BoardDto(boardNo, userId, boardTitle, boardContent, boardHit, boardDate, boardUpdate, boardGroup, boardStep, boardIndent, boardIp, commentCnt, userName);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("글 상세보기 실패"+boardNo+dto);
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
	
	// 글 수정하기
	public int modifyBoard(BoardDto dto) {
		int 			 result = FAIL;
		Connection 		   conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE BOARD " + 
				"  SET BOARDTITLE = ?, " + 
				"      BOARDCONTENT = ?, " + 
				"      BOARDUPDATE = SYSDATE, " + 
				"      BOARDIP = ? " + 
				"  WHERE BOARDNO = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getBoardTitle());
			pstmt.setString(2, dto.getBoardContent());
			pstmt.setString(3, dto.getBoardIp());
			pstmt.setInt(4, dto.getBoardNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("글수정 실패:"+dto);
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
	// 글 삭제
	public int deleteBoard(int boardNo) {
		int 			 result = FAIL;
		Connection 		   conn = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM BOARD WHERE BOARDNO = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("글삭제 실패:"+boardNo);
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
	// 8. 답변글 쓰기 전단계(원글의 group,step 정보필요)
	private void preReplyStep(int boardGroup, int boardStep) {
		Connection 		   conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE BOARD SET BOARDSTEP = BOARDSTEP + 1 " + 
				"    WHERE BOARDGROUP = ? AND BOARDSTEP > ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardGroup);
			pstmt.setInt(2, boardStep);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage()+"preReplyStep에서 오류");
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
	}
	// 9. 답변글 쓰기(원글의 group,step,indent정보, 답변글의 나머지정보)
	public int replyBoard(BoardDto dto) {
		int result = FAIL;
		preReplyStep(dto.getBoardGroup(), dto.getBoardStep());
		Connection 		   conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO BOARD(BOARDNO, USERID, BOARDTITLE, BOARDCONTENT, BOARDGROUP, BOARDSTEP, BOARDINDENT, BOARDIP) " + 
				"  VALUES(BOARD_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserId());
			pstmt.setString(2, dto.getBoardTitle());
			pstmt.setString(3, dto.getBoardContent());
			pstmt.setInt(4, dto.getBoardGroup());
			pstmt.setInt(5, dto.getBoardStep()+1);
			pstmt.setInt(6, dto.getBoardIndent()+1);
			pstmt.setString(7, dto.getBoardIp());
			result = pstmt.executeUpdate();
			System.out.println("답변글쓰기 성공");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("답변글쓰기 실패:"+dto);
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
	
	
	// 글 전체 검색
	public ArrayList<BoardDto> searchBoardFull(String searchFull, int startRow, int endRow) {
		ArrayList<BoardDto> dtos = new ArrayList<BoardDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM " + 
				"  (SELECT ROW_NUMBER() OVER(ORDER BY BOARDGROUP DESC, BOARDSTEP) RN,USERNAME, B.*, " + 
				"      (SELECT COUNT(*) FROM COMMENTS WHERE BOARDNO = B.BOARDNO) COMMENTCNT  FROM BOARD B, USERS U " + 
				"      WHERE B.USERID = U.USERID AND ( " + 
				"          BOARDTITLE LIKE '%' || ? || '%' " + 
				"          OR BOARDCONTENT LIKE '%' || ? || '%' " + 
				"          OR USERNAME LIKE '%' || ? || '%')) " + 
				"  WHERE RN BETWEEN ? AND ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchFull);
			pstmt.setString(2, searchFull);
			pstmt.setString(3, searchFull);
			pstmt.setInt(4, startRow);
			pstmt.setInt(5, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int boardNo = rs.getInt("boardNo");
				String userId = rs.getString("userId");
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
				String userName = rs.getString("userName");
				dtos.add(new BoardDto(boardNo, userId, boardTitle, boardContent, boardHit, boardDate, boardUpdate, boardGroup, boardStep, boardIndent, boardIp, commentCnt, userName));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("자유글 검색(전체) 에러:"+searchFull);
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
	// 글 전체 검색 갯수(페이징)
	public int totalsearchFull(String searchFull) {
		int total = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM BOARD B, USERS U " + 
				"      WHERE B.USERID = U.USERID AND " + 
				"          (BOARDTITLE LIKE '%' || ? || '%' " + 
				"          OR BOARDCONTENT LIKE '%' || ? || '%' " + 
				"          OR USERNAME LIKE '%' || ? || '%')";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchFull);
			pstmt.setString(2, searchFull);
			pstmt.setString(3, searchFull);
			rs = pstmt.executeQuery();
			rs.next();
			total = rs.getInt(1);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("글 전체검색 페이징 에러:"+total);
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
	
	// 글제목으로 글 검색
	public ArrayList<BoardDto> searchBoardTitle(String searchTitle, int startRow, int endRow) {
		ArrayList<BoardDto> dtos = new ArrayList<BoardDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM " + 
				"  (SELECT ROW_NUMBER() OVER(ORDER BY BOARDGROUP DESC, BOARDSTEP) RN,USERNAME ,B.*, " + 
				"      (SELECT COUNT(*) FROM COMMENTS WHERE BOARDNO = B.BOARDNO) COMMENTCNT  FROM BOARD B, USERS U " + 
				"      WHERE B.USERID = U.USERID AND BOARDTITLE LIKE '%' || ? || '%') " + 
				"  WHERE RN BETWEEN ? AND ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchTitle);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int boardNo = rs.getInt("boardNo");
				String userId = rs.getString("userId");
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
				String userName = rs.getString("userName");
				dtos.add(new BoardDto(boardNo, userId, boardTitle, boardContent, boardHit, boardDate, boardUpdate, boardGroup, boardStep, boardIndent, boardIp, commentCnt, userName));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("자유글 검색(제목) 에러:"+searchTitle);
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
	// 글 제목 검색 갯수(페이징)
	public int totalsearchTitle(String searchTitle) {
		int total = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM BOARD B, USERS U " + 
				"      WHERE B.USERID = U.USERID AND BOARDTITLE LIKE '%' || ? || '%'";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchTitle);
			rs = pstmt.executeQuery();
			rs.next();
			total = rs.getInt(1);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("글 제목검색 페이징 에러:"+total);
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
	
	// 글 내용으로 글 검색
	public ArrayList<BoardDto> searchBoardContent(String searchContent, int startRow, int endRow) {
		ArrayList<BoardDto> dtos = new ArrayList<BoardDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM " + 
				"  (SELECT ROW_NUMBER() OVER(ORDER BY BOARDGROUP DESC, BOARDSTEP) RN,USERNAME ,B.*, " + 
				"      (SELECT COUNT(*) FROM COMMENTS WHERE BOARDNO = B.BOARDNO) COMMENTCNT  FROM BOARD B, USERS U " + 
				"      WHERE B.USERID = U.USERID AND BOARDCONTENT LIKE '%' || ? || '%') " + 
				"  WHERE RN BETWEEN ? AND ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchContent);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int boardNo = rs.getInt("boardNo");
				String userId = rs.getString("userId");
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
				String userName = rs.getString("userName");
				dtos.add(new BoardDto(boardNo, userId, boardTitle, boardContent, boardHit, boardDate, boardUpdate, boardGroup, boardStep, boardIndent, boardIp, commentCnt, userName));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("자유글 검색(본문) 에러:"+searchContent);
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
	
	// 작성자 이름으로 글 검색
	public ArrayList<BoardDto> searchBoardUserName(String searchUserName, int startRow, int endRow) {
		ArrayList<BoardDto> dtos = new ArrayList<BoardDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM " + 
				"  (SELECT ROW_NUMBER() OVER(ORDER BY BOARDGROUP DESC, BOARDSTEP) RN,USERNAME ,B.*, " + 
				"      (SELECT COUNT(*) FROM COMMENTS WHERE BOARDNO = B.BOARDNO) COMMENTCNT  FROM BOARD B, USERS U " + 
				"      WHERE B.USERID = U.USERID AND USERNAME LIKE '%' || ? || '%') " + 
				"  WHERE RN BETWEEN ? AND ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchUserName);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int boardNo = rs.getInt("boardNo");
				String userId = rs.getString("userId");
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
				String userName = rs.getString("userName");
				dtos.add(new BoardDto(boardNo, userId, boardTitle, boardContent, boardHit, boardDate, boardUpdate, boardGroup, boardStep, boardIndent, boardIp, commentCnt, userName));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("자유글 검색(작성자) 에러:"+searchUserName);
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
	
	
	// 댓글로 글 검색
//	public ArrayList<BoardDto> searchComment(String searchComment, int startRow, int endRow) {
//		ArrayList<BoardDto> dtos = new ArrayList<BoardDto>();
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		String sql = "SELECT * FROM " + 
//				"  (SELECT USERNAME, B.*, COMMENTNO,COMMENTCONTENT,COMMENTDATE, (SELECT COUNT(*) FROM COMMENTS WHERE BOARDNO = B.BOARDNO) COMMENTCNT, " + 
//				"          ROW_NUMBER() OVER(ORDER BY COMMENTDATE DESC) RN " + 
//				"    FROM COMMENTS C, BOARD B, USERS U " + 
//				"    WHERE C.BOARDNO = B.BOARDNO AND C.USERID = U.USERID AND COMMENTCONTENT LIKE '' || ? || '') " + 
//				"  WHERE RN BETWEEN ? AND ?";
//		try {
//			conn = ds.getConnection();
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, searchComment);
//			pstmt.setInt(2, startRow);
//			pstmt.setInt(3, endRow);
//			rs = pstmt.executeQuery();
//			while(rs.next()) {
//				int boardNo = rs.getInt("boardNo");
//				String userId = rs.getString("userId");
//				String boardTitle = rs.getString("boardTitle");
//				String boardContent = rs.getString("boardContent");
//				int boardHit = rs.getInt("boardHit");
//				Timestamp boardDate = rs.getTimestamp("boardDate");
//				Timestamp boardUpdate = rs.getTimestamp("boardUpdate");
//				int boardGroup = rs.getInt("boardGroup");
//				int boardStep = rs.getInt("boardStep");
//				int boardIndent = rs.getInt("boardIndent");
//				String boardIp = rs.getString("boardIp");
//				int commentCnt = rs.getInt("commentCnt");
//				String userName = rs.getString("userName");
//				dtos.add(new BoardDto(boardNo, userId, boardTitle, boardContent, boardHit, boardDate, boardUpdate, boardGroup, boardStep, boardIndent, boardIp, commentCnt, userName));
//			}
//		} catch (SQLException e) {
//			System.out.println(e.getMessage());
//			System.out.println("자유글 검색(작성자) 에러:"+searchComment);
//		}finally {
//			try {
//				if(rs!=null)rs.close();
//				if(pstmt!=null)pstmt.close();
//				if(conn!=null)conn.close();
//			} catch (SQLException e) {
//				System.out.println(e.getMessage());
//			}
//		}
//		return dtos;
//	}
	
	
	
	
}
