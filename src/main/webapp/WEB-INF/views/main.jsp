<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<link rel="stylesheet" href="css/base.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/slider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$(".areaSelectBtn").click(function(){
		var tp=$(this).val()
		
		$.ajax({
			type: "post",
			url: "mainSelectType",
			data: {"area":tp},
			success: function(data){
				$(".areaListView").html(data);
			},
			error: function(){
				alert("데이터를 가져오는 데 실패했습니다.");
			}
		});
	});
});
</script>
</head>
<body>

<div class="slider-container" id="slider-container">
    <div class="slider" id="slider">
      <div class="slide"><a href="#"><img alt="" src="image/banner1.JPG"></a></div>
      <div class="slide"><a href="#"><img alt="" src="image/food1.JPG"></a></div>
      <div class="slide"><a href="#"><img alt="" src="image/food2.JPG"></a></div>
    </div>
  </div>

<div class="ranking_div">
	<h2>인기 맛집</h2><br>

	<div class="listView clearfix">
	<c:forEach items="${list}" var="rank" varStatus="status">
		<div class="main_rankList">
			<a href="detailview?storecode=${rank.storecode}"><img src="image/${rank.storeimage}" class="storeimg"></a>
			<p><a href="detailview?storecode=${rank.storecode}">${rank.storename}</a></p>
			<div class="rating" id="rating_${status.index}_rank">
			  <input type="radio" id="star5_${status.index}" name="rating_rank_${status.index}" value="5" onclick="return(false);" />
			  <label for="star5_${status.index}"></label>
			  <input type="radio" id="star4_${status.index}" name="rating_rank_${status.index}" value="4" onclick="return(false);" />
			  <label for="star4_${status.index}"></label>
			  <input type="radio" id="star3_${status.index}" name="rating_rank_${status.index}" value="3" onclick="return(false);" />
			  <label for="star3_${status.index}"></label>
			  <input type="radio" id="star2_${status.index}" name="rating_rank_${status.index}" value="2" onclick="return(false);" />
			  <label for="star2_${status.index}"></label>
			  <input type="radio" id="star1_${status.index}" name="rating_rank_${status.index}" value="1" onclick="return(false);" />
			  <label for="star1_${status.index}"></label>
			</div><br>${rank.stars}
		
			<script>
			// 별점 셋팅 스크립트
			(function() {
				let rstars = Math.round(parseFloat('${rank.stars}'));
				let radio = document.querySelector('input[name="rating_rank_${status.index}"][value="' + rstars + '"]');
				if (radio) radio.checked = true;
			})();
			</script>
			
		</div>
	</c:forEach>
	</div>	
	
</div>




<div class="area_div" style="margin-top: 150px;">
	<h2>지역별 추천</h2><br><br>
	<input type="button" class="areaSelectBtn" id="area1" value="서울">&emsp;
	<input type="button" class="areaSelectBtn" id="area2" value="경기">&emsp;
	<input type="button" class="areaSelectBtn" id="area3" value="인천">&emsp;
	<div class="areaListView clearfix">
	<c:forEach items="${area}" var="aa" varStatus="status">
		<div class="main_areaList">
			<a href="detailview?storecode=${aa.storecode}"><img src="image/${aa.storeimage}" class="storeimg"></a>
			<p><a href="detailview?storecode=${aa.storecode}">${aa.storename}</a></p>
			<div class="rating" id="rating_${status.index}_area">
			  <input type="radio" id="star5_${status.index}" name="rating_area_${status.index}" value="5" readonly />
			  <label for="star5_${status.index}"></label>
			  <input type="radio" id="star4_${status.index}" name="rating_area_${status.index}" value="4" readonly />
			  <label for="star4_${status.index}"></label>
			  <input type="radio" id="star3_${status.index}" name="rating_area_${status.index}" value="3" readonly />
			  <label for="star3_${status.index}"></label>
			  <input type="radio" id="star2_${status.index}" name="rating_area_${status.index}" value="2" readonly />
			  <label for="star2_${status.index}"></label>
			  <input type="radio" id="star1_${status.index}" name="rating_area_${status.index}" value="1" readonly />
			  <label for="star1_${status.index}"></label>
			</div>&nbsp;${aa.stars}
		
			<script>
			// 별점 셋팅 스크립트
			(function() {
				let stars = Math.round(parseFloat('${aa.stars}'));
				let radio = document.querySelector('input[name="rating_area_${status.index}"][value="' + stars + '"]');
				if (radio) radio.checked = true;
			})();
			</script>
			
		</div>
	</c:forEach>
	</div>	
	
</div>
<br><br><br>
<!-- 
<div>
	<h2>카테고리별 추천</h2><br><br>
	<input type="button" class="categorySelectBtn" value="한식">&emsp;
	<input type="button" class="categorySelectBtn" value="중식">&emsp;
	<input type="button" class="categorySelectBtn" value="일식">&emsp;
	<input type="button" class="categorySelectBtn" value="양식">

	<div class="categoryListView">
	<c:forEach items="${category}" var="cc" varStatus="status">
		<div class="main_categoryList">
			<a href="detailview?storecode=${cc.storecode}"><img src="image/${cc.storeimage}" class="storeimg"></a>
			<p><a href="detailview?storecode=${cc.storecode}">${cc.storename}</a></p>
			<div class="rating" id="rating_${status.index}_cate">
			  <input type="radio" id="star5" name="rating_${status.index}_cate" value="5" readonly />
			  <label for="star5"></label>
			  <input type="radio" id="star4" name="rating_${status.index}_cate" value="4" readonly />
			  <label for="star4"></label>
			  <input type="radio" id="star3" name="rating_${status.index}_cate" value="3" readonly />
			  <label for="star3"></label>
			  <input type="radio" id="star2" name="rating_${status.index}_cate" value="2" readonly />
			  <label for="star2"></label>
			  <input type="radio" id="star1" name="rating_${status.index}_cate" value="1" readonly />
			  <label for="star1"></label>
			</div>&nbsp;${cc.stars}
		
			<script>
			// 별점 셋팅 스크립트
			(function() {
				let stars = Math.round(parseFloat('${cc.stars}'));
				let radio = document.querySelector('input[name="rating_${status.index}_cate"][value="' + stars + '"]');
				if (radio) radio.checked = true;
			})();
			</script>
			
		</div>
	</c:forEach>
	</div>

</div>
-->

<script src="js/slider.js"></script>
</body>
</html>
