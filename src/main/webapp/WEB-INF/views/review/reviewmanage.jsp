<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>리뷰 관리 페이지</title>
<style>
    .div-container {
        display: flex;
        justify-content: center; /* 수평 가운데 정렬 */
        align-items: flex-start; /* 수직 정렬을 위로 맞춤 */
        width: 100%;
        min-height: 100vh; /* 화면 전체 높이를 채우되, 화면이 더 클 때 유연함 */
        margin-top: 50px;
    }

    h2 {
        margin: 0; /* 여백 제거 */
        text-align: center;
    }

    .container {
        width: 70%;
        padding: 30px;
        margin-bottom: 10px;
        border-radius: 10px;
        background-color: #f9f9f9;
    }

    table {
        width: 100%;
        margin: 20px 0;
        border-collapse: collapse;
        font-size: 15px;
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
</style>
</head>
<body>

	   <div class="div-container">
	    <div class="container">
	        <h2>리뷰 관리 페이지</h2>
	
	        <table>
	            <thead>
	                <tr>
	                    <th>매장명</th>
	                    <th>별점</th>
	                    <th>리뷰수</th>
	                </tr>
	            </thead>
	            <tbody>
	                <!-- storeList를 반복문으로 출력 -->
	                <c:forEach var="store" items="${storeList}">
	                    <tr>
	                        <td>${store.storename}</td>  <!-- 매장명 -->
	                        <td>${store.averageRating}</td>  <!-- 평균 별점 -->
	                        <td>${store.reviewcount}</td>  <!-- 리뷰 수 -->
	                    </tr>
	                </c:forEach>
	            </tbody>
	        </table>
	    </div>  
	</div>
	   

</body>
</html>
