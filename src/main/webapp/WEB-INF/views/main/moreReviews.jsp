<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:forEach var="r" items="${list}">
  <c:set var="reviewKey" value="${r.storecode}_${r.id}" />
  
  <div class="review" id="review-${reviewKey}">

    <!-- 기존 리뷰 표시 영역 -->
    <div id="review-display-${reviewKey}">
      <div class="review-header">
        <span class="review-avatar-emoji">👤</span>
        <span class="review-id">${r.id}</span>
      </div>

      <div class="review-stars">
        <c:forEach var="i" begin="1" end="${r.stars}">★</c:forEach><c:forEach var="i" begin="${r.stars + 1}" end="5">☆</c:forEach>
      </div>

      <div class="review-title">${r.title}</div>
      <div class="review-content">${r.content}</div>

      <c:if test="${loginstate == true && r.id == id}">
        <div class="review-buttons">
          <button type="button" class="btn" onclick="showEdit('${reviewKey}')">수정</button>
          <form action="deleteReview" method="post" class="review-btn-form">
            <input type="hidden" name="id" value="${r.id}">
            <input type="hidden" name="storecode" value="${r.storecode}">
            <button type="submit" class="btn cancel">삭제</button>
          </form>
        </div>
      </c:if>
    </div>

    <!-- 리뷰 수정 폼 -->
    <div class="review-edit" id="edit-${reviewKey}" style="display: none;">
      <form action="editReview" method="post">
        <input type="hidden" name="id" value="${r.id}">
        <input type="hidden" name="storecode" value="${r.storecode}">

        <div class="edit-group">
          <input type="text" name="title" value="${r.title}">
        </div>

        <div class="edit-group">
          <textarea name="content">${r.content}</textarea>
        </div>

        <div class="edit-buttons">
          <button type="submit" class="btn">수정완료</button>
          <button type="button" class="btn cancel" onclick="cancelEdit('${reviewKey}')">취소</button>
        </div>
      </form>
    </div>
  </div>
</c:forEach>