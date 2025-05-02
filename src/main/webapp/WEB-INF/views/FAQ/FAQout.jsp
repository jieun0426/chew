<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
<style type="text/css">
/* The switch - the box around the slider */
.switch {
 font-size: 10px; /* 스위치 크기 */
 position: relative;
 display: inline-block;
 width: 3.5em;
 height: 2em;
}

/* Hide default HTML checkbox */
.switch input {
 opacity: 0;
 width: 0;
 height: 0;
}

/* The slider */
.slider {
 position: absolute;
 cursor: pointer;
 top: 0;
 left: 0;
 right: 0;
 bottom: 0;
 background-color: #ccc;
 transition: .4s;
 border-radius: 30px;
}

.slider:before {
 position: absolute;
 content: "";
 height: 1.4em;
 width: 1.4em;
 border-radius: 20px;
 left: 0.3em;
 bottom: 0.3em;
 background-color: white;
 transition: .4s;
}

input:checked + .slider {
 background-color: rgb(255, 175, 2);
}

input:focus + .slider {
 box-shadow: 0 0 1px rgb(0,221,80);
}

input:checked + .slider:before {
 transform: translateX(1.5em);
}
.titleBtn {
	background-color: rgba(255,255,255,0);
	border: none;
}
.titleBtn:hover {
	cursor: pointer;
}
.secretBtn {
	background-color: rgba(255,255,255,0);
	border: none;
}
.secretBtn:hover {
	cursor: pointer;
}
#FAQ_list {
	margin-bottom: 30px;
}
</style>
<link rel="stylesheet" href="css/tables.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var loginstate=${loginstate};
	var id="${id}";
	console.log(loginstate);
	
	$("#writeBtn").click(function(){
		if(loginstate){
			location.href='FAQin';
		}else{
			alert("로그인 후 작성 가능합니다");
		}
	});
	
	$("#myFAQ").change(function(){
		var check=$(this).prop('checked');
		
		console.log("check:"+check+", id:"+id+", loginstate:"+loginstate);
		if(loginstate){
			$.ajax({
				url: "myFAQ",
	            method: "POST",
	            data: { 
	            	"check":check
	            },
	            success: function (data) {
	                $("#FAQ_list").html(data);
	            },
	            error: function () {
	                alert("리스트를 불러오는 데 실패했습니다.");
	            }
			});
		}else{
			alert("로그인 후 사용가능");
			$(this).prop('checked',false);
		}
	});
	
	$(".secretBtn").click(function(){
		
	});
	
	$(".titleBtn").click(function(){
		
	});
});
</script>
</head>
<body>
<h2>FAQ</h2>
<div>
	<input type="button" id="writeBtn" value="FAQ 작성"> &emsp;
	내 FAQ만 보기 <label class="switch">
	  <input type="checkbox" id="myFAQ">
	    <span class="slider"></span>
	</label>
</div>
<div id="FAQ_list">
	<table border="1" align="center" width="1000px">
		<tr>
			<th width="120px">답변상태</th>
			<th width="640px">제목</th>
			<th width="120px">작성자</th>
			<th width="120px">작성일</th>
		</tr>
		<c:choose>
			<c:when test="${qlist==null}">
				<tr><td colspan="4">등록된 FAQ가 없습니다</td></tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${qlist}" var="q">
					<c:if test="${q.secret==1}">
						<tr>
							<td>${q.state}</td><td><button class="secretBtn" value="${q.num}">비밀글입니다 </button></td><td>${q.id}</td><td>${q.wdate}</td>
						</tr>
					</c:if>
					<c:if test="${q.secret==0}">
						<tr>
							<td>${q.state}</td><td><button class="titleBtn" value="${q.num}">${q.title}</button></td><td>${q.id}</td><td>${q.wdate}</td>
						</tr>
					</c:if>
				</c:forEach>
			</c:otherwise>
		</c:choose>
			
	</table>
</div>

<c:if test="${qlist!=null}">
	<div>
		<c:if test="${pdto.startPage>pdto.cntPage}">
			<a href="FAQ?page=${pdto.startPage-pdto.cntPage}">◀</a>&emsp;
		</c:if>
		<c:forEach begin="${pdto.startPage}" end="${pdto.endPage}" var="p">
			<c:if test="${p==pdto.nowPage}">
				<span id="nowPage">${p}</span>&emsp;
			</c:if>
			<c:if test="${p!=pdto.nowPage}">
				<a class="pageList" href="FAQ?page=${p}">${p}</a>&emsp;
			</c:if>
		</c:forEach>
		<c:if test="${pdto.endPage<pdto.lastPage}">
			<a href="FAQ?page=${pdto.startPage+pdto.cntPage}">▶</a>
		</c:if>
	</div>
</c:if>
</body>
</html>