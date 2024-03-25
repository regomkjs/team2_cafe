<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트렙5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="//code.jquery.com/jquery-3.6.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<style type="text/css">

	.side_menu{
		width: 200px; height: auto;
		background-color: Blanchedalmond;
		border: 2px solid Dimgray;
		border-radius: 15px;
		
		
	}
	.nav-box{
		height: 300px;
		max-width: 200px; /* 최대 너비 */
   		min-width: 200px; /* 최소 너비 */
		background-color: Blanchedalmond;
		border: 2px solid Dimgray;
		border-radius: 15px;
		
	}
	
	.nav-link .nav-item .nav-tabs{
		background-color: Blanchedalmond;
		border: 2px solid Dimgray;
		border-radius: 15px;
	}
	
	.mypage-btn{
		width: 100px;
   		margin: auto;
    	display: block;
    	
		}
	
	
	
</style>	
	<script type="text/javascript">
	
	$("button").click(function(){
		$.ajax({
			url : '<c:url value="category/insert"/>',
			method : 'get',
			data :{
				num : 2
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
				
		    	<h6><b>카페정보</b></h6>

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
				<c:if test="${user != null && user.me_gr_num == 0}">
		    		<a class="btn btn-outline-black mt-6"  href ='<c:url value="/category/insert" />'>관리자 페이지</a>
				</c:if>

		    </div>
		    <div id="menu1" class="container tab-pane"><br>
		    	<h6><b>회원정보</b></h6>
		    	<b>등급 : ${grade}</b>
		    	<br>
		    	<b>내가 쓴 게시글 :</b> <a class="mb-1" href="<c:url value="/user/post"/>">${myPostNum}</a>
		    	<br><br>
		    	<b>내가 쓴 댓글 :</b> <a class="mb-1" href="<c:url value="/user/comment"/>">${myCommentNum}</a>
		    	<br><br>
		    	<a class="mypage-btn mb-1" id="memberInfo" href="<c:url value="/user/check"/>">마이페이지</a>
			</div>
		</div>
	</div>
	
	
	<c:forEach items="${caList}" var="category">
		<div class="container mt-3">
			<c:if test='${category.ca_name == "공지"}'>
				<span style="font-weight: bolder;">${category.ca_name} 
					<c:if test="${user != null && user.me_gr_num == 0}">
						<a href="<c:url value='/board/add'/>" class="badge bg-primary float-end" style="color: white; text-decoration: none;">게시판추가</a>
					</c:if>
				</span>
				<ul>
					<c:forEach items="${boList}" var="board">
						<c:if test='${board.bo_ca_name == "공지"}'>
							<li>
								<c:url value="/post/list" var="boardUrl">
									<c:param name="num" value="${board.bo_num}" />
								</c:url>
								<a href="${boardUrl}">${board.bo_name}</a>

								<c:if test="${user != null && user.me_gr_num == 0}">
									<span class="badge bg-danger float-end"><a href="#" style="color: white; text-decoration: none;">삭제</a></span>
									<span class="badge bg-success float-end me-2"><a href="#" style="color: white; text-decoration: none;">수정</a></span>
								</c:if>

							</li>
						</c:if>
					</c:forEach>				
				</ul>
			</c:if>
		</div>
	</c:forEach>
	<c:forEach items="${caList}" var="category">
		<div class="container mt-3">
			<c:if test='${category.ca_name != "공지"}'>

			<span style="font-weight: bolder;">${category.ca_name} 
				<c:if test="${user != null && user.me_gr_num == 0}">
					<a href="<c:url value='/board/add'/>" class="badge bg-primary float-end me-3" style="color: white; text-decoration: none;">게시판추가</a>
				</c:if>

			</span>

				<ul>
					<c:forEach items="${boList}" var="board">
						<c:if test='${category.ca_name == board.bo_ca_name && board.bo_ca_name !="공지"}'>
							<li>
								<c:url value="/post/list" var="boardUrl">
									<c:param name="num" value="${board.bo_num}" />
								</c:url>
								<a href="${boardUrl}">${board.bo_name}</a>
								<c:if test="${user != null && user.me_gr_num == 0}">
									<span class="badge bg-danger float-end"><a href="<c:url value="/board/delete"/>" style="color: white; text-decoration: none;">삭제</a></span>
									<span class="badge bg-success float-end me-2"><a href="<c:url value="/board/update"/>" style="color: white; text-decoration: none;">수정</a></span>
								</c:if>

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