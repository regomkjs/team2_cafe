<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<!-- 부트스트렙5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
	.main-box{
		 height: 1000px;
	}
	.main-img-box{
		width: 100%;
		height: 250px;
		background-color: tomato;
	}
	.main-content{
		width: 100%;
		height: 1000px;
		background-color: white;
	}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<div class="main-img-box">
	중앙에 이미지 배치, 클릭시 메인으로 이동
</div>
<div class="main-box d-flex">
	<jsp:include page="/WEB-INF/views/sidebar.jsp" flush="false"/>
	<div class="container">
	<form action="<c:url value="/my/page"/>" method="post">
		<h1>${user.me_id}님 회원정보 수정</h1>
   		<div class="mb-3 mt-3">
   			<label for="id">아이디:</label>
   			<input value="${user.me_id}" type="text" class="form-control" id="id" placeholder="아이디 입력" name="id" readOnly>
		</div>
   		<div class="mb-3 mt-3">
  			<label for="pw">비밀번호:</label>
  			<input type="password" class="form-control" id="pw" placeholder="비밀번호 입력" name="pw">
   		</div>
   		<div class="mb-3 mt-3">
   			<label for="pw2">비밀번호 확인:</label>
   			<input type="password" class="form-control" id="pw2" placeholder="비밀번호 확인" name="pw2">
   		</div>
   		<div class="mb-3 mt-3">
   			<label for="email">이메일:</label>
   			<input value="${user.me_email}" type="text" class="form-control" id="email" placeholder="이메일 입력" name="email">
   		</div>
   		<div class="mb-3 mt-3">
   			<label for="phone">핸드폰:</label>
   			<input value="${user.me_phone}" type="text" class="form-control" id="phone" placeholder="핸드폰 입력" name="phone">
   		</div>
   		<button type="submit" class="btn btn-outline-success col-12">회원정보수정</button>
	</form>
</div>
</div>
<script src="//code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
</script>
</body>
</html>