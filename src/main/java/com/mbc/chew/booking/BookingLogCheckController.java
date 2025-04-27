package com.mbc.chew.booking;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BookingLogCheckController {
	 
	     
	    @RequestMapping("/logincheck")
	    @ResponseBody
	    public String logincheck(HttpServletRequest request) {
	        HttpSession session = request.getSession(false);
	        if (session != null && session.getAttribute("id") != null) {
	            return "ok";
	        } else {
	            return "no";
	        }
	    }
	}