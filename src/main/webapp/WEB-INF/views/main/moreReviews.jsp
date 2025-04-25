<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:forEach var="r" items="${list}">
    <div class="review">
        <div class="review-header">
            <span class="review-avatar-emoji">👤</span>
            <span class="review-id">${r.id}</span>
        </div>
        <div class="review-stars">
            <c:forEach var="i" begin="1" end="${r.stars}">★</c:forEach>
            <c:forEach var="i" begin="${r.stars + 1}" end="5">☆</c:forEach>
        </div>
        <div class="review-title">${r.title}</div>
        <div class="review-content">${r.content}</div>
    </div>
</c:forEach>