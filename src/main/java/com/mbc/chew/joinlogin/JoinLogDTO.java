package com.mbc.chew.joinlogin;

import java.sql.Date;

public class JoinLogDTO {
	
	String id,pw,name,phone,newpw,newpwconfirm;
	Date birth;
	
	public JoinLogDTO() {}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getNewpw() {
		return newpw;
	}

	public void setNewpw(String newpw) {
		this.newpw = newpw;
	}

	public String getNewpwconfirm() {
		return newpwconfirm;
	}

	public void setNewpwconfirm(String newpwconfirm) {
		this.newpwconfirm = newpwconfirm;
	}
	
	
}
