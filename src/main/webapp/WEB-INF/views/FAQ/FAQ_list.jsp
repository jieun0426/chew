<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<table border="1" align="center" width="1000px">
		<tr>
			<th width="120px">답변상태</th>
			<th width="640px">제목</th>
			<th width="120px">작성자</th>
			<th width="120px">작성일</th>
		</tr>

		<c:if test="${qlist==null}">
			<tr><td colspan="4">등록된 FAQ가 없습니다</td></tr>
		</c:if>
		<c:if test="${qlist!=null}">
			<c:forEach items="${qlist}" var="q">
				<c:if test="${q.secret==1}">
					<tr>
						<td>${q.state}</td><td><button class="titleBtn" value="${q.num}">비밀글입니다 </button></td><td>${q.id}</td><td>${q.wdate}</td>
					</tr>
				</c:if>
				<c:if test="${q.secret==0}">
					<tr>
						<td>${q.state}</td><td><button class="titleBtn" value="${q.num}">${q.title}</button></td><td>${q.id}</td><td>${q.wdate}</td>
					</tr>
				</c:if>
				
			</c:forEach>
		</c:if>
			
	</table>

