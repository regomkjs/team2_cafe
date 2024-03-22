<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
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
		background-color: green;
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
	
	<div class="sub-content flex-grow-1">
		<div class="container justify-content-center min-vh-100">
			<form name="caForm" action="<c:url value="/admin/page"/>" enctype="multipart/form-data">
				<select id="selectCa" class="form-select bg-info" name="selectCategory" onchange="chageSelect()">
					<option value="-1">카테고리 선택</option>
					<c:forEach items="${caList}" var="caList">
						<option value="${caList.ca_name}" <c:if test="${caList.ca_name == caSelect }">selected</c:if>>${caList.ca_name}</option>
					</c:forEach>
				</select>
			</form>
			
			<div class="<c:if test="${caSelect == null || caSelect == '-1'}">d-none</c:if> input-group mb-3 w-50 boardBtn">
				<button type="button" class="btn btn-primary mb-1 boardAddBtn ms-1 mt-1">게시판 등록</button>
				<button type="button" class="btn btn-primary mb-1 boardSetBtn ms-1 mt-1">게시판 수정</button>
				<button type="button" class="btn btn-primary mb-1 boardDelBtn ms-1 mt-1">게시판 삭제</button>
			</div>
			<form action="<c:url value="/admin/page"/>" enctype="multipart/form-data" class="">
				<input type="hidden" name="caSelect" value="${caSelect}">
				<div class="input-group mb-3 w-50 inputBoard d-none">
		  			<input type="text" class="head-input form-control" placeholder="추가할 게시판명 입력" aria-describedby="btn1" name="inputBoard">
		  			<button class="btn btn-outline-secondary">등록</button>
				</div>
				
				<div class="input-group mb-3 w-50 updateBoard d-none">
					<select name="selectBoard" class="form-select selectBoard">
						<option value="-1">수정할 게시판 선택</option>
						<c:forEach items="${caBoardList}" var="boList">
							<option value="${boList.bo_num}">${boList.bo_name}</option>
						</c:forEach>
					</select>
					<input type="text" class="form-control" placeholder="수정할 게시판 이름 입력" name="updateboard">
					<button class="btn btn-outline-warning">수정</button>
				</div>
				
				<div class="input-group mb-3 w-50 deleteBoard d-none">
					<select name="deleteBoard" class="form-select deleteBoard ">
						<option value="-2">삭제할 말머리 선택</option>
						<c:forEach items="${caBoardList}" var="boList">
							<option value="${boList.bo_num}">${boList.bo_name}</option>
						</c:forEach>
					</select>
					<button class="btn btn-outline-warning">삭제</button>
				</div>
			</form>
		</div>
	</div>
</div>
<script src="//code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">

$(".boardAddBtn").click(function(){
	if($(".inputBoard").hasClass("d-none")===true) {
		$(".inputBoard").removeClass("d-none");
		$(".updateBoard").addClass("d-none");
		$(".deleteBoard").addClass("d-none");
	} else {
		$(".inputBoard").addClass("d-none");
	}
})

$(".boardSetBtn").click(function(){
	if($(".updateBoard").hasClass("d-none")===true) {
		$(".updateBoard").removeClass("d-none");
		$(".inputBoard").addClass("d-none");
		$(".deleteBoard").addClass("d-none");
	} else {
		$(".updateBoard").addClass("d-none");
	}
})

$(".boardDelBtn").click(function(){
	if($(".deleteBoard").hasClass("d-none")===true) {
		$(".deleteBoard").removeClass("d-none");
		$(".inputBoard").addClass("d-none");
		$(".updateBoard").addClass("d-none");
	} else {
		$(".deleteBoard").addClass("d-none");
	}
})

</script>

<script src="//code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">

function chageSelect() {
	if($("#selectCa option:selected").val()!="-1") {
		$(".boardBtn").removeClass("d-none");
		
	} else {
		$(".boardBtn").addClass("d-none");
	}
	let caSelect = $("#selectCa option:selected").val();
	location.href = `<c:url value="/admin/page?caSelect="/>\${caSelect}`;
}

</script>
</body>
</html>