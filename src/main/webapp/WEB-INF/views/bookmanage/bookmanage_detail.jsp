<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 정보</title>
<link rel="stylesheet" href="css/vtable.css">
</head>
<body>
<h2>예약 수정</h2>

<form action="updateBookings" method="post">
    <input type="hidden" name="id" value="${detail.ID}" />
    <input type="hidden" name="storecode" value="${detail.STORECODE}" />
    <input type="hidden" name="bookingdate" value="<fmt:formatDate value='${detail.BOOKINGDATE}' pattern='yyyy-MM-dd'/>" />
    <input type="hidden" name="bookingtime" value="${detail.BOOKINGTIME}" />

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
                    <c:forEach begin="1" end="9" var="i">
                        <option value="${i}" <c:if test="${detail.SARAMSU == i}">selected</c:if>>${i}</option>
                    </c:forEach>
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
            <td>
                <input type="date" name="bookingdate" value="<fmt:formatDate value='${detail.BOOKINGDATE}' pattern='yyyy-MM-dd'/>" >
            </td>
        </tr>
        <tr>
            <th>예약시간</th>
            <td>
                <input type="time" name="bookingtime" value="${detail.BOOKINGTIME}" >
            </td>
        </tr>
    </table>

    <br>

    <div>
        <button type="submit" class="buttons1">수정완료</button>
        <button class="buttons1" type="button" onclick="location.href='booklist'">목록으로</button>
    </div>
</form>


</body>
</html>