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
function send_go(){
    var name = document.f.name.value.trim();

    if(name.length > 4){
        alert("이름을 4자 이내로 입력해주세요.");
        document.f.name.focus();
        return false;
    }
    if(!isNaN(name.substr(0,1))){
        alert("이름은 숫자로 시작할 수 없습니다!");
        document.f.name.focus();
        return false;
    }

    alert("회원 정보가 정상적으로 수정되었습니다.");
    return true;
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
  margin:  auto;
  margin-top: -10px;
  margin-left: 250px;
  border: none;
  box-shadow: none;
  align-items: center;
}

#heading {
  text-align: center;
  margin-bottom: 1em;
  color: #333;
  font-size: 1.6em;
  font-weight: bold;
}

.required-label {
  font-size: 0.95em;
  color: #333;
  font-weight: 500;
  margin: 5px 0 2px 5px;
  text-align: center;
  width: 100%;
}

.required {
  color: red;
  font-weight: bold;
  margin-left: 3px;
}

.field {
  display: flex;
  justify-content: center;
  width: 100%;
  gap: 10px;
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
  margin-top: 10px;
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
</style>
</head>

<body>

<div class="div-container">
  <div class="category">
    <h1>마이페이지</h1>
    <nav>
      <ul>
        <li><a href="mypinfo" class="menulink active">회원정보 수정</a></li>
        <li><a href="mypagebook" class="menulink">예약내역</a></li>
        <li><a href="mypagereview" class="menulink">작성한 리뷰</a></li>
        <li><a href="mypagedel" class="menulink">회원탈퇴</a></li>
      </ul>
    </nav>
  </div>

  <form name="f" class="form" action="myinfosave" method="post" onsubmit="return send_go()">
    <div id="heading">회원정보 수정</div>

    <label class="required-label">ID</label>
    <div class="field">
      <input class="input-field" type="text" name="id" value="${dto.id}" readonly="readonly">
    </div>

    <label class="required-label">이름</label>
    <div class="field">
      <input class="input-field" type="text" name="name" value="${dto.name}">
    </div>

    <label class="required-label">전화번호</label>
    <div class="field">
      <input class="input-field" type="text" name="phone" value="${dto.phone}">
    </div>

    <label class="required-label">생년월일</label>
    <div class="field">
      <input class="input-field" type="date" name="birth" value="${dto.birth}">
    </div>

    <br>
    <button id="loginButton" class="button login-btn" type="submit">수정완료</button>
  </form>
</div>

<br><br>
</body>
</html>
