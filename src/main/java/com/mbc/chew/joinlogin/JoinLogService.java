package com.mbc.chew.joinlogin;

import java.sql.Date;

import org.apache.ibatis.annotations.Param;

public interface JoinLogService {

	void jlsinsert(String id, String pw, String name, String phone, Date birth);


	String passww(String id);


	int idcount22(String id);


	String findidid(String name, String phone);


	String findpwpw(String id, String name);


	int updatePassword(String id, String encodepw);


	 

	


}
