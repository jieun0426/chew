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
      <div class="slide">      
          <img alt="" src="image/ban(1).png">
          <div class="slide-text"></div>      
      </div>  
      <div class="slide">     
          <img alt="" src="image/ban(2).png">
          <div class="slide-text"></div>  
      </div>
      <div class="slide">   
          <img alt="" src="image/ban(3).png">
          <div class="slide-text"></div>
      </div>
    </div>
</div>

<div class="loader">
  <div class="loader__bar"></div>
  <div class="loader__bar"></div>
  <div class="loader__bar"></div>
  <div class="loader__bar"></div>
  <div class="loader__bar"></div>
  <div class="loader__ball"></div>
</div>


<div class="ranking_div">
   <h2>맛집/음식점 추천 순위 Best 3</h2>
   <p>사용자 리뷰를 기반으로 한 랭킹입니다.</p>

   <div class="listView clearfix">
 <c:forEach items="${list}" var="rank" varStatus="status">
    <div class="main_rankList">
        <a href="detailview?storecode=${rank.storecode}">
            <img src="image/${rank.storeimage}" class="storeimg">
        </a>
        <h1><a href="detailview?storecode=${rank.storecode}">${rank.storename}</a></h1>
        
        <div class="rating" id="rating_${status.index}_rank">
            <div class="stars" id="stars_${status.index}">
                <!-- 여기서 input은 별점 표시용이고, checked가 되면 별색을 바꿔주는 방식 -->
                <input type="radio" id="star5_${status.index}" name="rating_rank_${status.index}" value="5" readonly />
                <label for="star5_${status.index}"></label>
                <input type="radio" id="star4_${status.index}" name="rating_rank_${status.index}" value="4" readonly />
                <label for="star4_${status.index}"></label>
                <input type="radio" id="star3_${status.index}" name="rating_rank_${status.index}" value="3" readonly />
                <label for="star3_${status.index}"></label>
                <input type="radio" id="star2_${status.index}" name="rating_rank_${status.index}" value="2" readonly />
                <label for="star2_${status.index}"></label>
                <input type="radio" id="star1_${status.index}" name="rating_rank_${status.index}" value="1" readonly />
                <label for="star1_${status.index}"></label>
            </div>
        </div>
        
        <p class="star-score" style="margin-bottom: 0;">평균 별점 ${rank.stars}</p>   
        
        <script>
        // 별점 셋팅 스크립트
        (function() {
            let rstars = Math.round(parseFloat('${rank.stars}')); // 평균 별점을 반올림
            let radio = document.querySelector('input[name="rating_rank_${status.index}"][value="' + rstars + '"]');
            if (radio) radio.checked = true; // 해당 별을 체크
        })();
        </script>
    </div>
</c:forEach>
 
   </div>   
   
