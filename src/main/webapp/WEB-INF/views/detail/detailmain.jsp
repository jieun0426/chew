<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/detailmain.css">
</head>
<body>
<div class="container1">
  <h1>최고의 식당을 찾아보세요</h1>
  <form action="detailmain_search" method="post">
	  <div class="ui-input-container">
	    <input
	      name="search" 
	      required=""
	      placeholder="검색할 도시명이나 음식점명을 입력하세요..."
	      class="ui-input"
	      type="text"
	    />
	    <div class="ui-input-underline"></div>
	    <div class="ui-input-highlight"></div>
	    <div class="ui-input-icon">
	      <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
	        <path
	          stroke-linejoin="round"
	          stroke-linecap="round"
	          stroke-width="2"
	          stroke="currentColor"
	          d="M21 21L16.65 16.65M19 11C19 15.4183 15.4183 19 11 19C6.58172 19 3 15.4183 3 11C3 6.58172 6.58172 3 11 3C15.4183 3 19 6.58172 19 11Z"
	        ></path>
	      </svg>
	    </div>
	  </div>
  </form>
  <div aria-label="Orange and tan hamster running in a metal wheel" role="img" class="wheel-and-hamster">
	<div class="wheel"></div>
	<div class="hamster">
		<div class="hamster__body">
			<div class="hamster__head">
				<div class="hamster__ear"></div>
				<div class="hamster__eye"></div>
				<div class="hamster__nose"></div>
			</div>
			<div class="hamster__limb hamster__limb--fr"></div>
			<div class="hamster__limb hamster__limb--fl"></div>
			<div class="hamster__limb hamster__limb--br"></div>
			<div class="hamster__limb hamster__limb--bl"></div>
			<div class="hamster__tail"></div>
		</div>
	</div>
	<div class="spoke"></div>
</div>
</div>

<div id="container2" class="container2">
  <h2><a href="detailmain#container2">추천 음식점 전체보기</a></h2>
  
  <c:if test="${search!=null && count>0}">
  	<p style="margin-bottom: 30px;">'<span style="font-weight: bold;">${search}</span>' 검색 결과 (${count}건)</p> 
  </c:if>
  
  <c:if test="${search!=null && count==0}">
  	<div class="nolist">
  		'<span style="font-weight: bold;">${search}</span>' 검색 결과가 없습니다&emsp;
  	</div>
  	<button type="button" id="detailmainBtn" onclick="location.href='detailmain#container2'">추천 메인으로</button></a>
  </c:if>
  
  <div class="restaurant-grid">
    <c:forEach items="${list}" var="r">
    <div class="restaurant-card">
    <a href="detailview?storecode=${r.storecode}" class="restaurant-card-link">
        <img src="image/${r.storeimage}">
        <div class="restaurant-info">
          <div class="restaurant-name">${r.storename}</div>
          <div class="storecategory">${r.storecategory}</div>
          <div class="storeaddress">${r.storeaddress}</div>
        </div>
     </a>
     </div>
    </c:forEach>
  </div>
  
  <br><br>
  <div>
	<c:if test="${pdto.startPage>pdto.cntPage}">
		<c:if test="${search==null}"><a href="detailmain?page=${pdto.startPage-pdto.cntPage}#container2">◀</a>&emsp;</c:if>
		<c:if test="${search!=null}"><a href="detailmain_search?page=${pdto.startPage-pdto.cntPage}&search=${search}#container2">◀</a>&emsp;</c:if>
	</c:if>
	
	<c:forEach begin="${pdto.startPage}" end="${pdto.endPage}" var="p">
		<c:if test="${p==pdto.nowPage}">
			<span id="nowPage">${p}</span>&emsp;
		</c:if>
		
		<c:if test="${p!=pdto.nowPage}">
			<c:if test="${search==null}"><a class="pageList" href="detailmain?page=${p}#container2">${p}</a>&emsp;</c:if>
			<c:if test="${search!=null}"><a class="pageList" href="detailmain_search?page=${p}&search=${search}#container2">${p}</a>&emsp;</c:if>
		</c:if>
	</c:forEach>
	
	<c:if test="${pdto.endPage<pdto.lastPage}">
		<c:if test="${search==null}"><a href="detailmain?page=${pdto.startPage+pdto.cntPage}#container2">▶</a></c:if>
		<c:if test="${search!=null}"><a href="detailmain_search?page=${pdto.startPage+pdto.cntPage}&search=${search}#container2">▶</a></c:if>
	</c:if>
  </div>
</div>

</body>
</html>
