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
<link rel="stylesheet" href="css/search.css">
<style type="text/css">
img{
	display: block;
	margin: auto;
}
#nowPage{
  color: black;
  font-weight: bold;
}
.pageList{
  color: #aaaa7a;
  text-decoration: none; 
}
a {
  color: black;
  text-decoration: none; 
}
</style>
</head>
<body>
<div class="input_div">
	<form action="storemanage_search">
		<div class="group">
			<svg class="icon" aria-hidden="true" viewBox="0 0 24 24"><g><path d="M21.53 20.47l-3.66-3.66C19.195 15.24 20 13.214 20 11c0-4.97-4.03-9-9-9s-9 4.03-9 9 4.03 9 9 9c2.215 0 4.24-.804 5.808-2.13l3.66 3.66c.147.146.34.22.53.22s.385-.073.53-.22c.295-.293.295-.767.002-1.06zM3.5 11c0-4.135 3.365-7.5 7.5-7.5s7.5 3.365 7.5 7.5-3.365 7.5-7.5 7.5-7.5-3.365-7.5-7.5z"></path></g></svg>
			<input placeholder="회원 검색" type="search" class="input" name="search">
		</div>
</div>


<div>
	<table border="1" width="1100px">
	    <tr>
	        <th>회원아이디</th>
	        <th>회원비밀번호</th>
	        <th>회원이름</th>
	        <th>회원연락처</th>
	        <th>생년월일</th>
	        <th colspan="2">회원관리</th>
	    </tr>
		<c:forEach items="${list}" var="aa">
	     <tr>
	         <td class="align_center">${aa.id}</td>
	         <td class="align_center">
	         <td class="align_center">${aa.}</td> 
	         <td class="align_center">${aa.}</td>  
	         <td class="align_center">${aa.}</td>
	         <td class="align_center">
	             <a href="mdelete?id=${aa.id}">삭제</a>
	         </td>
	         <td class="align_center">
	             <a href="mmodify?id=${aa.id}">수정</a>
	         </td>
	     </tr>
		</c:forEach>
	</table>
</div>
<br><br>
<div>
	<c:if test="${pdto.startPage>pdto.cntPage}">
		<a href="sout?page=${pdto.startPage-pdto.cntPage}">◀</a>&emsp;
	</c:if>
	<c:forEach begin="${pdto.startPage}" end="${pdto.endPage}" var="p">
		<c:if test="${p==pdto.nowPage}">
			<span id="nowPage">${p}</span>&emsp;
		</c:if>
		<c:if test="${p!=pdto.nowPage}">
			<a class="pageList" href="sout?page=${p}">${p}</a>&emsp;
		</c:if>
	</c:forEach>
	<c:if test="${pdto.endPage<pdto.lastPage}">
		<a href="sout?page=${pdto.startPage+pdto.cntPage}">▶</a>
	</c:if>
</div>
</body>
</html>