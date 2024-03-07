<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<!-- 부트스트렙5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
	.main-box{
		 height: 1000px;
	}
	.side_menu{
		width: 150px; height: 100%; 
		background-color: yellow;
	}
</style>
</head>

<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<div class="main-box clearfix">
	<div class="side_menu float-start">
		<div>
			
		</div>
	</div>
	
	
	<div class="main-content">
	
	</div>
</div>
	
</body>
</html>