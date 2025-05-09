<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/vtable.css">

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="modify" method="post" enctype="multipart/form-data">
   <input type="hidden" name="storeimage" value="${dto.storeimage}">
   <table border="1" width="600px" align="center">
      <tr>
         <th>매장코드</th><td><input type="text" name="storecode" readonly value="${dto.storecode}"></td>
      </tr>
      <tr>
         <th>매장명</th><td><input type="text" name="storename" value="${dto.storename}"></td>
      </tr>
      <tr>
         <th>매장주소</th><td><input type="text" name="storeaddress" value="${dto.storeaddress}">
      </tr>
      <tr>
         <th>매장카테고리</th><td><input type="text" name="storecategory" value="${dto.storecategory}">
      </tr>
      <tr>
         <th>지역</th><td><input type="text" name="storearea" value="${dto.storearea}">
      </tr>
      <tr>   
         <th>매장이미지</th>
         <td>
            <div class="file-input-container">
             <!-- <input type="file" id="file-input" class="file-input" onchange="displayFileName()"> -->
              <input type="file" id="storeimage" name="storeimage" class="file-input" onchange="displayFileName()">
             <label for="storeimage" class="plusButton" title="파일 선택">
              <svg class="plusIcon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 30 30">
                <path d="M13.75 23.75V16.25H6.25V13.75H13.75V6.25H16.25V13.75H23.75V16.25H16.25V23.75H13.75Z"></path>
              </svg>
            </label>
            <input type="file" id="storeimage" />                
              <span id="file-name" class="file-name"></span> <!-- 선택된 파일 이름 표시 -->
            </div>   
            <!-- <input type="file" name="storeimage" class="buttons1"><br><br> -->
            <img src="./image/${dto.storeimage}" width="200px" height="150px">
         <br><br>
      </td>
      </tr>
      <tr>    
       <th>상세이미지</th>
       <td>
           <div style="display: grid; grid-template-columns: 1fr 1fr; grid-template-rows: 1fr 1fr; gap: 10px;">
               <c:forEach var="i" begin="0" end="3" varStatus="status">
                   <div class="file-input-container">
                       <input type="file" id="storeimage${i}" name="storeimage${i}" class="file-input" onchange="displayFileName(this)">
                      <label for="storeimage${i}" class="plusButton" title="파일 선택">
                    <svg class="plusIcon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 30 30">
                      <path d="M13.75 23.75V16.25H6.25V13.75H13.75V6.25H16.25V13.75H23.75V16.25H16.25V23.75H13.75Z"></path>
                    </svg>
                  </label>
                  <input type="file" id="storeimage${i}" style="display: none;" />
              
                       <span class="file-name"></span>
                       <br>
                       <c:if test="${status.index < fn:length(images)}">
                           <img src="${pageContext.request.contextPath}/image/${images[status.index].image_filename}" 
                                width="200px" height="150px"
                                style="margin-top: 5px; border: 1px solid #ccc; border-radius: 8px;">
                                <!-- 기존 이미지 파일명을 hidden으로 전송 -->
                           <input type="hidden" name="oldFilename${status.index}" value="${images[status.index].image_filename}">
                       </c:if>
                   </div>
               </c:forEach>
           </div>
       </td>
   </tr>
      
      
   </table>   
   
   <br>
   <input type="submit" value ="수정확인" class="buttons1">&emsp;
   <input type="button" value ="취소" class="buttons1" onclick="location.href='sout';"> 

</form>
	
	
	
</body>
</html>