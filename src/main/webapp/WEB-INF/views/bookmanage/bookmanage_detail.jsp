<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 정보</title>
<link rel="stylesheet" href="css/base.css">
<link rel="stylesheet" href="css/buttons.css">
<link rel="stylesheet" href="css/tables.css">
</head>
<body>

	<h2>예약 수정</h2>


<table>
    <tr>
        <th>매장명</th>
        <td>${detail.STORENAME}</td>
    </tr>
    <tr>
        <th>예약자</th>
        <td>${detail.ID}</td>
    </tr>
    <tr>
        <th>인원수</th>
        <td>
        	<select name="saramsu">
        	<option value="1" ${detail.SARAMSU}>1</option>
        	<option value="2" ${detail.SARAMSU}>2</option>
        	<option value="3" ${detail.SARAMSU}>3</option>
        	<option value="4" ${detail.SARAMSU}>4</option>
        	<option value="5" ${detail.SARAMSU}>5</option>
        	<option value="6" ${detail.SARAMSU}>6</option>
        	<option value="7" ${detail.SARAMSU}>7</option>
        	<option value="8" ${detail.SARAMSU}>8</option>
        	<option value="9" ${detail.SARAMSU}>9</option>
        	</select>
        </td>
    </tr>
    <tr>
        <th>예약상태</th>
        <td>
            <select name="state">
                <option value="예약중" ${detail.STATE == '예약중' ? 'selected' : ''}>대기</option>
                <option value="완료" ${detail.STATE == '완료' ? 'selected' : ''}>완료</option>
                <option value="취소" ${detail.STATE == '취소' ? 'selected' : ''}>취소</option>
            </select>
        </td>
    </tr>
    <tr>
        <th>예약날짜</th>
        <td><input type="date" name="bookingdate"
                value="<fmt:formatDate value='${detail.BOOKINGDATE}' pattern='yyyy-MM-dd'/>" />
        </td>
    </tr>
    <tr>
        <th>예약시간</th>
        <td><input type="time" name="bookingtime" value="${detail.BOOKINGTIME}" /></td>
    </tr>
</table>
<br>


	<div>
		<button class="buttons1" onclick="history.back()">수정완료</button>
		<button class="buttons1" onclick="location.href='booklist'">목록으로</button>
	</div>

</body>
</html>