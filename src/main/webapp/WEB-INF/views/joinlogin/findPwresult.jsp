<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 찾기 결과</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

<script type="text/javascript">


function send(){
    var newpw = document.f.newpw.value.trim();
    var newpwconfirm = document.f.newpwconfirm.value.trim();

    if(newpw === ""){
        alert("새 비밀번호를 입력하세요");
        document.f.newpw.focus();
        return false;
    }

    if (newpw.length < 4 || newpw.length > 15){
        alert("비밀번호는 4~15자 이내로 입력해야 합니다!");
        document.f.newpw.focus();
        return false;
    }

    for (var i = 0; i < newpw.length; i++) {
        var c = newpw.charAt(i);
        if (!((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || (c >= '0' && c <= '9'))) {
            alert("비밀번호는 영문 대소문자 또는 숫자만 입력 가능합니다!");
            document.f.newpw.focus();
            return false;
        }
    }

    if(newpw !== newpwconfirm){
        alert("비밀번호가 일치하지 않습니다!");
        document.f.newpwconfirm.focus();
        return false;
    }

    return true;
}



</script>
    
    <style>
        body {
            font-family: 'Arial', sans-serif;
            text-align: center;
            margin-top: 100px;
        }

        .title1 {
            font-size: 20px;
            font-weight: bold;
            color: #DAA520;
            margin-bottom: 15px;
        }

        .title2 {
            font-size: 20px;
            font-weight: bold;
            color: #DAA520;
            margin-bottom: 15px;
        }

        .userpw {
            font-size: 18px;
            font-weight: bold;
            color: #333;
            margin-bottom: 20px;
        }

        .btn-box {
            display: flex;
            justify-content: center;
            gap: 8px;
        }

        .button {
            padding: 8px 16px;
            font-size: 15px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
        }

        .button:hover {
            background-color: #e6c200;
        }

        .login-btn {
            background-color: #FFD700;
            color: #333;
        }

        .idfind-btn {
            background-color: #FFD700;
            color: #333;
        }
        .wrapper {
    display: flex;
    justify-content: center;
    align-items: center;
    /* height: 100%; 삭제 또는 수정 */
    padding-bottom: 40px; /* 아래 공간 확보 */
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
        
    </style>
</head>
<body>
    <div class="result-box">
        
        <c:choose>
            <c:when test="${empty findPw}">
                <div class="title1">회원정보를 확인하지 못했습니다.</div>
                <!-- 로그인하기와 아이디찾기 버튼만 나타남 -->
                <div class="btn-box">
                    <button class="button login-btn" onclick="location.href='loginput'">로그인하기</button>
                    <button class="button idfind-btn" onclick="location.href='login_Idfind'">아이디찾기</button>
                    
                </div>
            </c:when>
            <c:otherwise>
                <div class="title2">회원정보를 확인했습니다.<br>비밀번호를 변경해 주세요</div>
                <div class="wrapper">
                    <div class="form-container">
                        <div id="heading">비밀번호 변경</div>
                        <form name="f" action="updatepw" method="post" onsubmit="return send()">
						    <input type="hidden" name="id" value="${id}">  
						    <input class="input-field" type="password" name="newpw" placeholder="새 비밀번호">
						    <input class="input-field" type="password" name="newpwconfirm" placeholder="새 비밀번호 확인">
						    <div class="button-area">
						        <input class="button1" type="submit" value="비밀번호 변경">
						    </div>
						</form>

                    </div>
                </div>
                <c:if test="${not empty msg}">
			    <div style="color: red; font-weight: bold; margin-bottom: 15px;">
			        ${msg}
			    </div>
			</c:if>
                
            </c:otherwise>
        </c:choose>

    </div>
    <br>
<br>
<br>
<br>
<br>
<br>
</body>
</html>
