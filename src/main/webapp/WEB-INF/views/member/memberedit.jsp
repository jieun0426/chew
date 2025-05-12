<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<style>
/* 위 css 코드 전체 삽입 */
.member-edit-container {
  max-width: 600px;
  margin: 40px auto;
  background: #fff;
  padding: 30px 35px 25px 35px;
  border-radius: 12px;
  box-shadow: 0 2px 8px rgba(0,0,0,0.08);
}
.member-edit-title {
  text-align: center;
  font-size: 26px;
  margin-bottom: 28px;
  font-weight: bold;
  letter-spacing: 1px;
}
.member-form-group {
  margin-bottom: 20px;
}
.member-form-group label {
  display: block;
  font-weight: bold;
  margin-bottom: 7px;
  color: #444;
}
.member-form-group input[type="text"],
.member-form-group input[type="date"] {
  width: 98%;
  padding: 10px 12px;
  border: 1px solid #ccc;
  border-radius: 7px;
  background: #f9f9f9;
  font-size: 15px;
  box-sizing: border-box;
}
.member-form-group span {
  padding: 10px 0;
  display: inline-block;
  color: #555;
  font-size: 15px;
}
.member-form-actions {
  text-align: center;
  margin-top: 28px;
}
.member-btn {
  padding: 10px 22px;
  margin: 0 7px;
  border-radius: 7px;
  border: 1px solid #e0e0e0;
  background-color: bisque;
  color: #333;
  font-size: 15px;
  font-weight: bold;
  cursor: pointer;
  transition: background 0.2s;
  text-decoration: none;
  display: inline-block;
}
.member-btn.gray {
  background-color: #ccc;
  border: 1px solid #aaa;
  color: #333;
}
</style>
</head>
<body>

<h1 class="member-edit-title">회원 정보 수정</h1>

<c:if test="${dto != null}">
    <form class="member-edit-container" action="${pageContext.request.contextPath}/memberupdate" method="post">

        <input type="hidden" name="id" value="${dto.id}">

        <div class="member-form-group">
            <label for="userId">아이디:</label>
            <span>${dto.id}</span>
        </div>

        <div class="member-form-group">
            <label for="name">이름:</label>
            <input type="text" id="name" name="name" value="${dto.name}">
        </div>

        <div class="member-form-group">
            <label for="phone">연락처:</label>
            <input type="text" id="phone" name="phone" value="${dto.phone}">
        </div>

        <div class="member-form-group">
            <label for="birth">생년월일:</label>
            <fmt:formatDate value="${dto.birth}" pattern="yyyy-MM-dd" var="formattedBirth"/>
            <input type="date" id="birth" name="birth" value="${formattedBirth}">
        </div>

        <div class="member-form-actions">
            <button type="submit" class="member-btn">수정</button>
            <a href="/members" class="member-btn gray">취소</a>
        </div>

    </form>
</c:if>

<c:if test="${dto == null}">
    <p style="color: red; text-align: center;">회원 정보를 찾을 수 없습니다.</p>
    <div style="text-align: center;">
         <a href="/members" class="member-btn gray">목록으로 돌아가기</a>
    </div>
</c:if>
</body>
</html>