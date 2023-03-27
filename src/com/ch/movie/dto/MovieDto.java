package com.ch.movie.dto;

import java.sql.Date;
import java.util.ArrayList;

public class MovieDto {
	private String movieId;
	private String originalTitle;
	private String movieTitle;
	private String movieSummary;
	private int movieRunning;
	private String movieImage;
	private Date movieDate;
	private String movieGrade;
	private int movieAudience;
	private int state;
	private double avgScore;
	private ArrayList<String> tagList;
	private ArrayList<PersonDto> personList;
	private ArrayList<TrailerDto> trailerList;
	
	public MovieDto(String movieId, String originalTitle, String movieTitle, String movieSummary, int movieRunning,
			String movieImage, Date movieDate, String movieGrade, int movieAudience, int state, double avgScore,
			ArrayList<String> tagList, ArrayList<PersonDto> personList, ArrayList<TrailerDto> trailerList) {
		super();
		this.movieId = movieId;
		this.originalTitle = originalTitle;
		this.movieTitle = movieTitle;
		this.movieSummary = movieSummary;
		this.movieRunning = movieRunning;
		this.movieImage = movieImage;
		this.movieDate = movieDate;
		this.movieGrade = movieGrade;
		this.movieAudience = movieAudience;
		this.state = state;
		this.avgScore = avgScore;
		this.tagList = tagList;
		this.personList = personList;
		this.trailerList = trailerList;
	}

	public String getOriginalTitle() {
		return originalTitle;
	}

	public void setOriginalTitle(String originalTitle) {
		this.originalTitle = originalTitle;
	}

	public String getMovieTitle() {
		return movieTitle;
	}

	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}

	public ArrayList<TrailerDto> getTrailerList() {
		return trailerList;
	}

	public void setTrailerList(ArrayList<TrailerDto> trailerList) {
		this.trailerList = trailerList;
	}

	public ArrayList<String> getTagList() {
		return tagList;
	}

	public void setTagList(ArrayList<String> tagList) {
		this.tagList = tagList;
	}

	public ArrayList<PersonDto> getPersonList() {
		return personList;
	}

	public void setPersonList(ArrayList<PersonDto> personList) {
		this.personList = personList;
	}

	public double getAvgScore() {
		return avgScore;
	}

	public void setAvgScore(double avgScore) {
		this.avgScore = avgScore;
	}

	public String getMovieId() {
		return movieId;
	}

	public void setMovieId(String movieId) {
		this.movieId = movieId;
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
		return "MovieDto [movieId=" + movieId + ", originalTitle=" + originalTitle + ", movieTitle=" + movieTitle
				+ ", movieSummary=" + movieSummary + ", movieRunning=" + movieRunning + ", movieImage=" + movieImage
				+ ", movieDate=" + movieDate + ", movieGrade=" + movieGrade + ", movieAudience=" + movieAudience
				+ ", state=" + state + ", avgScore=" + avgScore + ", tagList=" + tagList + ", personList=" + personList
				+ ", trailerList=" + trailerList + "]";
	}
	
}
