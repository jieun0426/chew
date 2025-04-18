<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:forEach items="${area}" var="aa" varStatus="status">
	<div class="main_areaList">
		<a href="#"><img src="image/${aa.storeimage}" class="storeimg"></a>
		<p><a href="#">${aa.storename}</a></p>
		<div class="rating" id="rating_${status.index}">
			<input type="radio" id="star5_${status.index}" name="rating_${status.index}" value="5" disabled />
			<label for="star5_${status.index}"></label>
			<input type="radio" id="star4_${status.index}" name="rating_${status.index}" value="4" disabled />
			<label for="star4_${status.index}"></label>
			<input type="radio" id="star3_${status.index}" name="rating_${status.index}" value="3" disabled />
			<label for="star3_${status.index}"></label>
			<input type="radio" id="star2_${status.index}" name="rating_${status.index}" value="2" disabled />
			<label for="star2_${status.index}"></label>
			<input type="radio" id="star1_${status.index}" name="rating_${status.index}" value="1" disabled />
			<label for="star1_${status.index}"></label>
		</div> &nbsp;${aa.stars}

		<script>
			(function() {
				let stars = Math.round(parseFloat('${aa.stars}'));
				let radio = document.querySelector('input[name="rating_${status.index}"][value="' + stars + '"]');
				if (radio) radio.checked = true;
			})();
		</script>
	</div>
</c:forEach>