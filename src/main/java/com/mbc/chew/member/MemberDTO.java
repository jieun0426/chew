package com.mbc.chew.member;

import java.sql.Date;
import java.sql.Timestamp; 

public class MemberDTO {

    private String id;          
    private String pw;          
    private String name;        
    private String phone;    
    private Date birth;         

    public MemberDTO() {
    }

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

	
}
