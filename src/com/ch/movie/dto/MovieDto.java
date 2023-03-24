package com.ch.movie.dto;

import java.sql.Date;

public class MovieDto {
	private String movieId;
	private String movieName;
	private String movieSummary;
	private int movieRunning;
	private String movieImage;
	private Date movieDate;
	private String movieGrade;
	private int movieAudience;
	private int state;
	private int avgScore;

	

	public MovieDto(String movieId, String movieName, String movieSummary, int movieRunning, String movieImage,
			Date movieDate, String movieGrade, int movieAudience, int state, int avgScore) {
		super();
		this.movieId = movieId;
		this.movieName = movieName;
		this.movieSummary = movieSummary;
		this.movieRunning = movieRunning;
		this.movieImage = movieImage;
		this.movieDate = movieDate;
		this.movieGrade = movieGrade;
		this.movieAudience = movieAudience;
		this.state = state;
		this.avgScore = avgScore;
	}

	

	public int getAvgScore() {
		return avgScore;
	}

	public void setAvgScore(int avgScore) {
		this.avgScore = avgScore;
	}

	public String getMovieId() {
		return movieId;
	}

	public void setMovieId(String movieId) {
		this.movieId = movieId;
	}

	public String getMovieName() {
		return movieName;
	}

	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}

	public String getMovieSummary() {
		return movieSummary;
	}

	public void setMovieSummary(String movieSummary) {
		this.movieSummary = movieSummary;
	}

	public int getMovieRunning() {
		return movieRunning;
	}

	public void setMovieRunning(int movieRunning) {
		this.movieRunning = movieRunning;
	}

	public String getMovieImage() {
		return movieImage;
	}

	public void setMovieImage(String movieImage) {
		this.movieImage = movieImage;
	}

	public Date getMovieDate() {
		return movieDate;
	}

	public void setMovieDate(Date movieDate) {
		this.movieDate = movieDate;
	}

	public String getMovieGrade() {
		return movieGrade;
	}

	public void setMovieGrade(String movieGrade) {
		this.movieGrade = movieGrade;
	}

	public int getMovieAudience() {
		return movieAudience;
	}

	public void setMovieAudience(int movieAudience) {
		this.movieAudience = movieAudience;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}



	@Override
	public String toString() {
		return "MovieDto [movieId=" + movieId + ", movieName=" + movieName + ", movieSummary=" + movieSummary
				+ ", movieRunning=" + movieRunning + ", movieImage=" + movieImage + ", movieDate=" + movieDate
				+ ", movieGrade=" + movieGrade + ", movieAudience=" + movieAudience + ", state=" + state + ", avgScore="
				+ avgScore + "]";
	}



}
