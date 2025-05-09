<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/vtable.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>스토어 이미지</title>
<script>
src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js">
</script>
<!-- 나중에 js로 분리 -->
<script type="text/javascript">
$(document).ready(function(){
	$('#img1').click(function(){
		const formData = new FormData();
		const fileInput = $('#img1')[0].files[0];
		if (!fileInput){
			alert('파일 다시 선택');
			return;
		}
		formData.append('img1',fileInput);
		$.ajax({
			url:'storeimg',
			data:formData,
			processData:false,
			contentType:false,
			success: function(res){
				$('#uploadimg').append('<div class="uploadimg">
				<img src="/image/${res.fileName}"
				style="width:700px;"
				onclick="imgdetail('${res.fileName}')">
				</div>
				');
				alert('이미지 업로드 성공');
			},
			error: function(xhr){
				alert('업로드 실패'+xhr.responseText);
				}
			});
		})
	});
</script>
<!-- 까지  -->

</head>
<body>
<form action="storesave" method="post" enctype="multipart/form-data">
	<table border="1" width="500px" align="center">
		<tr>
			<th>매장코드</th>
			<td><input type="text" id="storecode" name="storecode" ></td>
		</tr>
		<tr>
			<th>매장명</th>
			<td><input type="text" id="storename" name="storename" ></td>
		</tr>
		<tr>
			<th>매장주소</th>
			<td><input type="text" id="storeaddress" name="storeaddress" ></td>
		</tr>
		<tr>
			<th>매장카테고리</th>
			<td><input type="text" id="storecategory" name="storecategory" ></td>
		</tr>
		<tr>
			<th>지역</th>
			<td><input type="text" id="storearea" name="storearea" ></td>
		</tr>
		<tr>
			<th>매장이미지</th>
			<td style="padding-left: 20px;">
				<div class="file-input-container">
				 <!-- <input type="file" id="file-input" class="file-input" onchange="displayFileName()"> -->
				  <input type="file" id="storeimage" name="storeimage" class="file-input" onchange="displayFileName()">
				  <label for="storeimage" class="file-label" style="text-align: center; display: flex;" >
				    파일 선택&ensp;
				    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path fill="currentColor" d="M19.999 4h-16c-1.103 0-2 .897-2 2v12c0 1.103.897 2 2 2h16c1.103 0 2-.897 2-2V6c0-1.103-.897-2-2-2m-13.5 3a1.5 1.5 0 1 1 0 3a1.5 1.5 0 0 1 0-3m5.5 10h-7l4-5l1.5 2l3-4l5.5 7z"/></svg>
				  </label>
				  <span id="file-name" class="file-name"></span> <!-- 선택된 파일 이름 표시 -->
				</div>
			</td>
		</tr>
	</table>
	<br>
	<button class="btn btn-success buttons1" id="btn1" type="submit">전송</button>&emsp;
	<button class="btn btn-info buttons1" id="btn2" type="reset" onclick="location.href='main'">취소</button>
</form>
<script type="text/javascript">
function displayFileName() {
  var input = document.getElementById("storeimage");
  var fileName = input.files[0].name; // 첫 번째 파일의 이름 가져오기
  document.getElementById("file-name").textContent = fileName; // 이름 표시
}
</script>

</body>
</html>