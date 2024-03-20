<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지-카테고리 등록</title>
<!-- 부트스트렙5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
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
	
</div>

<div class="main-box d-flex">
	<jsp:include page="/WEB-INF/views/sidebar.jsp"/>
	<div class="main-content flex-grow-1">
		
		<div class="category-box">
			<h2 class="mb-4">카테고리 등록 화면</h2>
			<h3>기존 카테고리 리스트</h3>
			<ul>
				<c:forEach items="${categoryList}" var="category" >
					<li>${category.ca_name}</li>
				</c:forEach>
			</ul>
			<form action="<c:url value="/category/insert"/>">
				<div class="mb-3 mt-3">
					<label for="category">카테고리명 :</label>
			  		<input type="text" class="form-control" id="category" name="category" placeholder="새로운 카테고리명을 입력하세요." />
				</div>
				<button type="submit" class="btn btn-primary col-12 insert-btn">등록</button>
			</form>
		</div>
	</div>
</div>

</body>
</html>