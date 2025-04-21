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
        HttpSession hs = request.getSession(false);
        Boolean loginstate = (hs != null) ? (Boolean) hs.getAttribute("loginstate") : null;
        if (loginstate != null && loginstate) {
            return "ok";
        } 
        else {
	        return "no";
	         }
	    }
}
