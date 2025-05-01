package com.mbc.chew.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class MemberInterceptor extends HandlerInterceptorAdapter{
//검문소 느낌 ,Controller 실행전에 로그인된지,관리자 인지 판별.
	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
	
	HttpSession hs = request.getSession(false);
	
	if (hs == null || hs.getAttribute("id") == null) {
        // 세션이 없거나, 세션에 "id" 속성이 없으면 로그인되지 않은 상태
        System.out.println("[Interceptor] 비로그인 사용자 접근 시도: " + request.getRequestURI());
        response.setContentType("text/html; charset=UTF-8");
        response.getWriter().println("<script>");
        response.getWriter().println("alert('로그인이 필요합니다.');");
        response.getWriter().println("location.href='" + request.getContextPath() + "/loginput';");
        response.getWriter().println("</script>");
        response.getWriter().flush();
        return false;
    }
	
	
	String loginId = (String) hs.getAttribute("id");
    if (!"admin".equals(loginId)) {
        // 로그인은 했지만 ID가 "admin"이 아님
        System.out.println("잘못된접근:관리자 전용 권한입니다" + loginId + ", URI: " + request.getRequestURI());
        response.setContentType("text/html; charset=UTF-8"); 
        response.getWriter().println("<script>");
        response.getWriter().println("alert('접근된 제한입니다(관리자전용)');");
        response.getWriter().println("history.back();");
        response.getWriter().println("</script>");
        response.getWriter().flush(); // 응답 즉시 전송
        return false; 
    }
    System.out.println("관리자(" + loginId + ")님 안녕하세요:" + request.getRequestURI());
    return true;
		
		
		
		
	}
}
