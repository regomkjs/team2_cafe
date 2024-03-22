<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	}

	
</style>
</head>

<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<div class="main-img-box">
	중앙에 이미지 배치, 클릭시 메인으로 이동
</div>
<div class="main-box d-flex align-content-stretch">
	<jsp:include page="/WEB-INF/views/sidebar.jsp"/>
	<div class="main-content flex-grow-1">
	 <img src="/team2_cafe/images/test01.jpg" alt="images">
</div>

</div>

</body>
</html>