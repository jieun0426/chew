package com.mbc.chew.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	@Autowired
	SqlSession sqls;

	@RequestMapping(value="/memberin")
	public String memberin()
	{
		return"memberlist";
	}
	
	




}
