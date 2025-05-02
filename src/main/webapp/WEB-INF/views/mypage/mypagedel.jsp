<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script>
  function confirmdelete() {
    return confirm("정말 탈퇴하시겠습니까?");
  }
</script>
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

 .form {
  display: flex;
  flex-direction: column;
  background-color: #fff8e1;
  gap: 12px;
  padding: 2em;
  border-radius: 25px;
  width: 480px;
  margin: 50px auto;
  margin-left: 70px;
  border: none;
  background-image: none;
  filter: none;
  box-shadow: none;
  align-items: center; /* 가운데 정렬 */
}

  #heading {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 30px;
  }

  .input-field {
  width: 100%;
  max-width: 400px; /* ← 이 줄 추가 */
  padding: 12px;
  margin-bottom: 0px;
  border: 1px solid #ccc;
  border-radius: 5px;
  font-size: 1em;
}


 .button-area {
  margin: 20px 0;
  width: 100%;
  max-width: 400px; /* 입력창과 동일한 최대 너비 */
}

  .button1 {
    width: 100%;
    padding: 12px;
    max-width: 400px;
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

.div-container {
	margin-top: 30px;
	display: flex;
	width: 90%;
	justify-content: space-evenly;
}

.category {
	margin-top: 70px;
	width: 30%;
	
	margin-left: 40px;
	text-align: left;
}

.category a {
	line-height: 40px;
	font-size: 20px;
	color: black;
	text-decoration: none;
}

.category a:hover {
	color: #ED751C;
}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<c:if test="${not empty alertMessage}">
  <script>alert("${alertMessage}");</script>
</c:if>
<div class="div-container">
  <div class="category">
    <h1 style="color:#783403 ">마이페이지</h1>
    <a href="mypinfo"  >회원정보 수정</a><br> 
    <a href="mypagereview">내가 작성 한 리뷰</a><br>
    <a href="mypagedel" style="color:#ED751C ">회원 탈퇴</a><br>
  </div>
      <form class="form" action="mypagedelsave" method="post" onsubmit="return confirmdelete()">

        <div id="heading">회원탈퇴
        <h4 style="font-size: 16px; color: red">*탈퇴 시, 계정은 삭제되며 복구되지 않습니다.</h4></div>
        <input type="hidden" name="id" value="${sessionScope.id}">
        <input class="input-field" type="password" name="pw" placeholder="비밀번호 입력">
        <div class="button-area">
          <input class="button1" type="submit" value="완료">
        </div>
      </form>
    </div>
</body>

</html>