package com.mbc.chew.mypage;


import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mbc.chew.joinlogin.JoinLogDTO;



@Controller
public class MyPageController {
	
	@Autowired
	SqlSession sqlSession;
	
	
	@RequestMapping(value = "/mypagePwcheck")
	public String personalpwcheck(HttpServletRequest request) {
	    HttpSession session = request.getSession();
	    Boolean loginstate = (Boolean) session.getAttribute("loginstate");

	    if (loginstate == null || !loginstate) {
	        session.setAttribute("alertMessage", "로그인 후 이용 가능합니다.");
	        return "redirect:/loginput";
	    }

	    return "mypagePwcheck";
	}
	
	@RequestMapping(value = "/mypagepwchecking", method = RequestMethod.POST)
	public String personalpwchecking(HttpServletRequest request, Model mo) {
	    HttpSession session = request.getSession();
	    String id = (String) session.getAttribute("id"); 
	    String pw = request.getParameter("pw");

	    // DB에서 해당 ID의 사용자 정보 조회
	    MyPageService ms = sqlSession.getMapper(MyPageService.class);
	    JoinLogDTO dto = ms.getUserById(id);

	    

	    // 비밀번호 비교
	    PasswordEncoder pe = new BCryptPasswordEncoder();
	    boolean flag = pe.matches(pw, dto.getPw());

	    if (flag) {
	        session.setAttribute("loginstate", true); // 로그인 유지
	        mo.addAttribute("dto", dto);
	        return "mypinfo"; // 마이페이지 정보로 이동
	    } else {
	        request.setAttribute("alertMessage", "비밀번호가 틀립니다.");
	        return "mypagePwcheck";
	    }
	}
	
	
	
	@RequestMapping(value = "/mypinfo")
	public String myinfomodify(HttpServletRequest request, Model mo) {
		String id=request.getParameter("id");
		MyPageService ms = sqlSession.getMapper(MyPageService.class);
		JoinLogDTO dto = ms.mymodify0423(id);
		mo.addAttribute("dto", dto);
	    return "mypinfo";
	}
	
	
	
	@RequestMapping(value = "/myinfosave", method = RequestMethod.POST)
	public String updateUserInfo(HttpServletRequest request) {
	    String id = request.getParameter("id");
	    String name = request.getParameter("name");
	    String phone = request.getParameter("phone");
	    Date birth =Date.valueOf(request.getParameter("birth")) ;

	   

	    MyPageService ms = sqlSession.getMapper(MyPageService.class);
	    ms.mymodify042322(name, phone, birth, id);

	    return "redirect:/";
	}

	@RequestMapping(value = "/myinforeview")
	public String myinforevieww(HttpServletRequest request) {
	    

	    return "myinforeview";
	}
	
	
	}
