<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 추가</title>
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
<jsp:include page="/WEB-INF/views/sidebar.jsp"/>
<div class="main-content flex-grow-1">
<!-- 게시판 추가에 관련된 정보 출력 -->
<div class="container">
	<form action="<c:url value="/board/add"/>" method="post">
		<h5>게시판 추가</h5>
		<div class="mb-3 mt-3">
		
		<select name="categorySelect" class="form-select" placeholder="카테고리를 선택하세요.">
	   			<c:forEach items="${categoryList}" var="categoryList">
	   				<option value="${categoryList.ca_name}">${categoryList.ca_name}</option>
	   			</c:forEach>
		</select>
		
		</div>
		<div class="mb-3 mt-3">
   			<label for="id">게시판 이름 :</label>
   			<input type="text" class="form-control" id="name" placeholder="새로운 게시판 이름을 입력하세요." name="name">
		</div>
		<button type="submit" class="btn btn-outline-success col-12">등록하기</button>
	</form>
</div>
</body>
</html>