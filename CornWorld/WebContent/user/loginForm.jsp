<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>사용자 관리(UserMan in Model2)</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/user.css' />" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Gaegu:300,400,700|Poor+Story&amp;subset=korean" rel="stylesheet">
<style>

body {
font-family: 'Gaegu', cursive;
font-size: 23px;
}
.babycorn {
background-repeat: repeat-x;
margin-left: auto;
margin-right: auto;
text-align : center;
}
.btn-group {
margin-left: auto;
margin-right: auto;
text-align : center;
}
.button {
font-family:'Roboto';
margin-left: auto;
margin-right: auto;
text-align : center;
background-color: #93E1D8;
border: none;
padding: 15px 30px;
border-radius: 15px;
cursor: pointer;
position:relative;
}

/*여긴 임시*/
* { box-sizing:border-box; }

/* basic stylings ------------------------------------------ */

div.container {
font-family:'Roboto';
width:600px;
margin:50px auto 50px;
display:block;
background:#FFF;
}
h2 {
text-align:center;
margin-bottom:50px;
}
h2 small {
font-weight:normal;
color:#888;
display:block;
}
.footer { text-align:center; }
.footer a { color:#53B2C8; }

/* form starting stylings ------------------------------- */
.group {
position:relative;
margin-bottom:45px;
padding: 0px 0px 0px 150px;
}
input.input {
font-size:18px;
padding:10px 10px 10px 10px;
width:300px;
border:none;
border-bottom:1px solid #757575;
}
input:focus { outline:none; }

/* LABEL ======================================= */
label {
color:#999;
font-size:18px;
font-weight:normal;
position:absolute;
pointer-events:none;
left:5px;
top:10px;
transition:0.2s ease all;
-moz-transition:0.2s ease all;
-webkit-transition:0.2s ease all;
padding: 0px 0px 0px 150px;
}

/* active state */
input:focus ~ label, input:valid ~ label {
top:-20px;
font-size:14px;
color:#5264AE;
}

/* BOTTOM BARS ================================= */
.bar { position:relative; display:block; width:300px; }
.bar:before, .bar:after {
content:'';
height:2px;
width:0;
bottom:1px;
position:absolute;
background:#5264AE;
transition:0.2s ease all;
-moz-transition:0.2s ease all;
-webkit-transition:0.2s ease all;
}
.bar:before {
left:50%;
}
.bar:after {
right:50%;
}

/* active state */
input:focus ~ .bar:before, input:focus ~ .bar:after {
width:50%;
}

/* HIGHLIGHTER ================================== */
.highlight {
position:absolute;
height:60%;
width:100px;
top:25%;
left:0;
pointer-events:none;
opacity:0.5;
}

/* active state */
input:focus ~ .highlight {
-webkit-animation:inputHighlighter 0.3s ease;
-moz-animation:inputHighlighter 0.3s ease;
animation:inputHighlighter 0.3s ease;
}

/* ANIMATIONS ================ */
@-webkit-keyframes inputHighlighter {
from { background:#5264AE; }
to { width:0; background:transparent; }
}
@-moz-keyframes inputHighlighter {
from { background:#5264AE; }
to { width:0; background:transparent; }
}
@keyframes inputHighlighter {
from { background:#5264AE; }
to { width:0; background:transparent; }
}

</style>
<script>
function login() {
if (form.userId.value == "") {
alert("사용자 ID를 입력하십시오.");
form.userId.focus();
return false;
}
if (form.password.value == "") {
alert("비밀번호를 입력하십시오.");
form.password.focus();
return false;
}
form.submit();
}

function userCreate(targetUri) {
form.action = targetUri;
form.submit();
}
</script>
</head>
<body class = "body" bgcolor=#FFFFFF text=#000000 >
<div class="container">

<img src="<c:url value='/images/login_banner.png' />" width = "600px" height = "180px" />
<br><br><br>
<form name="form" method="POST" action="<c:url value='/user/login' />">

<div class="group">
<input class="input" type="text" name="userId" required>
<span class="highlight"></span>
<span class="bar"></span>
<label>ID</label>
</div>

<div class="group">
<input class="input" type="password" name="password" required>
<span class="highlight"></span>
<span class="bar"></span>
<label>PASSWORD</label>
</div>

</form>
</div>
<div class="btn-group">
<input type="button" class="button" value="메인 " style="font-family: 'Gaegu', cursive; font-size:15pt; font-weight:bold" onclick="location.href='/CornWorld/'"> &nbsp;
<input type="button" class="button" value="로그인" style="font-family: 'Gaegu', cursive; font-size:15pt; font-weight:bold" onClick="login()"> &nbsp;
<input type="button" class="button" value="회원가입" style="font-family: 'Gaegu', cursive; font-size:15pt; font-weight:bold" onClick="userCreate('<c:url value='/user/register/form' />')">

</div>
<div class='babycorn'><img src="<c:url value='/images/login_babycorns.png' />"/></div>
</body>
</html>