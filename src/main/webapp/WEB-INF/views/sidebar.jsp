<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트렙5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="//code.jquery.com/jquery-3.6.1.js"></script>
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
	<script type="text/javascript">
	
	$("button").click(function(){
		$.ajax({
			url : '<c:url value="category/insert"/>',
			method : 'get',
			data :{
				num : 1 
			},
			success : function(data){
				alert(data);
			},
			error : function(xhr, status, error){
			}
		})
	});
</script>
	

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
			<div id="home" class="container tab-pane active">
		    	<p>카페정보</p>
		    	<a href='<c:url value="/post/list"/>' class="btn btn-secondary">전체 게시글 수 
		    	<span class="badge badge-light">${allPostNum }
				</a>
				<br><br>
				<button type="button" class="btn btn-primary">가입한 회원 수 
		    	<span class="badge badge badge-light">${allMemberNum}</span>
				</button>
		    	<p> ${categoryList}</p>
		    	<br>
		    	<p>카페관리</p>
		    </div>
		    <div id="menu1" class="container tab-pane"><br>
		    	<p>로그인 했을 때만 표시</p>
			</div>
		</div>
	</div>
	<a class="btn"  href ='<c:url value="/category/insert" />'>관리자 페이지</a>
	<c:forEach  items="${category.ca_name}" var="category">
		<div class="container">
			<span style="font-weight: bolder;">카테고리명<a href="#">게시판추가</a></span>
			<ul>
				<c:forEach begin="1" end="4">
					<li>
						<a href="#">게시판명</a>
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