<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>카보정 갈비</title>
<script>
/* 리뷰수정/삭제 스크립트 */
function showEdit(key) {
  const reviewDisplay = document.getElementById('review-display-' + key);
  const editBox = document.getElementById('edit-' + key);

  if (reviewDisplay && editBox) {
    reviewDisplay.style.display = 'none';
    editBox.style.display = 'block';
  }
}

function cancelEdit(key) {
  const reviewDisplay = document.getElementById('review-display-' + key);
  const editBox = document.getElementById('edit-' + key);

  if (reviewDisplay && editBox) {
    reviewDisplay.style.display = 'block';
    editBox.style.display = 'none';
  }
}


</script>




  
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
padding: 20px;
  text-align: left;
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
  text-align: left;
}

.review-content {
  font-size: 14px;
  color: #555;
  margin-bottom: 10px;
  text-align: left;
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
    /* 모달 전체 배경 */
.modal {
  position: fixed;
  z-index: 1000;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgba(0, 0, 0, 0.5);
}

/* 모달 콘텐츠 */
.modal-content {
  background-color: #fff;
  margin: 8% auto;
  padding: 30px;
  width: 360px;
  border-radius: 15px;
  box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
  font-family: 'Noto Sans KR', sans-serif;
  position: relative;
}

/* 닫기 버튼 */
.close {
  position: absolute;
  right: 20px;
  top: 15px;
  font-size: 24px;
  color: #888;
  cursor: pointer;
}
.close:hover {
  color: #000;
}

/* 제목 */
.modal-content h4 {
  text-align: center;
  font-size: 20px;
  margin-bottom: 25px;
}

/* 라벨 */
.modal-content label {
  display: block;
  font-weight: bold;
  margin-bottom: 6px;
  margin-top: 15px;
}

/* 입력창과 셀렉트 박스 */
.modal-content input,
.modal-content select {
  width: 100%;
  padding: 10px 12px;
  border: 1px solid #ccc;
  border-radius: 6px;
  font-size: 14px;
  box-sizing: border-box;
}

/* 예약하기 버튼 */
.modal-content button[type="submit"] {
  margin-top: 25px;
  width: 100%;
  padding: 12px;
  background-color: bisque;
  color: #333;
  border: none;
  border-radius: 8px;
  font-size: 16px;
  font-weight: bold;
  cursor: pointer;
  transition: background-color 0.3s;
}
.modal-content button[type="submit"]:hover {
  background-color: #f7cfa1;
}

.people-buttons {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
  margin-bottom: 10px;
}
.people-buttons .people-btn {
  flex: 1 1 30%;
  padding: 10px 0;
  border: 1px solid #ccc;
  border-radius: 8px;
  background-color: #fff;
  font-size: 15px;
  color: #333;
  cursor: pointer;
  transition: all 0.2s;
}
.people-buttons .people-btn.active {
  background-color: #f7cfa1;
  border-color: #f3be84;
  font-weight: bold;
}

.time-buttons {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 8px;
  margin-top: 10px;
}
.time-buttons .time-btn {
  padding: 10px 0;
  border: 1px solid #ccc;
  border-radius: 8px;
  background-color: #fff;
  font-size: 14px;
  color: #333;
  cursor: pointer;
  transition: all 0.2s;
}
.time-buttons .time-btn.selected {
  background-color: #f7cfa1;
  border-color: #f3be84;
  font-weight: bold;
}
.time-label1 {
text-align: left;
font-size: 14px;
}
.time-label2 {
margin-top: 20px; 
text-align: left;
font-size: 14px;

}

/* 날짜 input 스타일 */
input[type="date"] {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 8px;
  background-color: #f9f9f9;
  font-size: 15px;
  margin-bottom: 10px;
}
/* 예약css끝 */
	    
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
	.btn02:hover{
		cursor: pointer;
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
  height: 38px;
  width: 126px; 
  border-radius: 16px;
  border: 1px solid #e0e0e0;
  background-color: white;
  overflow: hidden;
  margin-top: 10px; /* 원하는 만큼 아래로 이동 */
  margin-bottom: 110px;
  margin-left: 370px;  
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
  transition: all 0.2s ease-out;
}

.like-text {
  color: black;
  font-size: 13px;
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

  /* ✅ 기본 위치에서 보이도록 설정 */
  transform: translateY(0);
}

/* ✅ 좋아요 눌렀을 때 아이콘 색과 애니메이션 */
.on:checked ~ .like .like-icon {
  fill: #fc4e4e;
  animation: enlarge 0.2s ease-out 1;
}

/* ✅ 좋아요 수 애니메이션 색상 변경 */
.on:checked ~ .like-count {
  color: black;
}

/* ✅ 필요 없는 클래스는 제거하거나 무시 */
.like-count.two,
.like-count.one {
  /* 클래스가 있어도 위치 고정 */
  transform: translateY(0);
}

/* 하트 애니메이션 */
@keyframes enlarge {
  0% {
    transform: scale(0.5);
  }
  100% {
    transform: scale(1.2);
  }
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

/* 리뷰 수정 삭제 버튼 */

/* 부모 요소에 상대 위치 설정 */
.review {
  position: relative;
}

/* 버튼 박스를 오른쪽 위로 이동 */
.review-buttons {
  position: absolute;
  top: 10px;       /* 위쪽 여백 */
  right: 10px;     /* 오른쪽 여백 */
  display: flex;
  gap: 10px;
}

.review-btn-form {
  display: inline-block;
}

.review-buttons .btn {
  padding: 6px 12px;
  font-size: 14px;
  border-radius: 6px;
  border: 1px solid #aaa;
  background-color: #fff;
  color: #333;
  cursor: pointer;
}

.review-buttons .btn:hover {
  background-color: #f0f0f0;
  border-color: #888;
}

.review-edit {
  border-radius: 12px;
  height: 220px; /* 고정 높이 유지 */
  width: 100%;
  padding: 15px;
  box-sizing: border-box;
  overflow: hidden; /* 넘치는 요소 숨기기 */
}

.review-edit .edit-group {
  margin-bottom: 16px;
}

.review-edit label {
  font-weight: bold;
  display: block;
  margin-bottom: 5px;
  color: #333;
}

.review-edit input[type="text"],
.review-edit textarea {
  width: 100%;
  font-size: 15px;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 6px;
  background-color: #f9f9f9;
  box-sizing: border-box;
  transition: border-color 0.2s ease;
}

.review-edit input[type="text"]:focus,
.review-edit textarea:focus {
  background-color: #fff;
  outline: none;
}

.review-edit textarea {
  height: 90px;
  resize: vertical;
}




.edit-buttons {
  position: absolute;
  bottom: 25px;
  right: 26px; /* ← 원래 6px이었던 값을 더 크게 조정 (왼쪽으로 이동) */
  display: flex;
  gap: 10px;
}




.edit-buttons .btn {
  padding: 6px 12px;
  font-size: 14px;
  border-radius: 6px;
  border: 1px solid #aaa;
  background-color: #fff;
  color: #333;
  cursor: pointer;
  transition: all 0.2s ease;
}

.edit-buttons .btn:hover {
  background-color: #f0f0f0;
  border-color: #888;
}

.edit-buttons .cancel {
  color: #b00;
  border-color: #b00;
}

.btn.cancel {
  color: #b00 !important;
  border-color: #b00 !important;
}
.btn.cancel:hover {
  background-color: #ffe5e5;
  border-color: #a00;
}

/* 리뷰 안 텍스트 정렬 통일 */

.review-header,
.review-stars
{
  padding-left: -10px;  /* 왼쪽 여백을 동일하게 맞춤 */
}


/* 아바타 아이콘과 아이디 나란히 정렬 */
.review-header {
  display: flex;
  align-items: center;
  gap: 5px;
  margin-bottom: 5px;
}

.review-avatar-emoji {
  font-size: 18px;
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
   <div class="like-button">
     <input class="on" id="heart" type="checkbox" />
     <label class="like" for="heart">
       <svg class="like-icon" fill-rule="nonzero" viewBox="0 0 24 24">
         <path
           d="m11.645 20.91-.007-.003-.022-.012a15.247 15.247 0 0 1-.383-.218 25.18 25.18 0 0 1-4.244-3.17C4.688 15.36 2.25 12.174 2.25 8.25 2.25 5.322 4.714 3 7.688 3A5.5 5.5 0 0 1 12 5.052 5.5 5.5 0 0 1 16.313 3c2.973 0 5.437 2.322 5.437 5.25 0 3.925-2.438 7.111-4.739 9.256a25.175 25.175 0 0 1-4.244 3.17 15.247 15.247 0 0 1-.383.219l-.022.012-.007.004-.003.001a.752.752 0 0 1-.704 0l-.003-.001Z"
         ></path>
       </svg>
       <span class="like-text">Likes</span>
     </label>
     <span class="like-count" id="likeCount">${ddto.storelikes}</span>
	</div>
        

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
    
     <!-- //////////예약 모달 창/////////// -->
     
<!-- 예약 버튼 -->

<div id="bookingModal" class="modal" style="display:none;">
  <div class="modal-content">
    <span class="close">&times;</span>
    <h4>예약하기</h4>
    <form id="bookingForm">
      <input type="hidden" name="storecode" value="${ddto.storecode}">

      <!-- 인원수 -->
      <label>인원수:</label>
<div class="people-buttons" id="personOptions">
  <button type="button" data-value="1" class="people-btn">1명</button>
  <button type="button" data-value="2" class="people-btn">2명</button>
  <button type="button" data-value="3" class="people-btn">3명</button>
  <button type="button" data-value="4" class="people-btn">4명</button>
  <button type="button" data-value="5" class="people-btn">5명</button>
  <button type="button" data-value="6" class="people-btn">6명</button>
  <button type="button" data-value="7" class="people-btn">7명</button>
  <button type="button" data-value="8" class="people-btn">8명</button>
  <button type="button" data-value="9" class="people-btn">9명</button>
  <!-- 필요시 더 추가 가능 -->
</div>
<input type="hidden" name="saramsu" id="saramsu">


      <!-- 날짜 -->
      <label for="bookingdate">날짜:</label>
      <input type="date" id="bookingdate" name="bookingdate">

      <!-- 시간 -->
      <label>시간:</label>
<div class="time-section">
  <div class="time-label1">오전</div>
  <div class="time-buttons" id="amTimes">
    <button type="button" class="time-btn" data-time="11:30">11:30</button>
  </div>

  <div class="time-label2">오후</div>
  <div class="time-buttons" id="pmTimes">
    <button type="button" class="time-btn" data-time="12:00">12:00</button>
    <button type="button" class="time-btn" data-time="12:30">12:30</button>
    <button type="button" class="time-btn" data-time="13:00">1:00</button>
    <button type="button" class="time-btn" data-time="13:30">1:30</button>
    <button type="button" class="time-btn" data-time="14:00">2:00</button>
    <button type="button" class="time-btn" data-time="14:30">2:30</button>
    <button type="button" class="time-btn" data-time="15:00">3:00</button>
    <button type="button" class="time-btn" data-time="15:30">3:30</button>
    <button type="button" class="time-btn" data-time="16:00">4:00</button>
    <button type="button" class="time-btn" data-time="16:30">4:30</button>
    <button type="button" class="time-btn" data-time="17:00">5:00</button>
    <button type="button" class="time-btn" data-time="17:30">5:30</button>
    <button type="button" class="time-btn" data-time="18:00">6:00</button>
    <button type="button" class="time-btn" data-time="18:30">6:30</button>
    <button type="button" class="time-btn" data-time="19:00">7:00</button>
    <button type="button" class="time-btn" data-time="19:00">7:30</button>
    <button type="button" class="time-btn" data-time="19:00">8:00</button>
  </div>
</div>
<input type="hidden" name="bookingtime" id="bookingtime">


      <button type="submit">예약하기</button>
    </form>
  </div>
</div>



 <script type="text/javascript">
  $(function () {
    const modal = $('#bookingModal');
    const openBtn = $('#openModalBtn');
    const closeBtn = $('.close');

    // 1. 예약하기 버튼 클릭 시 로그인 체크 후 모달 오픈
    openBtn.on('click', function (e) {
      e.preventDefault();
      $.ajax({
        url: '/chew/logincheck',
        type: 'GET',
        success: function (result) {
          if (result === 'ok') {
            modal.fadeIn();

            $('.modal-content').on('click', function (e) {
              e.stopPropagation();
            });
          } else {
            alert('로그인이 필요합니다.');
            window.location.href = '/chew/loginput';
          }
        },
        error: function () {
          alert('로그인 체크 오류');
        }
      });
    });

    // 2. 모달 닫기 (X 버튼)
    closeBtn.on('click', function () {
      modal.fadeOut();
    });

    // 3. 모달 외부 클릭 시 닫기
    $(window).on('click', function (e) {
      if ($(e.target).is(modal)) {
        modal.fadeOut();
      }
    });

    // ✅ 추가된 부분: 인원 버튼 클릭 시 선택 처리
    $('#personOptions .people-btn').on('click', function () {
  $('#personOptions .people-btn').removeClass('active');
  $(this).addClass('active');
  $('#saramsu').val($(this).data('value'));
});


    // ✅ 추가된 부분: 시간 버튼 클릭 시 선택 처리
  // 시간 버튼 클릭 시 처리
$('.time-btn').on('click', function () {
  $('.time-btn').removeClass('selected');
  $(this).addClass('selected');
  $('#bookingtime').val($(this).data('time'));
});


    // 4. 예약 폼 제출 시 AJAX로 예약 요청
    $('#bookingForm').on('submit', function (e) {
      e.preventDefault();

      // 필수 입력값 체크
      const saramsu = $('#saramsu').val();
      const bookingdate = $('#bookingdate').val();
      const bookingtime = $('#bookingtime').val();

      if (!saramsu || !bookingdate || !bookingtime) {
        alert('입력을 완료해주세요.');
        return;
      }

      // 시간 형식 체크 (HH:mm)
      const timePattern = /^([01]\d|2[0-3]):([0-5]\d)$/;
      if (!timePattern.test(bookingtime)) {
        alert('시간을 HH:mm 형식으로 입력해주세요.');
        return;
      }

      $.ajax({
        url: 'bookingsave',
        type: 'POST',
        data: $('#bookingForm').serialize(),
        success: function (result) {
          if (result === 'success') {
            alert('예약 성공!');
            modal.fadeOut();
          } else if (result === 'login_required') {
            alert('로그인이 필요합니다.');
            window.location.href = '/chew/loginput';
          } else if (result.startsWith("error:")) {
            alert("서버 오류: " + result.split(":")[1]);
          } else {
            alert('예약에 실패했습니다. 다시 시도해주세요.');
          }
        },
        error: function (xhr) {
          alert('예약 요청 실패: ' + xhr.status);
        }
      });
    });
  });
</script>
 
<!-- 예약모달 끝 -->
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
		<input type="hidden" name="id" value="${id}">
		
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
  <c:set var="reviewKey" value="${r.storecode}_${r.id}" />
  
  <div class="review" id="review-${reviewKey}">

    <!-- 기존 리뷰 표시 영역 -->
    <div id="review-display-${reviewKey}">
      <div class="review-header">
        <span class="review-avatar-emoji">👤</span>
        <span class="review-id">${r.id}</span>
      </div>

      <div class="review-stars">
        <c:forEach var="i" begin="1" end="${r.stars}">★</c:forEach>
        <c:forEach var="i" begin="${r.stars + 1}" end="5">☆</c:forEach>
      </div>

      <div class="review-title">${r.title}</div>
      <div class="review-content">${r.content}</div>

      <c:if test="${loginstate == true && r.id == id}">
        <div class="review-buttons">
          <button type="button" class="btn" onclick="showEdit('${reviewKey}')">수정</button>
          <form action="deleteReview" method="post" class="review-btn-form">
            <input type="hidden" name="id" value="${r.id}">
            <input type="hidden" name="storecode" value="${r.storecode}">
            <button type="submit" class="btn cancel">삭제</button>
          </form>
        </div>
      </c:if>
    </div>

    <!-- 리뷰 수정 폼 -->
    <div class="review-edit" id="edit-${reviewKey}" style="display: none;">
      <form action="editReview" method="post">
        <input type="hidden" name="id" value="${r.id}">
        <input type="hidden" name="storecode" value="${r.storecode}">

        <div class="edit-group">
          <input type="text" name="title" value="${r.title}">
        </div>

        <div class="edit-group">
          <textarea name="content">${r.content}</textarea>
        </div>

        <div class="edit-buttons">
          <button type="submit" class="btn">수정완료</button>
          <button type="button" class="btn cancel" onclick="cancelEdit('${reviewKey}')">취소</button>
        </div>
      </form>
    </div>
  </div>
</c:forEach>
</div>

<button id="moreReviewBtn" data-state="more">리뷰 더 보기</button>
<!-- hasMore 플래그를 data 속성으로 -->
<div id="moreFlag" data-hasmore="${hasMore}"></div>


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
  
	$(document).ready(function(){
		
	      
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
        const modal = $('#bookingModal');
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
    
    $(function() {
        const storecodeInput = document.getElementById("storecode");
        const heartInput = document.getElementById("heart");  // checkbox
        const likeCountElement = document.getElementById("likeCount");  // 좋아요 수 표시 요소

        if (!storecodeInput || !heartInput || !likeCountElement) return;

        const storecode = parseInt(storecodeInput.value, 10);
        const contextPath = "${pageContext.request.contextPath}";
        const checkUrl = contextPath + "/like/check";
        const toggleUrl = contextPath + "/like/toggle";

        // 페이지 진입 시 좋아요 상태 확인
        fetch(checkUrl, {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ storecode })
        })
        .then(response => response.json())
        .then(data => {
            if (!data.success && data.message?.includes("로그인")) {
                alert("로그인이 필요합니다.");  // 로그인 알림만
                return;
            }

            if (data.success) {
                heartInput.checked = data.liked;
                likeCountElement.textContent = data.storelikes !== undefined ? data.storelikes : 0;
            }
        });

        // 좋아요 토글 처리
        heartInput.addEventListener("change", function () {
            fetch(toggleUrl, {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify({ storecode })
            })
            .then(response => response.json())
            .then(data => {
                if (!data.success) {
                    if (data.message?.includes("로그인")) {
                        alert("로그인이 필요합니다.");  // 로그인 알림만
                        heartInput.checked = false;   // 체크 해제
                        return;
                    }

                    alert(data.message || "좋아요 처리 중 오류 발생");
                    heartInput.checked = !heartInput.checked;
                } else {
                    likeCountElement.textContent = data.storelikes !== undefined ? data.storelikes : 0;
                }
            })
            .catch(error => {
                console.error("❌ 좋아요 토글 실패:", error);
                alert("서버 오류 발생");
                heartInput.checked = !heartInput.checked;
            });
        });
    });
  </script>
</body>
</html>
