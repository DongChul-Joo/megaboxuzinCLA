package com.sp.member;

public class Member {
	private long customerCode;
	private String userId, userName, userPwd, created_date, modify_date, last_login;
	private String email, email1, email2;
	private String tel, tel1, tel2, tel3;
	private String birth;
	private int enabled;
	
	private String authority;

	public long getCustomerCode() {
		return customerCode;
	}

	public void setCustomerCode(long customerCode) {
		this.customerCode = customerCode;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getCreated_date() {
		return created_date;
	}

	public void setCreated_date(String created_date) {
		this.created_date = created_date;
	}

	public String getModify_date() {
		return modify_date;
	}

	public void setModify_date(String modify_date) {
		this.modify_date = modify_date;
	}

	public String getLast_login() {
		return last_login;
	}

	public void setLast_login(String last_login) {
		this.last_login = last_login;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEmail1() {
		return email1;
	}

	public void setEmail1(String email1) {
		this.email1 = email1;
	}

	public String getEmail2() {
		return email2;
	}

	public void setEmail2(String email2) {
		this.email2 = email2;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getTel1() {
		return tel1;
	}

	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}

	public String getTel2() {
		return tel2;
	}

	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}

	public String getTel3() {
		return tel3;
	}

	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	@Override
	public String toString() {
		return "Member [customerCode=" + customerCode + ", userId=" + userId + ", userName=" + userName + ", userPwd="
				+ userPwd + ", created_date=" + created_date + ", modify_date=" + modify_date + ", last_login="
				+ last_login + ", email=" + email + ", email1=" + email1 + ", email2=" + email2 + ", tel=" + tel
				+ ", tel1=" + tel1 + ", tel2=" + tel2 + ", tel3=" + tel3 + ", birth=" + birth + ", enabled=" + enabled
				+ ", authority=" + authority + ", getCustomerCode()=" + getCustomerCode() + ", getUserId()="
				+ getUserId() + ", getUserName()=" + getUserName() + ", getUserPwd()=" + getUserPwd()
				+ ", getCreated_date()=" + getCreated_date() + ", getModify_date()=" + getModify_date()
				+ ", getLast_login()=" + getLast_login() + ", getEmail()=" + getEmail() + ", getEmail1()=" + getEmail1()
				+ ", getEmail2()=" + getEmail2() + ", getTel()=" + getTel() + ", getTel1()=" + getTel1()
				+ ", getTel2()=" + getTel2() + ", getTel3()=" + getTel3() + ", getBirth()=" + getBirth()
				+ ", getEnabled()=" + getEnabled() + ", getAuthority()=" + getAuthority() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
}
