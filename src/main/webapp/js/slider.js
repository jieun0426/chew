document.addEventListener('DOMContentLoaded', function () {
  // DOM이 완전히 로드된 후에 실행

  const slider = document.getElementById('slider');
  const container = document.getElementById('slider-container');
  
  // slider 요소가 null이 아닌지 확인 (디버깅 용도)
  if (!slider) {
    console.error("슬라이드 요소를 찾을 수 없습니다!");
    return; // 오류 발생 시 코드 실행 중지
  }

  const totalSlides = slider.children.length;
  let currentIndex = 0;
  let intervalId;

  // 슬라이드 시작 함수
  function startSlide() {
    intervalId = setInterval(() => {
      currentIndex = (currentIndex + 1) % totalSlides;
      slider.style.transform = `translateX(-${currentIndex * 60}%)`;
    }, 5000); // 5초마다 슬라이드 이동
  }

  // 슬라이드 멈추는 함수
  function stopSlide() {
    clearInterval(intervalId);
  }

  // 슬라이드 시작
  startSlide();

  // 마우스 오버/아웃 이벤트로 슬라이드 멈추고 시작하기
  container.addEventListener('mouseenter', stopSlide);
  container.addEventListener('mouseleave', startSlide);
});