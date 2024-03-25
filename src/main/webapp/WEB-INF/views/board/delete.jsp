<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 리스트</title>
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
	<a href="<c:url value='/'/>"> 
		<img src="/team2_cafe/images/logo.jpg" alt="images">
	</a>
</div>
<div class="main-box d-flex">
<jsp:include page="/WEB-INF/views/sidebar.jsp"/>
<div class="main-content flex-grow-1">
		클릭한 게시판 관련 리스트
		<div class="container">
			<!-- 서버에서 보낸 데이터를 c:forEach를 이용하여 화면에 출력 -->
			<table class="table table-hover">
				<thead>
					<tr>
						<th>번호</th>
						<th>게시판 이름</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${boardList}" var="board">		
						<tr>
							<td>${board.bo_num}</td>
							<td>${board.bo_name}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>
</html>