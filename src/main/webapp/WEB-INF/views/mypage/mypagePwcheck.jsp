<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
 
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
    text-align: center;
  }

  #heading {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 30px;
  }

  .input-field {
  width:350px;
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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
  <div class="wrapper">
    <div class="form-container">
<c:if test="${not empty alertMessage}">
  <script>alert("${alertMessage}");</script>
</c:if>
      <form class="form" action="mypagepwchecking" method="post">
        <div id="heading">마이페이지</div>
        <input class="input-field" type="password" name="pw" placeholder="비밀번호 입력">
        <div class="button-area">
          <input class="button1" type="submit" value="완료">
        </div>
      </form>
    </div>
  </div>
</body>

</html>