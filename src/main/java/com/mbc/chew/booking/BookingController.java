package com.mbc.chew.booking;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class BookingController {
	@Autowired
	SqlSession sqls;
@RequestMapping(value="/bookin")
	public String storein()
	{
		return"bookinput";
	}

@RequestMapping(value="/booksave")
public String storesave(HttpServletRequest request)
{
	int tablenum      = Integer.parseInt(request.getParameter("tablenum"));
	int storecode	  = Integer.parseInt(request.getParameter("storecode"));
	String id		  = request.getParameter("id");
	int saramsu		  = Integer.parseInt(request.getParameter("s"));
	String state	  = request.getParameter("state");
	Date bookingdate  = java.sql.Date.valueOf(request.getParameter("bookingdate"));
	Date bookingtime  = java.sql.Date.valueOf(request.getParameter("bookingtime")); 
	
	BookingService bs = sqls.getMapper(BookingService.class);
	bs.insertbook(tablenum,storecode,id,saramsu,state,bookingdate,bookingtime);
	return"redirect:/";
}
}
