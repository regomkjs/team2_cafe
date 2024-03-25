<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<!-- 부트스트렙5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="//code.jquery.com/jquery-3.6.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
	.master-container {
	    max-width: 1200px; /* 최대 너비 */
	    min-width: 1024px; /* 최소 너비 */
	    margin: 0 auto; /* 가운데 정렬을 위해 margin을 auto로 설정 */
	}
	.main-box{
		 height: 1000px;
	}
	.main-img-box{
		width: 100%;
		
	}
	.main-content{
		height: 1000px;
		background-color: white;
	}
</style>
</head>
<body>
<div class="container master-container">
	<jsp:include page="/WEB-INF/views/header.jsp"/>
	<div class="main-img-box">
		<a href="<c:url value='/'/>"> 
        	<img src="/team2_cafe/images/logo.jpg" alt="images">
        </a>
	</div>
	<div class="main-box d-flex">
		<jsp:include page="/WEB-INF/views/sidebar.jsp" flush="false"/>
		<div class="container">
			<form action="<c:url value="/user/page"/>" method="post">
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
			<form action="<c:url value="/user/page"/>" method="post">
				<div class="input-group mb-3 name mt-3">
					<input value="${user.me_nick}" type="text" class="name form-control" placeholder="닉네임 등록/수정" aria-describedby="btn1" name="name">
					<button class="btn btn-outline-secondary">등록/수정</button>
				</div>
			</form>
		</div>
	</div>
</div>
<script src="//code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
</script>
</body>
</html>