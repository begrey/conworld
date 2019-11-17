<%@page contentType="text/html; charset=utf-8" %>
<%@page import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>상품 수정</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/post.css' />" type="text/css">
<script>
function postModify() {
if (form.price.value == "") {
   alert("가격을 제대로 입력하시라요!!");
   form.price.focus();
   return false;
}   
if (form.pname.value == "") {
alert("상품이름을 입력하시라요!!");
form.pname.focus();
return false;
}

form.submit();
}
function postList(targetUri) {
form.action = targetUri;
form.submit();
}
function showSub(obj) {

f = document.forms.form;
var select = document.getElementById("select_id");
var option_value = select.options[select.selectedIndex].value;

if(obj == 'cafe') {

f.cafe.style.display = "";
f.convin.style.display = "none";
f.movie.style.display = "none";

} else if (obj == 'convinience') {

f.cafe.style.display = "none";
f.convin.style.display = "";
f.movie.style.display = "none";

}
else {
f.cafe.style.display = "none";
f.convin.style.display = "none";
f.movie.style.display = "";
}
}
function sub_change1()
{
 vn_mnu1 = form.menu1.selectedIndex;

 if ( vn_mnu1 == 1 )
 {
  form.menu2.length = 10;
  form.menu2.options[0].text =  '---카페 브랜드---';
  form.menu2.options[1].text =  '스타벅스';
  form.menu2.options[2].text =  '커피빈';
  form.menu2.options[3].text =  '엔제리너스';
  form.menu2.options[4].text =  '탐앤탐스';
  form.menu2.options[5].text =  '그루나루';
  form.menu2.options[6].text =  '할리스커피';
  form.menu2.options[7].text =  '투썸';
  form.menu2.options[8].text =  '카페베네';
  form.menu2.options[9].text =  '이디야'
 }
 if ( vn_mnu1 == 2 )
 {
  form.menu2.length = 4;
  form.menu2.options[0].text =  '---편의점 가게---';
  form.menu2.options[1].text =  'CU';
  form.menu2.options[2].text =  'GS25';
  form.menu2.options[3].text =  '세븐일레븐';
 }
 if ( vn_mnu1 == 3 )
 {
  form.menu2.length = 4;
  form.menu2.options[0].text =  '---영화관---';
  form.menu2.options[1].text =  'CGV';
  form.menu2.options[2].text =  '롯데시네마';
  form.menu2.options[3].text =  '메가박스';
 }

}
</script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>
<br>

<!-- Update Form  -->

<form name="form" method="POST" action="<c:url value='/posts/update' />">
<table style="width: 100%">
<tr>
<td width="20"></td>
<td>
<table>
<tr>
<td><img src="<c:url value='/images/post_banner.png' />" width = "600px" height = "250px" /></td>
</tr>
</table>
<br>
<!-- 회원가입이 실패한 경우 exception 객체에 저장된 오류 메시지를 출력 -->
<c:if test="${registerFailed}">
<font color="red"><c:out value="${exception.getMessage()}" /></font>
</c:if>
<br>
<table class="newpost">
<tr height="40" >
<td width="150" align="center" bgcolor="#E6F8E0">상품이름</td>
<td width="250" bgcolor="ffffff" style="padding-left: 10">
<input type="text" style="width: 240" name="pname" value="${post.pname}">
</td>
</tr>
<tr height="40">
<td width="150" align="center" bgcolor="#E6F8E0">가격</td> 
<td width="250" bgcolor="ffffff" style="padding-left: 10">
<input type="text" style="width: 240" name="price" value="${post.price}">
</td>
</tr>
<tr height="40">
<td width="150" align="center" bgcolor="#E6F8E0">만료일</td> 
<td width="250" bgcolor="ffffff" style="padding-left: 10">
<input class="input" type="date" name="expiry" min="" onChange="date()"></input>
</td>
</tr>
<tr>
<td width="150" align="center" bgcolor="#E6F8E0">카테고리</td>
<td>
  <select name="menu1" size="1" onChange="sub_change1()"> 
   <option selected>---카테고리---</option> 
   <option>카페</option> 
   <option>편의점</option> 
   <option>영화</option> 
  </select>

  <select name="menu2" size="1" onChange="sub_change2()"> 
   <option value="" selected>—가게—</option> 
  </select> 
</td>
</tr>
</table>
<table style="width: 100%" class="input">
<tr>
<td>
<input type="button" class="button" value="수정 " onClick="postModify()">
<input type="submit" class="button" value="목록 " onClick="postList('<c:url value='/posts/list' />')">
</td>
</tr>
</table>

</table>
</form>
 
</body>
</html>