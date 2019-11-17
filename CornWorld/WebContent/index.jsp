<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width">
<script>
function ShowTable(atable, btable, ctable) {
    eval(atable).style.display="";
    eval(btable).style.display="none";
    eval(ctable).style.display="none";
}
function ShowAllTable(atable, btable, ctable) {
    eval(atable).style.display="";
    eval(btable).style.display="";
    eval(ctable).style.display="";
}
</script>
<style>
body {
background: url('http://i.hizliresim.com/v4Qykv.png') no-repeat center center fixed;
-webkit-background-size: cover;
-moz-background-size: cover;
-o-background-size: cover;
background-size: cover;
font-family: 'Roboto', Tahoma, Arial, sans-serif;
line-height: 1.5;
font-size: 13px;
}

form {
outline: 0;
float: right;
-webkit-box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
-webkit-border-radius: 4px;
border-radius: 4px;
}

form > .textbox {
outline: 0;
height: 30px;
width: 200px;
line-height: 42px;
padding: 0 16px;
background-color: rgba(255, 255, 255, 0.8);
color: #212121;
border: 0;
float: center;
-webkit-border-radius: 4px 0 0 4px;
border-radius: 4px 0 0 4px;
}

form > .textbox:focus {
outline: 0;
background-color: #FFF;
}

form > .button {
outline: 0;
background: none;
background-color: rgba(38, 50, 56, 0.8);
float: right;
height: 42px;
width: 42px;
text-align: center;
line-height: 42px;
border: 0;
color: #FFF;
font: normal normal normal 14px/1 FontAwesome;
font-size: 16px;
text-rendering: auto;
text-shadow: 0 1px 1px rgba(0, 0, 0, 0.2);
-webkit-transition: background-color .4s ease;
transition: background-color .4s ease;
-webkit-border-radius: 0 4px 4px 0;
border-radius: 0 4px 4px 0;
}
<!-- 로그인,회원가입 -->
form > .button:hover {
background-color: rgba(0, 150, 136, 0.8);
}

