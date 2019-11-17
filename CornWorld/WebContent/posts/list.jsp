<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기프티콘 정보 </title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/user.css' />" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Gaegu:300,400,700|Poor+Story&amp;subset=korean" rel="stylesheet">
<style>
   @charset "UTF-8";
@import url(https://fonts.googleapis.com/css?family=Open+Sans:300,400,700);

body {
  font-family: 'Open Sans', sans-serif;
  font-weight: 300;
  line-height: 1.42em;
  color:#FFF;
  background-color:#FFF;
}

h1 {
  font-size:3em; 
  font-weight: 300;
  line-height:1em;
  text-align: center;
  color: #4DC3FA;
  font-family: 'Gaegu', cursive;
  font-size: 23px;
}

h2 {
  font-size:1em; 
  font-weight: 300;
  text-align: center;
  display: block;
  line-height:1em;
  padding-bottom: 2em;
  color: #000;
  font-family: 'Gaegu', cursive;
  font-size: 23px;
}

h2 a {
  font-weight: 700;
  text-transform: uppercase;
  color: #000;
  text-decoration: none;
}

.blue { color: #000; }
.yellow { color: #FFF842; }

.container th h1 {
     font-weight: bold;
     font-size: 1em;
  text-align: center;
  color: #000;
}

.container td {
     font-weight: normal;
     font-size: 1em;
  -webkit-box-shadow: 0 2px 2px -2px #FFC81E;
      -moz-box-shadow: 0 2px 2px -2px #0E1119;
           box-shadow: 0 2px 2px -2px #0E1119;
}

.container {
     text-align: center;
     overflow: hidden;
     width: 80%;
     margin: 0 auto;
  display: table;
  padding: 0 0 8em 0;
}

.container td, .container th {
     padding-bottom: 2%;
     padding-top: 2%;
  padding-left:2%;  
}

/* Background-color of the odd rows */
.container tr:nth-child(odd) {
     background-color: #FFF;
}

/* Background-color of the even rows */
.container tr:nth-child(even) {
     background-color: #FFF;
}

.container th {
     background-color: #FFEB5A;
}

.container td:first-child { color: #FB667A; }



@media (max-width: 800px) {
.container td:nth-child(4),
.container th:nth-child(4) { display: none; }
}
</style>

</head>
<body>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>
<br>
<table style="width:100%">
<tr align="right">
<td width="20"></td>

</tr>
<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
<tr align="center">
<td width="20"></td>
<td>
<img src="<c:url value='/images/baby.png' />" width="400" height="100" /></a>








<table class="container">
   <thead>
      <tr>
         <th><h1>상품이름</h1></th>
         <th><h1>원가</h1></th>
         <th><h1>만료일</h1></th>
         <th><h1>남은기간</h1></th>
         <th><h1>세일가격</h1></th>
         <th><h1>카테고리</h1></th>
         <th><h1>상점</h1></th>
      </tr>
     <%= session.getAttribute("user") %>
     ${session.user} 
   </thead>
   <tbody>
   <c:forEach var="post" items="${postList}">
      <tr>
         <td><a href="<c:url value='/posts/view'>
                  <c:param name='postId' value='${post.postId}'/>
                 </c:url>"> 
           ${post.pname}</a>    <%-- <%=post.getTitle()%></a> --%></td>
         <td><fmt:formatNumber value="${post.price}" type="currency" currencySymbol="&#8361;"/></td>
         <td>${post.expiry}</td>
         <td> <c:choose>
         <c:when test = "${post.period ==0}">
         오늘까지!! ☆★파격 세일입니다요 ☆★
         </c:when>
         <c:otherwise>
         ${post.period}일
         </c:otherwise>
         </c:choose>
         </td>
         <td> <c:choose>
               <c:when test = "${post.period ==0}">
               <fmt:formatNumber value="${post.price * 0.5}" type="currency" currencySymbol="&#8361;"/>
               </c:when>
               <c:when test = "${post.period <= 7 && post.period >= 1}">
               <fmt:formatNumber value="${post.price * 0.7}" type="currency" currencySymbol="&#8361;"/>
               </c:when>
               <c:when test = "${post.period > 7}">
               <fmt:formatNumber value="${post.price * 0.8}" type="currency" currencySymbol="&#8361;"/>
               </c:when> 
         </c:choose></td>
         <td> ${post.category} </td>
         <td> ${post.shop} </td>
      </tr>
      </c:forEach>
   </tbody>
</table>
<br>
<button type="button" onclick="location.href='/CornWorld/' ">메인으로</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<button type="button" onclick="location.href='/CornWorld/posts/createForm.jsp'">글쓰기</button>
</body>
</html>