<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<!-- 부트스트렙5, 썸머노트, j query -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="//code.jquery.com/jquery-3.6.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<style type="text/css">
	
	.container {
    max-width: 1200px; /* 최대 너비 */
    min-width: 1024px; /* 최소 너비 */
    margin: 0 auto; /* 가운데 정렬을 위해 margin을 auto로 설정 */
	}
	
	
	.main-box{
		 height: 1000px;
	}
	.main-img-box{
		width: 100%;
		height: 200px;
		background-color: white;
		text-align: center;
	}
	.main-content{
		width: 100%;
		height: 1000px;
		
	}
</style>
</head>

<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<div class="container">
<div class="main-img-box">
	<img src="/team2_Shingyeongjae/images/error.png" alt="images">
</div>
<div class="main-box d-flex">
	<jsp:include page="/WEB-INF/views/sidebar.jsp"/>
	<div class="container main-content flex-grow-1">
		<div class="container mt-3 mb-3">
			<form action='<c:url value="/post/list"/>' method="post">
				<div class="mb-3 mt-3">
					<label for="board">게시판:</label>
					<select id="board" name="board" class="form-control">
						<c:forEach items="${boList}" var="board">
								<c:if test='${board.bo_ca_name == "공지" && user.me_gr_num == 0}'>
									<c:if test="${num == board.bo_num}">
										<option class="select-board" value="${board.bo_num}" selected>${board.bo_name}</option>
									</c:if>
									<c:if test="${num != board.bo_num}">
										<option class="select-board" value="${board.bo_num}" >${board.bo_name}</option>
									</c:if>
								</c:if>
								<c:if test='${board.bo_ca_name != "공지"}'>
									<c:if test="${num == board.bo_num}">
										<option class="select-board" value="${board.bo_num}" selected>${board.bo_name}</option>
									</c:if>
									<c:if test="${num != board.bo_num}">
										<option class="select-board" value="${board.bo_num}" >${board.bo_name}</option>
									</c:if>
								</c:if>
						</c:forEach>
					</select>
				</div>
				<div class="mb-3 mt-3">
					<label for="head">말머리:</label>
					<select id="head" name="head" class="form-control headselect">
						<c:forEach items="${heList}" var="he">
							<option class="select-board null-select" value="${he.he_num}">${he.he_name}</option>
						</c:forEach>
					</select>
				</div>
				<div class="mb-3 mt-3">
					<label for="title">제목:</label>
			  		<input type="text" class="form-control" id="title" placeholder="제목 입력" name="title">
				</div>
				<div class="mb-3">
			  		<label for="content">내용:</label>
		  			<textarea rows="10" name="content" id="content" class="form-control"></textarea>
				</div>
				<div class="mb-3 mt-3">
					<label class="form-label">첨부파일:</label>
			  		<input type="file" class="form-control" name="file">
			  		<input type="file" class="form-control" name="file">
			  		<input type="file" class="form-control" name="file">
				</div>
				<button type="submit" class="btn btn-primary col-12 insert-btn">등록</button>
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
	});
</script>

<script type="text/javascript">
	$(document).on("submit","form", function(){
		if($("#board").val() == 0 || $("#board").val() == null){
			alert("게시판을 선택해야합니다.");
			return false;
		}
		
		if($("#title").val() == '') {
			alert("제목이 없습니다.");
			return false;
		} 
		if($("#content").val() == '') {
			alert("내용이 없습니다.");
			return false;
		} 
		let title = $("#title").val();
		let content = $("#content").val();
		let head = $("#head").val();
		$.ajax({
			url : '<c:url value="/post/insert"/>',
			method : "post",
			data : {
				"title" : title,
				"content" : content,
				"head" : head
			},
			success : function(data){
				if(data == "true"){
					alert("게시글을 등록했습니다.")
					return true;
				}
				else{
					alert("게시글 등록에 실패했습니다.")
					return true;
				}
			},
			error : function(a,b,c){
				
			}
			
		});
	})

</script>
</body>
</html>