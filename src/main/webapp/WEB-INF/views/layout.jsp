<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/layout.css">
<meta charset="UTF-8">
<title><t:insertAttribute name="title"/></title>
</head>
<body>

<div id="container">
	<div id="top">
		<t:insertAttribute name="top"/>
	</div>
	<div id="body">
		<t:insertAttribute name="body"/>
	</div>
	<div id="footer">
		<t:insertAttribute name="footer"/>
	</div>
</div>

<a id="scroll-up" class="scroll-up" href="#" onclick="scrollToTop()">
  <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
    <path d="M0 0h24v24H0z" fill="none"></path>
    <path fill="rgba(255,255,255,1)" d="M11.9997 10.8284L7.04996 15.7782L5.63574 14.364L11.9997 8L18.3637 14.364L16.9495 15.7782L11.9997 10.8284Z"></path>
  </svg>
</a>

<script>
window.onscroll = function () {
  const scrollUpBtn = document.getElementById("scroll-up");
  if (document.documentElement.scrollTop > 300) {
    scrollUpBtn.style.display = "block";
  } else {
    scrollUpBtn.style.display = "none";
  }
};

function scrollToTop() {
  window.scrollTo({ top: 0, behavior: 'smooth' });
}
</script>

</body>
</html>

