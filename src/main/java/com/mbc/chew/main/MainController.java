package com.mbc.chew.main;

import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model,HttpServletRequest request) {
		HttpSession hs=request.getSession();
		hs.setAttribute("loginstate", false);
		hs.setAttribute("id", null);
		
		String area;
		if(request.getParameter("area")==null) {
			area="서울";
		}else {
			area=request.getParameter("area");
		}
		
		MainService ms=sqlSession.getMapper(MainService.class);
		ArrayList<MainDTO> list=ms.ranking3();
		ArrayList<MainDTO> list1=ms.show3nostars_area(area);
		
		for(int i=0; i<list1.size(); i++) {
			int storecode=list1.get(i).getStorecode();
			Double stars=ms.avgStar(storecode);
			
			list1.get(i).setStars(stars);
		}

		model.addAttribute("list", list);
		model.addAttribute("area", list1);
		
		return "main";
	}
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String home2(HttpServletRequest request, Model model) {
		
		String area;
		if(request.getParameter("area")==null) {
			area="서울";
		}else {
			area=request.getParameter("area");
		}
		
		MainService ms=sqlSession.getMapper(MainService.class);
		ArrayList<MainDTO> list=ms.ranking3();
		ArrayList<MainDTO> list1=ms.show3nostars_area(area);
		
		for(int i=0; i<list1.size(); i++) {
			int storecode=list1.get(i).getStorecode();
			Double stars=ms.avgStar(storecode);
			
			list1.get(i).setStars(stars);
		}

		model.addAttribute("list", list);
		model.addAttribute("area", list1);
		
		return "main";
	}
	
	@RequestMapping(value="/mainSelectType")
	public String ajax(String area, Model model) {
		MainService ms=sqlSession.getMapper(MainService.class);
		ArrayList<MainDTO> list=ms.show3nostars_area(area);
		
		for(int i=0; i<list.size(); i++) {
			int storecode=list.get(i).getStorecode();
			Double stars=ms.avgStar(storecode);
			
			list.get(i).setStars(stars);
		}
	
		model.addAttribute("area", list);
		
		return "main/mainStoreList";
	}
}
