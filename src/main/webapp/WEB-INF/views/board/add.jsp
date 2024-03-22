<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 리스트</title>
<!-- 부트스트렙5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
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
		<span style="font-weight: bolder;">${categoryName}</span>
		<div class="container">

			<table class="table table-hover">
				<thead>
					<tr>
						<th>번호</th>
						<th>카테고리 이름</th>
						<th>게시판 이름</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${boardList}" var="board">		
						<tr>
							<td>${board.bo_num}</td>
							<td>${board.bo_ca_name}</td>
							<td>${board.bo_name}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
       		<div class="container">
		<form action="<c:url value="/board/add"/>" method="get" class="mt-3">
		<div class="mb-3 mt-3">
			<label for="newboarname" class="form-label">새 게시판 : </label>
			<input type="text" class="form-control" id="newboarname" placeholder="새로운 게시판을 입력하세요." name="newboarname">
		</div>
		<button class="btn btn-outline-primary col-12">등록</button>
		</form>
			</div>
		</div>
	</div>
</div>



</body>
</html>