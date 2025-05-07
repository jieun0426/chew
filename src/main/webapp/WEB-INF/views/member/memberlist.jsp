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
.editBtn, .deleteBtn {
    background: none!important;
    border: none;
    padding: 0!important;
    color: #069;
    text-decoration: underline;
    cursor: pointer;
    font: inherit;
    outline: none;
    display: inline;
}

    
    
</style>


</head>



                  <!-- ContextPath 선언  -->
                  
<script>   var contextPath = "${pageContext.request.contextPath}"; console.log("컨텍스트패스:",contextPath,"키값",key,"밸류값",val) </script>

<script src="${pageContext.request.contextPath}/js/member.js"></script>


            <!-- -----------회원검색창----------------- -->
<body>
<h1>회원목록창</h1>


                       <!-- 검색버튼 수정 -->
<div class="input_div" style="text-align: center; margin-bottom: 20px;">
    <button type="button" class="button" onclick="openSearchModal()">회원검색</button>
</div>

                  <!-- 검색 모달창 -->

	<div id="searchModal" style="display:none; position:fixed; top:20%; left:40%; background:#fff; border:1px solid #ccc; padding:20px; z-index:1000;">
    <form id="memberSearchForm" onsubmit="return false;">
        <select name="searchKey" id="searchKey">
            <option value="id">아이디</option>
            <option value="name">이름</option>
            <option value="phone">연락처</option>
            <option value="birth">생년월일</option>
        </select>
        <input type="text" name="searchValue" id="searchValue" placeholder="검색어 입력">
        <button type="button" onclick="MemberSearch()">검색</button>
        <button type="button" onclick="closeSearchModal()">닫기</button>
    </form>
    <div id="searchResult"></div>
</div>

	
         
                  
                 
	
                   <!--  삭제 모달 창  -->   
                    
 <div id="deleteModal" style="display:none; position:fixed; left:0; top:0; width:100vw; height:100vh; background:rgba(0,0,0,0.3); z-index:9999;">
 <div style="background:#fff; width:300px; margin:200px auto; padding:20px; border-radius:8px; text-align:center;">
    <p>정말 삭제하시겠습니까?</p>
    <button id="deleteYesBtn">예</button>
    <button id="deleteNoBtn">취소</button>
  </div>
</div>	


               <!--   성공오류메시지 표시   -->
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
				            <td class="align_center">${member.id}</td>
					         
					         <td class="align_center">${member.name}</td>
					         <td class="align_center">${member.phone}</td> 
					         <td class="align_center">
					         	<fmt:formatDate value="${member.birth}" pattern="yyyy-MM-dd"/> 
					         </td>
					         
					         <td class="align_center">
					         <a href="${pageContext.request.contextPath}/mypinfo?id=${member.id}" class="editBtn">수정</a>
							 </td>
						     </form>
					         <td class="align_center">
						        <form action="${pageContext.request.contextPath}/memberdelete" method="post" class="deleteForm" style="display:inline;">
							    <input type="hidden" name="id" value="${member.id}">
							    <button type="button" class="deleteBtn" style="display:inline;">삭제</button>
						     </form>
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
            <a href="${pageContext.request.contextPath}/members?page=${pdto.startPage - pdto.cntPage}">◀</a>&emsp;
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