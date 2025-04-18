$(function() {
    const modal = $('#bookingModal');
    const openBtn = $('#openModalBtn');
    const closeBtn = $('.close');

    // 예약하기 버튼 클릭시 로그인 체크
    openBtn.on('click', function(e) {
        e.preventDefault();
        $.ajax({
            url: 'logincheck',
            type: 'GET',
            success: function(result) {
                if (result === 'ok') {
                    modal.fadeIn();
                } else {
                    alert('로그인이 필요합니다.');
                    window.location.href = '/chew/loginput';
                }
            },
            error: function() {
                alert('로그인 오류가 발생했습니다.');
            }
        });
    });

    // 예약 모달 끝
    closeBtn.on('click', function() {
        modal.fadeOut();
    });

    $(window).on('click', function(e) {
        if ($(e.target).is(modal)) {
            modal.fadeOut();
        }
    });

$('#bookingForm').on('submit', function(e) {
    e.preventDefault(); // 기본 폼 제출 방지
    
        //필수 입력값 체크 -인원수 날짜 시간
    const saramsu = $('#saramsu').val();
    const bookingdate = $('#bookingdate').val();
    const bookingtime = $('#bookingtime').val();
    
    
 	 if (!saramsu || !bookingdate || !bookingtime) {
        alert('입력을 완료해주세요.');
        return;
     }
 	const timePattern = /^([01]\d|2[0-3]):([0-5]\d)$/;
    if (!timePattern.test($('#bookingtime').val())) {
        alert('이부분을 입력해주세요');
        return;
     }
     

    $.ajax({
        url: 'bookingsave', // 서버의 예약 저장 URL
        type: 'POST',
        data: $('#bookingForm').serialize(), // 폼 데이터를 직렬화하여 전송
        statusCode: {
        	200: function() {
                alert('예약 성공');
            },
            401: function() {
                alert('로그인이 필요합니다.');
                window.location.href = '/chew/loginput';
            }
        },
        error: function(xhr, status, error) {
            alert('예약에 실패했습니다. 다시 확인해주세요.');
        }
    });
  });
});