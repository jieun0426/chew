<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
th,tr{text-align: center;}
</style>
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
<table border="1" width="400px" align="center">
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
	<th>매장좋아요수</th>
	<td><input type="text" id="storelikes" name="storelikes" ></td>
</tr>
<tr>
	<th>지점</th>
	<td><input type="text" id="storearea" name="storearea" ></td>
</tr>
<tr>
	<th>매장이미지</th>
	<td><input type="file" id="storeimage" name="storeimage" ></td>
</tr>
<tr style="text-align: center;">
	<td colspan="2">
	<button class="btn btn-success" type="submit">전송</button>
	<button class="btn btn-info" type="reset" onclick="location.href='main'">취소</button>
	</td>
</tr>
</table>
</form>
</body>
</html>