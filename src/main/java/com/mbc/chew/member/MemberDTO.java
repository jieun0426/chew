package com.mbc.chew.member;

import java.sql.Date;
import java.sql.Timestamp; 

public class MemberDTO {

    private String id;          
    private String pw;          
    private String name;        
    private String phone;    
    private Date birth;         
    private Timestamp memberdate;
    private int membercount;
    private String membergrade;
    private String role;
    private String accountstatus;

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

	public Timestamp getMemberdate() {
		return memberdate;
	}

	public void setMemberdate(Timestamp memberdate) {
		this.memberdate = memberdate;
	}

	public int getMembercount() {
		return membercount;
	}

	public void setMembercount(int membercount) {
		this.membercount = membercount;
	}

	public String getMembergrade() {
		return membergrade;
	}

	public void setMembergrade(String membergrade) {
		this.membergrade = membergrade;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getAccountstatus() {
		return accountstatus;
	}

	public void setAccountstatus(String accountstatus) {
		this.accountstatus = accountstatus;
	}

}
