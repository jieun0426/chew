<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>카보정 갈비</title>
  <style>
    body {
      font-family: 'Arial', sans-serif;
      margin: 0;
      padding: 0;
      background-color: #FBF8EF;
    }
    .container1 {
      max-width: 1000px;
      margin: 30px auto;
      background: white;
      padding: 20px;
      border-radius: 10px;
    }
    
    .container2 {
      max-width: 1000px;
      margin: 30px auto;
      background: white;
      padding: 20px;
      border-radius: 10px;
    }
    
    .container3 {
      max-width: 1000px;
      margin: 30px auto;
      background: white;
      padding: 20px;
      border-radius: 10px;
      background-color: #FFFFFF;
    }

    .top-nav {
      position: sticky;
      top: 0;
      z-index: 500;
      background: rgba(255, 255, 255, 0.95);
      backdrop-filter: blur(4px);
      border-bottom: 1px solid #ddd;
      padding: 13px 20px;  
      background-color: #F3E2A9;
      
    }
    .top-nav ul {
      list-style: none;
      display: flex;
      justify-content: center;
      gap: 30px;
      margin: 0;
      padding: 0;
    }
    .top-nav a {
      text-decoration: none;
      font-weight: bold;
      color: #333;
    }
    .top-nav a:hover {
      color: #f52121;
    }

    .restaurant-header {
      display: flex;
      align-items: center;
      gap: 20px;
    }
    .restaurant-header img {
      width: 200px;
      height: 150px;
      border-radius: 10px;
      object-fit: cover;
    }
    .restaurant-info h1 {
      margin: 0;
    }
    .stars {
      color: #ffc107;
      font-size: 20px;
    }
    .location {
      color: #666;
    }

    .title-like {
      display: flex;
      align-items: center;
      gap: 10px;
    }

    .like-wrapper {
      font-size: 12px;
      background: none;
      box-shadow: none;
      display: inline-flex;
      align-items: center;
      padding: 0.2em 0.4em;
      border: 0.1em solid #313131;
      border-radius: 0.35em;
      cursor: pointer;
      gap: 0.3em;
    }
    .like-wrapper .check { display: none; }
    .like-wrapper .like-btn {
      display: flex;
      align-items: center;
      gap: 0.3em;
    }
    .like-wrapper .icon {
      width: 1em;
      height: 1em;
      fill: white;
      transition: transform 0.2s ease-in-out;
    }
    .like-wrapper .icon.active {
      display: none;
      fill: #f52121;
    }
    .like-wrapper .check:checked + .like-btn .icon.active {
      display: inline-block;
      animation: wiggle 0.5s ease-in-out;
    }
    .like-wrapper .check:checked + .like-btn .icon.inactive {
      display: none;
    }
    .like-wrapper .like-text {
      font-weight: bold;
      color: black;
      line-height: 1;
    }
    @keyframes wiggle {
      0%,100% { transform: rotate(0deg); }
      25%     { transform: rotate(-10deg); }
      50%     { transform: rotate(10deg); }
      75%     { transform: rotate(-10deg); }
    }

    .card {
      position: relative;
      display: flex;
      justify-content: center;
      align-items: center;
      width: 100%;
      max-width: 1000px;
      height: 500px;
      margin: 30px auto;
    }
    .cardWrap {
      position: relative;
      width: 800px;
      height: 500px;
      overflow: hidden;
    }
    .cardWrap ul {
      position: absolute;
      display: flex;
      width: calc((800px + 20px) * 4);
      height: 500px;
      left: 0;
      margin: 0;
      padding: 0;
      list-style: none;
    }
    .cardWrap ul li {
      width: 800px;
      height: 500px;
      margin: 0 10px;
      flex-shrink: 0;
    }
    .cardWrap ul li img {
      width: 100%;
      height: 100%;
      object-fit: cover;
      display: block;
    }
    button.prev, button.next {
      position: absolute;
      top: 50%;
      transform: translateY(-50%);
      font-size: 50px;
      border: none;
      background: none;
      cursor: pointer;
      color: #333;
    }
    button.prev { left: 0; }
    button.next { right: 0; }

   .review-section {
  padding: 20px;
  max-width: 600px;
  margin: 0 auto;
}

.review {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  border: 1px solid #ddd;
  border-radius: 12px;
  padding: 15px;
  margin-bottom: 20px;
  margin-top: 50px;
  background-color: #fefefe;
  box-shadow: 0 2px 4px rgba(0,0,0,0.05);
}
.review-id {
  font-size: 13px;
  color: #888;
}

