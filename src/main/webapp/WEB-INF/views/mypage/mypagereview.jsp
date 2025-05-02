<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
  flex-direction: column;
  
  gap: 12px;
  padding: 2em;
  border-radius: 25px;
  width: 480px;
  margin: 50px auto;
  margin-left: 50px;
  border: none;
  background-image: none;
  filter: none;
  box-shadow: none;
  align-items: center; /* 가운데 정렬 */
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
  text-align: center; /* 텍스트 가운데 정렬 */
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
  filter: none !important;
  background-image: none !important;
}

* {
  box-shadow: none !important;
  outline: none !important;
  appearance: none !important;
  -webkit-appearance: none !important;
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
</head>

<body>

<div class="div-container">
  <div class="category">
    <h1 style="color:#783403 ">마이페이지</h1>
    <a href="mypinfo"  >회원정보 수정</a><br> 
    <a href="mypagereview" style="color:#ED751C ">내가 작성한 리뷰</a><br>
    <a href="mypagedel">회원 탈퇴</a><br>
  </div>

    <form name="f" class="form" action="#" method="post" onsubmit="return send_go()">
      <h1>할 예정</h1>
    </form>
  </div>
<br><br><br><br><br><br><br>
</body>
</html>
