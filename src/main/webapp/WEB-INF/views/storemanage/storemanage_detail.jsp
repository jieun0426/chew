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
<form action="modify" method="post">
<input type="hidden" name="storeimage" value="${dto.storeimage}">
<table border="1" width="400px" align="center">
	<tr>
		<th>매장코드</th><td>${dto.storecode}</td>
	</tr>
	<tr>
		<th>매장명</th><td>${dto.storename}</td>
	</tr>
	<tr>
		<th>매장주소</th><td>${dto.storeaddress}</td>
	</tr>
	<tr>
		<th>매장카테고리</th><td>${dto.storecategory}</td>
	</tr>
	<tr>
		<th>지점</th><td>${dto.storearea}</td>
	</tr>
	<tr>	
		<th>매장이미지</th>
		<td>
			<img src="./image/${dto.storeimage}" width="200px" height="150px">
		</td>
	</tr>
	</table>
	<br>
	<input type="button" value ="편집" class="buttons1" onclick="location.href='smodify?storecode=${dto.storecode}';">&emsp;
	<input type="button" value ="삭제" class="buttons1" onclick="location.href='sdelete?storecode=${dto.storecode}';"> 

</form>
</body>
</html>