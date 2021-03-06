<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>회원가입 </title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/user.css' />" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Gaegu:300,400,700|Poor+Story&amp;subset=korean" rel="stylesheet">
<style>
td {
       font-family: 'Gaegu', cursive;
        font-size: 23px;
   }
table {
width: 400px;
margin-left: auto;
margin-right: auto;
}
.input {
text-align : center;
}
.regis {
border: 5px solid #B4E1D9;
width : 400px;
height : 150px;
text-align : center;
}
.button {
background-color: #B4E1D9;
border: none;
padding: 15px 30px;
border-radius: 20px;
cursor: pointer;
font-family: 'Gaegu', cursive;
font-size: 23px;
}
</style>
<script>
function userCreate() {
if (form.userId.value == "") {
alert("사용자 ID를 입력하십시라요!");
form.userId.focus();
return false;
}
if (form.password.value == "") {
alert("비밀번호를 입력하십시오.");
form.password.focus();
return false;
}
if (form.password.value != form.password2.value) {
alert("비밀번호가 일치하지 않습니다.");
form.name.focus();
return false;
}
if (form.name.value == "") {
alert("이름을 입력하십시오.");
form.name.focus();
return false;
}

var phoneExp = /^\d{2,3}-\d{3,4}-\d{4}$/;
if(phoneExp.test(form.phone.value)==false) {
alert("전화번호 형식이 올바르지 않습니다.");
form.phone.focus();
return false;
}
form.submit();
}

function userList(targetUri) {
form.action = targetUri;
form.submit();
}
</script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>
<br>
<!-- registration form -->
<form name="form" method="POST" action="<c:url value='/user/register' />">
<table style="width: 100%">
<tr>
<td width="20"></td>
<td>
<table>
<tr>
<td height="22"><img src="<c:url value='/images/login_banner.png' />" width = "600px" height = "180px" /></td>
</tr>
</table>
<br>
<!-- 회원가입이 실패한 경우 exception 객체에 저장된 오류 메시지를 출력 -->
<c:if test="${registerFailed}">
<font color="red"><c:out value="${exception.getMessage()}" /></font>
</c:if>
<br>
<table class="regis">
<tr height="40">
<td width="150" align="center" bgcolor="#E6F8E0">사용자 ID</td>
<td width="250" bgcolor="ffffff" style="padding-left: 10">
<input type="text" style="width: 240;" name="userId">
</td>
</tr>
<tr height="40">
<td width="150" align="center" bgcolor="#E6F8E0">비밀번호</td>
<td width="250" bgcolor="ffffff" style="padding-left: 10">
<input type="password" style="width: 240" name="password">
</td>
</tr>
<tr height="40">
<td width="150" align="center" bgcolor="#E6F8E0">비밀번호 확인</td>
<td width="250" bgcolor="ffffff" style="padding-left: 10">
<input type="password" style="width: 240" name="password2">
</td>
</tr>
<tr height="40">
<td width="150" align="center" bgcolor="#E6F8E0">이름</td>
<td width="250" bgcolor="ffffff" style="padding-left: 10">
<input type="text" style="width: 240" name="name"
<c:if test="${registerFailed}">value="${user.name}"</c:if>>
</td>
</tr>
<tr height="40">
<td width="150" align="center" bgcolor="#E6F8E0">닉네임</td>
<td width="250" bgcolor="ffffff" style="padding-left: 10">
<input type="text" style="width: 240" name="nickname"
<c:if test="${registerFailed}">value="${user.nickname}"</c:if>>
</td>
</tr>
<tr height="40">
<td width="150" align="center" bgcolor="#E6F8E0">전화번호</td>
<td width="250" bgcolor="ffffff" style="padding-left: 10">
<input type="text" style="width: 240" name="phone"
<c:if test="${registerFailed}">value="${user.phone}"</c:if>>
</td>
</tr>
<tr height="40">
<td width="150" align="center" bgcolor="#E6F8E0">카카오톡id</td>
<td width="250" bgcolor="ffffff" style="padding-left: 10">
<input type="text" style="width: 240" name="kakaoid"
<c:if test="${registerFailed}">value="${user.kakaoid}"</c:if>>
</td>
</tr>
</table>
<br>
<table style="width: 100%" class="input">
<tr>
<td>
<input type="button" class="button" value="회원 가입" onClick="userCreate()"> &nbsp;
<input type="button" class="button" value="로그인화면" onClick="userList('<c:url value='/user/login/form' />')">
</td>
</tr>
</table>
</td>
</tr>
</table>
</form>
</body>
</html>