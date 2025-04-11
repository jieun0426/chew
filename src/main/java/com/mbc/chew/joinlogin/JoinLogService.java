package com.mbc.chew.joinlogin;

import java.sql.Date;

public interface JoinLogService {

	void jlsinsert(String id, String pw, String name, String phone, Date birth);


	String passww(String id);


	int idcount22(String id);


}
