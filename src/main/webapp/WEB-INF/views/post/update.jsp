<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<!-- 부트스트렙5 -->
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
		<div class="container mt-3 mb-3">
			<form action="<c:url value="/"/>" method="post" enctype="multipart/form-data">
				<div class="mb-3 mt-3">
					<label for="board">게시판:</label>
					<select id="board" name="board" class="form-control">
						<c:forEach items="${boList}" var="board">
								<c:if test='${board.bo_ca_name == "공지" && user.me_gr_num == 0}'>
									<c:if test="${post.bo_name == board.bo_name}">
										<option class="select-board" value="${board.bo_num}" selected="selected">${board.bo_name}</option>
									</c:if>
									<c:if test="${post.bo_name != board.bo_name}">
										<option class="select-board" value="${board.bo_num}">${board.bo_name}</option>
									</c:if>
								</c:if>
								<c:if test='${board.bo_ca_name != "공지"}'>
									<c:if test="${post.bo_name == board.bo_name}">
										<option class="select-board" value="${board.bo_num}" selected="selected">${board.bo_name}</option>
									</c:if>
									<c:if test="${post.bo_name != board.bo_name}">
										<option class="select-board" value="${board.bo_num}">${board.bo_name}</option>
									</c:if>
								</c:if>
						</c:forEach>
					</select>
				</div>
				<div class="mb-3 mt-3">
					<label for="head">말머리:</label>
					<select id="head" name="head" class="form-control headselect">
						<option class="null-select" value="${post.he_num}" selected="selected">${post.he_name}</option>
						<c:forEach items="${heList}" var="he">
							<c:if test="${post.bo_num == he.he_bo_num && post.he_num != he.he_num}">
								<option class="null-select" value="${he.he_num}">${he.he_name}</option>
							</c:if>
						</c:forEach>
					</select>
				</div>
				<div class="mb-3 mt-3">
					<label for="title">제목:</label>
			  		<input type="text" class="form-control" id="title" name="title" value="${post.po_title}">
				</div>
				<div class="mb-3">
			  		<label for="content">내용:</label>
			  		<div class="mb-3">
			  			<textarea rows="10" name="content" id="content" class="form-control">${post.po_content}</textarea>
			  		</div>
				</div>
				<div class="mb-3 mt-3">
					<label class="form-label">첨부파일:</label>
			  		<input type="file" class="form-control" name="file">
			  		<input type="file" class="form-control" name="file">
			  		<input type="file" class="form-control" name="file">
				</div>
				<button type="submit" class="btn btn-primary col-12 insert-btn">수정</button>
			</form>		
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

<!-- 보드에 따른 말머리 리스트 출력 -->
<script type="text/javascript">
	$(document).on("change","#board",function(){
		$(".null-select").remove();
		let bo_num = $(this).val();
		$.ajax({
			url : '<c:url value="/post/write"/>',
			method : 'post',
			data : {
				"bo_num" : bo_num
			},
			success : function(data){
				let str = ""; 
				for(head of data.headList){
					if(head.he_bo_num == data.bo_num){
					str += 
					`
						<option value="\${head.he_num}">\${head.he_name}</option>
					`
					}
				}
				$(".headselect").html(str);
			},
			error : function(a,b,c){
				
			}
		});
	})
</script>


</body>
</html>