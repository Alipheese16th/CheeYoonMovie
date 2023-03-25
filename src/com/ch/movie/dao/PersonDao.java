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
				String personName = rs.getString("personName");
				String personImage = rs.getString("personImage");
				String personNation = rs.getString("personNation");
				Date personBirth = rs.getDate("personBirth");
				dtos.add(new PersonDto(personId, personName, personImage, personNation, personBirth, null, null));
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
				String personName = rs.getString("personName");
				String personImage = rs.getString("personImage");
				String personNation = rs.getString("personNation");
				Date personBirth = rs.getDate("personBirth");
				dto = new PersonDto(personId, personName, personImage, personNation, personBirth, null, null);
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
		String sql = "INSERT INTO PERSON(PERSONID, PERSONNAME, PERSONIMAGE, PERSONNATION, PERSONBIRTH) " + 
				"  VALUES('p'||LPAD(PERSON_SEQ.NEXTVAL,3,'0'),?,?,?,?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getPersonName());
			pstmt.setString(2,dto.getPersonImage());
			pstmt.setString(3,dto.getPersonNation());
			pstmt.setDate(4,dto.getPersonBirth());
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
				"  SET PERSONNAME = ?, " + 
				"      PERSONIMAGE = ?, " + 
				"      PERSONNATION = ?, " + 
				"      PERSONBIRTH = ? " + 
				"  WHERE PERSONID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPersonName());
			pstmt.setString(2, dto.getPersonImage());
			pstmt.setString(3, dto.getPersonNation());
			pstmt.setDate(4, dto.getPersonBirth());
			pstmt.setNString(5, dto.getPersonId());
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
