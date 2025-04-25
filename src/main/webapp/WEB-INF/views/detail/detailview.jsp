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
      z-index: 1000;
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

    .title{
      text-align: center;
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
  height: 500px;
  left: 0;
  top: 0;
  margin: 0;
  padding: 0;
  list-style: none;
  transition: left 0.3s;
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
button.prev,
button.next {
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
	.restaurant-info p {
	  display: inline-block;
	  margin-right: 15px; 
	  color: #666;
	}

    #heart {
  display: none;
}

.like-button {
  position: relative;
  cursor: pointer;
  display: flex;
  height: 48px;
  width: 136px;
  border-radius: 16px;
  border: none;
  background-color: white;
  overflow: hidden;
  box-shadow:
    inset -2px -2px 5px rgba(255, 255, 255, 0.2),
    inset 2px 2px 5px rgba(0, 0, 0, 0.1),
    4px 4px 10px rgba(0, 0, 0, 0.4),
    -2px -2px 8px rgba(255, 255, 255, 0.1);
}

.like {
  width: 70%;
  height: 100%;
  display: flex;
  cursor: pointer;
  align-items: center;
  justify-content: space-evenly;
}

.like-icon {
  fill: #505050;
  height: 28px;
  width: 28px;
}

.like-text {
  color: black;
  font-size: 16px;
  font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
}

.like-count {
  position: absolute;
  right: 0;
  width: 30%;
  height: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  color: gray;
  font-size: 16px;
  border-left: 2px solid #4e4e4e;
  transition: all 0.5s ease-out;
}

.like-count.two {
  transform: translateY(40px);
}

.on:checked ~ .like .like-icon {
  fill: #fc4e4e;
  animation: enlarge 0.2s ease-out 1;
  transition: all 0.2s ease-out;
}

.on:checked ~ .like-count.two {
  transform: translateX(0);
  color: black;
}

.on:checked ~ .like-count.one {
  transform: translateY(-40px);
}

@keyframes enlarge {
  0% {
    transform: scale(0.5);
  }
  100% {
    transform: scale(1.2);
  }
}
     
  </style>

  <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
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
      <img src="image/${ddto.storeimage}" alt="레스토랑 사진">
      <div class="restaurant-info">
        <div class="title"><h1>${ddto.storename}</h1></div>
        
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
        <p>🍴 ${ddto.storecategory}</p>
        <p>🕒 ${ddto.storehours}</p>    
      </div>
      <!-- 좋아요 버튼 영역 -->
      <input type="hidden" id="storecode" value="${ddto.storecode}" />
	  <div class="like-button">
	  <input class="on" id="heart" type="checkbox" />
	  <label class="like" for="heart">
		   <svg
	      class="like-icon"
	      fill-rule="nonzero"
	      viewBox="0 0 24 24"
	      xmlns="http://www.w3.org/2000/svg"
	    >
	      <path
	        d="m11.645 20.91-.007-.003-.022-.012a15.247 15.247 0 0 1-.383-.218 25.18 25.18 0 0 1-4.244-3.17C4.688 15.36 2.25 12.174 2.25 8.25 2.25 5.322 4.714 3 7.688 3A5.5 5.5 0 0 1 12 5.052 5.5 5.5 0 0 1 16.313 3c2.973 0 5.437 2.322 5.437 5.25 0 3.925-2.438 7.111-4.739 9.256a25.175 25.175 0 0 1-4.244 3.17 15.247 15.247 0 0 1-.383.219l-.022.012-.007.004-.003.001a.752.752 0 0 1-.704 0l-.003-.001Z"
	      ></path>
	    </svg>
	    <span class="like-text">Likes</span>
	  </label>
	  <span class="like-count one">${ddto.storelikes}</span>
	  <span class="like-count two">${ddto.storelikes}</span>
	</div>

<!-- 숨겨진 storecode 값 -->
<input type="hidden" id="storecode" value="${ddto.storecode}" />
		

<!-- 숨겨진 storecode 값 -->
<input type="hidden" id="storecode" value="${ddto.storecode}" />
		
		       
    </div>
   </div>
   
   <div class="container2">
    <div class="card">
      <div class="cardWrap">
        <ul id="imageList">
         <c:forEach var="image" items="${imagelist}">
           <li>
           <img src="image/${image.image_filename}" alt="Store Image">
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
          <p>
          <c:choose>
        <c:when test="${ddto.parking == 1}">
          🅿️주차 가능✅
        </c:when>
       <c:otherwise>
          🅿️주차 불가🚫
       </c:otherwise>
        </c:choose>
          </p>
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




</div>

  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cc847f687b096a45e3012f1089780b4f"></script>
<script>
  // JSP에서 전달된 데이터로 좌표 세팅
  var lat = ${ddto.latitude};
  var lng = ${ddto.longitude};

  var mapContainer = document.getElementById('map'),
      mapOption = { 
          center: new kakao.maps.LatLng(lat, lng),
          level: 3 
      };

  var map = new kakao.maps.Map(mapContainer, mapOption); 

  var markerPosition  = new kakao.maps.LatLng(lat, lng); 

  var marker = new kakao.maps.Marker({
      position: markerPosition
  });

  marker.setMap(map);
</script>
  

  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
  $(window).on('load', function() {
    let i = 0,
        $slides = $('#imageList'),
        $items = $('#imageList li'),
        slideCount = $items.length;

    const slideWidth = 800 + 20; // 이미지 너비 + 여백

    // 슬라이드 전체 너비 계산해서 적용
    $slides.css('width', slideCount * slideWidth);

    function goToSlide(index) {
      if (index < 0) index = 0;
      if (index >= slideCount) index = slideCount - 1;
      const shift = slideWidth * index;
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
    
    //조아요
	   $(function() {
    const storecodeInput = document.getElementById("storecode");
    const heartInput = document.getElementById("heart");  // checkbox

    if (!storecodeInput || !heartInput) return;

    const storecode = parseInt(storecodeInput.value, 10);
    const contextPath = "${pageContext.request.contextPath}";
    const checkUrl = contextPath + "/like/check";
    const toggleUrl = contextPath + "/like/toggle";

    // ✅ 1. 페이지 진입 시 좋아요 상태 확인
    fetch(checkUrl, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ storecode })
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            heartInput.checked = data.liked;  // 체크박스 상태 반영
        }
    });

    // ✅ 2. 체크박스 클릭 시 좋아요 토글 요청
    heartInput.addEventListener("change", function () {
        fetch(toggleUrl, {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ storecode })
        })
        .then(response => response.json())
        .then(data => {
            if (!data.success) {
                alert(data.message || "좋아요 처리 중 오류 발생");
                heartInput.checked = !heartInput.checked; // 실패 시 롤백
            }
        })
        .catch(error => {
            console.error("❌ 좋아요 토글 실패:", error);
            alert("서버 오류 발생");
            heartInput.checked = !heartInput.checked; // 실패 시 롤백
        });
    });
});






    
    

  
 

    
  </script>
</body>
</html>
