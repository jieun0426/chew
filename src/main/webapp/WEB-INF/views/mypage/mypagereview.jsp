<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>내가 작성한 리뷰</title>
<style>
.div-container {
	margin-top: 30px;
	display: flex;
	width: 90%;
}

h2 {
	margin-top: 50px;
	text-align: center;
}

.no-review {
	text-align: center;
	color: gray;
	padding: 50px;
}

.container {
	width: 70%;
	padding: 30px;
	margin-left: 20px;
	margin-bottom: 10px;
	border-radius: 10px;
	margin-top: -70px;
}

table {
	width: 90%;
	margin-left:90px;
	border-collapse: collapse;
	font-size: 15px;
}

thead {
	border-bottom: 2px solid #ED751C;
	background-color: #fff4ea;
}

th {
	padding: 15px 10px;
	text-align: center;
	color: #ED751C;
	font-weight: bold;
	background-color: white;
	font-size: 16px;
}

td {
	padding: 14px 10px;
	text-align: center;
	color: #333;
	border-bottom: 1px solid #eee;
	background-color: white;
}

.stars {
	color: #ED751C;
	font-size: 17px;
}

.store-name a {
  color: #ED751C;
  font-weight: bold;
  font-size: 16px;
  text-decoration: none;
}


.review-title {
  font-weight: bold;
  padding-left: 10px;
}


.review-title a {
	color: #0056cc;
	text-decoration: none;
}

.review-title a:hover {
	text-decoration: underline;
}


.slink {
    text-decoration: none;
    cursor: pointer; /* 클릭 가능 표시 */
    font-weight: bold; /* 살짝 강조 */
}

.slink:hover {
    color: #ED751C; /* 호버 시 색상 변경 */
    text-decoration: underline; /* 호버 시 밑줄 */
}


.category {
  margin-top: 30px;
  width: 200px;
  padding: 30px 20px;
  background-color: #fff3e0;
  border-top-right-radius: 20px;
  border-bottom-right-radius: 20px;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
  height: 350px;
}

.category h1 {
  color: #783403;
  font-size: 1.8em;
  margin-bottom: 30px;
  text-align: center;
}

.category nav ul {
  list-style: none;
  padding: 0;
  margin: 0;
}

.category nav li {
  margin-bottom: 15px;
  text-align: center;
}

.menulink {
  font-size: 18px;
  color: #333;
  text-decoration: none;
  font-weight: 500;
  padding: 10px 15px;
  display: inline-block;
  width: 100%;
  border-radius: 10px;
  transition: all 0.3s ease;
}

.menulink:hover {
  background-color: #ffe0b2;
  color: #ED751C;
}

.menulink.active {
  background-color: #ffd180;
  color: #783403;
  font-weight: bold;
}
/* 페이징 */
.container2 {
  padding: 20px 20% 100px;
  background-color: #fefefe;
  font-family: Arial, sans-serif;
}

.container2 h2 {
  font-size: 26px;
  margin-bottom: 30px;
  
  color: #222;
  margin-top: 0;
}
#nowPage{
  color: black;
  font-weight: bold;
  margin-left: 40px;
}
.pageList{
  color: #aaaa7a;
  text-decoration: none; 
}
.pageList, #nowPage {
  margin: 0 2px;  /* 좌우 간격 5px로 설정 */
  font-size: 16px;
  text-decoration: none;
}

</style>
</head>
<body>

	<div class="div-container">
  <div class="category">
    <h1>마이페이지</h1>
    <nav>
      <ul>
        <li><a href="mypinfo" class="menulink">회원정보 수정</a></li>
        <li><a href="mypagebook" class="menulink">예약내역</a></li>
        <li><a href="mypagereview" class="menulink active">작성한 리뷰</a></li>
        <li><a href="mypagedel" class="menulink">회원탈퇴</a></li>
      </ul>
    </nav>
  </div>

		<div class="container">
			<h2>내가 작성한 리뷰</h2>

			<c:if test="${empty myreviews}">
				<div class="no-review">작성한 리뷰가 없습니다.</div>
			</c:if>

			<c:if test="${not empty myreviews}">
				<table>
					<thead>
						<tr>
							<th>매장명</th>
							<th>제목</th>
							<th>내용</th>
							<th>별점</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="review" items="${myreviews}">
							<tr>
								<td class="store-name">
								  <a href="detailview?storecode=${review.STORECODE}" class="slink">
								    ${review.STORENAME}
								  </a>
								</td>
								
								<td class="review-title">
								  ${review.TITLE}
								</td>

								<td>${review.CONTENT}</td>
								<td>
									<div class="stars">
										<c:forEach var="i" begin="1" end="5">
											<c:choose>
												<c:when test="${i <= review.STARS}">★</c:when>
												<c:otherwise>☆</c:otherwise>
											</c:choose>
										</c:forEach>
									</div>
								</td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</c:if>
		<br><br>
	<c:if test="${pdto.startPage>pdto.cntPage}">
		<a href="mypagereview?page=${pdto.startPage-pdto.cntPage}#container2">◀</a>&emsp;
	</c:if>
	<c:forEach begin="${pdto.startPage}" end="${pdto.endPage}" var="p">
		<c:if test="${p==pdto.nowPage}">
			<span id="nowPage">${p}</span>&emsp;
		</c:if>
		<c:if test="${p!=pdto.nowPage}">
			<a class="pageList" href="mypagereview?page=${p}#container2">${p}</a>&emsp;
		</c:if>
	</c:forEach>
	<c:if test="${pdto.endPage<pdto.lastPage}">
		<a href="mypagereview?page=${pdto.startPage+pdto.cntPage}#container2">▶</a>
	</c:if>
</div>
	</div>

</body>
</html>