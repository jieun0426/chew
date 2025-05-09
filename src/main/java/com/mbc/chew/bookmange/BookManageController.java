package com.mbc.chew.bookmange;

import java.io.PrintWriter;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BookManageController {

    @Autowired
    SqlSession sqlSession;

    // 예약 목록 (페이징)
    @RequestMapping(value = "/booklist")
    public String bookman1(HttpServletRequest request, HttpServletResponse response, Model mo, HttpSession hs) throws Exception {
        String id = (String) hs.getAttribute("id");

        // 관리자 로그인 체크
        if (id == null || !id.contains("admin")) {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter pww = response.getWriter();
            pww.print("<script>alert('관리자 계정으로 로그인 해주세요.')</script>");
            pww.print("<script>location.href='loginput'</script>");
            pww.close();
            return null;
        }

        BookManageService bms = sqlSession.getMapper(BookManageService.class);

        int nowPage;
        try {
            nowPage = Integer.parseInt(request.getParameter("page"));
        } catch (Exception e) {
            nowPage = 1;
        }

        int cntPerPage = 10;
        int total = bms.countAllBookings();

        PageDTO pdto = new PageDTO(total, nowPage, cntPerPage);
        List<Map<String, Object>> bookmaList = bms.pagingBookings(pdto.getStart(), pdto.getEnd());

        mo.addAttribute("bookma", bookmaList);
        mo.addAttribute("pdto", pdto);

        return "booklist";
    }

    // 예약 상세 - 여러 건
    @RequestMapping(value = "bookmanage_detail")
    public String bookman2(HttpServletRequest request, Model mo) {
        int storecode = Integer.parseInt(request.getParameter("storecode"));
        String id = request.getParameter("id");
        String bookingdate = request.getParameter("bookingdate");
        String bookingtime = request.getParameter("bookingtime");

        Map<String, Object> params = new HashMap<>();
        params.put("storecode", storecode);
        params.put("id", id);
        params.put("bookingdate", bookingdate);
        params.put("bookingtime", bookingtime);

        BookManageService bms = sqlSession.getMapper(BookManageService.class);

        Map<String, Object> detail = bms.select05077(params);

        mo.addAttribute("detail", detail);
        return "bookmanage_detail";
    }





    // 예약 정보 업데이트
    @RequestMapping(value = "/updateBookings", method = RequestMethod.POST)
    public String updateBookings(HttpServletRequest request) {
        String id = request.getParameter("id");

        BookManageService bms = sqlSession.getMapper(BookManageService.class);

        int storecode = 0;
        int saramsu = 0;

        try {
            storecode = Integer.parseInt(request.getParameter("storecode"));
            saramsu = Integer.parseInt(request.getParameter("saramsu"));
        } catch (NumberFormatException e) {
            System.out.println("storecode 또는 saramsu 값이 잘못되었습니다: " + e.getMessage());
            return "redirect:/booklist";
        }

        String state = request.getParameter("state");
        Date bookingdate = Date.valueOf(request.getParameter("bookingdate"));
        String bookingtime = request.getParameter("bookingtime");

        BookingDTO dto = new BookingDTO();
        dto.setId(id);
        dto.setStorecode(storecode);
        dto.setSaramsu(saramsu);
        dto.setState(state);
        dto.setBookingdate(bookingdate);
        dto.setBookingtime(bookingtime);

        bms.updateBooking(dto);

        return "redirect:/booklist";
    }
    
    @RequestMapping(value = "/bookmanage_search")
    public String bookman3(HttpServletRequest request, Model mo, HttpSession hs) {
        String id = (String) hs.getAttribute("id"); // 로그인한 사용자 ID (미사용이면 제거 가능)

        BookManageService bms = sqlSession.getMapper(BookManageService.class);

        int nowPage = 1;
        try {
            nowPage = Integer.parseInt(request.getParameter("page"));
        } catch (NumberFormatException ignored) {}

        String search = request.getParameter("search");
        int cntPerPage = 10;

        int total;
        List<Map<String, Object>> bookmaList;
        PageDTO pdto;

        if (search != null && !search.trim().isEmpty()) {
            total = bms.countBookingsById(search);
            pdto = new PageDTO(total, nowPage, cntPerPage);
            bookmaList = bms.pagingBookingsById(search, pdto.getStart(), pdto.getEnd());
            mo.addAttribute("search", search); // 검색어 유지
        } else {
            total = bms.countAllBookings();
            pdto = new PageDTO(total, nowPage, cntPerPage);
            bookmaList = bms.pagingBookings(pdto.getStart(), pdto.getEnd());
        }

        mo.addAttribute("bookma", bookmaList);
        mo.addAttribute("pdto", pdto);

        return "bookmanage_search";
    }

}
