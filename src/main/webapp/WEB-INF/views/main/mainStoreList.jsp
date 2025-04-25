<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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