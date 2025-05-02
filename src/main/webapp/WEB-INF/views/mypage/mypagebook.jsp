<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<title>예약내역</title>
<style>
.div-container {
	margin-top: 30px;
	display: flex;
	width: 90%;
}

.container {
	width: 70%;
	padding: 30px;
	margin-left: 20px;
	margin-top:10px;
	border-radius: 10px;
	margin-top: 50px;
}

h2 {
	margin-top: -70px;
	text-align: center;
}

.no-book {
	text-align: center;
	color: gray;
	padding: 50px;
}

table {
	width: 100%;
	margin-left: 50px;
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

.store-name a {
	color: #ED751C;
	font-weight: bold;
	font-size: 16px;
	text-decoration: none;
}

.slink {
	text-decoration: none;
	cursor: pointer;
	font-weight: bold;
}

.slink:hover {
	color: #ED751C;
	text-decoration: underline;
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
</style>
</head>
<body>

	<div class="div-container">
		<div class="category">
			<h1>마이페이지</h1>
			<nav>
				<ul>
					<li><a href="mypinfo" class="menulink">회원정보 수정</a></li>
					<li><a href="mypagebook" class="menulink active">예약내역</a></li>
					<li><a href="mypagereview" class="menulink">작성한 리뷰</a></li>
					<li><a href="mypagedel" class="menulink">회원탈퇴</a></li>
				</ul>
			</nav>
		</div>

		<div class="container">
			<h2>예약내역</h2>

			<c:if test="${empty mybook}">
				<div class="no-book">예약내역이 없습니다.</div>
			</c:if>

			<c:if test="${not empty mybook}">
				<table>
					<thead>
						<tr>
							<th>매장명</th>
							<th>인원수</th>
							<th>예약상태</th>
							<th>날짜</th>
							<th>시간</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="book" items="${mybook}">
							<tr>
								<td class="store-name">
									<a href="detailview?storecode=${book.STORECODE}" class="slink">
										${book.STORENAME}
									</a>
								</td>
								<td>${book.SARAMSU}</td>
								<td>${book.STATE}</td>
								<td><fmt:formatDate value="${book.BOOKINGDATE}" pattern="yyyy-MM-dd" /></td>
								<td>${book.BOOKINGTIME}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
		</div>
	</div>

</body>
</html>
