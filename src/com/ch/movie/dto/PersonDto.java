package com.ch.movie.dto;

import java.sql.Date;

public class PersonDto {
	private String personId;
	private String personJob;
	private String personName;
	private String personImage;
	private String personGender;
	private String personNation;
	private Date personBirth;
	private String personDetail;
	
	public PersonDto(String personId, String personJob, String personName, String personImage, String personGender,
			String personNation, Date personBirth, String personDetail) {
		this.personId = personId;
		this.personJob = personJob;
		this.personName = personName;
		this.personImage = personImage;
		this.personGender = personGender;
		this.personNation = personNation;
		this.personBirth = personBirth;
		this.personDetail = personDetail;
	}
	public String getPersonId() {
		return personId;
	}
	public void setPersonId(String personId) {
		this.personId = personId;
	}
	public String getPersonJob() {
		return personJob;
	}
	public void setPersonJob(String personJob) {
		this.personJob = personJob;
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
	public String getPersonGender() {
		return personGender;
	}
	public void setPersonGender(String personGender) {
		this.personGender = personGender;
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
	public String getPersonDetail() {
		return personDetail;
	}
	public void setPersonDetail(String personDetail) {
		this.personDetail = personDetail;
	}
	@Override
	public String toString() {
		return "PersonDto [personId=" + personId + ", personJob=" + personJob + ", personName=" + personName
				+ ", personImage=" + personImage + ", personGender=" + personGender + ", personNation=" + personNation
				+ ", personBirth=" + personBirth + ", personDetail=" + personDetail + "]";
	}
}
