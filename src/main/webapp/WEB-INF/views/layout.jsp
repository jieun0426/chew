<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title><t:insertAttribute name="title"/></title>
<style type="text/css">
#container {
  display: flex;
  flex-direction: column;
  min-height: 100vh; /* 화면 높이만큼 채움 */
}
header
{
   text-align: center;
   width: 100%;
}
nav
{
      
}
#top
{
   
}

#body
{
   text-align: center;
   width: 100%;
   flex: 1;
   margin-bottom: 50px;
}
#footer
{
   position: relative;
   bottom: 0px;
   width: 100%;
   text-align: center;
   font-size: 15px;
   line-height: 30px;
   background-color: #853b2c;
   color: #ffffff; 
}
#topBtn {
    display: none;
    position: fixed;
    bottom: 40px;
    right: 40px;
    z-index: 999;
    font-size: 16px;
    background-color: #ffcc00;
    color: white;
    padding: 10px 15px;
    border: none;
    border-radius: 8px;
    cursor: pointer;
  }

  #topBtn:hover {
    background-color: #555;
  }
</style>
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
	<button onclick="scrollToTop()" id="topBtn" title="맨 위로">▲</button>
	<script>
	window.onscroll = function () {
		const topBtn = document.getElementById("topBtn");
		if (document.documentElement.scrollTop > 300) {
			topBtn.style.display = "block";
		} else {
			topBtn.style.display = "none";
		}
	};

	function scrollToTop() {
		window.scrollTo({ top: 0, behavior: 'smooth' });
	}
	</script>
</body>
</html>

