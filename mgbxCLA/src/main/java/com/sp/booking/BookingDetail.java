package com.sp.booking;

public class BookingDetail {
	private int bookDetailCode;
	private String ticketInfo;
	private String ageInfo;
	private int clientNumber;
	private int discountPrice;
	private int originalPrice;
	private int finalPrice;
	
	private int bookCode;
	
	public int getBookCode() {
		return bookCode;
	}
	public void setBookCode(int bookCode) {
		this.bookCode = bookCode;
	}
	public int getBookDetailCode() {
		return bookDetailCode;
	}
	public void setBookDetailCode(int bookDetailCode) {
		this.bookDetailCode = bookDetailCode;
	}
	public String getTicketInfo() {
		return ticketInfo;
	}
	public void setTicketInfo(String tiketInfo) {
		this.ticketInfo = tiketInfo;
	}
	public String getAgeInfo() {
		return ageInfo;
	}
	public void setAgeInfo(String ageInfo) {
		this.ageInfo = ageInfo;
	}
	public int getClientNumber() {
		return clientNumber;
	}
	public void setClientNumber(int clientNumber) {
		this.clientNumber = clientNumber;
	}
	public int getDiscountPrice() {
		return discountPrice;
	}
	public void setDiscountPrice(int discountPrice) {
		this.discountPrice = discountPrice;
	}
	public int getOriginalPrice() {
		return originalPrice;
	}
	public void setOriginalPrice(int originalPrice) {
		this.originalPrice = originalPrice;
	}
	public int getFinalPrice() {
		return finalPrice;
	}
	public void setFinalPrice(int finalPrice) {
		this.finalPrice = finalPrice;
	}
	
	
}
