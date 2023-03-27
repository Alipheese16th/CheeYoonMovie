package com.ch.movie.dto;

public class TrailerDto {
	private String movieId;
	private String trailerName;
	private String trailerUrl;
	private String movieTitle;
	
	public TrailerDto(String movieId, String trailerName, String trailerUrl, String movieTitle) {
		super();
		this.movieId = movieId;
		this.trailerName = trailerName;
		this.trailerUrl = trailerUrl;
		this.movieTitle = movieTitle;
	}
	
	public String getMovieTitle() {
		return movieTitle;
	}

	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}

	public String getMovieId() {
		return movieId;
	}
	public void setMovieId(String movieId) {
		this.movieId = movieId;
	}
	public String getTrailerName() {
		return trailerName;
	}
	public void setTrailerName(String trailerName) {
		this.trailerName = trailerName;
	}
	public String getTrailerUrl() {
		return trailerUrl;
	}
	public void setTrailerUrl(String trailerUrl) {
		this.trailerUrl = trailerUrl;
	}

	@Override
	public String toString() {
		return "TrailerDto [movieId=" + movieId + ", trailerName=" + trailerName + ", trailerUrl=" + trailerUrl
				+ ", movieTitle=" + movieTitle + "]";
	}
	
}
