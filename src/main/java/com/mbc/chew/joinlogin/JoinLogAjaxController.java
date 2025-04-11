package com.mbc.chew.joinlogin;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class JoinLogAjaxController {
	@Autowired
	SqlSession sqlSession;
	
	@ResponseBody
	@RequestMapping(value = "/logcheck",method = RequestMethod.POST )
	public String ajaxx1(String id)
	{
		JoinLogService jls =sqlSession.getMapper(JoinLogService.class);
		int count = jls.idcount22(id);
		String bigo =(count==1)?"no":"ok";
		
		return bigo;
	}
}
