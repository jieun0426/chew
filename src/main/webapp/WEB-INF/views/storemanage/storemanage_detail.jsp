<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
<table border="1" width="600px" align="center">
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
			<img src="./image/${dto.storeimage}" width="200px" height="150px"
			     style="border: 1px solid #ccc; border-radius: 8px;">
		</td>
	</tr>
	<tr>    
	    <th>상세이미지</th>
	    <td>
	        <div style="display: grid; grid-template-columns: 1fr 1fr; grid-template-rows: 1fr 1fr; gap: 10px;">
	            <c:forEach var="img" items="${images}" varStatus="status">
	                <c:if test="${status.index < 4}">
	                    <div>
	                        <img src="./image/${img.image_filename}" 
	                             style="width: 200px; height: 150px; border: 1px solid #ccc; border-radius: 8px;">
	                    </div>
	                </c:if>
	            </c:forEach>
	        </div>
	    </td>
	</tr>
</table>
<br>
<input type="button" value ="편집" class="buttons1" onclick="location.href='smodify?storecode=${dto.storecode}';">&emsp;
<input type="button" value ="삭제" class="buttons1" onclick="location.href='sdelete?storecode=${dto.storecode}';"> 


</form>
</body>
</html>