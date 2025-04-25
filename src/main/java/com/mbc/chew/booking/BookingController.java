package com.mbc.chew.booking;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class BookingController {
	@Autowired
	SqlSession sqls;
	
@Transactional
@ResponseBody
@RequestMapping(value="/bookingsave")
public String booking(HttpServletRequest request,HttpSession hs)
{
	String result = "fail";
	
try {
	   HttpSession session = request.getSession(false);
       String id = (session != null) ? (String) session.getAttribute("id"):"test_user";
		int tablenum        = Integer.parseInt(request.getParameter("tablenum"));
		int storecode	    = Integer.parseInt(request.getParameter("storecode"));
		int saramsu		    = Integer.parseInt(request.getParameter("s"));
		String state	    = request.getParameter("state");
		Date bookingdate    = java.sql.Date.valueOf(request.getParameter("bookingdate"));
		String bookingtime  = request.getParameter("bookingtime"); 
		
		BookingService bs = sqls.getMapper(BookingService.class);
		bs.insertbook(tablenum,storecode,id,saramsu,state,bookingdate,bookingtime);
		result ="success";
}catch (Exception e) {
	e.printStackTrace();
	 System.err.println("오류발생:" + e.getMessage()); 
		}	
		return result;
}
}
