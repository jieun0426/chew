package com.mbc.chew.joinlogin;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class JoinLogFindController {
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "login_Idfind", method = RequestMethod.GET)
	public String loginFindPage() {
	    return "login_Idfind";  
	}
	
	@RequestMapping(value = "login_Pwfind", method = RequestMethod.GET)
	public String loginpwFindPage() {
	    return "login_Pwfind";  
	}
	
	@RequestMapping(value = "findIdCheck", method = RequestMethod.POST)
	public String searchId(HttpServletRequest request, Model mo, JoinLogDTO dto) {
	    try {
	        String name = dto.getName();
	        String phone = dto.getPhone();
	        JoinLogService jls = sqlSession.getMapper(JoinLogService.class);
	        String id = jls.findidid(name, phone); 
	        mo.addAttribute("findId", id);
	    } catch (Exception e) {
	        mo.addAttribute("msg", "오류가 발생했습니다.");
	        e.printStackTrace();
	    }
	    return "findIdresult";
	}
	@RequestMapping(value = "findPwCheck", method = RequestMethod.POST)
	public String searchPw(HttpServletRequest request, Model mo, JoinLogDTO dto) {
	    try {
	    	String id = dto.getId();
	        String name = dto.getName();
	        JoinLogService jls = sqlSession.getMapper(JoinLogService.class);
	        String pw = jls.findpwpw(id, name); 
	        mo.addAttribute("findPw", pw);
	        mo.addAttribute("id", id);
	    } catch (Exception e) {
	        mo.addAttribute("msg", "오류가 발생했습니다.");
	        e.printStackTrace();
	    }
	    return "findPwresult";
	}
	@RequestMapping(value = "updatepw", method = RequestMethod.POST)
	public String updatePassword(HttpServletRequest request, Model mo) {
	    String id = request.getParameter("id");
	    String newpw = request.getParameter("newpw");
	    String confirm = request.getParameter("newpwconfirm");
	    


	    if (newpw == null || !newpw.equals(confirm)) {
	        mo.addAttribute("id", id);  
	        mo.addAttribute("findPw", "notnull"); 
	        return "findPwresult";
	    }

	    try {
	        JoinLogService jls = sqlSession.getMapper(JoinLogService.class);
	        PasswordEncoder pe = new BCryptPasswordEncoder();
		    String encodepw = pe.encode(newpw);  
	        int result = jls.updatePassword(id, encodepw);
	        if (result > 0) {
	            mo.addAttribute("msg", "비밀번호가 성공적으로 변경되었습니다.");
	        } 
	    } catch (Exception e) {
	        mo.addAttribute("msg", "오류가 발생했습니다.");
	        e.printStackTrace();
	    }

	    return "loginput";
	}

}
