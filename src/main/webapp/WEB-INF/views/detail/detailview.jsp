<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>카보정 갈비</title>
  
  <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
  <link rel="stylesheet" href="css/detailview.css">
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
    <div class="restaurant-header">
      <img src="./image/gab5.jpg" alt="레스토랑 사진">
      <div class="restaurant-info">
        <div class="title-like">
          <h1>카보정 갈비</h1>
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
        <div class="stars">★★★★★ (4.5)</div>
        <div class="location">경기도 수원시 팔달구 인계동</div>
        <p>한식 · 고기 요리 전문 · 가족 모임 추천</p>
      </div>
    </div>
   </div>
   
   <div class="container2">
    <div class="card">
      <div class="cardWrap">
        <ul>
          <li><img src="./image/gab1.jpg" alt="사진 1"></li>
          <li><img src="./image/gab2.jpg" alt="사진 2"></li>
          <li><img src="./image/gab3.jpg" alt="사진 3"></li>
          <li><img src="./image/gab4.jpg" alt="사진 4"></li>
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
          <h5>경기도 수원시 팔달구 인계동 30번길 65</h5>
          <p>주차 가능 / 수원역에서 10분 거리</p>
        </div>
      </div>
    </div>
   </div>
    
     <!-- 예약 모달 창 -->
  <div id="bookingModal" style="display:none;" class="modal">
    <div class="modal-content">
    <c:if test="${not empty error}">
    <div class="error-message" style="color: red; margin-bottom: 10px;">
            ${error}
        </div></c:if>
      <span class="close">&times;</span>
      <h4>예약하기</h4>
      <form id="bookingForm" method="post">
        <label for="saramsu">인원수:</label><br>
        <select id="saramsu" name="saramsu" required="required">
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
        <input type="date" id="bookingdate" name="bookingdate" pattern="\d{4}-\d{2}-\d{2}" required="required"><br><br>
        <label for="time">시간:</label><br>
        <input type="time" id="bookingtime" name="bookingtime" step="60" required="required" ><br><br>
        <!-- 나중에 join -->
        <input type="hidden" name="tablenum" value="1">
		<input type="hidden" name="storecode" value="1001">
        <input type="hidden" name="state" value="예약중">
        
        <button type="submit">예약하기</button>
      </form>
    </div>
  </div>
  

 <div class="container3">  
   <!-- 리뷰 작성 폼 -->
<div style="margin-top: 30px;">
  <form action="reviewsave" method="post">
    <h3>리뷰 작성하기</h3>

    <!-- 별점 -->
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
   
     <!-- 카카오 맵 임다 --> 
    <div class="location-section" id="location">
      <h2>위치</h2>
      <div class="map-wrapper">
        <!-- 여기에 지도를 넣습니다 -->
        <div id="map" style="width: 500px; height: 250px;"></div> <!-- 반드시 너비/높이 지정! -->
        <div class="address-box">
          <!-- 주소 텍스트 등 -->
          <h5>${storeInfo.address}</h5> <!-- 예시: DB에서 가져온 주소 표시 -->
          <p>주차 시설 완비</p>
        </div>
      </div>
    </div>
   
   <!-- detail 로 보내버릴 것 -->
   <script>
   const storeLatitude = ${storeInfo.lat};
   const storeLongitude = ${storeInfo.lon};
   const storeName = "${storeInfo.storename}"; 
   
   function initMap() {}
// 3. 카카오맵 SDK 비동기 로드 및 initMap 호출
   const script = document.createElement('script');
   script.src = `//dapi.kakao.com/v2/maps/sdk.js?appkey=47eccc1e7f407254053a2b138b0d08f4&autoload=false`; //
   // 이부분 My APP Key 47eccc1e7f407254053a2b138b0d08f4
   script.async = true;
   script.onload = () => {
       if (window.kakao && window.kakao.maps) {
           kakao.maps.load(initMap);
       } else { console.error("Kakao Maps SDK 로드 실패"); }
   };
   script.onerror = () => { console.error("Kakao Maps SDK 스크립트 로드 중 에러 발생"); };
   document.head.appendChild(script);
</script>
   
    <!-- 리뷰 내용 -->
    <textarea class="star_box" name="content" placeholder="리뷰를 작성해주세요" required></textarea>

    <!-- 리뷰 등록 버튼 -->
    <button type="submit" class="btn02" style="display: block; margin: 0 auto;">리뷰 등록하기</button>
  </form>
</div>
   
   
   <h2>리뷰</h2>
    <div class="review-section" id="reviews">    
      <div class="review">
        <h4>김철수</h4>
        <div class="stars">★★★★☆</div>
        <p>고기가 정말 부드럽고 서비스도 친절했어요!</p>
      </div>
      <div class="review">
        <h4>박영희</h4>
        <div class="stars">★★★★★</div>
        <p>가족끼리 방문했는데 다들 만족했어요. 재방문의사 100%</p>
      </div>
    </div>
  </div>

  
  
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  <!-- 예약 모달 js 임다 -->
  <script src="js/booking.js"></script>
  
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
    });
   </script>

</body>
</html>
