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

import com.ch.movie.dto.PersonDto;


public class PersonDao {
	public static final int FAIL = 0;
	public static final int SUCCESS = 1;
	private DataSource ds;

	public PersonDao() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
	}
	
	// 인물이름으로 인물 검색
	public ArrayList<PersonDto> searchPersonName(String searchName) {
		ArrayList<PersonDto> dtos = new ArrayList<PersonDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM PERSON WHERE PERSONNAME LIKE '%' || ? || '%'";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchName);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String personId = rs.getString("personId");
				String personJob = rs.getString("personJob");
				String personName = rs.getString("personName");
				String personImage = rs.getString("personImage");
				String personGender = rs.getString("personGender");
				String personNation = rs.getString("personNation");
				Date personBirth = rs.getDate("personBirth");
				String personDetail = rs.getString("personDetail");
				dtos.add(new PersonDto(personId, personJob, personName, personImage, personGender, personNation, personBirth, personDetail));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("인물검색(이름) 에러:"+searchName);
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
	// 특정 영화의 인물들 출력 (movieId 로 인물리스트)
	public ArrayList<PersonDto> MovieHasPersonList(String movieId) {
		ArrayList<PersonDto> dtos = new ArrayList<PersonDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT P.* FROM MOVIE_PERSON MP, PERSON P " + 
				"  WHERE MP.PERSONID = P.PERSONID AND MP.MOVIEID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, movieId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String personId = rs.getString("personId");
				String personJob = rs.getString("personJob");
				String personName = rs.getString("personName");
				String personImage = rs.getString("personImage");
				String personGender = rs.getString("personGender");
				String personNation = rs.getString("personNation");
				Date personBirth = rs.getDate("personBirth");
				String personDetail = rs.getString("personDetail");
				dtos.add(new PersonDto(personId, personJob, personName, personImage, personGender, personNation, personBirth, personDetail));
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
	
	// 인물 상세보기 (personId로 dto가져오기)
	public PersonDto getPerson(String personId) {
		PersonDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM PERSON WHERE PERSONID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, personId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String personJob = rs.getString("personJob");
				String personName = rs.getString("personName");
				String personImage = rs.getString("personImage");
				String personGender = rs.getString("personGender");
				String personNation = rs.getString("personNation");
				Date personBirth = rs.getDate("personBirth");
				String personDetail = rs.getString("personDetail");
				dto = new PersonDto(personId, personJob, personName, personImage, personGender, personNation, personBirth, personDetail);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("인물 상세보기 에러:"+personId);
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
	
	// 인물 등록
	public int registerPerson(PersonDto dto) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO PERSON(PERSONID, PERSONJOB, PERSONNAME, PERSONIMAGE, PERSONGENDER, PERSONNATION, PERSONBIRTH, PERSONDETAIL) " + 
				"  VALUES('p'||LPAD(PERSON_SEQ.NEXTVAL,3,'0'),?,?,?,?,?,?,?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPersonJob());
			pstmt.setString(2,dto.getPersonName());
			pstmt.setString(3,dto.getPersonImage());
			pstmt.setString(4,dto.getPersonGender());
			pstmt.setString(5,dto.getPersonNation());
			pstmt.setDate(6,dto.getPersonBirth());
			pstmt.setString(7,dto.getPersonDetail());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("인물등록에러:"+dto);
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
	// 인물 정보 수정
	public int updatePerson(PersonDto dto) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE PERSON " + 
				"  SET PERSONJOB = ?, " + 
				"      PERSONNAME = ?, " + 
				"      PERSONIMAGE = ?, " + 
				"      PERSONGENDER = ?, " + 
				"      PERSONNATION = ?, " + 
				"      PERSONBIRTH = ?, " + 
				"      PERSONDETAIL = ? " + 
				"  WHERE PERSONID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPersonJob());
			pstmt.setString(2, dto.getPersonName());
			pstmt.setString(3, dto.getPersonImage());
			pstmt.setString(4, dto.getPersonGender());
			pstmt.setString(5, dto.getPersonNation());
			pstmt.setDate(6, dto.getPersonBirth());
			pstmt.setString(7, dto.getPersonDetail());
			pstmt.setNString(8, dto.getPersonId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("인물수정에러:"+dto);
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
