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
<style type="text/css">

.container1 {
  width: 90%;                  /* 전체 너비의 90%로 설정 */
  max-width: 1000px;           /* 최대 너비 지정 */
  min-height: 40vh;            /* 화면의 85% 높이 */
  margin: 30px auto;           /* 가운데 정렬 + 위아래 여백 */
  background-color: #FFF5E2;
  padding: 60px 40px;          /* 내부 여백 늘리기 */
  border-radius: 30px;         /* 모서리 둥글게 */
  box-shadow: 0 10px 30px rgba(0,0,0,0.1);  /* 부드러운 그림자 */
  display: flex;
  flex-direction: column;
  align-items: center;
  font-family: Arial, sans-serif;
}


/* h1 스타일 */
.container1 h1 {
  color: black;
  margin-bottom: 30px;
}

.ui-input-container {
  position: relative;
  width: 500px;
}

.ui-input {
  width: 100%;
  padding: 10px 10px 10px 40px;
  font-size: 1em;
  border: none;
  border-bottom: 2px solid #ccc;
  outline: none;
  background-color: white;
  transition: border-color 0.3s;
  
}

.ui-input:focus {
  border-color: #fbc821;
}

.ui-input-underline {
  position: absolute;
  bottom: 0;
  left: 0;
  height: 2px;
  width: 100%;
  background-color: #fcb52f;
  transform: scaleX(0);
  transition: transform 0.3s;
}

.ui-input:focus + .ui-input-underline {
  transform: scaleX(1);
}

.ui-input-highlight {
  position: absolute;
  bottom: 0;
  left: 0;
  height: 100%;
  width: 0;
  background-color: rgba(108, 99, 255, 0.1);
  transition: width 0.3s;
}

.ui-input:focus ~ .ui-input-highlight {
  width: 100%;
}

.ui-input-icon {
  position: absolute;
  left: 10px;
  top: 50%;
  transform: translateY(-50%);
  color: #999;
  transition: color 0.3s;
}

.ui-input:focus ~ .ui-input-icon {
  color: #fbc821;
}

.ui-input-icon svg {
  width: 20px;
  height: 20px;
}
.wheel-and-hamster {
  --dur: 1s;
  position: relative;
  width: 12em;
  height: 12em;
  font-size: 14px;
  margin-top: 60px;
  margin-bottom: -40px;
  padding-bottom: 0;
}

.wheel,
.hamster,
.hamster div,
.spoke {
  position: absolute;
}

.wheel,
.spoke {
  border-radius: 50%;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
}

.wheel {
  background: radial-gradient(100% 100% at center,hsla(0,0%,60%,0) 47.8%,hsl(0,0%,60%) 48%);
  z-index: 2;
}

.hamster {
  animation: hamster var(--dur) ease-in-out infinite;
  top: 50%;
  left: calc(50% - 3.5em);
  width: 7em;
  height: 3.75em;
  transform: rotate(4deg) translate(-0.8em,1.85em);
  transform-origin: 50% 0;
  z-index: 1;
}

.hamster__head {
  animation: hamsterHead var(--dur) ease-in-out infinite;
  background: hsl(30,90%,55%);
  border-radius: 70% 30% 0 100% / 40% 25% 25% 60%;
  box-shadow: 0 -0.25em 0 hsl(30,90%,80%) inset,
		0.75em -1.55em 0 hsl(30,90%,90%) inset;
  top: 0;
  left: -2em;
  width: 2.75em;
  height: 2.5em;
  transform-origin: 100% 50%;
}

.hamster__ear {
  animation: hamsterEar var(--dur) ease-in-out infinite;
  background: hsl(0,90%,85%);
  border-radius: 50%;
  box-shadow: -0.25em 0 hsl(30,90%,55%) inset;
  top: -0.25em;
  right: -0.25em;
  width: 0.75em;
  height: 0.75em;
  transform-origin: 50% 75%;
}

.hamster__eye {
  animation: hamsterEye var(--dur) linear infinite;
  background-color: hsl(0,0%,0%);
  border-radius: 50%;
  top: 0.375em;
  left: 1.25em;
  width: 0.5em;
  height: 0.5em;
}

