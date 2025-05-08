package com.mbc.chew.faq;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mbc.chew.store.PageDTO;


@Controller
public class FAQController {
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("/FAQ")
	public String qout(HttpServletRequest request, Model model) {
		int nowPage;
		try {
			nowPage=Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			nowPage=1;
		}
		int cntPerPage=10; //한 페이지에 나타낼 레코드 수
		FAQService fs = sqlSession.getMapper(FAQService.class);
		int total=fs.countAllRecords();

		PageDTO pdto=new PageDTO(total, nowPage, cntPerPage);
		
		ArrayList<FAQDTO> qlist = fs.paging(pdto.getStart(), pdto.getEnd());

		model.addAttribute("qlist",qlist);
		model.addAttribute("pdto", pdto);		
		
		return "FAQout";
	}
	
	@RequestMapping("/FAQin")
	public String qin() {
		return "FAQin";
	}
	
	@RequestMapping("/FAQsave")
	public String qSave(HttpServletRequest request) {
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		
		HttpSession hs=request.getSession();
		String id=(String) hs.getAttribute("id");

		String secret_check=request.getParameter("secret_check");
		//check시 on, 해제시 null
		int secret;
		if(secret_check!=null) secret=1;
		else secret=0;
		
		FAQService fs=sqlSession.getMapper(FAQService.class);
		fs.insertFAQ(id,title,content,secret);
		
		return "redirect:/FAQ";
	}
	
	//내 FAQ 보기 버튼
	@RequestMapping(value="/myFAQ", produces = "text/html; charset=UTF-8")
	public String my(HttpServletRequest request, boolean check, Model model) {
		int nowPage;
		try {
			nowPage=Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			nowPage=1;
		}
		int cntPerPage=10; //한 페이지에 나타낼 레코드 수
		
		HttpSession hs=request.getSession();
		String id=(String) hs.getAttribute("id");

		FAQService fs=sqlSession.getMapper(FAQService.class);
		int total;
		PageDTO pdto;
		ArrayList<FAQDTO> qlist;
		if(check) { //내 FAQ만 보기 체크시
			System.out.println("내 FAQ만 보기 체크");
			total=fs.countMyFAQ(id);
			pdto=new PageDTO(total, nowPage, cntPerPage);
			qlist = fs.myPagingList(pdto.getStart(), pdto.getEnd(), id);
		}else { //모든 FAQ 보기
			System.out.println("내 FAQ만 보기 체크해제");
			total=fs.countAllRecords();
			pdto=new PageDTO(total, nowPage, cntPerPage);
			qlist = fs.paging(pdto.getStart(), pdto.getEnd());
		}
		model.addAttribute("qlist",qlist);
		model.addAttribute("pdto", pdto);
		
		return "FAQ/FAQ_list";
	}
	
}