</div>



		<svg class="pl" viewBox="0 0 160 160" width="160px" height="160px" xmlns="http://www.w3.org/2000/svg">
			<defs>
				<linearGradient id="grad" x1="0" y1="0" x2="0" y2="1">
					<stop offset="0%" stop-color="#000"></stop>
					<stop offset="100%" stop-color="#fff"></stop>
				</linearGradient>
				<mask id="mask1">
					<rect x="0" y="0" width="160" height="160" fill="url(#grad)"></rect>
				</mask>
				<mask id="mask2">
					<rect x="28" y="28" width="104" height="104" fill="url(#grad)"></rect>
				</mask>
			</defs>
			
			<g>
				<g class="pl__ring-rotate">
					<circle class="pl__ring-stroke" cx="80" cy="80" r="72" fill="none" stroke="hsl(223,90%,55%)" stroke-width="16" stroke-dasharray="452.39 452.39" stroke-dashoffset="452" stroke-linecap="round" transform="rotate(-45,80,80)"></circle>
				</g>
			</g>
			<g mask="url(#mask1)">
				<g class="pl__ring-rotate">
					<circle class="pl__ring-stroke" cx="80" cy="80" r="72" fill="none" stroke="hsl(193,90%,55%)" stroke-width="16" stroke-dasharray="452.39 452.39" stroke-dashoffset="452" stroke-linecap="round" transform="rotate(-45,80,80)"></circle>
				</g>
			</g>
			
			<g>
				<g stroke-width="4" stroke-dasharray="12 12" stroke-dashoffset="12" stroke-linecap="round" transform="translate(80,80)">
					<polyline class="pl__tick" stroke="hsl(223,10%,90%)" points="0,2 0,14" transform="rotate(-135,0,0) translate(0,40)"></polyline>
					<polyline class="pl__tick" stroke="hsl(223,10%,90%)" points="0,2 0,14" transform="rotate(-90,0,0) translate(0,40)"></polyline>
					<polyline class="pl__tick" stroke="hsl(223,10%,90%)" points="0,2 0,14" transform="rotate(-45,0,0) translate(0,40)"></polyline>
					<polyline class="pl__tick" stroke="hsl(223,10%,90%)" points="0,2 0,14" transform="rotate(0,0,0) translate(0,40)"></polyline>
					<polyline class="pl__tick" stroke="hsl(223,10%,90%)" points="0,2 0,14" transform="rotate(45,0,0) translate(0,40)"></polyline>
					<polyline class="pl__tick" stroke="hsl(223,10%,90%)" points="0,2 0,14" transform="rotate(90,0,0) translate(0,40)"></polyline>
					<polyline class="pl__tick" stroke="hsl(223,10%,90%)" points="0,2 0,14" transform="rotate(135,0,0) translate(0,40)"></polyline>
					<polyline class="pl__tick" stroke="hsl(223,10%,90%)" points="0,2 0,14" transform="rotate(180,0,0) translate(0,40)"></polyline>
				</g>
			</g>
			<g mask="url(#mask1)">
				<g stroke-width="4" stroke-dasharray="12 12" stroke-dashoffset="12" stroke-linecap="round" transform="translate(80,80)">
					<polyline class="pl__tick" stroke="hsl(223,90%,80%)" points="0,2 0,14" transform="rotate(-135,0,0) translate(0,40)"></polyline>
					<polyline class="pl__tick" stroke="hsl(223,90%,80%)" points="0,2 0,14" transform="rotate(-90,0,0) translate(0,40)"></polyline>
					<polyline class="pl__tick" stroke="hsl(223,90%,80%)" points="0,2 0,14" transform="rotate(-45,0,0) translate(0,40)"></polyline>
					<polyline class="pl__tick" stroke="hsl(223,90%,80%)" points="0,2 0,14" transform="rotate(0,0,0) translate(0,40)"></polyline>
					<polyline class="pl__tick" stroke="hsl(223,90%,80%)" points="0,2 0,14" transform="rotate(45,0,0) translate(0,40)"></polyline>
					<polyline class="pl__tick" stroke="hsl(223,90%,80%)" points="0,2 0,14" transform="rotate(90,0,0) translate(0,40)"></polyline>
					<polyline class="pl__tick" stroke="hsl(223,90%,80%)" points="0,2 0,14" transform="rotate(135,0,0) translate(0,40)"></polyline>
					<polyline class="pl__tick" stroke="hsl(223,90%,80%)" points="0,2 0,14" transform="rotate(180,0,0) translate(0,40)"></polyline>
				</g>
			</g>
			
			<g>
				<g transform="translate(64,28)">
					<g class="pl__arrows" transform="rotate(45,16,52)">
						<path fill="hsl(3,90%,55%)" d="M17.998,1.506l13.892,43.594c.455,1.426-.56,2.899-1.998,2.899H2.108c-1.437,0-2.452-1.473-1.998-2.899L14.002,1.506c.64-2.008,3.356-2.008,3.996,0Z"></path>
						<path fill="hsl(223,10%,90%)" d="M14.009,102.499L.109,58.889c-.453-1.421,.559-2.889,1.991-2.889H29.899c1.433,0,2.444,1.468,1.991,2.889l-13.899,43.61c-.638,2.001-3.345,2.001-3.983,0Z"></path>
					</g>
				</g>
			</g>
			<g mask="url(#mask2)">
				<g transform="translate(64,28)">
					<g class="pl__arrows" transform="rotate(45,16,52)">
						<path fill="hsl(333,90%,55%)" d="M17.998,1.506l13.892,43.594c.455,1.426-.56,2.899-1.998,2.899H2.108c-1.437,0-2.452-1.473-1.998-2.899L14.002,1.506c.64-2.008,3.356-2.008,3.996,0Z"></path>
						<path fill="hsl(223,90%,80%)" d="M14.009,102.499L.109,58.889c-.453-1.421,.559-2.889,1.991-2.889H29.899c1.433,0,2.444,1.468,1.991,2.889l-13.899,43.61c-.638,2.001-3.345,2.001-3.983,0Z"></path>
					</g>
				</g>
			</g>
		</svg>



 
