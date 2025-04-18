<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장 목록</title>
<link rel="stylesheet" href="css/buttons.css">
<link rel="stylesheet" href="css/tables.css">
<link rel="stylesheet" href="css/tables.css">
<style type="text/css">
img{
        display: block;
        margin: auto;}
</style>
</head>
<body>
<input type="button" value ="매장 등록" class="buttons1" onclick="location.href='storein';">
<table border="1" width="1100px">
    <tr>
        <th>매장코드</th>
        <th>매장명</th>
        <th>매장주소</th>
        <th>매장카테고리</th>
        <th>지역</th>
        <th>매장이미지</th>
        <th colspan="2">매장관리</th> 
    </tr>
<c:forEach items="${list}" var="aa">
     <tr>
         <td class="align_center">${aa.storecode}</td>
         <td class="align_center"><a href="storemanage_detail?num=${aa.storecode}">${aa.storename}</a></td>
         <td class="align_center">${aa.storeaddress}</td> 
         <td class="align_center">${aa.storecategory}</td>  
         <td class="align_center">${aa.storearea}</td>
         <td class="align_center">
             <img src="./image/${aa.storeimage}" width="70px" height="50px">
         </td>
         <td class="align_center">
             <a href="sdelete?storecode=${aa.storecode}">삭제</a>
         </td>
         <td class="align_center">
             <a href="smodify?storecode=${aa.storecode}">수정</a>
         </td>
     </tr>
</c:forEach>
</table>
</body>
</html>