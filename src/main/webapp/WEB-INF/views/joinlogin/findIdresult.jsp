<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>아이디 찾기 결과</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            text-align: center;
            margin-top: 100px;
        }

    

        .title {
            font-size: 20px;
            font-weight: bold;
            color: #DAA520;
            margin-bottom: 15px;
        }

        .userid {
            font-size: 18px;
            font-weight: bold;
            color: #333;
            margin-bottom: 20px;
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

        .pwfind-btn {
            background-color: #FFD700;
            color: #333;
        }
    </style>
</head>
<body>
    <div class="result-box">
        <div class="title">회원님의 아이디를 확인해 주세요</div>
        <c:choose>
            <c:when test="${empty findId}">
                <div class="userid">조회 결과가 없습니다.</div>
            </c:when>
            <c:otherwise>
                <div class="userid">${findId}</div>
            </c:otherwise>
        </c:choose>
          <div class="wrapper">
                    <button class="button login-btn" onclick="location.href='loginput'">로그인하기</button>
                    <button class="button pwfind-btn" onclick="location.href='login_Pwfind'">비밀번호찾기</button>
                </div>
                <c:if test="${not empty msg}">
			    <div style="color: red; font-weight: bold; margin-bottom: 15px;">
			        ${msg}
			    </div>
			</c:if>
    </div>
</body>
</html>
