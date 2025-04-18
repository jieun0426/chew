<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/base.css">
<link rel="stylesheet" href="css/buttons.css">
<link rel="stylesheet" href="css/tables.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="delete" method="post">
<table border="1" width="1100px" align="center">
	<tr style="text-align: center;">
		<th>매장코드</th><th>매장명</th><th>매장주소</th>
		<th>매장카테고리</th><th>지역</th>
		<th>매장이미지</th>
	</tr>
<tr>
	<td class="align_center">${dto.storecode}</td>
	<td class="align_center">${dto.storename}</td>
	<td class="align_center">${dto.storeaddress}</td>
	<td class="align_center">${dto.storecategory}</td>
	<td class="align_center">${dto.storearea}</td>
	<td class="align_center">
		<img src="./image/${dto.storeimage}" width="70px" height="50px">
	</td>
	
</tr>
</table>

<input type="hidden" name="storecode" value="${dto.storecode}">
<input type="hidden" name="storeimage" value="${dto.storeimage}">
 <div style="text-align: center; margin-top: 20px;">
<button type="submit" class="buttons1">삭제 확인</button>
<button type="button" onclick="location.href='sout';" class="buttons1">취소</button>

</form>
</body>
</html>