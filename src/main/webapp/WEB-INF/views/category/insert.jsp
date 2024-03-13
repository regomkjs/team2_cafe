<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Category</title>
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
		background-color: white;
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

<div class="container-fluid p-5 bg-dark text-white text-center">
	<p>고양이 카페 관리자 페이지</p>
	<p>카테고리추가</p>
	
</div>
<div class="main-box d-flex">
	<jsp:include page="/WEB-INF/views/sidebar.jsp"/>
	<div class="main-content flex-grow-1">
		<c:forEach items="${categoryList}" var="category">
			${category.ca_name }
		</c:forEach>
		<img src="https://health.chosun.com/site/data/img_dir/2023/07/17/2023071701753_0.jpg" class="rounded" alt="Cinque Terre">
	</div>
</div>


</body>
</html>