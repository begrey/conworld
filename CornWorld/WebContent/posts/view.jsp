<%@page contentType="text/html; charset=utf-8" %>
<%@page import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Post post = (Post)request.getAttribute("post");
	User user = (User)request.getAttribute("user");
%>

<html>
<head>
<title>상품 정보 </title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/post.css' />" type="text/css">
<script>
function postRemove() {
	return confirm("정말 삭제하시겠습니까?");		
}
</script>

<style>
	@import url('https://fonts.googleapis.com/css?family=Amarante');

html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video {
  margin: 0;
  padding: 0;
  border: 0;
  font-size: 100%;
  font: inherit;
  vertical-align: baseline;
  outline: none;
  -webkit-font-smoothing: antialiased;
  -webkit-text-size-adjust: 100%;
  -ms-text-size-adjust: 100%;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}
html { overflow-y: scroll; }
body { 
  background: #eee url('https://i.imgur.com/eeQeRmk.png'); /* https://subtlepatterns.com/weave/ */
  font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
  font-size: 62.5%;
  line-height: 1;
  color: #585858;
  padding: 22px 10px;
  padding-bottom: 55px;
}

::selection { background: #5f74a0; color: #fff; }
::-moz-selection { background: #5f74a0; color: #fff; }
::-webkit-selection { background: #5f74a0; color: #fff; }

br { display: block; line-height: 1.6em; } 

article, aside, details, figcaption, figure, footer, header, hgroup, menu, nav, section { display: block; }
ol, ul { list-style: none; }

input, textarea { 
  -webkit-font-smoothing: antialiased;
  -webkit-text-size-adjust: 100%;
  -ms-text-size-adjust: 100%;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  outline: none; 
}

blockquote, q { quotes: none; }
blockquote:before, blockquote:after, q:before, q:after { content: ''; content: none; }
strong, b { font-weight: bold; } 

table { border-collapse: collapse; border-spacing: 0; }
img { border: 0; max-width: 100%; }

h1 { 
  font-family: 'Amarante', Tahoma, sans-serif;
  font-weight: bold;
  font-size: 3.6em;
  line-height: 1.7em;
  margin-bottom: 10px;
  text-align: center;
}


/** page structure **/
#wrapper {
  display: block;
  width: 850px;
  background: #fff;
  margin: 0 auto;
  padding: 10px 17px;
  -webkit-box-shadow: 2px 2px 3px -1px rgba(0,0,0,0.35);
}

#keywords {
  margin: 0 auto;
  font-size: 1.2em;
  margin-bottom: 15px;
}


#keywords thead {
  cursor: pointer;
  background: #c9dff0;
}
#keywords thead tr th { 
  font-weight: bold;
  padding: 12px 30px;
  padding-left: 42px;
}
#keywords thead tr th span { 
  padding-right: 20px;
  background-repeat: no-repeat;
  background-position: 100% 100%;
}

#keywords thead tr th.headerSortUp, #keywords thead tr th.headerSortDown {
  background: #acc8dd;
}

#keywords thead tr th.headerSortUp span {
  background-image: url('https://i.imgur.com/SP99ZPJ.png');
}
#keywords thead tr th.headerSortDown span {
  background-image: url('https://i.imgur.com/RkA9MBo.png');
}


#keywords tbody tr { 
  color: #555;
}
#keywords tbody tr td {
  text-align: center;
  padding: 15px 10px;
}
#keywords tbody tr td.lalign {
  text-align: left;
}


