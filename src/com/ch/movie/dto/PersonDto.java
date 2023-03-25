package com.ch.movie.dto;

import java.sql.Date;

public class PersonDto {
	private String personId;
	private String personName;
	private String personImage;
	private String personNation;
	private Date personBirth;
	private String casting;
	private String role;
	
	public PersonDto(String personId, String personName, String personImage, String personNation, Date personBirth,
			String casting, String role) {
		super();
		this.personId = personId;
		this.personName = personName;
		this.personImage = personImage;
		this.personNation = personNation;
		this.personBirth = personBirth;
		this.casting = casting;
		this.role = role;
	}
	
	public String getCasting() {
		return casting;
	}

	public void setCasting(String casting) {
		this.casting = casting;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getPersonId() {
		return personId;
	}
	public void setPersonId(String personId) {
		this.personId = personId;
	}
	
	public String getPersonName() {
		return personName;
	}
	public void setPersonName(String personName) {
		this.personName = personName;
	}
	public String getPersonImage() {
		return personImage;
	}
	public void setPersonImage(String personImage) {
		this.personImage = personImage;
	}
	
	public String getPersonNation() {
		return personNation;
	}
	public void setPersonNation(String personNation) {
		this.personNation = personNation;
	}
	public Date getPersonBirth() {
		return personBirth;
	}
	public void setPersonBirth(Date personBirth) {
		this.personBirth = personBirth;
	}

	@Override
	public String toString() {
		return "PersonDto [personId=" + personId + ", personName=" + personName + ", personImage=" + personImage
				+ ", personNation=" + personNation + ", personBirth=" + personBirth + ", casting=" + casting + ", role="
				+ role + "]";
	}
	
	
}
