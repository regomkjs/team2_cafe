<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<!-- 부트스트렙5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="//code.jquery.com/jquery-3.6.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
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
		
	}
	.main-content{
		height: 1000px;
		background-color: white;
	}
</style>
</head>
<body>
<div class="container master-container">
	<jsp:include page="/WEB-INF/views/header.jsp"/>
	<div class="main-img-box">
		<a href="<c:url value='/'/>"> 
        	<img src="/team2_cafe/images/logo.jpg" alt="images">
        </a>
	</div>
	<div class="main-box d-flex">
		<jsp:include page="/WEB-INF/views/sidebar.jsp" flush="false"/>
		<div class="main-content flex-grow-1">
			<div class="container">
				<table class="table table-hover mt-3">
			 		<thead class="text-center">
						<tr>
							<th class="col-1">번호</th>
							<th class="col-2">게시판</th>
							<th class="col-5">제목</th>
							<th class="col-2">작성자</th>
							<th >조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${postList}" var="post">
							<tr>
								<td class="text-center">${post.po_num}</td>
								<td class="text-center">${post.bo_name}</td>
								<td class="text-center">
									<c:url var="url" value="/post/detail">
										<c:param name="num" value="${post.po_num}"/>
									</c:url>
									<a href="${url}">[${post.he_name}] ${post.po_title}</a>
								</td>
						   		<td class="text-center">
									<a href="#">${post.po_writer}</a>
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