.hamster__nose {
  background: hsl(0,90%,75%);
  border-radius: 35% 65% 85% 15% / 70% 50% 50% 30%;
  top: 0.75em;
  left: 0;
  width: 0.2em;
  height: 0.25em;
}

.hamster__body {
  animation: hamsterBody var(--dur) ease-in-out infinite;
  background: hsl(30,90%,90%);
  border-radius: 50% 30% 50% 30% / 15% 60% 40% 40%;
  box-shadow: 0.1em 0.75em 0 hsl(30,90%,55%) inset,
		0.15em -0.5em 0 hsl(30,90%,80%) inset;
  top: 0.25em;
  left: 2em;
  width: 4.5em;
  height: 3em;
  transform-origin: 17% 50%;
  transform-style: preserve-3d;
}

.hamster__limb--fr,
.hamster__limb--fl {
  clip-path: polygon(0 0,100% 0,70% 80%,60% 100%,0% 100%,40% 80%);
  top: 2em;
  left: 0.5em;
  width: 1em;
  height: 1.5em;
  transform-origin: 50% 0;
}

.hamster__limb--fr {
  animation: hamsterFRLimb var(--dur) linear infinite;
  background: linear-gradient(hsl(30,90%,80%) 80%,hsl(0,90%,75%) 80%);
  transform: rotate(15deg) translateZ(-1px);
}

.hamster__limb--fl {
  animation: hamsterFLLimb var(--dur) linear infinite;
  background: linear-gradient(hsl(30,90%,90%) 80%,hsl(0,90%,85%) 80%);
  transform: rotate(15deg);
}

.hamster__limb--br,
.hamster__limb--bl {
  border-radius: 0.75em 0.75em 0 0;
  clip-path: polygon(0 0,100% 0,100% 30%,70% 90%,70% 100%,30% 100%,40% 90%,0% 30%);
  top: 1em;
  left: 2.8em;
  width: 1.5em;
  height: 2.5em;
  transform-origin: 50% 30%;
}

.hamster__limb--br {
  animation: hamsterBRLimb var(--dur) linear infinite;
  background: linear-gradient(hsl(30,90%,80%) 90%,hsl(0,90%,75%) 90%);
  transform: rotate(-25deg) translateZ(-1px);
}

.hamster__limb--bl {
  animation: hamsterBLLimb var(--dur) linear infinite;
  background: linear-gradient(hsl(30,90%,90%) 90%,hsl(0,90%,85%) 90%);
  transform: rotate(-25deg);
}

.hamster__tail {
  animation: hamsterTail var(--dur) linear infinite;
  background: hsl(0,90%,85%);
  border-radius: 0.25em 50% 50% 0.25em;
  box-shadow: 0 -0.2em 0 hsl(0,90%,75%) inset;
  top: 1.5em;
  right: -0.5em;
  width: 1em;
  height: 0.5em;
  transform: rotate(30deg) translateZ(-1px);
  transform-origin: 0.25em 0.25em;
}

.spoke {
  animation: spoke var(--dur) linear infinite;
  background: radial-gradient(100% 100% at center,hsl(0,0%,60%) 4.8%,hsla(0,0%,60%,0) 5%),
		linear-gradient(hsla(0,0%,55%,0) 46.9%,hsl(0,0%,65%) 47% 52.9%,hsla(0,0%,65%,0) 53%) 50% 50% / 99% 99% no-repeat;
}

/* Animations */
@keyframes hamster {
  from, to {
    transform: rotate(4deg) translate(-0.8em,1.85em);
  }

  50% {
    transform: rotate(0) translate(-0.8em,1.85em);
  }
}

@keyframes hamsterHead {
  from, 25%, 50%, 75%, to {
    transform: rotate(0);
  }

  12.5%, 37.5%, 62.5%, 87.5% {
    transform: rotate(8deg);
  }
}

@keyframes hamsterEye {
  from, 90%, to {
    transform: scaleY(1);
  }

  95% {
    transform: scaleY(0);
  }
}

