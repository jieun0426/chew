<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<style type="text/css">
  * {
    box-sizing: border-box;
  }

  html, body {
    margin: 0;
    padding: 0;
    height: 100%;
    font-family: 'Noto Sans KR', sans-serif;
  }

  .wrapper {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100%;
    background-color: #ffffff;
  }

  .form-container {
    width: 360px;
    text-align: center;
  }

  #heading {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 30px;
  }

  .input-field {
    width: 100%;
    padding: 12px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 1em;
  }

  .button-area {
    margin: 20px 0;
  }

  .button1 {
    width: 100%;
    padding: 12px;
    font-size: 16px;
    font-weight: bold;
    color: #000;
    background-color: #FFD732;
    border: none;
    border-radius: 5px;
    transition: background-color 0.3s ease;
  }

  .button1:hover {
    background-color: #e6c200;
  }

  .links {
    display: flex;
    justify-content: space-between;
    margin-top: 15px;
    font-size: 14px;
  }

  .links a {
    text-decoration: none;
    color: #333;
  }

  .links a:hover {
    text-decoration: underline;
    color: #000;
  }
</style>
</head>
<body>

<div class="wrapper">
  <div class="form-container">
    <div id="heading">비밀번호 찾기</div>

    <form action="findPwCheck" method="post">
      <input class="input-field" type="text" name="id" placeholder="아이디 입력">
      <input class="input-field" type="text" name="name" placeholder="이름 입력">

      <div class="button-area">
        <input class="button1" type="submit" value="비밀번호 찾기" onclick="find_submit()">
      </div>
    </form>

    <div class="links">
      <a href="joinput">회원가입하기</a>
      <a href="loginput">로그인하기</a>
    </div>
  </div>
</div>

</body>
</html>
