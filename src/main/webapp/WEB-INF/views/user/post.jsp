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
	.master-container {
	    max-width: 1200px; /* 최대 너비 */
	    min-width: 1024px; /* 최소 너비 */
	    margin: 0 auto; /* 가운데 정렬을 위해 margin을 auto로 설정 */
	}
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
<div class="container master-container">
	<jsp:include page="/WEB-INF/views/header.jsp"/>
	<div class="main-img-box">
		중앙에 이미지 배치, 클릭시 메인으로 이동
	</div>
	<div class="main-box d-flex">
		<jsp:include page="/WEB-INF/views/sidebar.jsp" flush="false"/>
		<div class="main-content flex-grow-1">
			<div class="container">
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
								<c:forEach items="${headList}" var="head">
								<c:if test="${post.po_he_num == head.he_num}"><td class="text-center">${head.he_name}</td></c:if>
								</c:forEach>
								<td class="text-center">
									<c:url var="url" value="/post/detail">
										<c:param name="num" value="${post.po_num}"/>
									</c:url>
									<a href="${url}">${post.po_title}</a>
								</td>
						   		<td class="text-center">
									<a href="#">${post.po_me_id}</a>
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
			</div>
		</div>
	</div>
</div>
<script src="//code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
</script>
</body>
</html>