<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
<div id="banner">
	<img alt="" src="image/banner1.JPG" width="1200px" height="400px" id="bannerImg">
</div>
<br><br><br>
<div>
	<h2>지역별 추천</h2><br><br>
	<input type="button" class="areaSelectBtn" value="서울">&emsp;
	<input type="button" class="areaSelectBtn" value="경기">&emsp;
	<input type="button" class="areaSelectBtn" value="인천">&emsp;
	<div class="listView">
	<c:forEach begin="1" end="3" >
	<div class="main_areaList">
			<a href="#"><img src="image/food1.JPG" class="storeimg"></a>
			<p><a href="#">DB는언제쯤</a></p>
			<div class="rating">
			  <input type="radio" id="star5" name="rating" value="5" />
			  <label for="star5"></label>
			  <input type="radio" id="star4" name="rating" value="4" />
			  <label for="star4"></label>
			  <input type="radio" id="star3" name="rating" value="3" />
			  <label for="star3"></label>
			  <input type="radio" id="star2" name="rating" value="2" />
			  <label for="star2"></label>
			  <input type="radio" id="star1" name="rating" value="1" />
			  <label for="star1"></label>
			</div>
		</div>
	</c:forEach>
	</div>	
	
	
</div>
<br><br><br>
<div>
	<h2>카테고리별 추천</h2><br><br>
	<input type="button" class="categorySelectBtn" value="한식">&emsp;
	<input type="button" class="categorySelectBtn" value="중식">&emsp;
	<input type="button" class="categorySelectBtn" value="일식">&emsp;
	<input type="button" class="categorySelectBtn" value="양식">

	<div class="listView">
	<c:forEach begin="1" end="3" >
		<div class="main_areaList">
			<a href="#"><img src="image/food1.JPG" class="storeimg"></a>
			<p><a href="#">혼자 봄이 왔냐</a></p>
			<div class="rating">
			  <input type="radio" id="star5" name="rating" value="5" />
			  <label for="star5"></label>
			  <input type="radio" id="star4" name="rating" value="4" />
			  <label for="star4"></label>
			  <input type="radio" id="star3" name="rating" value="3" />
			  <label for="star3"></label>
			  <input type="radio" id="star2" name="rating" value="2" />
			  <label for="star2"></label>
			  <input type="radio" id="star1" name="rating" value="1" />
			  <label for="star1"></label>
			</div>
		</div>
	</c:forEach>
	</div>	

</div>

<br><br><br><br><br><br><br>
</body>
</html>
