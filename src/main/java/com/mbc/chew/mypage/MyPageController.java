package com.mbc.chew.mypage;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mbc.chew.detail.PageDTO;
import com.mbc.chew.joinlogin.JoinLogDTO;

@Controller
public class MyPageController {

	@Autowired
	SqlSession sqlSession;
	
	//마이페이지 비밀번호 들어가기 전 체크
	@RequestMapping(value = "/mypagePwcheck")
	public String personalpwcheck(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Boolean loginstate = (Boolean) session.getAttribute("loginstate");

		if (loginstate == null || !loginstate) {
			session.setAttribute("alertMessage", "濡쒓렇�씤 �썑 �씠�슜 媛��뒫�빀�땲�떎.");
			return "redirect:/loginput";
		}

		return "mypagePwcheck";
	}

	@RequestMapping(value = "/mypagepwchecking", method = RequestMethod.POST)
	public String personalpwchecking(HttpServletRequest request, Model mo) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String pw = request.getParameter("pw");

		// DB�뿉�꽌 �빐�떦 ID�쓽 �궗�슜�옄 �젙蹂� 議고쉶
		MyPageService ms = sqlSession.getMapper(MyPageService.class);
		JoinLogDTO dto = ms.getUserById(id);

		// 鍮꾨�踰덊샇 鍮꾧탳
		PasswordEncoder pe = new BCryptPasswordEncoder();
		boolean flag = pe.matches(pw, dto.getPw());

		if (flag) {
			session.setAttribute("loginstate", true); // 濡쒓렇�씤 �쑀吏�
			mo.addAttribute("dto", dto);
			return "mypinfo"; // 留덉씠�럹�씠吏� �젙蹂대줈 �씠�룞
		} else {
			request.setAttribute("alertMessage", "鍮꾨�踰덊샇媛� ��由쎈땲�떎.");
			return "mypagePwcheck";
		}
	}
	//�쉶�썝�젙蹂�
	@RequestMapping(value = "/mypinfo")
	public String myinfomodify(HttpServletRequest request, Model mo) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		if (id == null) {
			return "redirect:/loginput";
		}

		MyPageService ms = sqlSession.getMapper(MyPageService.class);
		JoinLogDTO dto = ms.mymodify0423(id);
		mo.addAttribute("dto", dto);

		return "mypinfo";
	}
	
	//�쉶�썝�젙蹂댁꽭�씠釉�
	@RequestMapping(value = "/myinfosave", method = RequestMethod.POST)
	public String updateUserInfo(HttpServletRequest request) {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		Date birth = Date.valueOf(request.getParameter("birth"));

		MyPageService ms = sqlSession.getMapper(MyPageService.class);
		ms.mymodify042322(name, phone, birth, id);

		return "redirect:/mypinfo";
	}
	
	//�쉶�썝�깉�눜
	@RequestMapping(value = "/mypagedel")
	public String myinfodelete(HttpServletRequest request, Model mo) {
	    HttpSession session = request.getSession();
	    String id = (String) session.getAttribute("id");

	    MyPageService ms = sqlSession.getMapper(MyPageService.class);
	    JoinLogDTO dto = ms.delsave0424(id);  // �삉�뒗 delsave0424(id) �뜥�룄 �맖

	    mo.addAttribute("dto", dto);

	    return "mypagedel";
	}


	//회원탈퇴 체크(예약,리뷰,좋아요 다 삭제)
	@RequestMapping(value = "/mypagedelsave", method = RequestMethod.POST)
	public String myinfodelete2(HttpServletRequest request) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		MyPageService ms = sqlSession.getMapper(MyPageService.class);
		JoinLogDTO dto = ms.delsave0424(id); 

		
		PasswordEncoder pe = new BCryptPasswordEncoder();
		String cpw = dto.getPw(); // �븫�샇�솕�맂 鍮꾨�踰덊샇
		boolean flag = pe.matches(pw, cpw); // 鍮꾨�踰덊샇 鍮꾧탳

		if (flag) {
			
			ms.deleteUserBookings(id);//예약삭제
			ms.deleteUserReviews(id);//리뷰삭제
			ms.deleteUserLikes(id);//좋아요삭제
			ms.deleteUserById0424(id);
			HttpSession hs = request.getSession();
			hs.invalidate();// �꽭�뀡 醫낅즺 (濡쒓렇�븘�썐 �슚怨�)
			return "redirect:/";
		} else {
			request.setAttribute("alertMessage", "鍮꾨�踰덊샇媛� ��由쎈땲�떎.");
			return "mypagedel";
		}
	}

	
	//�궡媛� �옉�꽦�븳 由щ럭 �솗�씤
	@RequestMapping(value = "/mypagereview")
	public String reviewcheckk(HttpServletRequest request, Model mo, HttpSession hs) {
	    String id = (String) hs.getAttribute("id");

	    if (id == null)
	        return "redirect:/loginput";

	    MyPageService ms = sqlSession.getMapper(MyPageService.class);

	    // 페이징 처리
	    int nowPage;
	    try {
	        nowPage = Integer.parseInt(request.getParameter("page"));
	    } catch (Exception e) {
	        nowPage = 1;
	    }

	    int cntPerPage = 5; 
	    int total = ms.countUserReviews(id); 

	    PageDTO pdto = new PageDTO(total, nowPage, cntPerPage);

	    // ★ start, end를 보내서 해당 구간 리뷰만 가져옴
	    List<Map<String, Object>> reviewList = ms.pagingUserReviews(id, pdto.getStart(), pdto.getEnd());

	    mo.addAttribute("myreviews", reviewList);
	    mo.addAttribute("pdto", pdto); // 페이지 정보도 넘기기

	    return "mypagereview";
	}

	//내 예약관리
	@RequestMapping(value = "/mypagebook")
	public String mypagebooking(HttpServletRequest request,Model mo,HttpSession hs) {
		String id = (String) hs.getAttribute("id");

	    if (id == null)
	        return "redirect:/loginput";

	    MyPageService ms = sqlSession.getMapper(MyPageService.class);

	    
	    // ★ start, end를 보내서 해당 구간 리뷰만 가져옴
	    List<Map<String, Object>> bookList = ms.pagingUserBook(id);

	    mo.addAttribute("mybook", bookList);

		return "mypagebook";
	}
	
	
	// 관리자 회원관리 페이지에서 받아온 값
	@RequestMapping(value = "/mypagepwchecking", method = RequestMethod.GET)
	public String mypagepwcheckingGet(@RequestParam("id") String id, HttpServletRequest request, Model model) {
	    HttpSession session = request.getSession();
	    session.setAttribute("targetUserId", id); 

	    return "mypagePwcheck";
	}

}
