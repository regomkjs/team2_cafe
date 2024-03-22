<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>게시글 리스트</title>

<!-- 부트스트렙5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
	.main-box{
		 height: 1000px;
	}
	.main-img-box{
		width: 100%;
		height: 200px;
		background-color: white;
	}
	.main-content{
		width: 50%;
		height: 1000px;
	}
</style>
</head>

<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<div class="main-img-box">
	중앙에 이미지 배치, 클릭시 메인으로 이동
    <img src="/team2_Shingyeongjae/images/error.png" alt="images">
</div>
<div class="main-box d-flex">
	<jsp:include page="/WEB-INF/views/sidebar.jsp"/>
	<div class="main-content flex-grow-1">
		<div class="container ">
			<form action="<c:url value="/post/list"/>" method="get" class="mt-3">
				<input name="num" value="${bo_num}" type="hidden">
				<div class="input-group">
					<select name="type">
						<option value="title" <c:if test='${pm.cri.type == "title"}'>selected</c:if>>제목+내용</option>
						<option value="writer" <c:if test='${pm.cri.type == "writer"}'>selected</c:if>>작성자</option>
					</select>
					<input type="text" name="search" value="${pm.cri.search}">
					<button class="btn btn-outline-primary">검색</button>		
				</div>
			</form>
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

								<a href="${page}">${post.po_writer}</a>

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

			<ul class="pagination justify-content-center">
	<!--
		<div class ="container">
	<table class="table">
	 <thead>
	     <tr>
	       <th>번호</th>
	       <th>게시글 제목</th>
	       <th>게시판</th>
	       <th>작성자</th>
	       <th>조회수</th>
	     </tr>
	  </thead>
	  <tbody>
	   	<c:forEach items="${postlist}" var="po">
		<tr>
			<td>${po.po_num }</td>
			<td>${po.po_title }</td>
			<td>
				<c:url var="url" value="/post/list">
					<c:param name="num" value="${board.bo_num}" />
				</c:url>
					<a href="${url }">${boList}</a></td>
			<td>${po.po_writer}</td>
			<td>${po.po_view}</td>
		</tr>
	</c:forEach>
	<c:if test="${poList.size() == 0 }">
		<tr>
			<th colspan="5">
				<h3 class="text-center">등록된 게시글이 없습니다.</h3>
			</th>
		</tr>
	</c:if>
	</tbody>
  	</table>
  		<ul class="pagination justify-content-center">
-->
		    	<c:if test="${pm.prev}">
					<li class="page-item">
						<c:url var="prevUrl" value="/post/list">
							<c:param name="type" value="${pm.cri.type}"/>
							<c:param name="search" value="${pm.cri.search}"/>
							<c:param name="page" value="${pm.startPage-1}"/>
							<c:param name="num" value="${pm.cri.boNum}"/>
						</c:url>
						<a class="page-link" href="${prevUrl}">이전</a>
					</li>
				</c:if>
				<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
					<li class="page-item <c:if test="${pm.cri.page == i}">active</c:if>">
						<c:url var="pageUrl" value="/post/list">
							<c:param name="type" value="${pm.cri.type}"/>
							<c:param name="search" value="${pm.cri.search}"/>
							<c:param name="page" value="${i}"/>
							<c:param name="num" value="${pm.cri.boNum}"/>
						</c:url>
						<a class="page-link" href="${pageUrl}">${i}</a>
					</li>
				</c:forEach>
				<c:if test="${pm.next}">
					<li class="page-item">
						<c:url var="nextUrl" value="/post/list">
							<c:param name="type" value="${pm.cri.type}"/>
							<c:param name="search" value="${pm.cri.search}"/>
							<c:param name="page" value="${pm.endPage+1}"/>
							<c:param name="num" value="${pm.cri.boNum}"/>
						</c:url>
						<a class="page-link" href="${nextUrl}">다음</a>
					</li>
				</c:if>
		  	</ul>

			

			<c:if test="${bo_num == 1 && user.me_gr_num == 0}">
				<a href='<c:url value="/post/write" />'><button class="btn btn-primary">게시글 등록</button></a>
			</c:if>
			<c:if test="${bo_num != 1 && user != null}">
				<a href='<c:url value="/post/write" />'><button class="btn btn-primary">게시글 등록</button></a>
			</c:if>

			<c:if test="${user.me_gr_num == 0}"> <!-- 관리자 등급 번호는 0 -->
				<button type="button" class="btn btn-primary mb-1 headAddBtn">말머리 추가</button>
				<button type="button" class="btn btn-primary mb-1 headSetBtn">말머리 수정</button>
				<button type="button" class="btn btn-primary mb-1 headDelBtn">말머리 삭제</button>
				
				<form action="<c:url value="/post/list"/>" enctype="multipart/form-data">
					<input type="hidden" name="num" value="${bo_num}">
					<div class="d-none input-group mb-3 w-50 inputHead">
			  			<input type="text" class="head-input form-control" placeholder="추가할 말머리 입력" aria-describedby="btn1" name="inputHead">
			  			<button class="btn btn-outline-secondary">등록</button>
					</div>

					<div class="d-none input-group mb-3 w-50 updateHead">
						<select name="selectHead" class="form-select">
							<option value="-1">수정할 말머리 선택</option>
							<c:forEach items="${heList}" var="heList">
								<option value="${heList.he_num}">${heList.he_name}</option>
							</c:forEach>
						</select>
						<input type="text" class="form-control" placeholder="수정할 말머리 입력" name="updateHead">
						<button class="btn btn-outline-warning">수정</button>
					</div>

					<div class="d-none input-group mb-3 w-50 deleteHead">
						<select name="deleteHead" class="form-select">
							<option value="-2">삭제할 말머리 선택</option>
							<c:forEach items="${heList}" var="heList">
								<option value="${heList.he_num}">${heList.he_name}</option>
							</c:forEach>
						</select>
						<button class="btn btn-outline-warning">삭제</button>
					</div>
					
				</form>
				
			</c:if>
		</div>
	</div>
</div>
<script src="//code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(".headAddBtn").click(function(){
		if($(".inputHead").hasClass("d-none")===true) {
			$(".inputHead").removeClass("d-none");
			$(".updateHead").addClass("d-none");
			$(".deleteHead").addClass("d-none");
		} else {
			$(".inputHead").addClass("d-none");
		}
	})
	$(".headSetBtn").click(function(){
		if($(".updateHead").hasClass("d-none")===true) {
			$(".updateHead").removeClass("d-none");
			$(".inputHead").addClass("d-none");
			$(".deleteHead").addClass("d-none");
		} else {
			$(".updateHead").addClass("d-none");
		}
	})
	$(".headDelBtn").click(function(){
		if($(".deleteHead").hasClass("d-none")===true) {
			$(".deleteHead").removeClass("d-none");
			$(".inputHead").addClass("d-none");
			$(".updateHead").addClass("d-none");
		} else {
			$(".deleteHead").addClass("d-none");
		}
	})
</script>


</body>
</html>