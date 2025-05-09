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
   background-color: #FBF8EF;

}
#footer
{
   position: relative;
   bottom: 0px;
   width: 100%;
   height: 200px;
   text-align: center;
   font-size: 15px;
   line-height: 30px;
   background-color: #C6B89E;
   color: #EDD892;
   margin-top: 0;
   padding-top: 0;
   padding-bottom: 10px;
   border-bottom-left-radius: 20px;
   border-bottom-right-radius: 20px;'
}
/* <reset-style> ============================ */
a {
  text-decoration: none;
}
/* <main-style> ============================ */
.scroll-up {
  position: fixed; /* 주석 해제 */
  right: 3rem;
  bottom: 3rem; /* 항상 오른쪽 하단에 위치 */
  z-index: 10;
  width: 32px;
  height: 32px;
  border-radius: 4px; 
  background-color: #D5C7BC;
  backdrop-filter: saturate(180%) blur(20px);
  -webkit-backdrop-filter: saturate(180%) blur(20px);
  display: flex;
  align-items: center;
  justify-content: center;
  overflow: hidden;
  transition: bottom .4s, transform .4s;
}


.scroll-up:hover {
  transform: translateY(-.25rem);
}

/* Show scroll-up */
._show-scroll {
  bottom: 3rem;
}

@media (max-width: 1199.98px) {
  .scroll-up {
    right: 1rem;
  }
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

