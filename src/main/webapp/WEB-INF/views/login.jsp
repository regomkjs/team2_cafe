<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<!-- 부트스트렙5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">

.body{
  text-align: center;
  margin: 0;
  justify-content: left;
  transform:translate;
  align-items: center;
  display: flex;
  height: 100vh;
}

.master-container {
    max-width: 1200px; /* 최대 너비 */
    min-width: 1024px; /* 최소 너비 */
    margin: 0 auto; /* 가운데 정렬을 위해 margin을 auto로 설정 */
	
}

.login-box{
	width:500px;
	margin:0 auto;
	margin-top:100px;
	padding: 50px;
	border: 1px solid #ccc;
	border-radius: 10px;
}
.login-box h2{
	text-align: center;
	color: rgb(255, 127, 80);
	font-size: 30px;
	font-weight:bold;
	margin-bottom: 20px;
}
#id{
	width:100%;
	height:50px;
	border-radius: 5px 5px 0 0;
	border:1px solid #ededed;
	border-bottom:none;
	padding-left: 50px;
	background-image: url("/team2_cafe/images/id_icon.svg");
	background-repeat: no-repeat;
	background-size: 20px;
	background-position: 15px center;
	outline-color: rgb(255, 127, 80);
}
#id::placeholder{
	color:#ccc;
}
#pw{
	width:100%;
	height:50px;
	border:1px solid #ededed;
	border-radius:0 0 5px 5px;
	padding-left:50px;
	background-image: url("/team2_cafe/images/lock_icon.svg");
	background-repeat:no-repeat;
	background-size: 20px;
	background-position:15px center;
	outline-color: rgb(255, 127, 80);
	margin-bottom: 20px;
}
#pw::placeholder{
	color:#ccc;

}

.btn-block{
   
    display: block;
    width: 100%;
    padding: 13px 0 13px;
    border-radius: 6px;
    border: solid 1px rgba(0, 0, 0, .15);
    background-color: rgb(255, 127, 80);
    box-sizing: border-box; 
     color:white;
     margin-bottom: 30px;
    
 }
 
 .login-box ul{
	 list-style: none;
	 padding:0;
	 margin:0;
	 display: flex;
	 justify-content: center;
 }
.login-box li{
	 margin: 0 10px;
} 
.login-box li:first-child::after{
	content: '|'; 
	font-size: 14px;
	color:  rgb(255, 127, 80);
	position: relative;
	top: -2px; left: 10px;
}  
 .login{
 	 margin: 0 auto;
 	 position: relative;
 	 color: charcoal;
 
 }
 .pw{
	  margin: 0 auto;
	  position: relative;
 }
 
 .foot-txt{
	 color: rgb(255, 127, 80);
	text-decoration: none;
 }
 
 .foot-txt:hover{
 	 text-decoration: underline;
 }
</style>
</head>

<body>
<div class="master-container">
<jsp:include page="/WEB-INF/views/header.jsp"/>
<div class="login-box">
	<form action="<c:url value="/login"/>" method="post">

		 <h2>로그인</h2>
		 	<input name="id" id="id" type="text" placeholder="아이디를 입력하세요">
			 <br>
	 		<input name="pw" id="pw" type="password" placeholder="비밀번호를 입력하세요">
	  		<br>
	  		 <button type="submit" class="btn-block">로그인</button>
    </form>
	   		<ul>
	   			<li><a class="foot-txt" href="<c:url value="/signup"/>">아이디 찾기</a></li>
	   			<li><a class="foot-txt" href="<c:url value="/signup"/>">회원가입</a></li>
	   		</ul>
		</div>
	</div>

</body>
</html>