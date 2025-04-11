package com.mbc.chew.review;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class ReviewController {
	@Autowired
	SqlSession sqls;
	String path="C:\\git\\chew\\src\\main\\webapp\\image";
	@RequestMapping(value="/reviewin")
	public String reviewin()
	{
		return"reviewinput";
	}
	
	public String reviewsave(HttpServletRequest request)
	{
		int tablenum  	 = Integer.parseInt(request.getParameter("tablenum"));
		int storecode 	 = Integer.parseInt(request.getParameter("storecode"));
		String id 	     = request.getParameter("id");
		int saramsu 	 = Integer.parseInt(request.getParameter("saramsu"));
		String state 	 = request.getParameter("state");
		Date bookingdate = Date.valueOf(request.getParameter("bookingdate"));
		Date bookingtime = Date.valueOf(request.getParameter("bookingtime"));
		ReviewService rs = sqls.getMapper(ReviewService.class);
		rs.insertreview(tablenum,storecode,id,saramsu,state,bookingdate,bookingtime);
		return "redirect:/";
	}
}
