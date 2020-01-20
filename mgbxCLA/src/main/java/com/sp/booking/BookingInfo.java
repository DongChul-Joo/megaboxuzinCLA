package com.sp.booking;

import java.util.List;

public class BookingInfo {
	private int bookCode;
	private String bookDate;
	private int bookCount;
	private int realPrice;
	private int scheduleCode;
	
	private int customerCode;
	
	private int memberShip;
	
	private int SeatCode;
	private String [] seatNumber;
	
	
	private List<BookingDetail> pdList=null;
	
	private int moviePayCode ;
	private String payKind ;
	private int totalPrice ;
	private String payInfo ;
	
	
	
	public int getMemberShip() {
		return memberShip;
	}
	public void setMemberShip(int memberShip) {
		this.memberShip = memberShip;
	}
	public String[] getSeatNumber() {
		return seatNumber;
	}
	public void setSeatNumber(String[] seatNumber) {
		this.seatNumber = seatNumber;
	}
	public List<BookingDetail> getPdList() {
		return pdList;
	}
	public void setPdList(List<BookingDetail> pdList) {
		this.pdList = pdList;
	}
	public int getBookCode() {
		return bookCode;
	}
	public void setBookCode(int bookCode) {
		this.bookCode = bookCode;
	}
	public String getBookDate() {
		return bookDate;
	}
	public void setBookDate(String bookDate) {
		this.bookDate = bookDate;
	}
	public int getBookCount() {
		return bookCount;
	}
	public void setBookCount(int bookCount) {
		this.bookCount = bookCount;
	}
	public int getRealPrice() {
		return realPrice;
	}
	public void setRealPrice(int realPrice) {
		this.realPrice = realPrice;
	}
	public int getScheduleCode() {
		return scheduleCode;
	}
	public void setScheduleCode(int scheduleCode) {
		this.scheduleCode = scheduleCode;
	}
	public int getCustomerCode() {
		return customerCode;
	}
	public void setCustomerCode(int customerCode) {
		this.customerCode = customerCode;
	}

	public int getSeatCode() {
		return SeatCode;
	}
	public void setSeatCode(int seatCode) {
		SeatCode = seatCode;
	}

	public int getMoviePayCode() {
		return moviePayCode;
	}
	public void setMoviePayCode(int moviePayCode) {
		this.moviePayCode = moviePayCode;
	}
	public String getPayKind() {
		return payKind;
	}
	public void setPayKind(String payKind) {
		this.payKind = payKind;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getPayInfo() {
		return payInfo;
	}
	public void setPayInfo(String payInfo) {
		this.payInfo = payInfo;
	}
	
	
	
}