.review-stars {
  font-size: 22px;
  color: #f1c40f;
  margin-bottom: 8px;
}

.review-title {
  font-size: 16px;
  font-weight: bold;
  color: #333;
  margin-bottom: 6px;
}

.review-content {
  font-size: 14px;
  color: #555;
  margin-bottom: 10px;
}


   
   

    .map-wrapper {
      display: flex;
      gap: 20px;
      align-items: center;
    }
    #map {
      width: 35%;
      height: 250px;
      margin-left: 70px;
    }
    .address-box {
      flex: 1;
    }
    .modal {
      position: fixed;
      z-index: 2000;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      overflow: auto;
      background-color: rgba(0,0,0,0.5);
    }
    .modal-content {
      background-color: #fff;
      margin: 10% auto;
      padding: 30px;
      border-radius: 10px;
      width: 400px;
      box-shadow: 0 4px 8px rgba(0,0,0,0.3);
    }
    .close {
      color: #aaa;
      float: right;
      font-size: 28px;
      cursor: pointer;
    }
    .close:hover {
      color: black;
    }
    
.review_form {
  display: flex;
  flex-direction: column;
  width: 100%;
  align-items: center;
}

.review_title {
  width: 600px;
  box-sizing: border-box;
  display: inline-block;
  margin: 15px 0 0 0;
  background: #fff;
  border: 1px solid #ccc;
  border-radius: 10px;
  height: 40px;
  padding: 10px 15px;
  font-size: 13px;
  font-family: sans-serif;
  font-weight: bold;
}

.star_box {
  width: 600px;
  box-sizing: border-box;
  display: inline-block;
  margin: 15px 0;
  background: #F3F4F8;
  border: 0;
  border-radius: 10px;
  height: 100px;
  resize: none;
  padding: 15px;
  font-size: 13px;
  font-family: sans-serif;
}


.btn02 {
  display:block;
  width: 600px;
  font-weight: bold;
  border: 0;
  border-radius: 10px;
  max-height: 50px;
  padding: 15px 0;
  font-size: 1.1em;
  text-align: center;
  background:bisque;
}
.rating:not(:checked) > input {
  position: absolute;
  appearance: none;
}

.rating:not(:checked) > label {
  float: right;
  cursor: pointer;
  font-size: 30px;
  color: #666;
}

.rating:not(:checked) > label:before {
  content: '★';
}

.rating > input:checked + label:hover,
.rating > input:checked + label:hover ~ label,
.rating > input:checked ~ label:hover,
.rating > input:checked ~ label:hover ~ label,
.rating > label:hover ~ input:checked ~ label {
  color: #e58e09;
}

.rating:not(:checked) > label:hover,
.rating:not(:checked) > label:hover ~ label {
  color: #ff9e0b;
}

.rating > input:checked ~ label {
  color: #ffa723;
}
.review_logout_box {
	text-align: center;
	margin: 10px 190px 20px;
	padding: 20px 180px;
	background-color:#f2f2f2;
	border-radius: 12px;
}

#moreReviewBtn {
	width: 600px;
	background-color: white;
	font-size: 1em;
	border-radius: 5px;
	border: 1px solid #d3d3d3;
	margin-top: 20px;
	margin-bottom: 50px;
	padding: 7px;
}
#moreReviewBtn:hover {
	/* border: 1px solid #f3e2a9; 
	box-shadow: 0 0 0 4px rgb(255 219 90 / 5%); */
	cursor: pointer;
}

  </style>

  <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script>
  const storecode = "${ddto.storecode}";
