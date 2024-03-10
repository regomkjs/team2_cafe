<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 리스트</title>
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
		<div class="container ">
			<table class="table table-hover mt-3">
		 		<thead class="text-center">
					<tr>
						<th class="col-1">번호</th>
						<th class="col-2">말머리</th>
						<th class="col-5">제목</th>
						<th class="col-2">작성자</th>
						<th >조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${postList}" var="post">
						<tr>
							<td class="text-center">${post.po_num}</td>
							<td class="text-center">${post.he_name}</td>
							<td>
								<c:url var="url" value="/post/detail">
									<c:param name="num" value="${post.po_num}"/>
								</c:url>
								<a href="${url}">${post.po_title}</a>
							</td>
							<td class="text-center">
								<c:url var="page" value="/post/list">
									<c:param name="type" value="writer"/>
									<c:param name="search" value="${post.po_me_id}"/>
									<c:param name="page" value="1"/>
								</c:url>
								<a href="${page}">${post.po_me_id}</a>
							</td>
							<td class="text-center">${post.po_view}</td>
						</tr>
					</c:forEach>
					<c:if test="${postList.size() == 0}">
						<tr>
							<th colspan="5">
								<h3 class="text-center">등록된 게시글이 없습니다.</h3>
							</th>
						</tr>
					</c:if>
				</tbody>
			</table>
			<c:url value="/post/insert" var="insertUrl"> 
				<c:param name="num" value="${bo_num}"/>
			</c:url>
			<a href="${insertUrl}"><button class="btn btn-primary">게시글 등록</button></a>
		</div>
	</div>
</div>
	
</body>
</html>