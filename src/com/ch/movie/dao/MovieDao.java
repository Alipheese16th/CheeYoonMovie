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
import com.ch.movie.dto.PersonDto;
import com.ch.movie.dto.TrailerDto;

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
	
	
	// 현재 상영중 영화리스트 (개봉일 최근순)
	public ArrayList<MovieDto> nowPlayingMovie() {
		ArrayList<MovieDto> dtos = new ArrayList<MovieDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT M.*,(SELECT ROUND(AVG(RATINGSCORE),1) FROM RATING WHERE MOVIEID = M.MOVIEID) as avgSCORE " + 
				"  FROM MOVIE M WHERE STATE = 2 ORDER BY MOVIEDATE DESC";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String movieId = rs.getString("movieId");
				String originalTitle = rs.getString("originalTitle");
				String movieTitle = rs.getString("movieTitle");
				String movieSummary = rs.getString("movieSummary");
				int movieRunning = rs.getInt("movieRunning");
				String movieImage = rs.getString("movieImage");
				Date movieDate = rs.getDate("movieDate");
				String movieGrade = rs.getString("movieGrade");
				int movieAudience = rs.getInt("movieAudience");
				int state = rs.getInt("state");
				double avgScore = rs.getDouble("avgScore");
				dtos.add(new MovieDto(movieId, originalTitle, movieTitle, movieSummary, movieRunning, movieImage, movieDate, movieGrade, 
						movieAudience, state, avgScore, getTagList(movieId), MovieHasPersonList(movieId), getTrailerList(movieId)));
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
	// 상영예고 영화리스트 (가장 빨리 개봉되는 순)
	public ArrayList<MovieDto> upComingMovie() {
		ArrayList<MovieDto> dtos = new ArrayList<MovieDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT M.*,(SELECT ROUND(AVG(RATINGSCORE),1) FROM RATING WHERE MOVIEID = M.MOVIEID) as avgSCORE " + 
				"  FROM MOVIE M WHERE STATE = 1 ORDER BY MOVIEDATE";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String movieId = rs.getString("movieId");
				String originalTitle = rs.getString("originalTitle");
				String movieTitle = rs.getString("movieTitle");
				String movieSummary = rs.getString("movieSummary");
				int movieRunning = rs.getInt("movieRunning");
				String movieImage = rs.getString("movieImage");
				Date movieDate = rs.getDate("movieDate");
				String movieGrade = rs.getString("movieGrade");
				int movieAudience = rs.getInt("movieAudience");
				int state = rs.getInt("state");
				double avgScore = rs.getDouble("avgScore");
				dtos.add(new MovieDto(movieId, originalTitle, movieTitle, movieSummary, movieRunning, movieImage, movieDate, movieGrade, 
						movieAudience, state, avgScore, getTagList(movieId), MovieHasPersonList(movieId), getTrailerList(movieId)));
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
	
	// 영화 상세보기 (id로 dto가져오기)
	public MovieDto getMovie(String movieId) {
		MovieDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT M.*,(SELECT ROUND(AVG(RATINGSCORE),1) FROM RATING WHERE MOVIEID = M.MOVIEID) as avgScore " + 
				"  FROM MOVIE M WHERE MOVIEID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,movieId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String originalTitle = rs.getString("originalTitle");
				String movieTitle = rs.getString("movieTitle");
				String movieSummary = rs.getString("movieSummary");
				int movieRunning = rs.getInt("movieRunning");
				String movieImage = rs.getString("movieImage");
				Date movieDate = rs.getDate("movieDate");
				String movieGrade = rs.getString("movieGrade");
				int movieAudience = rs.getInt("movieAudience");
				int state = rs.getInt("state");
				double avgScore = rs.getDouble("avgScore");
				dto = new MovieDto(movieId, originalTitle, movieTitle, movieSummary, movieRunning, movieImage, movieDate, movieGrade, 
						movieAudience, state, avgScore, getTagList(movieId), MovieHasPersonList(movieId), getTrailerList(movieId));
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
	
	// 영화리스트,상세보기 - 특정 영화의 인물들  (캐스팅,롤 컬럼 추가)
	private ArrayList<PersonDto> MovieHasPersonList(String movieId) {
		ArrayList<PersonDto> dtos = new ArrayList<PersonDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT P.PERSONID,PERSONNAME,PERSONIMAGE,PERSONNATION,PERSONBIRTH,CASTING,ROLE " + 
				"FROM MOVIE_PERSON MP,PERSON P WHERE MP.PERSONID = P.PERSONID AND MOVIEID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, movieId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String personId = rs.getString("personId");
				String personName = rs.getString("personName");
				String personImage = rs.getString("personImage");
				String personNation = rs.getString("personNation");
				Date personBirth = rs.getDate("personBirth");
				String casting = rs.getString("casting");
				String role = rs.getString("role");
				dtos.add(new PersonDto(personId, personName, personImage, personNation, personBirth, casting, role));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("특정영화의 제작진(인물리스트) 에러:"+movieId);
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
	// 영화리스트,상세보기 - 특정 영화의 태그리스트 
	private ArrayList<String> getTagList(String movieId){
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
	// 영화상세보기 - 특정 영화의 트레일러 리스트
	private ArrayList<TrailerDto> getTrailerList(String movieId){
		ArrayList<TrailerDto> trailerList = new ArrayList<TrailerDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM TRAILER WHERE MOVIEID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,movieId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String trailerName = rs.getString("trailerName");
				String trailerUrl = rs.getString("trailerUrl");
				trailerList.add(new TrailerDto(movieId, trailerName, trailerUrl, null));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("트레일러리스트 가져오는중 에러:"+movieId+trailerList);
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return trailerList;
	}
	// 모든 트레일러 리스트 (메인페이지 용)
	public ArrayList<TrailerDto> getTrailerList(){
		ArrayList<TrailerDto> trailerList = new ArrayList<TrailerDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM TRAILER ORDER BY MOVIEID DESC";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String movieId = rs.getString("movieId");
				String trailerName = rs.getString("trailerName");
				String trailerUrl = rs.getString("trailerUrl");
				trailerList.add(new TrailerDto(movieId, trailerName, trailerUrl, null));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("메인트레일러리스트 가져오는중 에러:"+trailerList);
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return trailerList;
	}
	// 검색페이지 - 영화이름으로 영화 검색
	public ArrayList<MovieDto> searchMovieTitle(String searchTitle) {
		ArrayList<MovieDto> dtos = new ArrayList<MovieDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT M.*,(SELECT ROUND(AVG(RATINGSCORE),1) FROM RATING WHERE MOVIEID = M.MOVIEID) as avgScore " + 
				"  FROM MOVIE M WHERE MOVIETITLE LIKE '%' || ? || '%' ORDER BY MOVIEDATE DESC";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchTitle);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String movieId = rs.getString("movieId");
				String originalTitle = rs.getString("originalTitle");
				String movieTitle = rs.getString("movieTitle");
				String movieSummary = rs.getString("movieSummary");
				int movieRunning = rs.getInt("movieRunning");
				String movieImage = rs.getString("movieImage");
				Date movieDate = rs.getDate("movieDate");
				String movieGrade = rs.getString("movieGrade");
				int movieAudience = rs.getInt("movieAudience");
				int state = rs.getInt("state");
				double avgScore = rs.getDouble("avgScore");
				dtos.add(new MovieDto(movieId, originalTitle, movieTitle, movieSummary, movieRunning, movieImage, movieDate, movieGrade, 
						movieAudience, state, avgScore, getTagList(movieId), MovieHasPersonList(movieId), getTrailerList(movieId)));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("영화검색(이름) 에러:"+searchTitle);
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
	// 검색페이지 - 태그로 영화 검색
	public ArrayList<MovieDto> searchMovieTag(String searchTag) {
		ArrayList<MovieDto> dtos = new ArrayList<MovieDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT M.*,(SELECT ROUND(AVG(RATINGSCORE),1) FROM RATING WHERE MOVIEID = M.MOVIEID) as avgScore " + 
				"  FROM MOVIE M WHERE MOVIEID IN (SELECT MOVIEID FROM TAG WHERE TAG = ?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchTag);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String movieId = rs.getString("movieId");
				String originalTitle = rs.getString("originalTitle");
				String movieTitle = rs.getString("movieTitle");
				String movieSummary = rs.getString("movieSummary");
				int movieRunning = rs.getInt("movieRunning");
				String movieImage = rs.getString("movieImage");
				Date movieDate = rs.getDate("movieDate");
				String movieGrade = rs.getString("movieGrade");
				int movieAudience = rs.getInt("movieAudience");
				int state = rs.getInt("state");
				double avgScore = rs.getDouble("avgScore");
				dtos.add(new MovieDto(movieId, originalTitle, movieTitle, movieSummary, movieRunning, movieImage, movieDate, movieGrade, 
						movieAudience, state, avgScore, getTagList(movieId), MovieHasPersonList(movieId), getTrailerList(movieId)));
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
	// 검색페이지 - 해당 검색 이름의 영화 트레일러 리스트
	public ArrayList<TrailerDto> searchTrailerList(String searchTrailer) {
		ArrayList<TrailerDto> dtos = new ArrayList<TrailerDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT T.*,MOVIETITLE FROM TRAILER T, MOVIE M " + 
				"  WHERE T.MOVIEID = M.MOVIEID AND MOVIETITLE LIKE '%' || ? || '%'";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchTrailer);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String movieId = rs.getString("movieId");
				String movieTitle = rs.getString("movieTitle");
				String trailerName = rs.getString("trailerName");
				String trailerUrl = rs.getString("trailerUrl");
				dtos.add(new TrailerDto(movieId, trailerName, trailerUrl, movieTitle));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("트레일러검색 에러:"+searchTrailer);
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
	
	// 관람객 순 현재 상영 영화 (메인페이지용 캐러셀)
	public ArrayList<MovieDto> nowPlayingByAudience(int startRow, int endRow) {
		ArrayList<MovieDto> dtos = new ArrayList<MovieDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM ( " + 
				"    SELECT ROWNUM RN, A.* FROM " + 
				"      (SELECT M.*,(SELECT ROUND(AVG(RATINGSCORE),1) FROM RATING WHERE MOVIEID = M.MOVIEID) as avgScore " + 
				"        FROM MOVIE M WHERE STATE = 2 ORDER BY MOVIEAUDIENCE DESC) A) " + 
				"  WHERE RN BETWEEN ? AND ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String movieId = rs.getString("movieId");
				String originalTitle = rs.getString("originalTitle");
				String movieTitle = rs.getString("movieTitle");
				String movieSummary = rs.getString("movieSummary");
				int movieRunning = rs.getInt("movieRunning");
				String movieImage = rs.getString("movieImage");
				Date movieDate = rs.getDate("movieDate");
				String movieGrade = rs.getString("movieGrade");
				int movieAudience = rs.getInt("movieAudience");
				int state = rs.getInt("state");
				double avgScore = rs.getDouble("avgScore");
				dtos.add(new MovieDto(movieId, originalTitle, movieTitle, movieSummary, movieRunning, movieImage, movieDate, movieGrade, 
						movieAudience, state, avgScore, getTagList(movieId), MovieHasPersonList(movieId), getTrailerList(movieId)));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("관람객순 현재상영작 리스트 에러:"+dtos);
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
	// 평점순 현재 상영 영화
	public ArrayList<MovieDto> nowPlayingByAvgScore(int startRow, int endRow) {
		ArrayList<MovieDto> dtos = new ArrayList<MovieDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM ( " + 
				"    SELECT ROWNUM RN, A.* FROM " + 
				"      (SELECT M.*, NVL((SELECT ROUND(AVG(RATINGSCORE),1) FROM RATING WHERE MOVIEID = M.MOVIEID),0) as avgScore " + 
				"        FROM MOVIE M WHERE STATE = 2 ORDER BY avgScore DESC) A) " + 
				"  WHERE RN BETWEEN ? AND ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String movieId = rs.getString("movieId");
				String originalTitle = rs.getString("originalTitle");
				String movieTitle = rs.getString("movieTitle");
				String movieSummary = rs.getString("movieSummary");
				int movieRunning = rs.getInt("movieRunning");
				String movieImage = rs.getString("movieImage");
				Date movieDate = rs.getDate("movieDate");
				String movieGrade = rs.getString("movieGrade");
				int movieAudience = rs.getInt("movieAudience");
				int state = rs.getInt("state");
				double avgScore = rs.getDouble("avgScore");
				dtos.add(new MovieDto(movieId, originalTitle, movieTitle, movieSummary, movieRunning, movieImage, movieDate, movieGrade, 
						movieAudience, state, avgScore, getTagList(movieId), MovieHasPersonList(movieId), getTrailerList(movieId)));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("평점순 현재상영작 리스트 에러:"+dtos);
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
	// 현재상영영화 페이징
	public int totalNowPlaying() {
		int total = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM MOVIE WHERE STATE = 2";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			total = rs.getInt(1);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("현재상영작 페이징 에러:"+total);
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
	
	// 평점순 모든 영화
	public ArrayList<MovieDto> allMovieByAvgScore(int startRow, int endRow) {
		ArrayList<MovieDto> dtos = new ArrayList<MovieDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM ( " + 
				"    SELECT ROWNUM RN, A.* FROM " + 
				"      (SELECT M.*,NVL((SELECT ROUND(AVG(RATINGSCORE),1) FROM RATING WHERE MOVIEID = M.MOVIEID),0) as avgScore " + 
				"        FROM MOVIE M ORDER BY avgScore DESC) A) " + 
				"  WHERE RN BETWEEN ? AND ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String movieId = rs.getString("movieId");
				String originalTitle = rs.getString("originalTitle");
				String movieTitle = rs.getString("movieTitle");
				String movieSummary = rs.getString("movieSummary");
				int movieRunning = rs.getInt("movieRunning");
				String movieImage = rs.getString("movieImage");
				Date movieDate = rs.getDate("movieDate");
				String movieGrade = rs.getString("movieGrade");
				int movieAudience = rs.getInt("movieAudience");
				int state = rs.getInt("state");
				double avgScore = rs.getDouble("avgScore");
				dtos.add(new MovieDto(movieId, originalTitle, movieTitle, movieSummary, movieRunning, movieImage, movieDate, movieGrade, 
						movieAudience, state, avgScore, getTagList(movieId), MovieHasPersonList(movieId), getTrailerList(movieId)));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("평점순 현재상영작 리스트 에러:"+dtos);
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
	// 모든영화 페이징
	public int totalAllMovie() {
		int total = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM MOVIE";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			total = rs.getInt(1);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("모든영화 페이징 에러:"+total);
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
	
	
	
	// 모든 영화
	public ArrayList<MovieDto> allMovie() {
		ArrayList<MovieDto> dtos = new ArrayList<MovieDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM MOVIE";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String movieId = rs.getString("movieId");
				String originalTitle = rs.getString("originalTitle");
				String movieTitle = rs.getString("movieTitle");
				String movieSummary = rs.getString("movieSummary");
				int movieRunning = rs.getInt("movieRunning");
				String movieImage = rs.getString("movieImage");
				Date movieDate = rs.getDate("movieDate");
				String movieGrade = rs.getString("movieGrade");
				int movieAudience = rs.getInt("movieAudience");
				int state = rs.getInt("state");
				dtos.add(new MovieDto(movieId, originalTitle, movieTitle, movieSummary, movieRunning, movieImage, movieDate, movieGrade, 
						movieAudience, state));
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
	
	// 영화등록
	public int insertMovie(MovieDto dto) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO MOVIE(MOVIEID, ORIGINALTITLE, MOVIETITLE, MOVIESUMMARY, MOVIERUNNING, MOVIEIMAGE, " + 
				"            MOVIEDATE, MOVIEGRADE, MOVIEAUDIENCE, STATE) " + 
				"  VALUES('m'||LPAD(MOVIE_SEQ.NEXTVAL,3,'0'), ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getOriginalTitle());
			pstmt.setString(2, dto.getMovieTitle());
			pstmt.setString(3, dto.getMovieSummary());
			pstmt.setInt(4, dto.getMovieRunning());
			pstmt.setString(5, dto.getMovieImage());
			pstmt.setDate(6, dto.getMovieDate());
			pstmt.setString(7, dto.getMovieGrade());
			pstmt.setInt(8, dto.getMovieAudience());
			pstmt.setInt(9, dto.getState());
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
				"  SET ORIGINALTITLE = ?, " + 
				"      MOVIETITLE = ?, " + 
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
			pstmt.setString(1, dto.getOriginalTitle());
			pstmt.setString(2, dto.getMovieTitle());
			pstmt.setString(3,dto.getMovieSummary());
			pstmt.setInt(4,dto.getMovieRunning());
			pstmt.setString(5,dto.getMovieImage());
			pstmt.setDate(6,dto.getMovieDate());
			pstmt.setString(7,dto.getMovieGrade());
			pstmt.setInt(8,dto.getMovieAudience());
			pstmt.setInt(9, dto.getState());
			pstmt.setString(10, dto.getMovieId());
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
		
	// 특정 인물의 영화 출연작 리스트 
	public ArrayList<MovieDto> personHasMovieList(String personId){
		ArrayList<MovieDto> dtos = new ArrayList<MovieDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT M.*,(SELECT ROUND(AVG(RATINGSCORE),1) FROM RATING WHERE MOVIEID = M.MOVIEID) as avgSCORE " + 
				"  FROM MOVIE M, MOVIE_PERSON MP " + 
				"  WHERE MP.MOVIEID = M.MOVIEID AND MP.PERSONID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, personId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String movieId = rs.getString("movieId");
				String originalTitle = rs.getString("originalTitle");
				String movieTitle = rs.getString("movieTitle");
				String movieSummary = rs.getString("movieSummary");
				int movieRunning = rs.getInt("movieRunning");
				String movieImage = rs.getString("movieImage");
				Date movieDate = rs.getDate("movieDate");
				String movieGrade = rs.getString("movieGrade");
				int movieAudience = rs.getInt("movieAudience");
				int state = rs.getInt("state");
				double avgScore = rs.getDouble("avgScore");
				dtos.add(new MovieDto(movieId, originalTitle, movieTitle, movieSummary, movieRunning, movieImage, movieDate, movieGrade, 
						movieAudience, state, avgScore, getTagList(movieId), MovieHasPersonList(movieId), null));
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
