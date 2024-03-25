<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<!-- 부트스트랩5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="//code.jquery.com/jquery-3.6.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<style type="text/css">
	/* 공통 레이아웃 css */
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
	
	/* 카테고리 등록 css */
	.category-box{
		padding:50px;
	}
	.board-box{
		padding:50px;
		
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
	<div class="input-group mt-3 w-50">
		<form action="<c:url value="/user/check"/>" method="post">
			<b>본인 확인을 위해 비밀번호를 입력해주세요.</b>
			<div class="input-group mb-3">
				<input type="password" class="head-input form-control" placeholder="비밀번호 입력" aria-describedby="btn" name="pwCheck">
	  			<button class="btn btn-outline-secondary">입력</button>
			</div>
		</form>
	</div>
</div>
<script src="//code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
</script>
</body>
</html>