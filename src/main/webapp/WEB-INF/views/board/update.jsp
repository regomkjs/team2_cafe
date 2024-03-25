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
<div class="side_menu">
	<div class="container nav-box mb-6">
		<!-- Nav tabs -->
		<ul class="nav nav-tabs" role="tablist">
				<li class="nav-item col-6">
		<a class="nav-link active" data-bs-toggle="tab" href="#home">카페</a>
					</li>
				<c:if test="${user != null}">
	 			<li class="nav-item col-6">
	 				<a class="nav-link" data-bs-toggle="tab" href="#menu1">유저</a>
	 			</li>
				</c:if>
		</ul>
		<!-- Tab panes -->
		<div class="tab-content">
			<div id="home" class="container tab-pane active">
		    	<p>카페정보</p>
				<c:url value="/post/list" var="allPostUrl">
					<c:param name="page" value="1"/>
				</c:url>
		    	<a href='${allPostUrl}' class="btn btn-secondary">전체 게시글 수 
		    	<span class="badge badge-light">${allPostNum}</span>
				</a>
				<br><br>
				<button type="button" class="btn btn-primary">가입한 회원 수 
		    	<span class="badge badge badge-light">${allMemberNum}</span>
				</button>
		    	<p>카페관리</p>
		    	<a class="btn btn-outline-primary"  href ='<c:url value="/category/insert" />'>관리자 페이지</a>
		    </div>
		    <div id="menu1" class="container tab-pane"><br>
		    	<p>로그인 했을 때만 표시</p>
		    	<a class="btn mt-1 bg-secondary" href="<c:url value="/my/page"/>">회원정보 수정</a>
		    	<a class="btn mt-1 bg-secondary" href="<c:url value="/my/post"/>">내가 쓴 글 보기</a>
		    	<a class="btn mt-1 bg-secondary" href="<c:url value="/my/comment"/>">내가 쓴 댓글보기</a>
			</div>
		</div>
	</div>
	<c:forEach items="${caList}" var="category">

		<div class="container mt-3">
			<c:if test='${category.ca_name == "공지"}'>
				<span style="font-weight: bolder;">${category.ca_name} <a href="<c:url value='/board/add'/>" class="badge bg-primary float-end" style="color: white; text-decoration: none;">게시판추가</a></span>
				<ul>
					<c:forEach items="${boList}" var="board">
						<c:if test='${board.bo_ca_name == "공지"}'>
							<li>
								<c:url value="/post/list" var="boardUrl">
									<c:param name="num" value="${board.bo_num}" />
								</c:url>
								<a href="${boardUrl}">${board.bo_name}</a>
								<span class="badge bg-danger float-end"><a href="<c:url value='/board/delete'/>" style="color: white; text-decoration: none;">삭제</a></span>
								<span class="badge bg-success float-end me-2"><a href="#" style="color: white; text-decoration: none;">수정</a></span>
							</li>
						</c:if>
					</c:forEach>				
				</ul>
			</c:if>
		</div>
	</c:forEach>
	<c:forEach items="${caList}" var="category">
		<div class="container">
			<c:if test='${category.ca_name != "공지"}'>
			<span style="font-weight: bolder;">${category.ca_name} <a href="<c:url value='/board/add'/>" class="badge bg-primary float-end me-3" style="color: white; text-decoration: none;">게시판추가</a></span>

				<ul>
					<c:forEach items="${boList}" var="board">
						<c:if test='${category.ca_name == board.bo_ca_name && board.bo_ca_name !="공지"}'>
							<li>
								<c:url value="/post/list" var="boardUrl">
									<c:param name="num" value="${board.bo_num}" />
								</c:url>
								<a href="${boardUrl}">${board.bo_name}</a>

								<span class="badge bg-danger float-end"><a href="<c:url value="/board/delete"/>" style="color: white; text-decoration: none;">삭제</a></span>
								<span class="badge bg-success float-end me-2"><a href="<c:url value="/board/update"/>" style="color: white; text-decoration: none;">수정</a></span>

							</li>
						</c:if>
					</c:forEach>				
				</ul>
			</c:if>
		</div>
	</c:forEach>
</div>
</body>
</html>