<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
  function confirmdelete() {
    return confirm("정말 탈퇴하시겠습니까?");
  }
</script>

<style>
body {
  text-align: center;
}

.form {
  display: flex;
  background-color: #fff8e1;
  flex-direction: column;
  gap: 12px;
  padding: 2em;
  border-radius: 25px;
  width: 480px;
  margin: 50px auto;
  margin-left: 250px;
  border: none;
  box-shadow: none;
  align-items: center;
  height: 230px;
}

#heading {
  text-align: center;
  margin-bottom: 1em;
  color: #333;
  font-size: 1.6em;
  font-weight: bold;
}





.input-field {
  width: 100%;
  max-width: 400px;
  padding: 12px 16px;
  border-radius: 10px;
  border: 1px solid #ccc;
  outline: none;
  font-size: 1em;
  text-align: center;
  box-sizing: border-box;
  margin-top: 20px;
}

.btn {
  width: 100%;
  display: flex;
  max-width: 400px;
  justify-content: center;
  gap: 10px;
  margin-top: 1em;
  box-shadow: none !important;
}

.button {
  width: 100%;
  padding: 12px;
  max-width: 400px;
  border-radius: 10px;
  border: none;
  text-align: center;
  font-size: 1em;
  font-weight: bold;
  color: #000;
  background-color: #FFD732;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.button:hover {
  background-color: #ffc400;
}

.login-btn {
	margin-top: 10px;		
  background-color: #FFD700;
  color: #333;
}

.div-container {
  margin-top: 30px;
  display: flex;
  width: 90%;
  justify-content: space-evenly;
}

/* 개선된 왼쪽 메뉴바 디자인 */
.category {
  margin-top: 30px;
  width: 200px;
  padding: 30px 20px;
  background-color: #fff3e0;
  border-top-right-radius: 20px;
  border-bottom-right-radius: 20px;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
  height: 350px;
}

.category h1 {
  color: #783403;
  font-size: 1.8em;
  margin-bottom: 30px;
  text-align: center;
}

.category nav ul {
  list-style: none;
  padding: 0;
  margin: 0;
}

.category nav li {
  margin-bottom: 15px;
  text-align: center;
}

.menulink {
  font-size: 18px;
  color: #333;
  text-decoration: none;
  font-weight: 500;
  padding: 10px 15px;
  display: inline-block;
  width: 100%;
  border-radius: 10px;
  transition: all 0.3s ease;
}

.menulink:hover {
  background-color: #ffe0b2;
  color: #ED751C;
}

.menulink.active {
  background-color: #ffd180;
  color: #783403;
  font-weight: bold;
}

* {
  outline: none !important;
  appearance: none !important;
  -webkit-appearance: none !important;
}
 .warning-text {
    font-size: 16px;
    color: red;
    margin-top: -30px;
    font-weight: semi bold;
    text-align: center;
  }
</style>
</head>

<body>

<div class="div-container">
  <!-- 메뉴바 -->
  <div class="category">
    <h1>마이페이지</h1>
    <nav>
      <ul>
        <li><a href="mypinfo" class="menulink">회원정보 수정</a></li>
        <li><a href="mypagebook" class="menulink">예약내역</a></li>
        <li><a href="mypagereview" class="menulink">작성한 리뷰</a></li>
        <li><a href="mypagedel" class="menulink active">회원탈퇴</a></li>
      </ul>
    </nav>
  </div>

  <form class="form" action="mypagedelsave" method="post" onsubmit="return confirmdelete()">

    <div id="heading">회원탈퇴</div>
    <div class="warning-text">
        *탈퇴 시, 계정은 삭제되며 복구되지 않습니다.
      </div>

     <input type="hidden" name="id" value="${sessionScope.id}">
    <input class="input-field" type="password" name="pw" placeholder="비밀번호 입력">
    <button id="loginButton" class="button login-btn" type="submit" >완료</button>
  </form>
</div>

<br><br>
</body>
</html>
