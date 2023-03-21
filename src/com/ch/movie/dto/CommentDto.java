package com.ch.movie.dto;

import java.sql.Timestamp;

public class CommentDto {
	private int commentNo;
	private int boardNo;
	private String userId;
	private String commentContent;
	private Timestamp commentDate;
	
	public CommentDto(int commentNo, int boardNo, String userId, String commentContent, Timestamp commentDate) {
		this.commentNo = commentNo;
		this.boardNo = boardNo;
		this.userId = userId;
		this.commentContent = commentContent;
		this.commentDate = commentDate;
	}
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public Timestamp getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(Timestamp commentDate) {
		this.commentDate = commentDate;
	}
	@Override
	public String toString() {
		return "CommentDto [commentNo=" + commentNo + ", boardNo=" + boardNo + ", userId=" + userId
				+ ", commentContent=" + commentContent + ", commentDate=" + commentDate + "]";
	}
}