@import url(https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css);
@import url(https://fonts.googleapis.com/css?family=Lato:300,400,700);

body {
font-family: 'Lato', sans-serif;
background: #fff;
color: #000;
}
.jumbotron h1 {
color: #353535;
}

span.icon {
margin: 0 5px;
color: #D64541;
}

/* Global Button Styles */
a.animated-button:link, a.animated-button:visited {
position: relative;
display: block;
margin: 30px auto 0;
padding: 14px 15px;
color: #fff;
font-size:14px;
font-weight: bold;
text-align: center;
text-decoration: none;
text-transform: uppercase;
overflow: hidden;
letter-spacing: .08em;
border-radius: 0;
text-shadow: 0 0 1px rgba(0, 0, 0, 0.2), 0 1px 0 rgba(0, 0, 0, 0.2);
-webkit-transition: all 1s ease;
-moz-transition: all 1s ease;
-o-transition: all 1s ease;
transition: all 1s ease;
}
a.animated-button:link:after, a.animated-button:visited:after {
content: "";
position: absolute;
height: 0%;
left: 50%;
top: 50%;
width: 300%;
z-index: -1;
-webkit-transition: all 0.75s ease 0s;
-moz-transition: all 0.75s ease 0s;
-o-transition: all 0.75s ease 0s;
transition: all 0.75s ease 0s;
}
a.animated-button:link:hover, a.animated-button:visited:hover {
color: #FFF;
text-shadow: none;
}
a.animated-button:link:hover:after, a.animated-button:visited:hover:after {
height: 450%;
}
a.animated-button:link, a.animated-button:visited {
position: relative;
display: block;
margin: 30px auto 0;
padding: 14px 15px;
color: #fff;
font-size:14px;
border-radius: 0;
font-weight: bold;
text-align: center;
text-decoration: none;
text-transform: uppercase;
overflow: hidden;
letter-spacing: .08em;
text-shadow: 0 0 1px rgba(0, 0, 0, 0.2), 0 1px 0 rgba(0, 0, 0, 0.2);
-webkit-transition: all 1s ease;
-moz-transition: all 1s ease;
-o-transition: all 1s ease;
transition: all 1s ease;
}

a.animated-button.thar-two {
color: #000;
cursor: pointer;
display: block;
position: relative;
border: 2px solid #F7CA18;
transition: all 0.4s cubic-bezier(0.215, 0.61, 0.355, 1) 0s;
}
a.animated-button.thar-two:hover {
color: #000 !important;
background-color: transparent;
text-shadow: ntwo;
}
a.animated-button.thar-two:hover:before {
top: 0%;
bottom: auto;
height: 100%;
}
a.animated-button.thar-two:before {
display: block;
position: absolute;
left: 0px;
bottom: 0px;
height: 0px;
width: 100%;
z-index: -1;
content: '';
color: #000 !important;
background: #F7CA18;
transition: all 0.4s cubic-bezier(0.215, 0.61, 0.355, 1) 0s;
}
a.animated-button.thar-three {
color: #000;
cursor: pointer;
display: block;
position: relative;
border: 2px solid #F7CA18;
transition: all 0.4s cubic-bezier(0.42, 0, 0.58, 1);
0s;
}
a.animated-button.thar-three:hover {
color: #000 !important;
background-color: transparent;
text-shadow: nthree;
}
a.animated-button.thar-three:hover:before {
left: 0%;
right: auto;
width: 100%;
}
a.animated-button.thar-three:before {
display:block;
position: absolute;
top: 0px;
right: 0px;
height: 100%;
width: 0px;
z-index: -1;
content: '';
color: #000 !important;
background: #F7CA18;
transition: all 0.4s cubic-bezier(0.42, 0, 0.58, 1);
0s;
}


#primary_nav_wrap
{
	margin-top:25px
}

#primary_nav_wrap ul
{
	list-style:none;
	position:relative;
	float:center;
	margin:0;
	padding:0
}

#primary_nav_wrap ul a
{
	display:block;
	color:#333;
	text-decoration:none;
	font-weight:700;
	font-size:20px;
	line-height:32px;
	padding:0 15px;
	font-family:"HelveticaNeue","Helvetica Neue",Helvetica,Arial,sans-serif
}

#primary_nav_wrap ul li
{
	position:relative;
	float:left;
	margin:0;
	padding:0
}

#primary_nav_wrap ul li.current-menu-item
{
	background:#ddd
}

#primary_nav_wrap ul li:hover
{
	background:#f6f6f6
}

#primary_nav_wrap ul ul
{
	display:none;
	position:absolute;
	top:100%;
	left:0;
	background:#fff;
	padding:0
}

#primary_nav_wrap ul ul li
{
	float:none;
	width:200px
}

#primary_nav_wrap ul ul a
{
	line-height:120%;
	padding:10px 15px
}

#primary_nav_wrap ul ul ul
{
	top:0;
	left:100%
}

#primary_nav_wrap ul li:hover > ul
{
	display:block
}
</style>

<title>기프티콘을 사고 파는 중콘나라!</title>

</head>

<body>




<table width = "100%">
<tr>

<td><div align="center">

<img src="<c:url value='/images/jungconlogo.png' />" class="center" width="400" height="300" />
</td>
<td>
</div>

<div class="row">
<% if (session.getAttribute("user") == null) { %>
<div class="col-md-3 col-sm-3 col-xs-6"> <a href="user/loginForm.jsp" class="btn btn-sm animated-button thar-two">로그인</a> </div>
<div class="col-md-3 col-sm-3 col-xs-6"> <a href="user/registerForm.jsp" class="btn btn-sm animated-button thar-three">회원가입</a> </div>
<% } else { %>
<div class="col-md-3 col-sm-3 col-xs-6"> <a href="<c:url value='/user/logout' />" class="btn btn-sm animated-button thar-three">로그아웃 </a> </div>
<div class="col-md-3 col-sm-3 col-xs-6"> <a href="posts/list" class="btn btn-sm animated-button thar-two">상품정보 </a> </div>
<div class="col-md-3 col-sm-3 col-xs-6"> <a href="posts/createForm.jsp" class="btn btn-sm animated-button thar-three">글쓰기 </a> </div>
<% } %>
</div></td>
</tr>

</table>
<br><br><br>


<nav id="primary_nav_wrap">
<ul>
  <li class="current-menu-item"><a href="#" onclick="ShowAllTable('movie_table', 'cafe_table', 'convin_table');">Home</a></li>
  <li><a href="#" onclick="ShowTable('cafe_table', 'movie_table', 'convin_table');" >카페 </a></li>
  <li><a href="#" onclick="ShowTable('convin_table', 'movie_table', 'cafe_table');">편의점 </a></li>
  <li><a href="#" onclick="ShowTable('movie_table', 'convin_table', 'cafe_table');">영화 </a></li>
  <li><a href="#"  onclick="ShowAllTable('movie_table', 'cafe_table', 'convin_table');">기타 </a></li>
</ul>
</nav>
<br><br><br><br><br><br>

 <table align="center" width = "100%" height = "70%" id="cafe_table" style="display:;">
   <tr= width = "100%" height = "70%" >
       <td width = "100" height = "100"><center/><img src="<c:url value='/images/starbucks.png' />" width="150" height="150" /></a><center/><br><b/>스타벅스 </td>
       <td width = "100" height = "70"><center/><img src="<c:url value='/images/coffeebean.png' />" width="150" height="150" /></a><center/><br><b/>커피빈 </td>
       <td width = "100" height = "70"><center/><img src="<c:url value='/images/angel.png' />" width="150" height="150" /></a><center/><br><b/>엔젤리너스 </td>
   	  
   </tr>
	
   <tr= width = "100%" height = "70%" >
       <td width = "100" height = "70"><center/><img src="<c:url value='/images/tomntoms.png' />" width="150" height="150" /></a><center/><br><b/>탐앤탐스 </td>
       <td width = "100" height = "70"><center/><img src="<c:url value='/images/coffine.png' />" width="150" height="150" /></a><center/><br><b/>커핀그루나루 </td>
       <td width = "100" height = "70"><center/><img src="<c:url value='/images/hollys.png' />" width="150" height="150" /></a><center/><br><b/>할리스커피 </td>
   </tr>
   <tr= width = "100%" height = "70%" >
       <td width = "100" height = "70"><center/><img src="<c:url value='/images/twosome.png' />" width="250" height="150" /></a><center/><br><b/>투썸플레이스 </td>
       <td width = "100" height = "70"><center/><img src="<c:url value='/images/coffebene.png' />" width="250" height="150" /></a><center/><br><b/>커피베네 </td>
       <td width = "100" height = "70"><center/><img src="<c:url value='/images/ediya.png' />" width="150" height="150" /></a><center/><br><b/>이디야 </td>
   </tr><!-- 첫번째 줄 끝 -->
</table>

<table align="center" width = "100%" height = "70%" id="convin_table" style="display:;">
   <tr width = "100%" height = "70%">
       <td width = "100" height = "70"><center/><img src="<c:url value='/images/GS25.png' />" width="150" height="150" /></a><center/><br><b/>GS25 </td>
       <td width = "100" height = "70"><center/><img src="<c:url value='/images/CU.jpg' />" width="150" height="150" /></a><center/><br><b/>CU </td>
       <td width = "100" height = "70"><center/><img src="<c:url value='/images/seven.png' />" width="150" height="150" /></a><center/><br><b/>세븐일레븐  </td>
   </tr><!-- 두번째 줄 끝 -->
</table>
<table align="center" width = "100%" height = "70%" id="movie_table" style="display:;">
   <tr width = "100%" height = "70%"><!-- 첫번째 줄 시작 -->
       <td width = "100" height = "70"><center/><img src="<c:url value='/images/CGV.jpg' />" width="250" height="150" /></a><center/><br><b/>CGV </td>
       <td width = "100" height = "70"><center/><img src="<c:url value='/images/lottecinema.png' />" width="250" height="150" /></a><center/><br><b></b>롯데시네마 </td>
       <td width = "100" height = "70"><center/><img src="<c:url value='/images/mega.jpg' />" width="150" height="150" /></a><center/><br><b/>메가박스 </td>
   </tr><!— 두번째 줄 끝 —>
</table>




<br><br><br><br><br><br><br><br><br><br><br><br>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script src="js/bootstrap.min.js"></script>

</body>

</html>