<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트렙5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
	.side_menu{
		width: 300px; height: 100%; 
		background-color: yellow;
	}
	.nav-box{
		height: 300px;
		border: 1px solid black;
		background-color: white;
	}
</style>

</head>
<body>
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
			<div id="home" class="container tab-pane active"><br>
		    	<p>카페정보</p>
		    	<br>
		    	<p>카페관리</p>
		    </div>
		    <div id="menu1" class="container tab-pane"><br>
		    	<p>로그인 했을 때만 표시</p>
			</div>
		</div>
	</div>
	<c:forEach begin="1" end="3">
		<div class="container">
			<span style="font-weight: bolder;">카테고리명 <a href="#">게시판추가</a></span>
			<ul>
				<c:forEach begin="1" end="4">
					<li >
						<a href="<c:url value="/board/list"/>">게시판명</a>
						<span><a href="#">수정</a></span>
						<span><a href="#">삭제</a></span>
					</li>
				</c:forEach>				
			</ul>
		</div>
	</c:forEach>
</div>
</body>
</html>