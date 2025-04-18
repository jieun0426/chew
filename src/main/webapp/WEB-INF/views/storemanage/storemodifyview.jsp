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
<form action="modify" method="post" enctype="multipart/form-data">
	<input type="hidden" name="storeimage" value="${dto.storeimage}">
	<table border="1" width="400px" align="center">
		<tr>
			<th>매장코드</th><td><input type="text" name="storecode" readonly value="${dto.storecode}"></td>
		</tr>
		<tr>
			<th>매장명</th><td><input type="text" name="storename" value="${dto.storename}"></td>
		</tr>
		<tr>
			<th>매장주소</th><td><input type="text" name="storeaddress" value="${dto.storeaddress}">
		</tr>
		<tr>
			<th>매장카테고리</th><td><input type="text" name="storecategory" value="${dto.storecategory}">
		</tr>
		<tr>
			<th>지역</th><td><input type="text" name="storearea" value="${dto.storearea}">
		</tr>
		<tr>	
			<th>매장이미지</th>
			<td>
				<div class="file-input-container">
				 <!-- <input type="file" id="file-input" class="file-input" onchange="displayFileName()"> -->
				  <input type="file" id="storeimage" name="storeimage" class="file-input" onchange="displayFileName()">
				  <label for="storeimage" class="file-label" style="text-align: center;">
				    파일 선택
				  </label>
				  <span id="file-name" class="file-name"></span> <!-- 선택된 파일 이름 표시 -->
				</div>	
				<!-- <input type="file" name="storeimage" class="buttons1"><br><br> -->
				<img src="./image/${dto.storeimage}" width="200px" height="150px">
			<br><br>
		</td>
		</tr>
	</table>	
	
	<br>
	<input type="submit" value ="수정확인" class="buttons1">&emsp;
	<input type="button" value ="취소" class="buttons1" onclick="location.href='sout';"> 

</form>
</body>
</html>