<!--button-->
url(https://fonts.googleapis.com/css?family=Open+Sans:400,400italic,600,600italic,700italic);

*{margin: 0px; padding: 0px}



h1, button{
  color:#000;
  text-align: center;
  padding: 10px;
}

p{
  color:#fff;
  text-align: center;
  padding-top: 500px;
  font-size: 10px;
}

a{
   text-decoration:none;
   color:#fff;
}

a:hover{
   color:#2ecc71;
}

.main{
  width: 100%;
}

.sub-main{
  width: 30%;
  margin:22px;
  float: left;
}

.button-one, .button-two, .button-three{
  text-align: center;
  cursor: pointer;
  font-size:18px;
  margin: 0 0 0 100px;
}



/*Button One*/
.button-one {
  padding:5px 15px;
  outline: none;
  background-color: #27ae60;
  border: none;
  border-radius:5px;
  box-shadow: 0 9px #95a5a6;
}

.button-one:hover{
  background-color: #2ecc71;
}

.button-one:active {
  background-color: #2ecc71;
  box-shadow: 0 5px #95a5a6;
  transform: translateY(4px);
}


/*Button Two*/
.button-two {
  border-radius: 4px;
  background-color:#d35400;
  border: none;
  padding: 20px;
  width: 200px;
  transition: all 0.5s;
}


.button-two span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button-two span:after {
  content: '»';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.button-two:hover span {
  padding-right: 25px;
}

.button-two:hover span:after {
  opacity: 1;
  right: 0;
}


/*Button Three*/
.button-three {
    position: relative;
    background-color: #f39c12;
    border: none;
    padding: 20px;
    width: 200px;
    text-align: center;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    text-decoration: none;
    overflow: hidden;
}

.button-three:hover{
   background:#000;
   box-shadow:0px 2px 10px 5px #97B1BF;
   color:#000;
}

.button-three:after {
    content: "";
    background: #f1c40f;
    display: block;
    position: absolute;
    padding-top: 300%;
    padding-left: 350%;
    margin-left: -20px !important;
    margin-top: -120%;
    opacity: 0;
    transition: all 0.8s
}

.button-three:active:after {
    padding: 0;
    margin: 0;
    opacity: 1;
    transition: 0s
}
</style>

</head>

<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>



<body>
<h1>상품 정보 </h1>
 <div id="wrapper">
 <center/><img src="<c:url value='/images/baby.png' />" width="400" height="100" /></a>
  <br><br>
  <table id="keywords" cellspacing="0" cellpadding="0">
    <!-- <thead>
      <tr>
        <th><span>상품 ID </span></th>
        	
        <th><span>Impressions</span></th>
        <th><span>Clicks</span></th>
        <th><span>CTR</span></th>
        <th><span>Rank</span></th>
      </tr>
    </thead> -->
    <tbody>
		  
		<tr>
			<td width="120" align="center" bgcolor=#fcc50a height="22">판매자 카카오톡 </td>
			<td width="470" bgcolor="ffffff" style="padding-left: 10">
				<%= user.getKakaoId() %>
			</td>
		</tr>
		  
      <tr>
			<td width="120" align="center" bgcolor=#fcc50a height="22">상품 이름</td>
			<td width="470" bgcolor="ffffff" style="padding-left: 10">
				${post.pname}
			</td>
		</tr>	
		  
		  
      <tr>
			<td width="120" align="center" bgcolor=#fcc50a height="22">가격</td>
			<td width="470" bgcolor="ffffff" style="padding-left: 10">
				${post.price} 
			</td>
		  </tr>	
      
      
      <tr>
			<td width="120" align="center" bgcolor=#fcc50a height="22">만료일</td>
			<td width="470" bgcolor="ffffff" style="padding-left: 10">
				${post.expiry}
			</td>
		  </tr>
      
    </tbody>
  </table>
 </div> 
</body>
   
	    <br><br>
	    <div align = "center">
	    <% if(session.getAttribute("user").equals(post.getUserid())) { %>
	    <button class="button-one"><a href="<c:url value='/posts/update/form'>
	     		   <c:param name='postId' value='${post.postId}'/>
			 	 </c:url>">수정</a></button>
			 	 
 	    <button class="button-one"><a href="<c:url value='/posts/delete'>
				   <c:param name='postId' value='${post.postId}'/>
			 	 </c:url>" onclick="return postRemove();">삭제 </a></button>
 	    <button class="button-one"><a href="<c:url value='/posts/list' />">상품 목록</a></button>
 	    <% } else { %>
 	     	    <button class="button-one"><a href="<c:url value='/posts/list' />">상품 목록</a></button>
 	    <%} %>
 	    </div>
 	    <br>
 	    <br><br>
 	    
 	    <!— 수정이 실패한 경우 exception 객체에 저장된 오류 메시지를 출력 —>
        <c:if test="${updateFailed}">
	      <font color="red"><c:out value="${exception.getMessage()}" /></font>
	    </c:if>    
	  </td>
	</tr>
  </table>  
</body>
</html>