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
		height: 200px;
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
<div class="container master-container">
	<jsp:include page="/WEB-INF/views/header.jsp"/>
	<div class="main-img-box">
		<a href="<c:url value='/'/>"> 
			<img src="/team2_cafe/images/logo.jpg" alt="images">
		</a>
	</div>
	
	<div class="main-box d-flex">
	<jsp:include page="/WEB-INF/views/sidebar.jsp"/>
	<div class="main-content flex-grow-1">
	
	<!-- 게시판 추가에 관련된 정보 출력 -->
	<div class="container">
		<form action="<c:url value="/board/add"/>" method="post">
			<h5>게시판 추가</h5>
	
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
</div>


</body>
</html>