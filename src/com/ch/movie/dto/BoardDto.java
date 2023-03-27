package com.ch.movie.dto;

import java.sql.Timestamp;

public class BoardDto {
	private int boardNo;
	private String userId;
	private String boardTitle;
	private String boardContent;
	private int boardHit;
	private Timestamp boardDate;
	private Timestamp boardUpdate;
	private int boardGroup;
	private int boardStep;
	private int boardIndent;
	private String boardIp;
	private int commentCnt;
	private String userName;
	
	public BoardDto(int boardNo, String userId, String boardTitle, String boardContent, int boardHit,
			Timestamp boardDate, Timestamp boardUpdate, int boardGroup, int boardStep, int boardIndent, String boardIp,
			int commentCnt, String userName) {
		super();
		this.boardNo = boardNo;
		this.userId = userId;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardHit = boardHit;
		this.boardDate = boardDate;
		this.boardUpdate = boardUpdate;
		this.boardGroup = boardGroup;
		this.boardStep = boardStep;
		this.boardIndent = boardIndent;
		this.boardIp = boardIp;
		this.commentCnt = commentCnt;
		this.userName = userName;
	}
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getCommentCnt() {
		return commentCnt;
	}
	public void setCommentCnt(int commentCnt) {
		this.commentCnt = commentCnt;
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
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public int getBoardHit() {
		return boardHit;
	}
	public void setBoardHit(int boardHit) {
		this.boardHit = boardHit;
	}
	public Timestamp getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(Timestamp boardDate) {
		this.boardDate = boardDate;
	}
	public Timestamp getBoardUpdate() {
		return boardUpdate;
	}
	public void setBoardUpdate(Timestamp boardUpdate) {
		this.boardUpdate = boardUpdate;
	}
	public int getBoardGroup() {
		return boardGroup;
	}
	public void setBoardGroup(int boardGroup) {
		this.boardGroup = boardGroup;
	}
	public int getBoardStep() {
		return boardStep;
	}
	public void setBoardStep(int boardStep) {
		this.boardStep = boardStep;
	}
	public int getBoardIndent() {
		return boardIndent;
	}
	public void setBoardIndent(int boardIndent) {
		this.boardIndent = boardIndent;
	}
	public String getBoardIp() {
		return boardIp;
	}
	public void setBoardIp(String boardIp) {
		this.boardIp = boardIp;
	}

	@Override
	public String toString() {
		return "BoardDto [boardNo=" + boardNo + ", userId=" + userId + ", boardTitle=" + boardTitle + ", boardContent="
				+ boardContent + ", boardHit=" + boardHit + ", boardDate=" + boardDate + ", boardUpdate=" + boardUpdate
				+ ", boardGroup=" + boardGroup + ", boardStep=" + boardStep + ", boardIndent=" + boardIndent
				+ ", boardIp=" + boardIp + ", commentCnt=" + commentCnt + ", userName=" + userName + "]";
	}

}
