package com.sp.branchCla;

public class BranchCla {
	private int branCode;
	private String branName;
	private int branZip;
	private String branAddr1;
	private String branAddr2 ;
	
	private int areaCode;
	private int parent;
	private String areaName;
	
	private String imageFilename ;

	
	
	
	public int getBranCode() {
		return branCode;
	}

	public void setBranCode(int branCode) {
		this.branCode = branCode;
	}

	public int getParent() {
		return parent;
	}

	public void setParent(int parent) {
		this.parent = parent;
	}




	public String getBranName() {
		return branName;
	}

	public void setBranName(String branName) {
		this.branName = branName;
	}

	public int getBranZip() {
		return branZip;
	}

	public void setBranZip(int branZip) {
		this.branZip = branZip;
	}

	public String getBranAddr1() {
		return branAddr1;
	}

	public void setBranAddr1(String branAddr1) {
		this.branAddr1 = branAddr1;
	}

	public String getBranAddr2() {
		return branAddr2;
	}

	public void setBranAddr2(String branAddr2) {
		this.branAddr2 = branAddr2;
	}

	public int getAreaCode() {
		return areaCode;
	}

	public void setAreaCode(int areaCode) {
		this.areaCode = areaCode;
	}

	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	public String getImageFilename() {
		return imageFilename;
	}

	public void setImageFilename(String imageFilename) {
		this.imageFilename = imageFilename;
	}
	
}
