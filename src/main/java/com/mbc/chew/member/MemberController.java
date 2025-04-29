package com.mbc.chew.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/admin")
public class MemberController {
	@Autowired
	SqlSessionTemplate sqls;
	

	@RequestMapping(value="/memberin")
	public String memberin()	{
		return"memberlist";
	}
		@RequestMapping(value = "/members", method = RequestMethod.GET)
		public String memberList(Model m) {
			List<MemberDTO> memberList = sqls.selectList("com.mbc.chew.member.MemberService.findAllMembers");
			m.addAttribute("memberList", memberList);
			return "memberlist";
		}

		@RequestMapping(value = "/memberwithdraw", method = RequestMethod.POST)
		public String withdraw(HttpServletRequest request)
		{
			return "redirect:/memberin";
	}
}




