<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세</title>
<!-- 부트스트렙5, 썸머노트, j query -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="//code.jquery.com/jquery-3.6.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<style type="text/css">
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
		
	}
</style>
</head>

<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<div class="main-img-box">
	중앙에 이미지 배치, 클릭시 메인으로 이동
</div>
<div class="main-box d-flex">
	<jsp:include page="/WEB-INF/views/sidebar.jsp"/>
	<div class="main-content flex-grow-1">
		<div class="container  mt-3 mb-3">
			<div class="container mt-3 mb-3">
				<div class="mb-3 container">
					<div class="form-control">
						<div class="mb-3 mt-3 ">
					  		<div id="board" class="d-flex">
					  			<div class="col-4" style="font-weight: bold;">${post.bo_name}</div>
					  			<div class="d-flex justify-content-end ms-auto">
					  				<c:if test="${post.po_me_id == user.me_id}">
						  				<c:url var="updateUrl" value="/post/update">
											<c:param name="num" value="${post.po_num}"/>
										</c:url>
						  				<div><a href='${updateUrl}' class="btn btn-success" style="margin-right: 10px">수정</a></div>
					  				</c:if>
					  				<c:if test="${post.po_me_id == user.me_id || user.me_gr_num == 0}">
					  					<c:url var="deleteUrl" value="/post/delete">
											<c:param name="num" value="${post.po_num}"/>
										</c:url>
					  					<div><a href='${deleteUrl}' class="btn btn-danger" style="margin-right: 10px">삭제</a></div>
					  				</c:if>
					  			</div>
					  		</div>
						</div>
						
						<div class="mb-2 mt-3 ">
					  		<div id="title" class="d-flex">
					  			<div class="col-1">제목 :</div>
					  			<div style="margin-right: 5px">[${post.he_name}]</div>
					  			<div class="col-9">${post.po_title}</div>
					  		</div>
						</div>
						<div class="mb-2 mt-2 ">
					  		<div id="writer" class="d-flex">
					  			<div class="col-3" style="font-size: small; text-align: center;">작성자 : ${post.po_writer}</div>
					  			<div class="col-9" style="font-size: small; text-align: center;">작성일 : ${post.po_datetime}</div>
					  		</div>
						</div>
					</div>
				</div>
				<div class="mb-3 container">
			  		<div class="mb-3 form-control" style="min-height: 300px">
			  			${post.po_content}
			  		</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 썸머노트 스크립트 -->
<script type="text/javascript">
	$('[name=content]').summernote({
	    placeholder: '내용',
	    tabsize: 2,
	    height: 400,
	    toolbar: [
		      ['style', ['style']],
		      ['font', ['bold', 'underline', 'clear']],
		      ['color', ['color']],
		      ['para', ['ul', 'ol', 'paragraph']],
		      ['table', ['table']],
		      ['insert', ['link', 'picture', 'video']],
		      ['view', ['fullscreen', 'codeview', 'help']]
		    ]
	});
</script>

</body>
</html>