<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<!-- 부트스트렙5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<div class="container">
	<form action="<c:url value="/login"/>" method="post">
		<br>
		<h4><b>로그인</b></h4>
   		<div class="mb-3 mt-3">
   			<label for="id">아이디:</label>
   			<input type="text" class="form-control" id="id" placeholder="아이디를 입력하세요." name="id">
		</div>
   		<div class="mb-3">
  			<label for="pw">비밀번호:</label>
  			<input type="password" class="form-control" id="pw" placeholder="비밀번호를 입력하세요." name="pw">
   		</div>
   		<button type="submit" class="btn btn-outline-success col-12">로그인</button>
	</form>
</div>
</body>
</html>