package com.mbc.chew.review;



import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.catalina.StoreManager;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mbc.chew.store.StoreDTO;


@Controller
public class ReviewController {
	@Autowired
	SqlSession sqlSession;
	ReviewService reviewService;
	
	@RequestMapping(value="/submitReview", method = RequestMethod.POST)
	public String submitReview(HttpServletRequest request) {
	    ReviewDTO dto = new ReviewDTO();
	    dto.setId(request.getParameter("id"));
	    dto.setStorecode(Integer.parseInt(request.getParameter("storecode")));
	    dto.setContent(request.getParameter("content"));
	    dto.setStars(Integer.parseInt(request.getParameter("stars")));
	    dto.setTitle(request.getParameter("title"));
    
	    ReviewService rs = sqlSession.getMapper(ReviewService.class);
	    rs.insertReview(dto);     
	   

	    return "redirect:/detailview?storecode=" + dto.getStorecode();
	}
	
	@RequestMapping(value="/reviews")
	public String Reviewlist(Model model, HttpServletRequest request) {
	    int storecode = Integer.parseInt(request.getParameter("storecode"));
	    ReviewService rs = sqlSession.getMapper(ReviewService.class);
	    ArrayList<ReviewDTO> list = rs.reviewout(storecode);
	    
	    model.addAttribute("list", list);
	    model.addAttribute("storecode", storecode);

	    
	    return "detailview"; 
	}

	@RequestMapping(value="/deleteReview", method = RequestMethod.POST)
	public String deleteReview(HttpServletRequest request) {
	    String id = (String) request.getSession().getAttribute("id");
	    int storecode = Integer.parseInt(request.getParameter("storecode"));

	   

	    ReviewService rs = sqlSession.getMapper(ReviewService.class);
	    rs.deleteReview(id, storecode); 

	    return "detailview";
	}

	@RequestMapping(value="/editReview", method = RequestMethod.POST)
	public String editReview(HttpServletRequest request) {
	    ReviewDTO dto = new ReviewDTO();
	    dto.setId(request.getParameter("id"));
	    dto.setStorecode(Integer.parseInt(request.getParameter("storecode")));
	    dto.setTitle(request.getParameter("title"));
	    dto.setContent(request.getParameter("content"));

	    ReviewService rs = sqlSession.getMapper(ReviewService.class);
	    rs.updateReview(dto);

	    return "redirect:/detailview?storecode=" + dto.getStorecode();
	}
	
	
//	@RequestMapping(value="/reviewmanage", method = RequestMethod.GET)
//	public String mr1(HttpServletRequest request, Model model) {
//	   
//	    // ���� �ڵ�� ����� �Ķ���� ��������
//	    String storecodeStr = request.getParameter("storecode");
//	    String storename = request.getParameter("storename");
//
//	    // ���� ��� ��������
//	    ArrayList<ReviewManageDTO> storeList = reviewService.getAllStoresWithReviewInfo();
//
//	    // storecode�� ���� ��� �ش� ���� ���� ��ȸ
//	    if (storecodeStr != null && !storecodeStr.isEmpty()) {
//	        int storecode = 0;
//	        try {
//	            storecode = Integer.parseInt(storecodeStr);
//	        } catch (NumberFormatException e) {
//	            model.addAttribute("error", "�߸��� storecode �����Դϴ�.");
//	            return "errorPage";
//	        }
//
//	        // Ư�� ���忡 ���� ���� ���� ��� ���� ��������
//	        int reviewcount = reviewService.getReviewCountByStorecode(storecode);
//	        double averageRating = reviewService.getAverageRatingByStorecode(storecode);
//
//	        // �𵨿� ������ �߰�
//	        model.addAttribute("reviewcount", reviewcount);
//	        model.addAttribute("averageRating", averageRating);
//	    }
//
//	    model.addAttribute("storename", storename);
//	    model.addAttribute("storeList", storeList);
//
//	    return "reviewmanage"; // reviewmanage.jsp�� �̵�
//	}





	
	
}
