package com.sp.item;

import org.springframework.web.multipart.MultipartFile;

public class Item {
	private int itemCode;
	private String itemName;
	private int itemPrice;
	private String itemOrigin;
	private String itemDetail;
	private String itemImg;
	private String itemPart;
	private MultipartFile upload;
	
	private int bdCode, bdInfo, bdSale, bdCount, bdPrice, bdAmount;
	
	private int buyCode, buyAmount, totalAmount, realAmount;
	private String buyDate, userId;
	
	public int getItemCode() {
		return itemCode;
	}
	public void setItemCode(int itemCode) {
		this.itemCode = itemCode;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public int getItemPrice() {
		return itemPrice;
	}
	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}
	public String getItemOrigin() {
		return itemOrigin;
	}
	public void setItemOrigin(String itemOrigin) {
		this.itemOrigin = itemOrigin;
	}
	public String getItemDetail() {
		return itemDetail;
	}
	public void setItemDetail(String itemDetail) {
		this.itemDetail = itemDetail;
	}
	public String getItemImg() {
		return itemImg;
	}
	public void setItemImg(String itemImg) {
		this.itemImg = itemImg;
	}
	public String getItemPart() {
		return itemPart;
	}
	public void setItemPart(String itemPart) {
		this.itemPart = itemPart;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	
	public int getBdCode() {
		return bdCode;
	}
	public void setBdCode(int bdCode) {
		this.bdCode = bdCode;
	}
	public int getBdInfo() {
		return bdInfo;
	}
	public void setBdInfo(int bdInfo) {
		this.bdInfo = bdInfo;
	}
	public int getBdSale() {
		return bdSale;
	}
	public void setBdSale(int bdSale) {
		this.bdSale = bdSale;
	}
	public int getBdCount() {
		return bdCount;
	}
	public void setBdCount(int bdCount) {
		this.bdCount = bdCount;
	}
	public int getBdPrice() {
		return bdPrice;
	}
	public void setBdPrice(int bdPrice) {
		this.bdPrice = bdPrice;
	}
	public int getBdAmount() {
		return bdAmount;
	}
	public void setBdAmount(int bdAmount) {
		this.bdAmount = bdAmount;
	}
	
	public int getBuyCode() {
		return buyCode;
	}
	public void setBuyCode(int buyCode) {
		this.buyCode = buyCode;
	}
	public int getBuyAmount() {
		return buyAmount;
	}
	public void setBuyAmount(int buyAmount) {
		this.buyAmount = buyAmount;
	}
	public int getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(int totalAmount) {
		this.totalAmount = totalAmount;
	}
	public int getRealAmount() {
		return realAmount;
	}
	public void setRealAmount(int realAmount) {
		this.realAmount = realAmount;
	}
	public String getBuyDate() {
		return buyDate;
	}
	public void setBuyDate(String buyDate) {
		this.buyDate = buyDate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
}