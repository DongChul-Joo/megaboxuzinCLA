package com.sp.movie;

public class Movie {
	private String state;
	private int listNum;
	private int movieCode;
	private String movieNm;
	private String audits;
	private String thumbNail;
	private String movieStory;
	private String openDate;
	private String startDate;
	private String endDate;
	
	
	//영화 평점 테이블
	private long movieScores; 
	private long totalScores;
	//출연진 테이블
	private String director;
	private String actorName;
	
	//영화 상세게시판 댓글
	private int countUserId;
	private String userId;
	private String content;
	private String created;
	
	//영화 상세게시판 댓글 좋아요
	private int likeCount;
	private String likeUserId;
	
	//댓글 신고
	private String reportUserId;

	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getStartDate() {
		return startDate;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getOpenDate() {
		return openDate;
	}

	public void setOpenDate(String openDate) {
		this.openDate = openDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public int getListNum() {
		return listNum;
	}

	public void setListNum(int listNum) {
		this.listNum = listNum;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public int getMovieCode() {
		return movieCode;
	}

	public void setMovieCode(int movieCode) {
		this.movieCode = movieCode;
	}

	public String getMovieNm() {
		return movieNm;
	}

	public void setMovieNm(String movieNm) {
		this.movieNm = movieNm;
	}

	public String getAudits() {
		return audits;
	}

	public void setAudits(String audits) {
		this.audits = audits;
	}

	public String getThumbNail() {
		return thumbNail;
	}

	public void setThumbNail(String thumbNail) {
		this.thumbNail = thumbNail;
	}

	public String getMovieStory() {
		return movieStory;
	}

	public void setMovieStory(String movieStory) {
		this.movieStory = movieStory;
	}

	public long getMovieScores() {
		return movieScores;
	}


	public int getCountUserId() {
		return countUserId;
	}

	public void setCountUserId(int countUserId) {
		this.countUserId = countUserId;
	}

	public void setMovieScores(long movieScores) {
		this.movieScores = movieScores;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getActorName() {
		return actorName;
	}

	public void setActorName(String actorName) {
		this.actorName = actorName;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCreated() {
		return created;
	}

	public void setCreated(String created) {
		this.created = created;
	}

	public String getLikeUserId() {
		return likeUserId;
	}

	public void setLikeUserId(String likeUserId) {
		this.likeUserId = likeUserId;
	}

	public String getReportUserId() {
		return reportUserId;
	}

	public void setReportUserId(String reportUserId) {
		this.reportUserId = reportUserId;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public long getTotalScores() {
		return totalScores;
	}

	public void setTotalScores(long totalScores) {
		this.totalScores = totalScores;
	}

	
	
	
}
