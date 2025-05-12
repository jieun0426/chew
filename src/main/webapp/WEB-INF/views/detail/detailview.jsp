<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="css/detailview.css">
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
	      
			<div class="item">
				<span class="time">🍴 ${ddto.storecategory}</span>
				<span class="category">🕒 ${ddto.storehours}</span>
			</div>
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
					<li><img src="image/${image.image_filename}" alt="Store Image"></li>
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

	<div class="review-section" id="reviews" style="padding-top: 50px;">
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
						<c:forEach var="i" begin="1" end="${r.stars}">★</c:forEach><c:forEach var="i" begin="${r.stars + 1}" end="5">☆</c:forEach>
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

		$(document).on('click', '#moreReviewBtn', function(){
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
