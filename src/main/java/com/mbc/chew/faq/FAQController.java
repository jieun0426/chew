package com.mbc.chew.faq;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mbc.chew.store.PageDTO;


@Controller
public class FAQController {
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("/FAQ")
	public String qout(HttpServletRequest request, Model model) {
		int nowPage;
		boolean check;
		try {
			nowPage=Integer.parseInt(request.getParameter("page"));
			check=Boolean.parseBoolean(request.getParameter("check"));
		} catch (Exception e) {
			nowPage=1;
			check=false;
		}
		
		int cntPerPage=10; //한 페이지에 나타낼 레코드 수
		HttpSession hs=request.getSession();
		String id=(String) hs.getAttribute("id");

		FAQService fs=sqlSession.getMapper(FAQService.class);
		int total;
		PageDTO pdto;
		ArrayList<FAQDTO> qlist;
		if(check) { //내 FAQ만 보기 체크시
			total=fs.countMyFAQ(id);
			pdto=new PageDTO(total, nowPage, cntPerPage);
			qlist = fs.myPagingList(pdto.getStart(), pdto.getEnd(), id);
		}else { //모든 FAQ 보기
			total=fs.countAllRecords();
			pdto=new PageDTO(total, nowPage, cntPerPage);
			qlist = fs.paging(pdto.getStart(), pdto.getEnd());
		}
		model.addAttribute("qlist",qlist);
		model.addAttribute("pdto", pdto);
		model.addAttribute("check", check);
		
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
	public String my(HttpServletRequest request, 
			@RequestParam(value = "check", required = false, defaultValue = "false") boolean check,
            @RequestParam(value = "page", required = false, defaultValue = "1") int nowPage, Model model) {
		
		int cntPerPage=10; //한 페이지에 나타낼 레코드 수
		
		HttpSession hs=request.getSession();
		String id=(String) hs.getAttribute("id");
		
		FAQService fs=sqlSession.getMapper(FAQService.class);
		int total;
		PageDTO pdto;
		ArrayList<FAQDTO> qlist;
		if(check) { //내 FAQ만 보기 체크시
			total=fs.countMyFAQ(id);
			pdto=new PageDTO(total, nowPage, cntPerPage);
			qlist = fs.myPagingList(pdto.getStart(), pdto.getEnd(), id);
		}else { //모든 FAQ 보기
			total=fs.countAllRecords();
			pdto=new PageDTO(total, nowPage, cntPerPage);
			qlist = fs.paging(pdto.getStart(), pdto.getEnd());
		}
		model.addAttribute("qlist",qlist);
		model.addAttribute("pdto", pdto);
		model.addAttribute("check", check);
		
		return "FAQ/FAQ_list";
	}
	
	@ResponseBody
	@RequestMapping(value="/faq_titleBtn_click", produces = "text/html; charset=UTF-8")
	public String faq_titleBtn_click(String qnum, String id) {
		FAQService fs=sqlSession.getMapper(FAQService.class);
		FAQDTO qdto=fs.selectQuestion(qnum); //qnum에 해당하는 질문내용 가져옴
		FAQDTO adto=fs.selectAnswer(qnum); //qnum에 해당하는 답변 가져옴
		
		StringBuilder sb = new StringBuilder();

	    sb.append("<div class='question' style='padding-left:140px; text-align: left;'>");
	    sb.append("<pre>"+qdto.getContent()+"</pre>");
	    if(id.equals("admin") && (adto == null || adto.getContent() == null || adto.getContent().isEmpty()))
	    	 sb.append("<div><input type='button' value='답변쓰기' class='reply_inputBtn' style='margin-top: 20px; margin-left: 0px;' data-qnum='" + qdto.getNum() + "'></div>");
	    else if(id.equals("admin"))
	    	 sb.append("<div><input type='button' value='답변수정' class='reply_updateBtn' style='margin-top: 20px; margin-left: 0px;' data-qnum='" + qdto.getNum() + "'></div>");
	    sb.append("</div>");

	    sb.append("<div class='answer' style='padding-left: 140px; margin-top: 20px; text-align: left;'>");
	    if (adto != null && adto.getContent() != null) {
	        sb.append("<strong>답변:</strong> ").append("<pre>"+adto.getContent()+"</pre>");
	    }
	    sb.append("</div>");

	    return sb.toString();
	}
	
	@ResponseBody
	@RequestMapping(value="/faq_reply_input", produces = "text/html; charset=UTF-8")
	public String faq_reply(String qnum) {
		StringBuilder sb = new StringBuilder();

	    sb.append("<form id='replyForm' style='padding-left:140px;'>");
	    sb.append("<textarea name='content' rows='4' cols='60' placeholder='답변을 입력하세요'></textarea><br>");
	    sb.append("<input type='hidden' name='qnum' value='" + qnum + "'>");
	    sb.append("<input type='submit' value='등록'>");
	    sb.append("</form>");

	    return sb.toString();
	}
	
	@ResponseBody
	@RequestMapping(value="/faq_save_reply", method=RequestMethod.POST)
	public String faq_save_reply(String qnum, String content, HttpSession session) {
	    FAQService fs = sqlSession.getMapper(FAQService.class);
	    
	    // 로그인한 사용자 정보가 세션에 있다고 가정
	    String id = (String) session.getAttribute("id");

	    // DTO에 담기
	    FAQDTO dto = new FAQDTO();
	    dto.setNum(Integer.parseInt(qnum));
	    dto.setContent(content);
	    dto.setId(id);
	    
	    try {
	        fs.insertAnswer(dto);
	        fs.updateQuestionState(dto.getNum());
	        return "success";
	    } catch(Exception e) {
	        e.printStackTrace();
	        return "fail";
	    }
	}
	
	@ResponseBody
	@RequestMapping(value="/faq_reply_updateForm", produces = "text/html; charset=UTF-8")
	public String faq_reply_updateForm(String qnum) {
		StringBuilder sb = new StringBuilder();

	    sb.append("<form id='replyUpdateForm' style='padding-left:140px;'>");
	    sb.append("<textarea name='content' rows='4' cols='60' placeholder='답변을 입력하세요'></textarea><br>");
	    sb.append("<input type='hidden' name='qnum' value='" + qnum + "'>");
	    sb.append("<input type='submit' value='등록'>");
	    sb.append("</form>");

	    return sb.toString();
	}
	
	@ResponseBody
	@RequestMapping(value="/faq_reply_update", method=RequestMethod.POST)
	public String faq_reply_update(String qnum, String content, HttpSession session) {
	    FAQService fs = sqlSession.getMapper(FAQService.class);
	    
	    // 로그인한 사용자 정보
	    String id = (String) session.getAttribute("id");

	    // DTO에 담기
	    FAQDTO dto = new FAQDTO();
	    dto.setGroups(Integer.parseInt(qnum));
	    dto.setContent(content);
	    dto.setId(id);
	    
	    try {
	        fs.updateAnswer(dto);
	        return "success";
	    } catch(Exception e) {
	        e.printStackTrace();
	        return "fail";
	    }
	}
	
	@ResponseBody
	@RequestMapping(value="/faq_secretBtn_click", produces = "text/html; charset=UTF-8")
	public String faq_secretBtn_click(String qnum, String id) {
		FAQService fs=sqlSession.getMapper(FAQService.class);
		FAQDTO qdto=fs.selectQuestion(qnum); //qnum에 해당하는 질문내용 가져옴
		
		if(id.equals(qdto.getId()) || id.equals("admin")) {
			FAQDTO adto=fs.selectAnswer(qnum); //qnum에 해당하는 답변 가져옴
			
			StringBuilder sb = new StringBuilder();

		    sb.append("<div class='question' style='padding-left:140px; text-align: left;'>");
		    sb.append("<pre>"+qdto.getContent()+"</pre>");
		    if(id.equals("admin") && (adto == null || adto.getContent() == null || adto.getContent().isEmpty()))
		    	 sb.append("<div><input type='button' value='답변쓰기' class='reply_inputBtn' style='margin-top: 20px; margin-left: 0;' data-qnum='" + qdto.getNum() + "'></div>");
		    else if(id.equals("admin"))
		    	 sb.append("<div><input type='button' value='답변수정' class='reply_updateBtn' style='margin-top: 20px; margin-left: 0;' data-qnum='" + qdto.getNum() + "'></div>");
		    sb.append("</div>");

		    sb.append("<div class='answer' style='padding-left: 140px; margin-top: 20px; text-align: left;'>");
		    if (adto != null && adto.getContent() != null) {
		        sb.append("<strong>답변:</strong> ").append("<pre>"+adto.getContent()+"</pre>");
		    }
		    sb.append("</div>");

		    return sb.toString();
		}else {
			return "fail";
		}
		
	}
}
