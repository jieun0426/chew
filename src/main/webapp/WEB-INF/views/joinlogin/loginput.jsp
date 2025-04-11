<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
 .form {
    display: flex;
    flex-direction: column;
    gap: 10px;
    padding: 2em;
    background-color: #fff8e1;
    border-radius: 25px;
    transition: 0.4s ease-in-out;
    width: 400px;
    margin: 100px auto;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  }

  .form:hover {
    transform: scale(1.03);
    border: 2px solid #FFD732;
  }

  #heading {
    text-align: center;
    margin-bottom: 1em;
    color: #333;
    font-size: 1.5em;
    font-weight: bold;
  }

  .field {
    display: flex;
    align-items: center;
    gap: 0.5em;
    border-radius: 25px;
    padding: 0.6em;
    border: none;
    background-color: #fff;
    box-shadow: inset 1px 2px 5px rgba(0, 0, 0, 0.1);
  }

  .input-field {
    background: none;
    border: none;
    outline: none;
    width: 100%;
    color: #333;
    font-size: 1em;
  }

  .form .btn {
    display: flex;
    justify-content: center;
    gap: 1em;
    margin-top: 1.5em;
  }

  .button1,
  .button2 {
    padding: 0.5em 1.5em;
    border-radius: 25px;
    border: none;
    background-color: #FFD732;
    color: #333;
    font-weight: bold;
    cursor: pointer;
    transition: background-color 0.3s ease;
  }

  .button1:hover,
  .button2:hover {
    background-color: #ffc400;
  }
</style>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form class="form" action="logsave" method="post">
  <div id="heading">로그인</div>

  <div class="field">
    <input class="input-field" type="text" name="id" placeholder="아이디 입력">
  </div>

  <div class="field">
    <input class="input-field" type="password" name="pw" placeholder="비밀번호 입력">
  </div>

  <div class="btn">
    <input class="button1" type="submit" value="로그인">
    <input class="button2" type="reset" value="취소">
  </div>
</form>
</body>
</html>