@keyframes hamsterEar {
  from, 25%, 50%, 75%, to {
    transform: rotate(0);
  }

  12.5%, 37.5%, 62.5%, 87.5% {
    transform: rotate(12deg);
  }
}

@keyframes hamsterBody {
  from, 25%, 50%, 75%, to {
    transform: rotate(0);
  }

  12.5%, 37.5%, 62.5%, 87.5% {
    transform: rotate(-2deg);
  }
}

@keyframes hamsterFRLimb {
  from, 25%, 50%, 75%, to {
    transform: rotate(50deg) translateZ(-1px);
  }

  12.5%, 37.5%, 62.5%, 87.5% {
    transform: rotate(-30deg) translateZ(-1px);
  }
}

@keyframes hamsterFLLimb {
  from, 25%, 50%, 75%, to {
    transform: rotate(-30deg);
  }

  12.5%, 37.5%, 62.5%, 87.5% {
    transform: rotate(50deg);
  }
}

@keyframes hamsterBRLimb {
  from, 25%, 50%, 75%, to {
    transform: rotate(-60deg) translateZ(-1px);
  }

  12.5%, 37.5%, 62.5%, 87.5% {
    transform: rotate(20deg) translateZ(-1px);
  }
}

@keyframes hamsterBLLimb {
  from, 25%, 50%, 75%, to {
    transform: rotate(20deg);
  }

  12.5%, 37.5%, 62.5%, 87.5% {
    transform: rotate(-60deg);
  }
}

@keyframes hamsterTail {
  from, 25%, 50%, 75%, to {
    transform: rotate(30deg) translateZ(-1px);
  }

  12.5%, 37.5%, 62.5%, 87.5% {
    transform: rotate(10deg) translateZ(-1px);
  }
}

@keyframes spoke {
  from {
    transform: rotate(0);
  }

  to {
    transform: rotate(-1turn);
  }
}
.container2 {
  padding: 20px 20% 100px;
 
  font-family: Arial, sans-serif;
}

.container2 h2 {
  font-size: 26px;
  margin-bottom: 30px;
  color: #222;
  margin-top: 0;
  padding: 30px;
}

/* 레스토랑 카드 그리드 */
.restaurant-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(25%, 1fr));
  gap: 30px;
  height: 75vh; /* 화면 높이의 30% */
  min-height: 30vh; /* 너무 작아지지 않게 */
}

/* 개별 카드 */
.restaurant-card {
  background-color: #ffffff;
  border-radius: 12px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
  overflow: hidden;
  transition: transform 0.3s ease, box-shadow 0.3s ease;
  height: 100%;
}

.restaurant-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 6px 16px rgba(0, 0, 0, 0.15);
}

/* 카드 내 이미지 */
.restaurant-card img {
  width: 100%;
  height: 70%;
  object-fit: cover;
  display: block;
  border-radius: 12px;
}

/* 텍스트 정보 박스 */
.restaurant-info {
  padding: 5px 15px;
}

.restaurant-name {
  font-size: 17px;
  font-weight: bold;
  margin-bottom: 8px;
  color: #333;
}

.stars { 
  font-size: 15px;
  color: #00AA6C;
  margin-bottom: 5px;
}

.restaurant-reviews {
  font-size: 14px;
  color: #666;
  margin-bottom: 4px;
}

.restaurant-location {
  font-size: 13px;
  color: #999;
}
#nowPage{
  color: black;
  font-weight: bold;
}
.pageList{
  color: #aaaa7a;
  text-decoration: none; 
}
a {
  color: black;
  text-decoration: none; 
}
.nolist {
  width: 1000px;
  heigth: 400px;
  min-height: 30vh;
  margin: 20px auto;
  background-color: #fffdee;
  border-radius: 10px;
  display: flex;
  align-items: center; /* 수직 정렬 */
  justify-content: center; /* 수평 정렬 (선택) */
}
#detailmainBtn {
	background-color: #ffcc00;
	border: none;
	font-weight: bold;
	padding: 8px 10px;
	border-radius: 5px;
}
#detailmainBtn:hover {
	cursor: pointer;
}

</style>
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