</script>
</head>
<body>

  <header class="top-nav">
    <nav>
      <ul>
        <li><a href="#home">홈</a></li>
        <li><a href="#location">오시는길</a></li>
        <li><a href="#reviews">리뷰</a></li>
        <li><a href="#" id="openModalBtn">예약하기</a></li>
      </ul>
    </nav>
  </header>

  <div class="container1">
    <div class="restaurant-header" id="home">
      <img src="${ddto.storeimage}" alt="레스토랑 사진">
      <div class="restaurant-info">
        <div class="title-like">
          <h1>${ddto.storename}</h1>
          <label class="like-wrapper">
            <input type="checkbox" class="check">
            <div class="like-btn">
              <svg class="icon inactive" viewBox="0 0 24 24">
                <path d="M12.1 8.64l-.1.1-.11-.11C10.14 6.7 7.5 6.7 5.7 8.5c-1.8 1.8-1.8 4.6 0 6.4l6.4 6.4 6.4-6.4c1.8-1.8 1.8-4.6 0-6.4-1.8-1.8-4.6-1.8-6.4 0z"
                      fill="none" stroke="currentColor" stroke-width="2"/>
              </svg>
              <svg class="icon active" viewBox="0 0 24 24">
                <path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 
                         4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 
                         14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 
                         6.86-8.55 11.54L12 21.35z"/>
              </svg>
              <span class="like-text">Like</span>
            </div>
          </label>
        </div>
       <c:set var="fullStars" value="${avgStars - (avgStars % 1)}" />
       <c:set var="emptyStars" value="${5 - fullStars}" />

       <div class="stars">
          <c:forEach var="i" begin="1" end="${fullStars}">
            ★
          </c:forEach>
          <c:forEach var="i" begin="1" end="${emptyStars}">
            ☆
          </c:forEach>
          (${avgStars})
       </div>
       
        <div class="location">${ddto.storeaddress}</div>
        <p>${ddto.storecategory}</p>
      </div>
    </div>
   </div>
   
   <div class="container2">
    <div class="card">
      <div class="cardWrap">
        <ul id="imageList">
         <c:forEach var="image" items="${imagelist}">
           <li>
           <img src="${pageContext.request.contextPath}/images/${image.image_filename}" alt="Store Image">
           </li>
         </c:forEach>
        </ul>
      </div>
      <button class="prev"><i class='bx bxs-chevron-left'></i></button>
      <button class="next"><i class='bx bxs-chevron-right'></i></button>
    </div>

    <div class="location-section" id="location">
      <h2>위치</h2> 
      <div class="map-wrapper">
        <div id="map"></div>
        <div class="address-box">
          <h5>${ddto.storeaddress}</h5>
          <p>주차 가능여부 테이블 넣어줘요</p>
        </div>
      </div>
    </div>
   </div>
    
     <!-- 예약 모달 창 -->
  <div id="reservationModal" style="display:none;" class="modal">
    <div class="modal-content">
      <span class="close">&times;</span>
      <h4>예약하기</h4>
      <form id="reservationForm">
        <label for="name">성함:</label><br>
        <input type="text" id="name" name="name"><br><br>
        <label for="people">인원수:</label><br>
        <select id="people" name="people">
        <option value="1">1명</option>
        <option value="2">2명</option>
        <option value="3">3명</option>
        <option value="4">4명</option>
        <option value="5">5명</option>
        <option value="6">6명</option>
        <option value="7">7명</option>
        <option value="8">8명</option>
        <option value="9">9명</option>
        <option value="10">10명 이상</option>
        </select><br><br>
        <label for="date">날짜:</label><br>
        <input type="date" id="date" name="date"><br><br>
        <label for="time">시간:</label><br>
        <input type="time" id="time" name="time"><br><br>
        <button type="submit">예약하기</button>
      </form>
    </div>
  </div>
  

<div class="container3">  
<!-- 리뷰 작성 폼 -->
<div class="review-form" style="margin-top: 30px;">
 <form action="submitReview" method="post" class="review_form">
  <h3>리뷰 작성하기</h3>
  <p>식사는 만족스러우셨나요?</p>
  <c:choose>
  	<c:when test="${loginstate == false}">
  		<div class="review_logout_box">
	    	<p>리뷰 작성은 <a href="loginput" style="color: blue; text-decoration: underline; font-weight: bold;">로그인</a>이 필요합니다.</p>
	    </div>
  	</c:when>
  	<c:otherwise>
  		<!-- 고정된 사용자 ID -->
		<input type="hidden" name="id" value="testuser">
		
		<!-- storecode는 해당 가게의 코드 -->
		<input type="hidden" name="storecode" value="${ddto.storecode}">
		
		<!-- 별점 선택 -->
		<div style="text-align: center;">
		    <div class="rating" style="display: inline-block;">
		    	<input value="5" name="stars" id="star5" type="radio">
		    	<label title="5점" for="star5"></label>
		    	<input value="4" name="stars" id="star4" type="radio">
		    	<label title="4점" for="star4"></label>
		    	<input value="3" name="stars" id="star3" type="radio" checked>
		    	<label title="3점" for="star3"></label>
		    	<input value="2" name="stars" id="star2" type="radio">
		    	<label title="2점" for="star2"></label>
		    	<input value="1" name="stars" id="star1" type="radio">
		    	<label title="1점" for="star1"></label>
		    </div>
		</div>
		  
		<!-- 제목 입력칸 -->
		<input type="text" name="title" class="review_title" placeholder="리뷰 제목을 입력해주세요" required>
		
		<!-- 리뷰 내용 입력 -->
		<textarea class="star_box" name="content" placeholder="리뷰를 작성해주세요" required></textarea>
		
		<!-- 리뷰 등록 버튼 -->
		<button type="submit" class="btn02" style="display: block; margin: 0 auto; margin-bottom: 100px;">리뷰 등록하기</button>

  	</c:otherwise>
  </c:choose>
  
