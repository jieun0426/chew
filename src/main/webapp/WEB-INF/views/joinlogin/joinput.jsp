<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
    $("#logcheck").click(function(){
        var id = $("#id").val().trim();
        if (id === "") {
            alert("ID를 입력하세요.");
            return;
        }

        $.ajax({
            type: "post",
            url: "logcheck",
            data: { "id": id },
            async: true,
            success: function(data){
                console.log("서버 응답:", data);  // 콘솔 확인
                if(data === "ok"){
                    alert("사용 가능한 ID 입니다.");
                } else {
                    alert("사용 불가능한 ID 입니다.");
                }
            }
        });
    });
});

function send_go(){
    var id = document.f.id.value.trim();
    var pw = document.f.pw.value.trim();
    var name = document.f.name.value.trim();
    var phone = document.f.phone.value.trim();
    var birth = document.f.birth.value.trim();

    if(id === ""){
        alert("ID를 입력하세요");
        document.f.id.focus();
        return false;
    }
    if(pw === ""){
        alert("비밀번호를 입력하세요");
        document.f.pw.focus();
        return false;
    }
    if(name === ""){
        alert("이름을 입력하세요");
        document.f.name.focus();
        return false;
    }
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
    if(phone === ""){
        alert("전화번호를 입력하세요");
        document.f.phone.focus();
        return false;
    }
    if(birth === ""){
        alert("생년월일을 입력하세요");
        document.f.birth.focus();
        return false;
    }
    if (id.length < 4 || id.length > 12) {
        alert("아이디는 4-12자 이내로 입력 가능합니다!");
        document.f.id.focus();
        return false;
    }
    if (pw.length < 4 || pw.length > 15){
        alert("비밀번호는 4-15자 이내로 입력해야 합니다!");
        document.f.pw.focus();
        return false;
    }

    for (var i = 0; i < id.length; i++) {
        var ch = id.charAt(i);
        if (!((ch >= 'a' && ch <= 'z') || (ch >= 'A' && ch <= 'Z') || (ch >= '0' && ch <= '9'))) {
            alert("아이디는 영문 대소문자 또는 숫자만 입력 가능합니다!");
            document.f.id.focus();
            return false;
        }
    }

    for (var i = 0; i < pw.length; i++) {
        var c = pw.charAt(i);
        if (!((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || (c >= '0' && c <= '9'))) {
            alert("비밀번호는 영문 대소문자 또는 숫자만 입력 가능합니다!");
            document.f.pw.focus();
            return false;
        }
    }


    return true;
}


</script>

<style>
.form {
  display: flex;
  flex-direction: column;
  gap: 12px;
  padding: 2em;
  background-color: #fff8e1;
  border-radius: 25px;
  transition: 0.4s ease-in-out;
  width: 450px;
  margin: 50px auto;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

.form:hover {
  transform: scale(1.02);
  border: 2px solid #FFD732;
}

#heading {
  text-align: center;
  margin-bottom: 1em;
  color: #333;
  font-size: 1.6em;
  font-weight: bold;
}

.field {
  display: flex;
  align-items: center;
  gap: 0.5em;
  border-radius: 25px;
  padding: 0.6em;
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
  flex-wrap: wrap;
}

.button {
  padding: 0.6em 1.6em;
  border-radius: 25px;
  border: none;
  cursor: pointer;
  font-weight: bold;
  transition: background-color 0.3s ease;
  background-color: #FFD732;
  color: #333;
}

.button:hover {
  background-color: #ffc400;
}

.id-check-btn {
  margin-left: 10px;
  background-color: #FFD732;
  color: #333;
  border: none;
  border-radius: 10px;
  padding: 5px 10px;
  cursor: pointer;
  font-size: 0.9em;
}

.id-check-btn:hover {
  background-color: #ffc400;
}

.required-label {
  font-size: 0.95em;
  color: #333;
  font-weight: 500;
  margin: 5px 0 2px 5px;
  text-align: left;
}

.required {
  color: red;
  font-weight: bold;
  margin-left: 3px;
}
</style>
</head>
<body>

<form name="f" class="form" action="joinsave" method="post" onsubmit="return send_go()">
  <div id="heading">회원가입</div>

  <label class="required-label">ID <span class="required">*</span></label>
  <div class="field">
    <input class="input-field" type="text" name="id" id="id">
    <input class="id-check-btn" type="button" value="중복확인" id="logcheck">
  </div>

  <label class="required-label">비밀번호 <span class="required">*</span></label>
  <div class="field">
    <input class="input-field" type="password" name="pw">
  </div>

  <label class="required-label">이름 <span class="required">*</span></label>
  <div class="field">
    <input class="input-field" type="text" name="name">
  </div>

  <label class="required-label">전화번호 <span class="required">*</span></label>
  <div class="field">
    <input class="input-field" type="text" name="phone">
  </div>

  <label class="required-label">생년월일 <span class="required">*</span></label>
  <div class="field">
    <input class="input-field" type="date" name="birth">
  </div>

  <div class="btn">
    <input class="button" type="submit" value="회원가입">
    <input class="button" type="reset" value="취소">
  </div>
  
</form>
<br>
<br>
<br>
<br>
<br>
<br>
</body>
</html>
