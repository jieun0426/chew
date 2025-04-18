package com.mbc.chew.detail;



import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mbc.chew.review.ReviewDTO;
import com.mbc.chew.review.ReviewService;






@Controller
public class DetailController {
	
	@Autowired
	SqlSession sqlSession;

	
	@RequestMapping(value = "/detailmain")
	public String dd1(Model model) {
		DetailService ds = sqlSession.getMapper(DetailService.class);
		ArrayList<DetailDTO>list=ds.resout();
		model.addAttribute("list",list);
		
		return "detailmain"; 
	}
	
	@RequestMapping(value ="/detailview")
	public String dd2(HttpServletRequest request,Model model) {
		String code=request.getParameter("storecode");
		DetailService ds = sqlSession.getMapper(DetailService.class);
		DetailDTO ddto =ds.dout1(code);
		model.addAttribute("ddto",ddto);
		
		ReviewService rs = sqlSession.getMapper(ReviewService.class);
	    ArrayList<ReviewDTO> list = rs.reviewout(Integer.parseInt(code));
	    model.addAttribute("list", list); // 
		
		return "detailview";
	}
	
	
	
	
}
