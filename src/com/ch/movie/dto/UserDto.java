package com.ch.movie.dto;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;

public class UserDto {
	private String userId;
	private String userPw;
	private String userName;
	private Date userBirth;
	private String userGender;
	private String userEmail;
	private String userTel;
	private Timestamp userDate;
	private Timestamp userLimit;
	private ArrayList<BoardDto> boardList;
	private ArrayList<CommentDto> commentList;
	private ArrayList<RatingDto> ratingList;
	
	
	public UserDto(String userId, String userPw, String userName, Date userBirth, String userGender, String userEmail,
			String userTel, Timestamp userDate, Timestamp userLimit, ArrayList<BoardDto> boardList,
			ArrayList<CommentDto> commentList, ArrayList<RatingDto> ratingList) {
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userBirth = userBirth;
		this.userGender = userGender;
		this.userEmail = userEmail;
		this.userTel = userTel;
		this.userDate = userDate;
		this.userLimit = userLimit;
		this.boardList = boardList;
		this.commentList = commentList;
		this.ratingList = ratingList;
	}

	public UserDto(String userId, String userPw, String userName, Date userBirth, String userGender, String userEmail,
			String userTel, Timestamp userDate, Timestamp userLimit) {
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userBirth = userBirth;
		this.userGender = userGender;
		this.userEmail = userEmail;
		this.userTel = userTel;
		this.userDate = userDate;
		this.userLimit = userLimit;
	}

	
	public ArrayList<BoardDto> getBoardList() {
		return boardList;
	}
	public void setBoardList(ArrayList<BoardDto> boardList) {
		this.boardList = boardList;
	}
	public ArrayList<CommentDto> getCommentList() {
		return commentList;
	}
	public void setCommentList(ArrayList<CommentDto> commentList) {
		this.commentList = commentList;
	}
	public ArrayList<RatingDto> getRatingList() {
		return ratingList;
	}
	public void setRatingList(ArrayList<RatingDto> ratingList) {
		this.ratingList = ratingList;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Date getUserBirth() {
		return userBirth;
	}

	public void setUserBirth(Date userBirth) {
		this.userBirth = userBirth;
	}

	public String getUserGender() {
		return userGender;
	}

	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserTel() {
		return userTel;
	}

	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}

	public Timestamp getUserDate() {
		return userDate;
	}

	public void setUserDate(Timestamp userDate) {
		this.userDate = userDate;
	}

	public Timestamp getUserLimit() {
		return userLimit;
	}

	public void setUserLimit(Timestamp userLimit) {
		this.userLimit = userLimit;
	}

	@Override
	public String toString() {
		return "UserDto [userId=" + userId + ", userPw=" + userPw + ", userName=" + userName + ", userBirth="
				+ userBirth + ", userGender=" + userGender + ", userEmail=" + userEmail + ", userTel=" + userTel
				+ ", userDate=" + userDate + ", userLimit=" + userLimit + ", boardList=" + boardList + ", commentList="
				+ commentList + ", ratingList=" + ratingList + "]";
	}

	
}
