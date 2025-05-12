<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>검색</title>
<link rel="stylesheet" href="css/search.css">
<link rel="stylesheet" href="css/storeout.css">
<style>
.container {
  width: 70%;
  padding: 30px;
  border-radius: 10px;
  margin: 20px auto 50px auto;
  display: flex;
  flex-direction: column;
  align-items: center;
  text-align: center;
}

.no-book {
  text-align: center;
  color: gray;
  padding: 50px;
}

table {
  width: 90%;
  border-collapse: collapse;
  font-size: 15px;
  margin: 0 auto;
}

thead {
  border-bottom: 2px solid #ED751C;
  background-color: #fff4ea;
}

th {
  padding: 15px 10px;
  text-align: center;
  color: #ED751C;
  font-weight: bold;
  background-color: white;
  font-size: 16px;
}

td {
  padding: 14px 10px;
  text-align: center;
  color: #333;
  border-bottom: 1px solid #eee;
  background-color: white;
}

.store-name a {
  color: #ED751C;
  font-weight: bold;
  font-size: 16px;
  text-decoration: none;
}

.slink {
  text-decoration: none;
  cursor: pointer;
  font-weight: bold;
}

.slink:hover {
  color: #ED751C;
  text-decoration: underline;
}
    
/* 페이징 */
#nowPage{
  color: black;
  font-weight: bold;
  margin-left: 40px;
}
.pageList{
  color: #aaaa7a;
  text-decoration: none; 
}
.pageList, #nowPage {
  margin: 0 2px;  /* 좌우 간격 5px로 설정 */
  font-size: 16px;
  text-decoration: none;
}
</style>
</head>
<body>
<script type="text/javascript">
	$(document).ready(function(){
		$("#allCheck").change(function(){
			$(".deleteCheckbox").prop("checked", $(this).prop("checked"));
		});
		
		$(".deleteBtn").click(function(){
			// 체크된 체크박스들의 값을 배열로 수집
		    var checkedValues = [];
		    
		    $(".deleteCheckbox:checked").each(function() {
		        checkedValues.push($(this).val());
		    });

		    // 만약 선택된 항목이 있다면
		    if (checkedValues.length > 0) {
		        // AJAX 요청으로 서버로 데이터 전송
		        $.ajax({
		            type: "POST",          // POST 방식으로 요청
		            url: "deleteSelectedItems",  // 서버의 URL을 여기에 입력
		            data: { ids: checkedValues.join(',') },  // 체크된 체크박스의 값 배열을 전송
		            success: function(response) {
		                // 서버로부터 응답이 오면 실행할 코드
		                console.log("예약삭제 성공:", response);
		                // 응답에 따라 처리 (예: 삭제된 항목 목록 갱신 등)
		                alert("예약이 삭제되었습니다");
		                location.href='booklist';
		            },
		            error: function(xhr, status, error) {
		                console.log("오류:", error);
		            }
		        });
		    } else {
		        alert("삭제할 항목을 선택해주세요.");
		    }
		});
	});
</script>

