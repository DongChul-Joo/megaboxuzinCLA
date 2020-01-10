package com.sp.booking;

public class Booking {
	private int scheduleCode;
	private int showingNum;
	private String showingDate;
	private int showingKind;
	private String starttime;
	private String endTime;
	private String cmName;
	private int cmSeatTot;
	private String branName;
	private String movieNm;
	private String audits;
	
	//seat(예약좌석)
	private String seatNumber;
	private int seatCount;
	// 좌석배치도
	private String cmSeatMap;
	private int bookingSeatTot;
	
	
	
	
	
	
	public int getBookingSeatTot() {
		return bookingSeatTot;
	}
	public void setBookingSeatTot(int bookingSeatTot) {
		this.bookingSeatTot = bookingSeatTot;
	}
	public String getCmSeatMap() {
		return cmSeatMap;
	}
	public void setCmSeatMap(String cmSeatMap) {
		this.cmSeatMap = cmSeatMap;
	}
	public String getSeatNumber() {
		return seatNumber;
	}
	public void setSeatNumber(String seatNumber) {
		this.seatNumber = seatNumber;
	}
	public int getSeatCount() {
		return seatCount;
	}
	public void setSeatCount(int seatCount) {
		this.seatCount = seatCount;
	}
	public int getScheduleCode() {
		return scheduleCode;
	}
	public void setScheduleCode(int scheduleCode) {
		this.scheduleCode = scheduleCode;
	}
	public int getShowingNum() {
		return showingNum;
	}
	public void setShowingNum(int showingNum) {
		this.showingNum = showingNum;
	}
	public String getShowingDate() {
		return showingDate;
	}
	public void setShowingDate(String showingDate) {
		this.showingDate = showingDate;
	}
	public int getShowingKind() {
		return showingKind;
	}
	public void setShowingKind(int showingKind) {
		this.showingKind = showingKind;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getCmName() {
		return cmName;
	}
	public void setCmName(String cmName) {
		this.cmName = cmName;
	}
	public int getCmSeatTot() {
		return cmSeatTot;
	}
	public void setCmSeatTot(int cmSeatTot) {
		this.cmSeatTot = cmSeatTot;
	}
	public String getBranName() {
		return branName;
	}
	public void setBranName(String branName) {
		this.branName = branName;
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

	
}
