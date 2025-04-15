package com.mbc.chew.detail;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class DetailController {

	@RequestMapping(value = "/detailmain")
	public String dd1() {
		
		return "detailmain";
	}
	
	
	
	@RequestMapping(value = "/detail")
	public String dd2() {
		
		return "detailview";
	}
	
	
	
}
