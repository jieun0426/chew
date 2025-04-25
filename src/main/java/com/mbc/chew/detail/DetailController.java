package com.mbc.chew.detail;



import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mbc.chew.review.ReviewDTO;
import com.mbc.chew.review.ReviewService;




@Controller
public class DetailController {
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/detailmain")
	public String dd1(HttpServletRequest request,Model model) {
		int nowPage;
		try {
			nowPage=Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			nowPage=1;
		}
		int cntPerPage=6; //한 페이지에 나타낼 레코드 수
		DetailService ds = sqlSession.getMapper(DetailService.class);
		int total=ds.countAllRecords();
		PageDTO pdto = new PageDTO(total, nowPage, cntPerPage);
		ArrayList<DetailDTO> plist= ds.paging(pdto.getStart(), pdto.getEnd());
		
		model.addAttribute("list", plist);
		model.addAttribute("pdto", pdto);

//		ArrayList<DetailDTO>list=ds.resout();
//		model.addAttribute("list",list);
		
		return "detailmain";
	}
	
	@RequestMapping(value ="/detailview")
	public String dd2(HttpServletRequest request,Model model) {
		String code=request.getParameter("storecode"); 
		DetailService ds = sqlSession.getMapper(DetailService.class);
		DetailDTO ddto =ds.dout1(code);
		model.addAttribute("ddto",ddto);

		ReviewService rs = sqlSession.getMapper(ReviewService.class);

	  Double avgStars = rs.getAverageStars(Integer.parseInt(code));
		model.addAttribute("avgStars", avgStars);
		
		ImageService is = sqlSession.getMapper(ImageService.class);
		ArrayList<ImageDTO> imagelist = is.getImage(Integer.parseInt(code));
		model.addAttribute("imagelist", imagelist);

		
		
		ReviewService rs = sqlSession.getMapper(ReviewService.class);

	    ArrayList<ReviewDTO> list = rs.getReviews(Integer.parseInt(code),0);
	    boolean hasMore = list.size() > 5;

	    if (hasMore) {
	    	list.remove(5);  // 6번째는 보여주지 않음
	    }
	    model.addAttribute("list", list); // 
	    model.addAttribute("hasMore", hasMore);

		return "detailview"; 

	}
	
	@RequestMapping(value="/loadMoreReviews", produces = "text/html; charset=UTF-8")
	public String loadMoreReviews(@RequestParam("storecode") int storecode,
	                              @RequestParam("offset") int offset,
	                              Model model) {

		ReviewService rs = sqlSession.getMapper(ReviewService.class);
	    ArrayList<ReviewDTO> moreReviews = rs.getReviews(storecode, offset);
	    
	    boolean hasMore = moreReviews.size() > 5;

	    if (hasMore) {
	        moreReviews.remove(5);  // 6번째는 보여주지 않음
	    }
	    
	    model.addAttribute("list", moreReviews);
	    model.addAttribute("hasMore", hasMore);
	    return "main/moreReviews"; // JSP fragment 반환 (리뷰 한 세트 5개)
	}
	
	
}
