<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/htable.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="delete" method="post">
<table width="1100px">
	<thead>
		<tr style="text-align: center;">
			<th>매장코드</th><th>매장명</th><th>매장주소</th>
			<th>매장카테고리</th><th>지역</th>
			<th>매장이미지</th><th>상세이미지</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td class="align_center">${dto.storecode}</td>
			<td class="align_center">${dto.storename}</td>
			<td class="align_center">${dto.storeaddress}</td>
			<td class="align_center">${dto.storecategory}</td>
			<td class="align_center">${dto.storearea}</td>
			<td class="align_center">
				<img src="./image/${dto.storeimage}" width="70px" height="50px" 
					style="border: 1px solid #ccc; border-radius: 6px;">
			</td>
			<td class="align_center">
				<c:if test="${not empty oneImage}">
		    		<img src="${pageContext.request.contextPath}/image/${oneImage.image_filename}"
		        	 width="70px" height="50px" style="border: 1px solid #ccc; border-radius: 6px;">
				</c:if>	
			</td>
		</tr>
	</tbody>
</table>

<input type="hidden" name="storecode" value="${dto.storecode}">
<input type="hidden" name="storeimage" value="${dto.storeimage}">
<div style="text-align: center; margin-top: 20px;">
	<button type="submit" class="buttons1">삭제 확인</button>
	<button type="button" onclick="location.href='sout';" class="buttons1">취소</button>
</div>

</form>
</body>
</html>