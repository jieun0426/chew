<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
<link rel="stylesheet" href="css/buttons.css">
<link rel="stylesheet" href="css/tables.css">
<link rel="stylesheet" href="css/search.css">
<style>
table { border-collapse: collapse; width: 90%; margin: 20px auto; }
th, td { border: 1px solid #ddd; padding: 8px; text-align: center; }
th { background-color: #f2f2f2; }
.align_center { text-align: center; }
.message { text-align: center; padding: 10px; margin-bottom: 15px; }
.success { color: green; border: 1px solid green; background-color: #e9f7ef; }
.error { color: red; border: 1px solid red; background-color: #fdecea; }
/* 삭제 버튼을 링크처럼 보이게 하는 스타일 */
.delete-button {
    background: none!important;
    border: none;
    padding: 0!important;
    color: #069; /* 링크 색상 */
    text-decoration: underline;
    cursor: pointer;
    }
</style>

<script>
    // 삭제 확인 JavaScript 함수
    function confirmDelete() {
        return confirm('정말로 이 회원을 삭제하시겠습니까?');
    }
</script>

</head>
<!-- ---------------------------- -->
<body>
<h1>회원목록창</h1>
<div class="input_div" style="text-align: center; margin-bottom: 20px;">
	<form action="membersearch" method="get">
		<div class="group">
			<svg class="icon" aria-hidden="true" viewBox="0 0 24 24"><g><path d="M21.53 20.47l-3.66-3.66C19.195 15.24 20 13.214 20 11c0-4.97-4.03-9-9-9s-9 4.03-9 9 4.03 9 9 9c2.215 0 4.24-.804 5.808-2.13l3.66 3.66c.147.146.34.22.53.22s.385-.073.53-.22c.295-.293.295-.767.002-1.06zM3.5 11c0-4.135 3.365-7.5 7.5-7.5s7.5 3.365 7.5 7.5-3.365 7.5-7.5 7.5-7.5-3.365-7.5-7.5z"></path></g></svg>
			</path></g></svg>
			<input placeholder="회원 검색" type="search" class="input" name="search">
		<button type="submit" class="button">회원검색 </button>
		</div>
	</form>
</div>


<!-- 성공오류메시지 표시 -->
<c:if test="${not empty errorMessage}">
	<p style="color: red; text-align: center;">${errorMessage}</p>
</c:if>


<div>
	<table>
	  <thead>
	    <tr>
	        <th>회원아이디</th>
	        <th>회원이름</th>
	        <th>회원연락처</th>
	        <th>생년월일</th>
	        <th colspan="2">회원관리</th>
	    </tr>
	</thead>
 <tbody>
		<c:choose>
	     	<c:when test="${not empty memberList}"> 
					<c:forEach items="${memberList}" var="member">
					     <tr>
				            <td class="align_center">
						    <a href="${pageContext.request.contextPath}/mypinfo?id=${member.id}">${member.id}</a>
					      	</td>
					         
					         <td class="align_center">${member.name}</td>
					         <td class="align_center">${member.phone}</td> 
					         <td class="align_center">
					         	<fmt:formatDate value="${member.birth}" pattern="yyyy-MM-dd"/> 
					         </td>
					         
					         <td class="align_center">
					             <a href="${pageContext.request.contextPath}/memberupdate?id=${member.id}">수정</a>
					         </td>
					         
					         <td class="align_center">
					             <a href="${pageContext.request.contextPath}/memberdelete?id=${member.id}">삭제</a>
					         </td>
					         
					     </tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="6">등록된 회원이 없습니다.</td>
					</tr>
			</c:otherwise>
		</c:choose>
	  </tbody>	
	</table>
</div>
<br><br>


<!-- 페이징 처리부분 -->
<div style="text-align: center;">
    <c:if test="${pdto != null}"> 
        <c:if test="${pdto.startPage > pdto.cntPage}">
            <a href="members?page=${pdto.startPage - pdto.cntPage}">◀</a>&emsp;
        </c:if>

        <c:forEach begin="${pdto.startPage}" end="${pdto.endPage}" var="p">
            <c:choose>
               <c:when test="${p == pdto.nowPage}">
                    <span id="nowPage" style="font-weight: bold; color:#DDA0DD;">${p}</span>&emsp;
                </c:when>
                <c:otherwise>
                    <a class="pageList" href="members?page=${p}">${p}</a>&emsp;
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <c:if test="${pdto.endPage < pdto.lastPage}">
            <a href="members?page=${pdto.startPage + pdto.cntPage}">▶</a>
        </c:if>
    </c:if>
</div>

</body>
</html>