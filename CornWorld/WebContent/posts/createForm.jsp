<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>게시글 입력</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/post.css' />" type="text/css">
<script>
function postList(targetUri) {
	form.action = targetUri;
	form.submit();
	}
function postCreate() {
	if (form.pname.value == "") {
		alert("상품이름을 입력하시라요!!");
		return form.pname.focus();
		}
	if (form.price.value == "") {
		alert("가격을 제대로 입력하시라요!!");
		form.price.focus();
		return false;
	}
	if (form.menu1.value =="---카테고리---") {
		alert("카테고리를 선택하시라요!!");
		form.menu1.focus();
		return false;
	}
	if (form.menu2.value =="") {
		alert("브랜드를 선택하시라요!!");
		form.menu2.focus();
		return false;
	}
	if (date() == false) {
		form.date.focus();
		return false;
	}
	else {
	form.submit();
	}
}
function date() {
	var date = new Date(); 
	var year = date.getFullYear(); 
	var month = new String(date.getMonth()+1); 
	var day = new String(date.getDate()); 

	// 한자리수일 경우 0을 채워준다. 
	if(month.length == 1){ 
	  month = "0" + month; 
	} 
	if(day.length == 1){ 
	  day = "0" + day; 
	} 
 
    var getDate = year + "-" + month + "-" + day;
    if (form.expiry.value < getDate) {
 		alert("맞는 날짜를 입력하시라요!");
 		return false;
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
<body>

<!-- post form -->
<form name="form" method="POST" action="<c:url value='/posts/create' />">
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
<input class="title_input" type="text" style="width: 240; height: 50;" name="pname">
</td>
</tr>
<tr height="40">
<td width="150" align="center" bgcolor="#E6F8E0">가격</td> 
<td width="250" bgcolor="ffffff" style="padding-left: 10">
<input class="input" type="text" name="price" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></input>
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
   <option value="" selected>---가게---</option> 
  </select> 
</td>
</tr>
</table>
<table style="width: 100%" class="input">
<tr>
<td>
<input type="button" class="button" value="생성" onClick="postCreate()">
<input type="submit" class="button" value="뒤로가기" onClick="postList('<c:url value='/' />')">
</td>
</tr>
</table>

</table>
</form>
 
</body>
</html>