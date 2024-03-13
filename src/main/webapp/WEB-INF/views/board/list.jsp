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
<jsp:include page="/WEB-INF/views/header.jsp"/>
<div class="main-img-box">
	중앙에 이미지 배치, 클릭시 메인으로 이동
</div>
<div class="main-box d-flex">
	<jsp:include page="/WEB-INF/views/sidebar.jsp"/>
	<div class="main-content flex-grow-1">
		메인 화면에 보여줄 리스트 구상<br>
		<button type="button" class="btn btn-primary mb-1 headAddBtn">말머리 추가</button>
		<button type="button" class="btn btn-primary mb-1 headSetBtn">말머리 수정</button>
		<button type="button" class="btn btn-primary mb-1 headDelBtn">말머리 삭제</button>
		
		<form action="<c:url value="/board/list"/>" enctype="multipart/form-data">
		
			<div class="d-none input-group mb-3 w-25 inputHead">
	  			<input type="text" class="head-input form-control" placeholder="추가할 말머리 입력" aria-describedby="btn1" name="inputHead">
	  			<button class="btn btn-outline-secondary">등록</button>
			</div>

			<div class="d-none input-group mb-3 w-25 updateHead">
				<select name="selectHead" class="form-select">
					<option value="-1">수정할 말머리 선택</option>
					<c:forEach items="${headList}" var="headList">
						<c:if test="${headList.he_bo_num==1}"> <!-- 관리자가 들어와 있는 게시판의 번호를 받아와야 함 임시로 1로 해둔 상태 -->
							<option value="${headList.he_num}">${headList.he_name}</option>
						</c:if>
					</c:forEach>
				</select>
				<input type="text" class="form-control" placeholder="수정할 말머리 입력" name="updateHead">
				<button class="btn btn-outline-warning">수정</button>
			</div>

			<div class="d-none input-group mb-3 w-25 deleteHead">
				<select name="deleteHead" class="form-select">
					<option value="-2">삭제할 말머리 선택</option>
					<c:forEach items="${headList}" var="headList">
						<c:if test="${headList.he_bo_num==1}"> <!-- 관리자가 들어와 있는 게시판의 번호를 받아와야 함 임시로 1로 해둔 상태 -->
							<option value="${headList.he_num}">${headList.he_name}</option>
						</c:if>
					</c:forEach>
				</select>
				<button class="btn btn-outline-warning">삭제</button>
			</div>
			
		</form>
		
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