<!-- 예약 관리 테이블 -->
<div class="container">
	<!-- 검색창 + 삭제 버튼 -->
	<div style="width: 95%; margin: 30px auto 40px;">
		<div style="display: flex; justify-content: space-between; align-items: center;">
	    
		    <!-- 가운데 정렬된 검색창 -->
		    <div class="search-group">
				<form action="bookmanage_search">
					<div class="group">
						<svg class="icon" aria-hidden="true" viewBox="0 0 24 24"><g><path d="M21.53 20.47l-3.66-3.66C19.195 15.24 20 13.214 20 11c0-4.97-4.03-9-9-9s-9 4.03-9 9 4.03 9 9 9c2.215 0 4.24-.804 5.808-2.13l3.66 3.66c.147.146.34.22.53.22s.385-.073.53-.22c.295-.293.295-.767.002-1.06zM3.5 11c0-4.135 3.365-7.5 7.5-7.5s7.5 3.365 7.5 7.5-3.365 7.5-7.5 7.5-7.5-3.365-7.5-7.5z"></path></g></svg>
						<input placeholder="예약자 검색" type="search" class="input" name="search">
					</div>
				</form>
			</div>
		    
		    <!-- 삭제 버튼 (오른쪽 정렬) -->
		    <button type="button" class="deleteBtn" style=" margin-right: 30px;">
		      <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 69 14" class="svgIcon bin-top">
		        <g clip-path="url(#clip0_35_24)">
		          <path fill="black" d="M20.8232 2.62734L19.9948 4.21304C19.8224 4.54309 19.4808 4.75 19.1085 4.75H4.92857C2.20246 4.75 0 6.87266 0 9.5C0 12.1273 2.20246 14.25 4.92857 14.25H64.0714C66.7975 14.25 69 12.1273 69 9.5C69 6.87266 66.7975 4.75 64.0714 4.75H49.8915C49.5192 4.75 49.1776 4.54309 49.0052 4.21305L48.1768 2.62734C47.3451 1.00938 45.6355 0 43.7719 0H25.2281C23.3645 0 21.6549 1.00938 20.8232 2.62734Z"></path>
		        </g>
		        <defs>
		          <clipPath id="clip0_35_24"><rect fill="white" height="14" width="69"></rect></clipPath>
		        </defs>
		      </svg>
		      <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 69 57" class="svgIcon bin-bottom">
		        <g clip-path="url(#clip0_35_22)">
		          <path fill="black" d="M20.8232 -16.3727L19.9948 -14.787C19.8224 -14.4569 19.4808 -14.25 19.1085 -14.25H4.92857C2.20246 -14.25 0 -12.1273 0 -9.5C0 -6.8727 2.20246 -4.75 4.92857 -4.75H64.0714C66.7975 -4.75 69 -6.8727 69 -9.5C69 -12.1273 66.7975 -14.25 64.0714 -14.25H49.8915C49.5192 -14.25 49.1776 -14.4569 49.0052 -14.787L48.1768 -16.3727C47.3451 -17.9906 45.6355 -19 43.7719 -19H25.2281C23.3645 -19 21.6549 -17.9906 20.8232 -16.3727ZM64.0023 1.0648C64.0397 0.4882 63.5822 0 63.0044 0H5.99556C5.4178 0 4.96025 0.4882 4.99766 1.0648L8.19375 50.3203C8.44018 54.0758 11.6746 57 15.5712 57H53.4288C57.3254 57 60.5598 54.0758 60.8062 50.3203L64.0023 1.0648Z"></path>
		        </g>
		        <defs>
		          <clipPath id="clip0_35_22"><rect fill="white" height="57" width="69"></rect></clipPath>
		        </defs>
		      </svg>
		    </button>
		</div>
	</div>
	
	<c:if test="${empty bookma}">
		<div class="no-book">검색내역이 없습니다.</div>
	</c:if>
	
	<c:if test="${not empty bookma}">
	<table>
		<thead>
			<tr>
		        <th>매장명</th>
		        <th>예약자</th>
		        <th>인원수</th>
		        <th>예약상태</th>
		        <th>예약날짜</th>
		        <th>예약시간</th>
		        <th><input type="checkbox" id="allCheck"></th>
	     		</tr>
	   	</thead>
		<tbody>
			<c:forEach var="bookm" items="${bookma}">
			<tr>
		        <td class="store-name">
					<a href="detailview?storecode=${bookm.STORECODE}" class="slink">${bookm.STORENAME}</a>
		        </td>
		        <td><a href="bookmanage_detail?storecode=${bookm.STORECODE}">${bookm.ID}</a></td>
		        <td>${bookm.SARAMSU}</td>
		        <td>${bookm.STATE}</td>
		        <td><fmt:formatDate value="${bookm.BOOKINGDATE}" pattern="yyyy-MM-dd" /></td>
		        <td>${bookm.BOOKINGTIME}</td>
		        <td class="align_center">
		          <input type="checkbox" id="check_${bookm.STORECODE}" class="deleteCheckbox" value="${bookm.STORECODE}">
		        </td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	</c:if>
	<br><br>
	<div>
		<c:if test="${pdto.startPage>pdto.cntPage}">
			<a href="booklist?page=${pdto.startPage-pdto.cntPage}">◀</a>&emsp;
		</c:if>
		<c:forEach begin="${pdto.startPage}" end="${pdto.endPage}" var="p">
			<c:if test="${p==pdto.nowPage}">
				<span id="nowPage">${p}</span>&emsp;
			</c:if>
			<c:if test="${p!=pdto.nowPage}">
				<a class="pageList" href="booklist?page=${p}">${p}</a>&emsp;
			</c:if>
		</c:forEach>
		<c:if test="${pdto.endPage<pdto.lastPage}">
			<a href="booklist?page=${pdto.startPage+pdto.cntPage}">▶</a>
		</c:if>
	</div>
</div>

</body>
</html>
