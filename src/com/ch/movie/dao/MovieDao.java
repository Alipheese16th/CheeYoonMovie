package com.ch.movie.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.ch.movie.dto.MovieDto;

public class MovieDao {
	public static final int FAIL = 0;
	public static final int SUCCESS = 1;
	private DataSource ds;

	public MovieDao() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
	}
	
	// 영화등록
	public int registerMovie(MovieDto dto) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO MOVIE(MOVIEID, MOVIENAME, MOVIESUMMARY, MOVIERUNNING, MOVIEIMAGE, " + 
				"            MOVIEDATE, MOVIEGRADE, MOVIEAUDIENCE, STATE) " + 
				"  VALUES('m'||LPAD(MOVIE_SEQ.NEXTVAL,3,'0'),?,'아이언맨은 히어로 이야기이다. 머시기 저시기', " + 
				"  126,'ironman.png','08/04/30','12세 관람가',4300365,3)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMovieName());
			pstmt.setString(2,dto.getMovieSummary());
			pstmt.setInt(3,dto.getMovieRunning());
			pstmt.setString(4,dto.getMovieImage());
			pstmt.setDate(5,dto.getMovieDate());
			pstmt.setString(6,dto.getMovieGrade());
			pstmt.setInt(7,dto.getMovieAudience());
			pstmt.setInt(8, dto.getState());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("영화등록에러:"+dto);
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
	// 영화 수정
	public int updateMovie(MovieDto dto) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE MOVIE " + 
				"  SET MOVIENAME = ?, " + 
				"      MOVIESUMMARY = ?, " + 
				"      MOVIERUNNING = ?, " + 
				"      MOVIEIMAGE = ?, " + 
				"      MOVIEDATE = ?, " + 
				"      MOVIEGRADE = ?, " + 
				"      MOVIEAUDIENCE = ?, " + 
				"      STATE = ? " + 
				"  WHERE MOVIEID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMovieName());
			pstmt.setString(2,dto.getMovieSummary());
			pstmt.setInt(3,dto.getMovieRunning());
			pstmt.setString(4,dto.getMovieImage());
			pstmt.setDate(5,dto.getMovieDate());
			pstmt.setString(6,dto.getMovieGrade());
			pstmt.setInt(7,dto.getMovieAudience());
			pstmt.setInt(8, dto.getState());
			pstmt.setNString(9, dto.getMovieId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("영화수정에러:"+dto);
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
	// 현재 상영중 영화리스트
	public ArrayList<MovieDto> nowPlayingMovie() {
		ArrayList<MovieDto> dtos = new ArrayList<MovieDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM MOVIE WHERE STATE = 2 ORDER BY MOVIEDATE DESC";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String movieId = rs.getString("movieId");
				String movieName = rs.getString("movieName");
				String movieSummary = rs.getString("movieSummary");
				int movieRunning = rs.getInt("movieRunning");
				String movieImage = rs.getString("movieImage");
				Date movieDate = rs.getDate("movieDate");
				String movieGrade = rs.getString("movieGrade");
				int movieAudience = rs.getInt("movieAudience");
				int state = rs.getInt("state");
				dtos.add(new MovieDto(movieId, movieName, movieSummary, movieRunning, movieImage, movieDate, movieGrade, movieAudience, state));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("현재상영작 가져오는중 에러:"+dtos);
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
	// 상영예고 영화리스트
	public ArrayList<MovieDto> upComingMovie() {
		ArrayList<MovieDto> dtos = new ArrayList<MovieDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM MOVIE WHERE STATE = 1 ORDER BY MOVIEDATE";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String movieId = rs.getString("movieId");
				String movieName = rs.getString("movieName");
				String movieSummary = rs.getString("movieSummary");
				int movieRunning = rs.getInt("movieRunning");
				String movieImage = rs.getString("movieImage");
				Date movieDate = rs.getDate("movieDate");
				String movieGrade = rs.getString("movieGrade");
				int movieAudience = rs.getInt("movieAudience");
				int state = rs.getInt("state");
				dtos.add(new MovieDto(movieId, movieName, movieSummary, movieRunning, movieImage, movieDate, movieGrade, movieAudience, state));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("상영예고 가져오는중 에러:"+dtos);
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
	// 상영 예고작품중에 상영일이 됐으면 상영중으로 업데이트
	public int refreshMovie() {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE MOVIE " + 
				"  SET STATE = 2 " + 
				"  WHERE STATE = 1 " + 
				"  AND MOVIEDATE <= SYSDATE";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("상영예고->상영중새로고침에러");
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
	// 영화이름으로 영화 검색
	public ArrayList<MovieDto> searchMovieName(String searchName) {
		ArrayList<MovieDto> dtos = new ArrayList<MovieDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM MOVIE WHERE MOVIENAME LIKE '%' || ? || '%'";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchName);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String movieId = rs.getString("movieId");
				String movieName = rs.getString("movieName");
				String movieSummary = rs.getString("movieSummary");
				int movieRunning = rs.getInt("movieRunning");
				String movieImage = rs.getString("movieImage");
				Date movieDate = rs.getDate("movieDate");
				String movieGrade = rs.getString("movieGrade");
				int movieAudience = rs.getInt("movieAudience");
				int state = rs.getInt("state");
				dtos.add(new MovieDto(movieId, movieName, movieSummary, movieRunning, movieImage, movieDate, movieGrade, movieAudience, state));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("영화검색(이름) 에러:"+searchName);
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
	// 태그로 영화 검색
	public ArrayList<MovieDto> searchMovieTag(String searchTag) {
		ArrayList<MovieDto> dtos = new ArrayList<MovieDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM MOVIE WHERE MOVIEID IN (SELECT MOVIEID FROM TAG WHERE TAG = ?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchTag);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String movieId = rs.getString("movieId");
				String movieName = rs.getString("movieName");
				String movieSummary = rs.getString("movieSummary");
				int movieRunning = rs.getInt("movieRunning");
				String movieImage = rs.getString("movieImage");
				Date movieDate = rs.getDate("movieDate");
				String movieGrade = rs.getString("movieGrade");
				int movieAudience = rs.getInt("movieAudience");
				int state = rs.getInt("state");
				dtos.add(new MovieDto(movieId, movieName, movieSummary, movieRunning, movieImage, movieDate, movieGrade, movieAudience, state));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("영화검색(태그) 에러:"+searchTag);
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
	// 영화 상세보기 (id로 dto가져오기)
	public MovieDto getMovie(String movieId) {
		MovieDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM MOVIE WHERE MOVIEID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,movieId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String movieName = rs.getString("movieName");
				String movieSummary = rs.getString("movieSummary");
				int movieRunning = rs.getInt("movieRunning");
				String movieImage = rs.getString("movieImage");
				Date movieDate = rs.getDate("movieDate");
				String movieGrade = rs.getString("movieGrade");
				int movieAudience = rs.getInt("movieAudience");
				int state = rs.getInt("state");
				dto = new MovieDto(movieId, movieName, movieSummary, movieRunning, movieImage, movieDate, movieGrade, movieAudience, state);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("movieId로 dto가져오는중 에러:"+movieId);
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
	// movieId로 태그 리스트 가져오기
	public ArrayList<String> getTagList(String movieId){
		ArrayList<String> tagList = new ArrayList<String>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT TAG FROM TAG WHERE MOVIEID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,movieId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				tagList.add(rs.getString("tag"));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("movieId로 태그리스트 가져오는중 에러:"+movieId);
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return tagList;
	}
	// 특정 인물의 영화 출연작 리스트 (personId로 영화 리스트 출력)
	public ArrayList<MovieDto> personHasMovieList(String personId){
		ArrayList<MovieDto> dtos = new ArrayList<MovieDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT M.* FROM MOVIE_PERSON MP, MOVIE M " + 
				"  WHERE MP.MOVIEID = M.MOVIEID AND MP.PERSONID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, personId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String movieId = rs.getString("movieId");
				String movieName = rs.getString("movieName");
				String movieSummary = rs.getString("movieSummary");
				int movieRunning = rs.getInt("movieRunning");
				String movieImage = rs.getString("movieImage");
				Date movieDate = rs.getDate("movieDate");
				String movieGrade = rs.getString("movieGrade");
				int movieAudience = rs.getInt("movieAudience");
				int state = rs.getInt("state");
				dtos.add(new MovieDto(movieId, movieName, movieSummary, movieRunning, movieImage, movieDate, movieGrade, movieAudience, state));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("특정인물의 영화출연작리스트 에러:"+personId);
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
	
	
}
