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
	a:link{
		color : black;
		text-decoration: none;
	}
	a:visited{
		color : black;
		text-decoration: none;
	}
	.side_menu{
		height: auto;
		border-radius: 15px;
		min-width: 250px;
		max-width: 250px;
	}
	.nav-box{
		height: 300px;
		
		background-color: Blanchedalmond;
		border: 2px solid Dimgray;
		border-radius: 15px;
		
	}
	
	.nav-link .nav-item .nav-tabs{
		background-color: Blanchedalmond;
		border: 2px solid Dimgray;
		border-radius: 15px;
	}

	.category-box{
		background-color: Blanchedalmond;
		height: calc(100% - 296px);
		border: 2px solid Dimgray;
		border-radius: 15px;
	}
	.tab-pane.active{
		border-bottom-left-radius: 10px;
		border-bottom-right-radius: 10px;
		height: 237px ;
		background-color: white;
		border-left: 1px solid rgb(233, 236, 239);
		border-right: 1px solid rgb(233, 236, 239);
		border-bottom: 1px solid rgb(233, 236, 239);
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
		<ul class="nav nav-tabs mt-2" role="tablist">
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

				<c:if test="${user != null && user.me_gr_num == 0}">
		    		<a class="mt-3 mb-1 float-end"  href ='<c:url value="/category/insert" />' style="color: gray; font-size: small;">관리자 페이지</a>
				</c:if>
				<br>
				<br>
		    	<h6 >카페명 : <b>With My Pet</b></h6>
				<br>

				<c:url value="/post/list" var="allPostUrl">
					<c:param name="page" value="1"/>
					<c:param name="num" value="0"/>
				</c:url>

		    	<a href='${allPostUrl}' style="text-decoration: none; color: black;">전체 게시글 수 :  
		    		<span class="">${allPostNum}</span>
				</a>
				<br><br>



				<a style="text-decoration: none; color: black;">가입한 회원 수 
		    		<span>${allMemberNum}</span>
				</a>
				<br><br>
				

		    </div>
		    <div id="menu1" class="container tab-pane">
		    	<a class="mt-3 mb-1 float-end" id="memberInfo" href="<c:url value="/user/check"/>" style="color: gray; font-size: small;">마이페이지</a>
		    	<br>
		    	<br>
		    	<c:if test="${user.me_nick == null}">
		    		<p><b>회원 : </b>${user.me_id}</p>
		    	</c:if>
		    	<c:if test="${user.me_nick != null}">
			    	<p><b>회원 : </b>${user.me_nick}(${user.me_id})</p>
		    	</c:if>
		    	<p><b>등급 : </b>${grade}</p>


		    	<b>내가 쓴 게시글 :</b> <a class="mb-1" href="<c:url value="/user/post"/>">${myPostNum}</a><br>

		    	<b>내가 쓴 댓글 :</b> <a class="mb-1" href="<c:url value="/user/comment"/>">${myCommentNum}</a>
		    	<br><br>
		    	<a class="mypage-btn mb-1" id="memberInfo" href="<c:url value="/user/check"/>">마이페이지</a>
			</div>
		</div>
	</div>
	
	<div class="category-box">
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
										<span class="badge bg-success float-end me-1"><a href="#" style="color: white; text-decoration: none;">수정</a></span>
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
						<a href="<c:url value='/admin/page'/>" class="badge bg-primary float-end" style="color: white; text-decoration: none;">게시판추가</a>
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
										<span class="badge bg-danger float-end"><a href="<c:url value="/admin/page?caSelect=${category.ca_name}"/>" style="color: white; text-decoration: none;">삭제</a></span>
										<span class="badge bg-success float-end me-1"><a href="<c:url value="/admin/page?caSelect=${category.ca_name}"/>" style="color: white; text-decoration: none;">수정</a></span>
									</c:if>
	
								</li>
							</c:if>
						</c:forEach>				
					</ul>

				</c:if>
			</div>
		</c:forEach>
	</div>


</div>
</body>
</html>