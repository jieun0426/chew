<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
  .form {
    display: flex;
    flex-direction: column;
    gap: 15px;
    padding: 2em;
    background-color: #fff8e1;
    border-radius: 25px;
    width: 360px;
    margin: 100px auto;
    align-items: center;
    box-shadow: none !important;
  background-image: none !important;
  filter: none !important;
  border: none !important;
  }

  #heading {
    text-align: center;
    color: #333;
    font-size: 1.5em;
    font-weight: bold;
  }

  .field {
    width: 100%;
    max-width: 304px;
  }

  .input-field {
    width: 100%;
    max-width: 304px;
    padding: 12px 16px;
    border-radius: 10px;
    border: 1px solid #ccc;
    outline: none;
    font-size: 1em;
    box-sizing: border-box;
  }

	* {
  box-shadow: none !important;
  outline: none !important;
  appearance: none !important;
  -webkit-appearance: none !important;
}
		
	
  .btn {
  box-shadow: none !important;
  filter: none !important;
  background-image: none !important;
}

  .button1 {
    width: 304px;
    padding: 12px 14px;
    font-size: 16px;
    font-weight: bold;
    color: #000;
    background-color: #FFD732;
    border: none;
    border-radius: 10px;
    cursor: pointer;
    box-sizing: border-box;
    box-shadow: none;
  }

  .button1:hover {
    background-color: #e6c200;
  }

  .links {
    font-size: 13px;
    text-align: center;
    margin-top: -10px;
    margin-bottom: 10px;
  }

  body, div, span, a, h3, .snslogin-divider span {
    user-select: none;
  }

  .links a {
    text-decoration: none;
    color: #6a1b9a;
    font-weight: bold;
    margin: 0 5px;
    outline: none;
    cursor: pointer;
  }

  .links a:hover {
    color: #2698cb;
  }

 

  .snslogin-wrapper {
    width: 100%;
    text-align: center;
    margin-top: 40px;
  }

  .snslogin-divider {
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 20px;
  }

  .snslogin-divider::before,
  .snslogin-divider::after {
    content: "";
    flex: 1;
    height: 1px;
    background-color: #D4B229;
    margin: 0 10px;
  }

  .snslogin-divider span {
    font-size: 13px;
    font-weight: bold;
    color: #333;
  }

  .sns-buttons {
    display: flex;
    flex-direction: column;
    gap: 10px;
    width: 100%;
    align-items: center;
  }

.sns-btn {
  display: flex;
  align-items: center;
  justify-content: center; 
  gap: 12px;
  width: 304px;
  padding: 12px 16px;
  border-radius: 10px;
  font-size: 16px;
  font-weight: bold;
  cursor: pointer;
  border: none;
  box-sizing: border-box;
  position: relative;
}

.sns-btn img {
  position: absolute;
  left: 16px; 
  width: 24px;
  height: 24px;
}


.sns-btn,
.sns-btn:hover,
.sns-btn:active,
.sns-btn:visited {
  text-decoration: none !important;
}
 
  .sns-kakao {
    background-color: #FEE500;
    text-decoration:none;
    color: #3C1E1E;
  }

  .sns-kakao:hover {
    background-color: #e6c200;
  }

  .sns-naver {
    background-color: #00B818;
    text-decoration:none;
    color: white;
  }

  .sns-naver:hover {
    background-color: #00AD17;
  }

  .sns-google {
    background-color: #F4FFFF;
    text-decoration:none;
    color: black;
  }

  .sns-google:hover {
    background-color: #E0EBEB;
  }
</style>
<meta charset="EUC-KR">
<title>로그인</title>
</head>
<body>
<c:if test="${not empty sessionScope.alertMessage}">
    <script>
        alert('${sessionScope.alertMessage}');
    </script>
    <c:remove var="alertMessage" scope="session"/>
</c:if>

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
  </div>

  <c:if test="${not empty msg}">
    <div style="color: red; font-weight: bold; margin-bottom: 15px;">
      ${msg}
    </div>
  </c:if>

  <div class="links">
  <a href="joinput">회원가입</a>
    <span>|</span>
    <a href="login_Idfind">아이디찾기</a>
    <span>|</span>
    <a href="login_Pwfind">비밀번호찾기</a>
  </div>

  <div class="snslogin-wrapper">
    <div class="snslogin-divider">
      <span>SNS 계정으로 로그인하기</span>
    </div>
    <div class="sns-buttons">
<a href="errorpage"
   class="sns-btn sns-kakao">
  <img src="./image/kakaosymbol.png" alt="카카오 아이콘">
  카카오 로그인
</a>



      <a href="errorpage"
   class="sns-btn sns-naver">
  <img src="./image/naver.png" alt="네이버 아이콘">
  네이버로 로그인
</a>


<a href="errorpage"
   class="sns-btn sns-google">
  <img src="./image/google.png" alt="구글 아이콘">
  구글로 로그인
</a>

    </div>
  </div>
</form>
</body>
</html>
