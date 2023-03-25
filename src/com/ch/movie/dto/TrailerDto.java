package com.ch.movie.dto;

public class TrailerDto {
	private String movieId;
	private String trailerName;
	private String trailerUrl;
	public TrailerDto(String movieId, String trailerName, String trailerUrl) {
		super();
		this.movieId = movieId;
		this.trailerName = trailerName;
		this.trailerUrl = trailerUrl;
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
		return "TrailerDto [movieId=" + movieId + ", trailerName=" + trailerName + ", trailerUrl=" + trailerUrl + "]";
	}
	
}