</form>
 
</div>
   
<div class="review-section" id="reviews">
    <h2>리뷰</h2>

    <c:forEach var="r" items="${list}">
        <div class="review">
            <div class="review-header">
                <span class="review-avatar-emoji">👤</span>
                <span class="review-id">${r.id}</span>
            </div>
            <div class="review-stars">
                <c:forEach var="i" begin="1" end="${r.stars}">
                    ★
                </c:forEach>
                <c:forEach var="i" begin="${r.stars + 1}" end="5">
                    ☆
                </c:forEach>
            </div>
            <div class="review-title">${r.title}</div>
            <div class="review-content">${r.content}</div>
        </div>
    </c:forEach>
    
</div>
<button id="moreReviewBtn" data-state="more">리뷰 더 보기</button>
<!-- hasMore 플래그를 data 속성으로 -->
<div id="moreFlag" data-hasmore="${hasMore}"></div>


</div>

  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cc847f687b096a45e3012f1089780b4f"></script>
  <script>
    var mapContainer = document.getElementById('map'),
        mapOption = { 
            center: new kakao.maps.LatLng(33.450701, 126.570667),
            level: 3 
        };
    var map = new kakao.maps.Map(mapContainer, mapOption); 
    var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 
    var marker = new kakao.maps.Marker({
        position: markerPosition
    });
    marker.setMap(map);
  </script>

  
  <script>
  
	$(document).ready(function(){
		let i = 0,
		$slides = $('.cardWrap ul'),
		$items = $('.cardWrap ul li'),
		slideCount = $items.length;

		function goToSlide(index) {
	        if (index < 0) index = 0;
	        if (index >= slideCount) index = slideCount - 1;
	        const shift = (800 + 20) * index;
	        $slides.animate({ left: -shift + 'px' }, 300);
	        i = index;
	        updateNav();
		}
	
		function updateNav() {
			$('.prev').toggle(i > 0);
	        $('.next').toggle(i < slideCount - 1);
		}
	
		$('.prev').click(() => goToSlide(i - 1));
		$('.next').click(() => goToSlide(i + 1));
	
		updateNav();
	      
		let reviewOffset = 5;

		$('#moreReviewBtn').click(function () {
		    const $btn = $(this);
		    console.log("storecode: ", storecode);
		    if ($btn.data("state") === "more") {
		        $.ajax({
		            url: "loadMoreReviews",
		            method: "GET",
		            data: {
		                storecode: storecode,
		                offset: reviewOffset,
		                limit: 6
		            },
		            success: function (data) {
		                const $temp = $('<div>').html(data);
		                const reviews = $temp.find('.review');
		                const hasMore = $temp.find('#moreFlag').data("hasmore");

		                // 5개만 append
		                $("#reviews").append(reviews);
		                reviewOffset += reviews.length;

		                if (!hasMore) {
		                    $btn.text("접기").data("state", "fold");
		                    return;
		                }
		            },
		            error: function () {
		                alert("리뷰를 불러오는 데 실패했습니다.");
		            }
		        });

		    } else if ($btn.data("state") === "fold") {
		        $("#reviews .review").slice(5).remove();
		        reviewOffset = 5;
		        $btn.text("리뷰 더 보기").data("state", "more");
		        
		        document.getElementById("reviews").scrollIntoView({ behavior: 'smooth' });
		    }
		});
	});
    $(function() {
        const modal = $('#reservationModal');
        const openBtn = $('#openModalBtn');
        const closeBtn = $('.close');

        openBtn.on('click', function(e) {
          e.preventDefault();
          modal.fadeIn();
        });

        closeBtn.on('click', function() {
          modal.fadeOut();
        });

        $(window).on('click', function(e) {
          if ($(e.target).is(modal)) {
            modal.fadeOut();
          }
        });
        
        //예약완료 알림처리
        $('#reservationForm').on('submit', function(e) {
            e.preventDefault(); // 실제 전송 방지
            alert('예약이 완료되었습니다!');
            modal.fadeOut(); // 알림 후 모달 닫기
            this.reset(); // 폼 초기화
          });     
      });
    

  
 

    
  </script>
</body>
</html>
