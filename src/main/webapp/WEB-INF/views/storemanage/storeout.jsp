<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장 목록</title>
<style type="text/css">
table { border-collapse: collapse;
        width: 1100px;
        margin: auto;}
th, td {
        border: 1px solid #ddd;
        padding: 10px;
        text-align: center;}
th {
        background-color: #f4f4f4;
        font-weight: bold;}
img{
        display: block;
        margin: auto;}
</style>
</head>
<body>
<table>
    <tr>
        <th>매장코드</th>
        <th>매장명</th>
        <th>매장주소</th>
        <th>매장카테고리</th>
        <th>매장좋아요수</th>
        <th>지점</th>
        <th>매장이미지</th>
        <th colspan="2">매장관리</th> 
    </tr>
<c:forEach items="${list}" var="aa">
     <tr>
         <td>${aa.storecode}</td>
         <td>${aa.storename}</td>
         <td>${aa.storeaddress}</td> 
         <td>${aa.storecategory}</td> 
         <td>${aa.storelikes}</td> 
         <td>${aa.storearea}</td>
         <td>
             <img src="./image/${aa.storeimage}" width="70px" height="50px">
         </td>
         <td>
             <a href="sdelete?storecode=${aa.storecode}">삭제</a>
         </td>
         <td>
             <a href="smodify?storecode=${aa.storecode}">수정</a>
         </td>
     </tr>
</c:forEach>
</table>
</body>
</html>