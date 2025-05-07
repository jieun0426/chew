<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<style>
    .edit-form { width: 50%; margin: 20px auto; padding: 20px; border: 1px solid #ccc; }
    .form-group { margin-bottom: 15px; }
    .form-group label { display: block; margin-bottom: 5px; }
    .form-group input[type="text"],
    .form-group input[type="date"] { width: 95%; padding: 8px; border: 1px solid #ccc; }
    .form-group span { padding: 8px; display: inline-block; }
    .form-actions { text-align: center; margin-top: 20px; }
    .button { padding: 8px 15px; margin: 0 5px; cursor: pointer; } /* 기본 버튼 스타일 */
    .button.gray { background-color: #ccc; border: 1px solid #aaa; color: #333; text-decoration: none; display: inline-block;} /* 취소 버튼 */
</style>
</head>
<body>

<h1 style="text-align: center;">회원 정보 수정</h1>

<c:if test="${dto != null}">
    <form class="edit-form" action="/memberupdate" method="post">

        <input type="hidden" name="id" value="${dto.id}">

        <div class="form-group">
            <label for="userId">아이디:</label>
            <span>${dto.id}</span>
        </div>

        <div class="form-group">
            <label for="name">이름:</label>
            <input type="text" id="name" name="name" value="${dto.name}" required>
        </div>

        <div class="form-group">
            <label for="phone">연락처:</label>
            <input type="text" id="phone" name="phone" value="${dto.phone}">
        </div>

        <div class="form-group">
            <label for="birth">생년월일:</label>
            <fmt:formatDate value="${dto.birth}" pattern="yyyy-MM-dd" var="formattedBirth"/>
            <input type="date" id="birth" name="birth" value="${formattedBirth}">
        </div>

        <div class="form-actions">
            <button type="submit" class="button">수정</button>
            <a href="/members" class="button gray">취소</a>
        </div>

    </form>
</c:if>

<c:if test="${dto == null}">
    <p style="color: red; text-align: center;">회원 정보를 찾을 수 없습니다.</p>
    <div style="text-align: center;">
         <a href="/members" class="button gray">목록으로 돌아가기</a>
    </div>
</c:if>
</body>
</html> --%>
