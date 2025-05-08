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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
	        // bookingtime À» ºÐ´ÜÀ§·Î º¯È¯ÇØ¼­ ³Ñ°Ü¹ö¸²
	        int bookingmin = Integer.parseInt(bookingtime.substring(0,2)) * 60 + Integer.parseInt(bookingtime.substring(3,5));

	        //»ç¿ëÀÚ°¡ °°Àº½Ã°£ 2½Ã°£ ÀÌ³»·Î Áßº¹¿¹¾à ºÒ°¡ (Áßº¹Ã¼Å©)
	        int userdup = bs.countuserdup(storecode,id,bookingdate,bookingtime,bookingmin);
	        if (userdup>0) {
	        	return "duplicate";
	        }
	        
	        
	        // ÀüÃ¼ ¿¹¾à½Ã°£Áß 2½Ã°£ ¹üÀ§ (ÀÌ¹Ì ´Ù¸¥»ç¿ëÀÚ ¿¹¾à½Ã 2½Ã°£ ³» ¿¹¾àºÒ°¡)
	        int storedup = bs.countstoredup(storecode,bookingdate,bookingtime,bookingmin);
	        if(storedup>0) {
	        	return "time_unavailable";
	        	
	        }
	        
	        
	        bs.insertbook(
	            0, // ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½Úµï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½Ç¹Ç·ï¿½ 0 ï¿½ï¿½ï¿½ï¿½
	            storecode,
	            id,
	            saramsu,
	            "ëŒ€ê¸°", // ï¿½âº» ï¿½ï¿½ï¿½Â°ï¿½ ï¿½ï¿½ï¿½ï¿½
	            bookingdate,
	            bookingtime
	        );
	        result = "success";
	    } catch (Exception e) {
	        e.printStackTrace();
	        result = "error: " + e.getMessage(); // ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ ï¿½Þ½ï¿½ï¿½ï¿½
	    }
	    return result;
	}
}