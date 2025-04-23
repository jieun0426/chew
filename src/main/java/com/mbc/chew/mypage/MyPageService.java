package com.mbc.chew.mypage;


import java.sql.Date;

import com.mbc.chew.joinlogin.JoinLogDTO;

public interface MyPageService {


	JoinLogDTO getUserById(String id);

	JoinLogDTO mymodify0423(String id);

	void mymodify042322(String name, String phone, Date birth, String id);




}
