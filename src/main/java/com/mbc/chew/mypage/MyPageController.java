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
			session.setAttribute("alertMessage", "로그인 후 이용 가능합니다.");
			return "redirect:/loginput";
		}

		return "mypagePwcheck";
	}

	@RequestMapping(value = "/mypagepwchecking", method = RequestMethod.POST)
	public String personalpwchecking(HttpServletRequest request, Model mo) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String pw = request.getParameter("pw");

		// DB에서 해당 ID의 사용자 정보 조회
		MyPageService ms = sqlSession.getMapper(MyPageService.class);
		JoinLogDTO dto = ms.getUserById(id);

		// 비밀번호 비교
		PasswordEncoder pe = new BCryptPasswordEncoder();
		boolean flag = pe.matches(pw, dto.getPw());

		if (flag) {
			session.setAttribute("loginstate", true); // 로그인 유지
			mo.addAttribute("dto", dto);
			return "mypinfo"; // 마이페이지 정보로 이동
		} else {
			request.setAttribute("alertMessage", "비밀번호가 틀립니다.");
			return "mypagePwcheck";
		}
	}
	//회원정보
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
	
	//회원정보세이브
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
	
	//회원탈퇴
	@RequestMapping(value = "/mypagedel")
	public String myinfodelete(HttpServletRequest request, Model mo) {
	    HttpSession session = request.getSession();
	    String id = (String) session.getAttribute("id");

	    MyPageService ms = sqlSession.getMapper(MyPageService.class);
	    JoinLogDTO dto = ms.delsave0424(id);  // 또는 delsave0424(id) 써도 됨

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
		String cpw = dto.getPw(); // 암호화된 비밀번호
		boolean flag = pe.matches(pw, cpw); // 비밀번호 비교

		if (flag) {
			
			ms.deleteUserBookings(id);//예약삭제
			ms.deleteUserReviews(id);//리뷰삭제
			ms.deleteUserLikes(id);//좋아요삭제
			ms.deleteUserById0424(id);
			HttpSession hs = request.getSession();
			hs.invalidate();// 세션 종료 (로그아웃 효과)
			return "redirect:/";
		} else {
			request.setAttribute("alertMessage", "비밀번호가 틀립니다.");
			return "mypagedel";
		}
	}

	
	//내가 작성한 리뷰 확인
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

}
