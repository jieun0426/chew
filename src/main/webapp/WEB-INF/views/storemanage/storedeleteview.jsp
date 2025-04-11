<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
th{text-align: center;}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="delete" method="post">
<table border="1" width="1100px" align="center">
	<tr style="text-align: center;">
		<th>매장코드</th><th>매장명</th><th>매장주소</th>
		<th>매장카테고리</th><th>매장좋아요수</th><th>지점</th>
		<th>매장이미지</th>
	</tr>
<tr>
	<td>${dto.storecode}</td>
	<td>${dto.storename}</td>
	<td>${dto.storeaddress}</td>
	<td>${dto.storecategory}</td>
	<td>${dto.storelikes}</td>
	<td>${dto.storearea}</td>
	<td>
	<img src="./image/${dto.storeimage}" width="70px" height="50px">
	</td>
	
</tr>
</table>

<input type="hidden" name="storecode" value="${dto.storecode}">
<input type="hidden" name="storeimage" value="${dto.storeimage}">
 <div style="text-align: center; margin-top: 20px;">
<button type="submit">삭제 확인</button>
<button type="button" onclick="location.href='main';">취소</button>

</form>
</body>
</html>