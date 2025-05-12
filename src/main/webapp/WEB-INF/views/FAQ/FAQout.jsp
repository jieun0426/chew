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
 font-size: 8px; /* 스위치 크기 */
 position: relative;
 display: inline-block;
 width: 3.5em;
 height: 2em;
 line-height: 2.8em;
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
svg {
	vertical-align: -1px;
}
</style>
<link rel="stylesheet" href="css/htable.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var loginstate=${loginstate};
	var id="${id}";
	console.log(loginstate);
	
	$(document).on("click", "#writeBtn", function(){
		if(loginstate){
			location.href='FAQin';
		}else{
			alert("로그인 후 작성 가능합니다");
		}
	});
	
	$(document).on("change", "#myFAQ", function(){
		var check=$(this).prop('checked');
		
		console.log("check:"+check+", id:"+id+", loginstate:"+loginstate);
		if(loginstate){
			$.ajax({
				url: "myFAQ",
	            method: "GET",
	            data: { 
	            	"check":check,
	            	 "page": 1
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
	
	$(document).on("click", ".secretBtn", function(){
		var qnum = $(this).val();
	    var loginid = "${id}";
	    var $currentRow = $(this).closest("tr");

	    // 이미 존재하는 댓글 tr이 있으면 제거 (토글 효과)
	    if ($currentRow.next().hasClass("replyRow")) {
	        $currentRow.next().remove();
	        return;
	    }

	    $.ajax({
	        url: "faq_secretBtn_click",
	        method: "POST",
	        data: { 
	            "qnum": qnum,
	            "id": loginid
	        },
	        success: function (data) {
	        	if(data=="fail"){
	        		alert("작성자만 볼 수 있습니다.");
	        	}else{
	        		// 댓글 data는 <td colspan='4'>내용</td> 같이 서버에서 렌더링
		            var replyRow = $("<tr class='replyRow'><td colspan='4'>" + data + "</td></tr>");
		            $currentRow.after(replyRow);
	        	}
	        },
	        error: function () {
	            alert("리스트를 불러오는 데 실패했습니다.");
	        }
	    });
	});
	
	$(document).on("click", ".titleBtn", function(){
		var qnum = $(this).val();
	    var loginid = "${id}";
	    var $currentRow = $(this).closest("tr");

	    // 이미 존재하는 댓글 tr이 있으면 제거 (토글 효과)
	    if ($currentRow.next().hasClass("replyRow")) {
	        $currentRow.next().remove();
	        return;
	    }

	    $.ajax({
	        url: "faq_titleBtn_click",
	        method: "POST",
	        data: { 
	            "qnum": qnum,
	            "id": loginid
	        },
	        success: function (data) {
	            // 댓글 data는 <td colspan='4'>내용</td> 같이 서버에서 렌더링
	            var replyRow = $("<tr class='replyRow'><td colspan='4'>" + data + "</td></tr>");
	            $currentRow.after(replyRow);
	        },
	        error: function () {
	            alert("리스트를 불러오는 데 실패했습니다.");
	        }
	    });
	});
	
	$(document).on("click", ".reply_inputBtn", function(){
		var qnum = $(this).data("qnum");
	    var loginid = "${id}";
	    var $currentRow = $(this).closest("tr");

	    // 이미 존재하는 댓글 tr이 있으면 제거
	    if ($currentRow.next().hasClass("replyRow")) {
	        $currentRow.next().remove();
	        return;
	    }

	    $.ajax({
	        url: "faq_reply_input",
	        method: "POST",
	        data: { 
	            "qnum": qnum,
	            "id": loginid
	        },
	        success: function (data) {
	            var replyRow = $("<tr class='replyRow'><td colspan='4'>" + data + "</td></tr>");
	            $currentRow.after(replyRow);
	        },
	        error: function () {
	            alert("리스트를 불러오는 데 실패했습니다.");
	        }
	    });
	});
	
	$(document).on("submit", "#replyForm", function(e){
	    e.preventDefault(); // 기본 제출 막기

	    var formData = $(this).serialize();

	    $.ajax({
	        url: "faq_save_reply",
	        method: "POST",
	        data: formData,
	        success: function(response){
	            alert("답변이 등록되었습니다!");
	            // 리스트를 새로고침하거나 해당 tr을 다시 렌더링
	            location.reload();
	        },
	        error: function(){
	            alert("답변 등록 실패");
	        }
	    });
	});
	
	$(document).on("click", ".reply_updateBtn", function(){
		var qnum = $(this).data("qnum");
	    var loginid = "${id}";
	    var $currentRow = $(this).closest("tr");

	    // 이미 존재하는 댓글 tr이 있으면 제거
	    if ($currentRow.next().hasClass("replyRow")) {
	        $currentRow.next().remove();
	        return;
	    }

	    $.ajax({
	        url: "faq_reply_updateForm",
	        method: "POST",
	        data: { 
	            "qnum": qnum,
	            "id": loginid
	        },
	        success: function (data) {
	            var replyRow = $("<tr class='replyRow'><td colspan='4'>" + data + "</td></tr>");
	            $currentRow.after(replyRow);
	        },
	        error: function () {
	            alert("리스트를 불러오는 데 실패했습니다.");
	        }
	    });
	});
	
	$(document).on("submit", "#replyUpdateForm", function(e){
	    e.preventDefault(); // 기본 제출 막기

	    var formData = $(this).serialize();

	    $.ajax({
	        url: "faq_reply_update",
	        method: "POST",
	        data: formData,
	        success: function(response){
	            alert("답변이 등록되었습니다!");
	            // 리스트를 새로고침하거나 해당 tr을 다시 렌더링
	            location.reload();
	        },
	        error: function(){
	            alert("답변 등록 실패");
	        }
	    });
	});
});
</script>
</head>
<body>
<h2>FAQ</h2>

<div id="FAQ_list">
	<c:if test="${check==true}">
		<div>
			<input type="button" id="writeBtn" value="FAQ 작성">
			내 FAQ만 보기 <label class="switch">
				<input type="checkbox" id="myFAQ" checked>
			    <span class="slider"></span>
			</label>
		</div>
	</c:if>
	<c:if test="${check==false}">
		<div>
			<input type="button" id="writeBtn" value="FAQ 작성">
			내 FAQ만 보기 <label class="switch">
				<input type="checkbox" id="myFAQ">
			    <span class="slider"></span>
			</label>
		</div>
	</c:if>	

	<table width="1000px">
		<thead>
			<tr>
				<th width="120px">답변상태</th>
				<th width="640px">제목</th>
				<th width="120px">작성자</th>
				<th width="120px">작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty qlist}">
					<tr><td colspan="4">등록된 FAQ가 없습니다</td></tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${qlist}" var="q">
						<c:if test="${q.secret==1}">
							<tr>
								<td>${q.state}</td>
								<td>
									<c:if test="${id==q.id || id=='admin'}">
										<button class="secretBtn" value="${q.num}">${q.title} <svg xmlns="http://www.w3.org/2000/svg" width="1.2em" height="1.2em" viewBox="0 0 24 24"><path fill="currentColor" d="M10.25 14.75a1.75 1.75 0 1 1 2.5 1.582V17a.75.75 0 0 1-1.5 0v-.668a1.75 1.75 0 0 1-1-1.582"/><path fill="currentColor" d="M7.25 7a4.75 4.75 0 0 1 9.5 0v2.356c.34.058.654.15.953.303a3.75 3.75 0 0 1 1.638 1.638c.227.445.321.925.366 1.471c.043.531.043 1.187.043 2v1.464c0 .813 0 1.469-.043 2c-.045.546-.14 1.026-.366 1.47a3.75 3.75 0 0 1-1.639 1.64c-.444.226-.924.32-1.47.365c-.531.043-1.187.043-2 .043H9.768c-.813 0-1.469 0-2-.043c-.546-.045-1.026-.14-1.47-.366a3.75 3.75 0 0 1-1.64-1.639c-.226-.444-.32-.924-.365-1.47c-.043-.531-.043-1.187-.043-2v-1.464c0-.813 0-1.469.043-2c.045-.546.14-1.026.366-1.47a3.75 3.75 0 0 1 1.639-1.64a3.3 3.3 0 0 1 .952-.302zm8 0a3.25 3.25 0 0 0-6.5 0v2.254q.463-.005 1.018-.004h4.464q.556-.001 1.018.004zm-7.36 3.788c-.453.037-.714.107-.911.207a2.25 2.25 0 0 0-.984.984c-.1.197-.17.458-.207.912c-.037.462-.038 1.056-.038 1.909v1.4c0 .852 0 1.447.038 1.91c.037.453.107.714.207.912c.216.423.56.767.984.983c.197.1.458.17.912.207c.462.037 1.057.038 1.909.038h4.4c.853 0 1.447 0 1.91-.038c.453-.038.714-.107.912-.207c.423-.216.767-.56.983-.983c.1-.198.17-.459.207-.913c.037-.462.038-1.057.038-1.909v-1.4c0-.853 0-1.447-.038-1.91c-.038-.453-.107-.714-.207-.912a2.25 2.25 0 0 0-.983-.983c-.198-.1-.459-.17-.913-.207c-.462-.037-1.057-.038-1.909-.038H9.8c-.852 0-1.447 0-1.91.038"/></svg></button>
									</c:if>
									<c:if test="${q.id!=id && id!='admin'}">
										<button class="secretBtn" value="${q.num}">비밀글입니다 <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24"><path fill="currentColor" d="M10.25 14.75a1.75 1.75 0 1 1 2.5 1.582V17a.75.75 0 0 1-1.5 0v-.668a1.75 1.75 0 0 1-1-1.582"/><path fill="currentColor" d="M7.25 7a4.75 4.75 0 0 1 9.5 0v2.356c.34.058.654.15.953.303a3.75 3.75 0 0 1 1.638 1.638c.227.445.321.925.366 1.471c.043.531.043 1.187.043 2v1.464c0 .813 0 1.469-.043 2c-.045.546-.14 1.026-.366 1.47a3.75 3.75 0 0 1-1.639 1.64c-.444.226-.924.32-1.47.365c-.531.043-1.187.043-2 .043H9.768c-.813 0-1.469 0-2-.043c-.546-.045-1.026-.14-1.47-.366a3.75 3.75 0 0 1-1.64-1.639c-.226-.444-.32-.924-.365-1.47c-.043-.531-.043-1.187-.043-2v-1.464c0-.813 0-1.469.043-2c.045-.546.14-1.026.366-1.47a3.75 3.75 0 0 1 1.639-1.64a3.3 3.3 0 0 1 .952-.302zm8 0a3.25 3.25 0 0 0-6.5 0v2.254q.463-.005 1.018-.004h4.464q.556-.001 1.018.004zm-7.36 3.788c-.453.037-.714.107-.911.207a2.25 2.25 0 0 0-.984.984c-.1.197-.17.458-.207.912c-.037.462-.038 1.056-.038 1.909v1.4c0 .852 0 1.447.038 1.91c.037.453.107.714.207.912c.216.423.56.767.984.983c.197.1.458.17.912.207c.462.037 1.057.038 1.909.038h4.4c.853 0 1.447 0 1.91-.038c.453-.038.714-.107.912-.207c.423-.216.767-.56.983-.983c.1-.198.17-.459.207-.913c.037-.462.038-1.057.038-1.909v-1.4c0-.853 0-1.447-.038-1.91c-.038-.453-.107-.714-.207-.912a2.25 2.25 0 0 0-.983-.983c-.198-.1-.459-.17-.913-.207c-.462-.037-1.057-.038-1.909-.038H9.8c-.852 0-1.447 0-1.91.038"/></svg></button>
									</c:if>
								</td>
								<td>${q.id}</td>
								<td>${q.wdate}</td>
							</tr>
						</c:if>
						<c:if test="${q.secret==0}">
							<tr>
								<td>${q.state}</td>
								<td>
									<button class="titleBtn" value="${q.num}">${q.title}</button>
								</td>
								<td>${q.id}</td>
								<td>${q.wdate}</td>
							</tr>
						</c:if>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	
	<c:if test="${qlist!=null}">
		<div style="align-items: center; line-height: 2em;">
			<c:if test="${pdto.startPage>pdto.cntPage}">
				<a href="FAQ?page=${pdto.startPage-pdto.cntPage}&check=${check}">
					<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24">
						<path fill="currentColor" fill-rule="evenodd" d="M14.884 16.884a1.25 1.25 0 0 1-1.768 0L8.232 12l4.884-4.884a1.25 1.25 0 0 1 1.768 1.768L11.768 12l3.116 3.116a1.25 1.25 0 0 1 0 1.768" clip-rule="evenodd"/>
					</svg>
				</a>&emsp;
			</c:if>
			<c:forEach begin="${pdto.startPage}" end="${pdto.endPage}" var="p">
				<c:if test="${p==pdto.nowPage}">
					<span id="nowPage" style="font-weight: bold;">${p}</span>&emsp;
				</c:if>
				<c:if test="${p!=pdto.nowPage}">
					<a class="pageList" href="FAQ?page=${p}&check=${check}">${p}</a>&emsp;
				</c:if>
			</c:forEach>
			<c:if test="${pdto.endPage<pdto.lastPage}">
				<a href="FAQ?page=${pdto.startPage+pdto.cntPage}&check=${check}" style="vertical-align: center;">
					<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24">
						<path fill="currentColor" fill-rule="evenodd" d="M9.116 7.116a1.25 1.25 0 0 1 1.768 0L15.768 12l-4.884 4.884a1.25 1.25 0 0 1-1.768-1.768L12.232 12L9.116 8.884a1.25 1.25 0 0 1 0-1.768" clip-rule="evenodd"/>
					</svg>
				</a>
			</c:if>
		</div>
	</c:if>
</div>

</body>
</html>