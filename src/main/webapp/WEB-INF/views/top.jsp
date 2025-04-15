<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="css/base.css">
  <link rel="stylesheet" href="css/searchinput.css">
<title>Main</title>
</head>
<body>
<div id="top_div">
	<a href="main"><img src="image/logo.png" id="logo"></a>
	<h1 id="top_h1"><a href="main">CHEWTOPIA</a></h1>
	
	<div class="group">
  		<svg class="icon" aria-hidden="true" viewBox="0 0 24 24"><g><path d="M21.53 20.47l-3.66-3.66C19.195 15.24 20 13.214 20 11c0-4.97-4.03-9-9-9s-9 4.03-9 9 4.03 9 9 9c2.215 0 4.24-.804 5.808-2.13l3.66 3.66c.147.146.34.22.53.22s.385-.073.53-.22c.295-.293.295-.767.002-1.06zM3.5 11c0-4.135 3.365-7.5 7.5-7.5s7.5 3.365 7.5 7.5-3.365 7.5-7.5 7.5-7.5-3.365-7.5-7.5z"></path></g></svg>
  		<input placeholder="Search" type="search" class="input">
	</div>
	
</div>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Chew</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">맛집 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="detail">상세화면</a></li>
          <li><a href="detailmain">상세메인</a></li>
          <li><a href="#">Page 1-3</a></li>
        </ul>
      </li>
     
      <li><a href="#">이벤트</a></li>
      
      <li><a href="#">FAQ</a></li>
      
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">관리자페이지 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="storein">매장관리</a></li>
          <li><a href="sout">매장보기</a></li>
          <li><a href="#">회원관리</a></li>
          <li><a href="#">리뷰관리</a></li>
          <li><a href="#">예약관리</a></li>
        </ul>
      </li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>
      <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
    </ul>
  </div>
</nav>

</body>
</html>
