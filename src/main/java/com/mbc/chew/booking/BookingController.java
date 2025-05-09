package com.mbc.chew.booking;

import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BookingController {
	@Autowired
	SqlSession sqls;
	
	@Transactional
	@ResponseBody
	@RequestMapping(value="/bookingsave", method = RequestMethod.POST)
	public String booking(HttpServletRequest request, HttpSession session) {
	    String result = "fail";
	    
	    try {
	        String id = (String) session.getAttribute("id");
	        if (id == null) return "login_required";

	        int storecode = Integer.parseInt(request.getParameter("storecode"));
	        int saramsu = Integer.parseInt(request.getParameter("saramsu"));
	        Date bookingdate = java.sql.Date.valueOf(request.getParameter("bookingdate"));
	        String bookingtime = request.getParameter("bookingtime");

	        BookingService bs = sqls.getMapper(BookingService.class);
	        bs.insertbook(
	            0,
	            storecode,
	            id,
	            saramsu,
	            "대기",
	            bookingdate,
	            bookingtime
	        );
	        result = "success";
	    } catch (Exception e) {
	        e.printStackTrace();
	        result = "error: " + e.getMessage();
	    }
	    return result;
	}
}