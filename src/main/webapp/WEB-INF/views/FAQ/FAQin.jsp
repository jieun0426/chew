<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
<style type="text/css">
textarea {
	padding: 7px 10px;
	resize: none;
}
</style>
<link rel="stylesheet" href="css/tables.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<h2>FAQ 작성</h2>
<div>
<form action="FAQsave" method="post">
	<input type="submit" value="작성">&emsp;
	<input type="button" value="작성취소" onclick="location.href='FAQ'">
	<table border="1" align="center">
		<tr>
			<th>제목</th>
			<td>
				<input type="text" name="title">
				비밀글 작성 
				<label class="switch">
				  <input type="checkbox" id="secret_check" name="secret_check">
				    <span class="slider"></span>
				</label>
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<textarea rows="5" cols="40" name="content"></textarea>
			</td>
		</tr>
	</table>
</form>
</div>

</body>
</html>