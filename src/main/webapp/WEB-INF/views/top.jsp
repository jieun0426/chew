<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/base.css">
  <link rel="stylesheet" href="css/searchinput.css">
  <link rel="stylesheet" href="css/style.css">

  <title>Main</title>
</head>
<body>

<!-- 상단 로고 + 로그인/회원가입 메뉴 -->
<div id="top_div">
  <a href="main"><img src="image/logo.png" id="logo"></a>  
</div>
<div class="login">
  <c:choose>
    <c:when test="${loginstate == true}">
      <a href="mypagePwcheck">👤 ${id}님 반갑습니다</a>&nbsp; |<a href="logout">로그아웃</a>
    </c:when>
    <c:otherwise>
   <a href="joinput">회원가입</a> &nbsp; |<a href="loginput">로그인</a>
    </c:otherwise>
  </c:choose>
</div>

<!-- 사이드바 토글 버튼 (체크박스를 사용) -->
<input type="checkbox" class="check-icon" id="check-icon" style="opacity: 0; position: absolute; left: -9999px;">
<label class="icon-menu" id="toggleSidebarBtn">
  <div class="bar bar--1"></div>
  <div class="bar bar--2"></div>
  <div class="bar bar--3"></div>
</label>

<!-- 왼쪽 사이드바 -->
<nav id="sidebar" class="sidebar">
  <div class="sidebar-header">
    <h3>MENU</h3>
  </div>
  <ul class="menu">
    <li><a href="main">메인으로</a></li>
    <li><a href="detailmain">맛집 찾기</a></li>
    <li><a href="FAQ">FAQ</a></li>
    
    <c:if test="${loginstate == true}">
      <li><a href="mypagePwcheck">마이페이지</a></li>
    </c:if>
    
    <c:if test="${id == 'admin'}">
    	<li>
	      <button class="menu-toggle">관리자페이지 ▼</button>
	      <ul class="submenu">
	        <li><a href="sout">매장관리</a></li>
	        <li><a href="${pageContext.request.contextPath}/members">회원관리</a></li>
	        <li><a href="#">리뷰관리</a></li>
	        <li><a href="#">예약관리</a></li>
	      </ul>
    	</li>
    </c:if>
  </ul>
</nav>

<!-- 서브메뉴 토글 기능 -->
<script>
document.addEventListener("DOMContentLoaded", function () {
	const toggleBtn = document.getElementById("toggleSidebarBtn");
    const checkIcon = document.getElementById("check-icon");

    toggleBtn.addEventListener("click", function (e) {
        checkIcon.checked = !checkIcon.checked;
        e.preventDefault(); // ← 페이지 상단 이동 방지!
    });

    const toggles = document.querySelectorAll(".menu-toggle");
    toggles.forEach((toggle) => {
        toggle.addEventListener("click", function (e) {
            const submenu = this.nextElementSibling;
            submenu.classList.toggle("open");
            e.stopPropagation();
        });
    });
});
</script>

</body>
</html>