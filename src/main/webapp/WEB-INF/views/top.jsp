<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/base.css">
  <link rel="stylesheet" href="css/searchinput.css">
  <link rel="stylesheet" href="css/style.css">
<style type="text/css">
  .login {
    position: absolute;
    top: 20px;
    right: 30px;
  }
  .login a {
    margin-left: 10px;
    text-decoration: none;
  }
</style>

  
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
          <a href="mypagePwcheck">👤 ${id}님 반갑습니다</a>
          <a href="logout">🔓 로그아웃</a>
        </c:when>
        <c:otherwise>
          <a href="joinput">👤 회원가입</a>
          <a href="loginput">🔐 로그인</a>
        </c:otherwise>
      </c:choose>
    </div>

<!-- 사이드바 토글 버튼 -->
<button id="toggleSidebarBtn">☰ 메뉴</button>

<!-- 왼쪽 사이드바 -->
<nav id="sidebar" class="sidebar hidden">
  <div class="sidebar-header">
    <h3>Chew</h3>
  </div>
  <ul class="menu">
    <li><a href="main">메인으로</a></li>

    <li>
      <button class="menu-toggle">맛집 ▼</button>
      <ul class="submenu">
        <li><a href="detailmain">상세보기</a></li>
        <li><a href="#">Page 1-3</a></li>
      </ul>
    </li>

    <li><a href="#">이벤트</a></li>
    <li><a href="#">FAQ</a></li>

    <li>
      <button class="menu-toggle">관리자페이지 ▼</button>
      <ul class="submenu">
        <li><a href="sout">매장관리</a></li>
        <li><a href="/memberin">회원관리</a></li>
        <li><a href="#">리뷰관리</a></li>
        <li><a href="#">예약관리</a></li>
      </ul>
    </li>
    
   <c:if test="${loginstate == true}">
      <li><a href="mypagePwcheck">마이페이지</a></li>
    </c:if>
    
  </ul>
</nav>

<!-- 토글 및 서브메뉴 스크립트 -->
<script>
  document.addEventListener("DOMContentLoaded", function () {
    const toggleBtn = document.getElementById("toggleSidebarBtn");
    const sidebar = document.getElementById("sidebar");

    toggleBtn.addEventListener("click", function () {
      sidebar.classList.toggle("hidden");
    });

  });
</script>
<script>
  document.addEventListener("DOMContentLoaded", function () {

    const toggles = document.querySelectorAll(".menu-toggle");

    toggles.forEach((toggle) => {
      toggle.addEventListener("click", function () {
        const submenu = this.nextElementSibling;

        if (submenu.style.display === "block") {
          submenu.style.display = "none";
        } else {
          submenu.style.display = "block";
        }
      });
    });
  });
</script>

</body>
</html>
