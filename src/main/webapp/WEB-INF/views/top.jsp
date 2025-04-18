<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
  <link rel="stylesheet" href="css/base.css">
  <link rel="stylesheet" href="css/searchinput.css">
  <link rel="stylesheet" href="css/style.css">
  
  
<title>Main</title>
</head>
<body>
<div id="top_div">
	<a href="main"><img src="image/logo.png" id="logo"></a>	

</div>


<!-- 사이드바 토글 버튼 -->
<button id="toggleSidebarBtn">☰ 메뉴</button>

<!-- 왼쪽 사이드바 -->
<nav id="sidebar" class="sidebar">
  <div class="sidebar-header">
    <h3>Chew</h3>
  </div>
  <ul class="menu">
    <li><a href="main">메인으로</a></li>
    
    <li>
      <button class="menu-toggle">맛집 ▼</button>
      <ul class="submenu">
        <li><a href="detailview">상세화면</a></li>
        <li><a href="#">Page 1-2</a></li>
        <li><a href="#">Page 1-3</a></li>
      </ul>
    </li>

    <li><a href="#">이벤트</a></li>
    <li><a href="#">FAQ</a></li>

    <li>
      <button class="menu-toggle">관리자페이지 ▼</button>
      <ul class="submenu">
        <li><a href="sout">매장관리</a></li>
        <li><a href="#">회원관리</a></li>
        <li><a href="#">리뷰관리</a></li>
        <li><a href="#">예약관리</a></li>
      </ul>
    </li>

    <c:choose>
      <c:when test="${loginstate == true}">
        <li><a href="#">👤 ${id}님 반갑습니다</a></li>
        <li><a href="logout">🔓 로그아웃</a></li>
      </c:when>
      <c:otherwise>
        <li><a href="joinput">👤 회원가입</a></li>
        <li><a href="loginput">🔐 로그인</a></li>
      </c:otherwise>
    </c:choose>
  </ul>
</nav>
<script type="text/javascript">
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
