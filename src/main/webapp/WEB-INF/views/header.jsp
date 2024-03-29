<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트렙5 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

</head>
<body>
<div class="container header">
	<nav class="navbar navbar-expand-sm white">
		<div class="container-fluid">
			<a class="navbar-brand" href="<c:url value="/"/>"><b>WITH MY PET</b></a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="collapsibleNavbar">
				<ul class="navbar-nav ">
					<c:if test="${user == null}">
						<li class="nav-item">
							<a class="nav-link" href="<c:url value="/signup"/>">회원가입</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="<c:url value="/login"/>">로그인</a>
						</li>
					</c:if>
					<!--	
					<li class="nav-item">
						<a class="nav-link" href='<c:url  value="/board/list"/>'>게시글</a>
					</li> 
					-->
					<c:if test="${user != null}"> 
						<li class="nav-item">
							<a class="nav-link" href='<c:url  value="/logout"/>'>로그아웃</a>
						</li> 
					</c:if>
				</ul>	


			</div>
		</nav>
	</div>
</body>
</html>