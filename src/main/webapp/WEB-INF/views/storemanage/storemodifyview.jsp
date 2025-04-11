<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
th,tr,td{text-align: center;}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="modify" method="post" enctype="multipart/form-data">
<input type="hidden" name="storeimage" value="${dto.storeimage}">
<table border="1" width="700px" align="center">
	<tr>
		<th>매장코드</th><td><input type="text" name="storecode" readonly value="${dto.storecode}"></td>
	</tr>
	<tr>
		<th>매장명</th><td><input type="text" name="storename"></td>
	</tr>
	<tr>
		<th>매장주소</th><td><input type="text" name="storeaddress" >
	</tr>
	<tr>
		<th>매장카테고리</th><td><input type="text" name="storecategory" >
	</tr>
	<tr>
		<th>매장좋아요수</th><td><input type="text" name="storelikes" >
	</tr>
	<tr>
		<th>지점</th><td><input type="text" name="storearea" >
	</tr>
	<tr>	
		<th>매장이미지</th><td><input type="file" name="storeimage" ><br><br>
		<img src="./image/${dto.storeimage}" width="200px" height="150px">
		<br><br>
	</td>
	</tr>
	
<tr>
	<td colspan="2">
	<input type="submit" value ="수정확인">
	<input type="button" value ="취소" onclick="location.href='sout';"> 
	</td>
</tr>
</table>
</form>
</body>
</html>