<div class="area_div" >
    <h2>지역별추천</h2>
    <p>해당 지역에서 인기 있는 맛집을 소개합니다.</p>
    <div class="areaSelectContainer">
        <input type="button" class="areaSelectBtn" id="area1" value="서울" style="background-image: url('image/seoul.jpg');">
        <input type="button" class="areaSelectBtn" id="area2" value="경기" style="background-image: url('image/gyeonggi.jpg');">
        <input type="button" class="areaSelectBtn" id="area3" value="인천" style="background-image: url('image/incheon.jpg');">
    </div>
    
    <h3 id="selectedAreaText" style="font-size: 25px; color: #FCAB64; padding: 50px;"></h3>

    <div class="areaListView clearfix">
    <c:forEach items="${area}" var="aa" varStatus="status">
        <div class="main_areaList">
            <a href="detailview?storecode=${aa.storecode}">
                <img src="image/${aa.storeimage}" class="storeimg">
            </a>
            <p><a href="detailview?storecode=${aa.storecode}">${aa.storename}</a></p>

            <div class="rating" id="rating_${status.index}">
                <div class="stars" id="stars_${status.index}">
                    <input type="radio" id="star1_${status.index}" name="rating_area_${status.index}" value="1" readonly />
                    <label for="star1_${status.index}"></label>
                    <input type="radio" id="star2_${status.index}" name="rating_area_${status.index}" value="2" readonly />
                    <label for="star2_${status.index}"></label>
                    <input type="radio" id="star3_${status.index}" name="rating_area_${status.index}" value="3" readonly />
                    <label for="star3_${status.index}"></label>
                    <input type="radio" id="star4_${status.index}" name="rating_area_${status.index}" value="4" readonly />
                    <label for="star4_${status.index}"></label>
                    <input type="radio" id="star5_${status.index}" name="rating_area_${status.index}" value="5" readonly />
                    <label for="star5_${status.index}"></label>
                </div>
            </div>
            <p class="star-score">평균 별점 ${aa.stars}</p>

            <script>
                // 별점 셋팅 스크립트
                (function() {
                    let rstars = Math.round(parseFloat('${aa.stars}')); // 평균 별점을 반올림
                    let radio = document.querySelector('input[name="rating_area_${status.index}"][value="' + rstars + '"]');
                    if (radio) radio.checked = true; // 해당 별을 체크
                })();
            </script>
        </div>
    </c:forEach>
</div>
    
</div>

<br><br><br>


<script src="js/slider.js"></script>
<script>
  // 지역 버튼에 이벤트 추가
  document.addEventListener('DOMContentLoaded', function () {
    const areaButtons = document.querySelectorAll('.areaSelectBtn');
    const selectedAreaText = document.getElementById('selectedAreaText');

    areaButtons.forEach(btn => {
      btn.addEventListener('click', function () {
        const areaName = this.value;
        selectedAreaText.textContent = areaName + ' 추천 맛집';
      });
    });
  });
</script>



</body>
</html>
