<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 리스트</title>
<!-- 부트스트렙5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="//code.jquery.com/jquery-3.6.1.js"></script>
</head>
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
<body>
<jsp:include page="/WEB-INF/views/header.jsp" />

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
	   	<c:forEach items="${poList}" var="po">
		<tr>
			<td>${po.po_num }</td>
			<td>${po.po_title }</td>
			<td>${po.po_content}</td>
			<td>${po.po_writer}</td>
			<td>
				<c:url var="url" value="/post/list">
					<c:param name="num" value="${board.bo_num}" />
				</c:url>
					<a href="${url }">${board.bo_title}</a></td>
			<td>
				<c:url var="page" value="/board/list">
					<c:param name="type" value="writer" />
					<c:param name="search" value="${board.bo_me_id}" />
					<c:param name="page" value="1" />
				</c:url>
					<a href="${page}"> ${board.bo_me_id}</a></td>
			<td>${Post.po_view}</td>
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
	</div>
</body>
</html>