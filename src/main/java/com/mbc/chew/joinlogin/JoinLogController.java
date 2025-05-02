package com.mbc.chew.joinlogin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class JoinLogController {
	@Autowired
	SqlSession sqlSession;
	
	
	@RequestMapping("/errorpage")
    public String Error() {
        return "errorpage";
    }

	
	@RequestMapping(value = "/joinput")
	public String jj1()
	{
		return "joinput";
	}
	
	@RequestMapping(value = "/joinsave")
	public void jj2(HttpServletRequest request, 
			HttpServletResponse response) throws IOException
	{
		String id= request.getParameter("id");
		String pw= request.getParameter("pw");
		String name= request.getParameter("name");
		String phone= request.getParameter("phone");
		Date birth=Date.valueOf(request.getParameter("birth")) ;
		PasswordEncoder pe = new BCryptPasswordEncoder();
		pw=pe.encode(pw);
		JoinLogService jls = sqlSession.getMapper(JoinLogService.class);
		jls.jlsinsert(id,pw,name,phone,birth);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('회원가입을 환영합니다!');");
		String contextPath = request.getContextPath();
		out.println("location.href='" + contextPath + "/main';");
		out.println("</script>");
		out.close();

		
	}
	
	
	
	@RequestMapping(value = "/loginput")
	public String jj6()
	{
		
		return "loginput";
	}
	
	@RequestMapping(value = "/logsave")
	public String jj7(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		
		JoinLogService jls = sqlSession.getMapper(JoinLogService.class);
		String  cpw = jls.passww(id);
		
		PasswordEncoder pe = new BCryptPasswordEncoder();
		boolean flag = pe.matches(pw, cpw);
		if(flag)
		{
			HttpSession hs = request.getSession();
			hs.setAttribute("loginstate", true);
			hs.setAttribute("id", id);
			return "redirect:/main";
		}
		else
		{
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter pww = response.getWriter();
			pww.print("<script>alert('아이디나 비번이 틀립니다.')</script>");
			pww.print("<script>location.href='loginput'</script>");
			pww.close();
			return "redirect:/loginput";
		}
	
	}
	@RequestMapping(value = "/logout")
	public String log3(HttpServletRequest request) 
	{
		HttpSession hs = request.getSession();
		hs.removeAttribute("loginstate");
		hs.removeAttribute("id");
		return "redirect:/";
	}
	
	//아이디 중복검사
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
