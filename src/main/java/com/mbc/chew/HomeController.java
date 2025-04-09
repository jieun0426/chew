package com.mbc.chew;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HomeController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model,HttpServletRequest request) {
		HttpSession hs=request.getSession();
		hs.setAttribute("loginstate", false);
		
		return "main";
	}
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String home2(Locale locale, Model model) {
		return "main";
	}
	
}
