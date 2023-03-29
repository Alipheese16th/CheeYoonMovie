package com.ch.movie.dto;

import java.sql.Timestamp;

public class RatingDto {
	private String userId;
	private String movieId;
	private String ratingContent;
	private int ratingScore;
	private Timestamp ratingDate;
	private String userName;
	private String movieTitle;
	
	
	
	public RatingDto(String userId, String movieId, String ratingContent, int ratingScore, Timestamp ratingDate) {
		this.userId = userId;
		this.movieId = movieId;
		this.ratingContent = ratingContent;
		this.ratingScore = ratingScore;
		this.ratingDate = ratingDate;
	}
	public RatingDto(String userId, String movieId, String ratingContent, int ratingScore, Timestamp ratingDate,
			String userName) {
		this.userId = userId;
		this.movieId = movieId;
		this.ratingContent = ratingContent;
		this.ratingScore = ratingScore;
		this.ratingDate = ratingDate;
		this.userName = userName;
	}
	public RatingDto(String userId, String movieId, String ratingContent, int ratingScore, Timestamp ratingDate,
			String userName, String movieTitle) {
		this.userId = userId;
		this.movieId = movieId;
		this.ratingContent = ratingContent;
		this.ratingScore = ratingScore;
		this.ratingDate = ratingDate;
		this.userName = userName;
		this.movieTitle = movieTitle;
	}

	public String getMovieTitle() {
		return movieTitle;
	}
	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}
	public int getRatingScore() {
		return ratingScore;
	}
	public void setRatingScore(int ratingScore) {
		this.ratingScore = ratingScore;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getMovieId() {
		return movieId;
	}
	public void setMovieId(String movieId) {
		this.movieId = movieId;
	}
	public String getRatingContent() {
		return ratingContent;
	}
	public void setRatingContent(String ratingContent) {
		this.ratingContent = ratingContent;
	}
	public Timestamp getRatingDate() {
		return ratingDate;
	}
	public void setRatingDate(Timestamp ratingDate) {
		this.ratingDate = ratingDate;
	}
	@Override
	public String toString() {
		return "RatingDto [userId=" + userId + ", movieId=" + movieId + ", ratingContent=" + ratingContent
				+ ", ratingScore=" + ratingScore + ", ratingDate=" + ratingDate + ", userName=" + userName
				+ ", movieTitle=" + movieTitle + "]";
	}
	
}
