<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<!-- 부트스트렙5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="//code.jquery.com/jquery-3.6.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<style type="text/css">
	/* 공통 레이아웃 css */
	.main-box{
		 height: 1000px;
	}
	.main-img-box{
		width: 100%;
	}
	.main-content{
		width: 100%;
		height: 1000px;
		background-color: white;
	}
	
	/* 카테고리 등록 css */
	.category-box1{
		padding:50px;
	}
	.board-box{
		padding:50px;
		
	}

</style>
</head>
<body>
<div class="master-container container">
	
	<jsp:include page="/WEB-INF/views/header.jsp"/>
	<div class="main-img-box">
		<a href="<c:url value='/'/>"> 
        	<img src="/team2_cafe/images/logo.jpg" alt="images">
        </a>
	</div>
	
	<div class="main-box d-flex">
		<jsp:include page="/WEB-INF/views/sidebar.jsp"/>
		
		<div class="sub-content flex-grow-1">
		
		<!-- 카테고리 등록 -->
		
		<div class="category-box1">
				<h2 class="mb-4">관리자 페이지</h2>
				<h3>기존 카테고리 리스트</h3>
				<ul>
					<c:forEach items="${caList}" var="category" >
						<li class="ca-box"><span class="ca-text">${category.ca_name}</span>
							<div class="btn-group">
							   <button class="btn btn-outline-danger btn-category-update" type="button">수정</button>
								<c:url value="/category/delete" var="delUrl">
							       <c:param name="category" value="${category.ca_name}"/>
							   </c:url>
							   <a class="btn btn-outline-warning btn-comment-delete" href="${delUrl}">삭제</a>
							</div>
						</li>
					</c:forEach>
				</ul>
				<!-- 카테고리 입력 박스 -->
				<form action="<c:url value="/category/insert"/>" method="post">
					<label for="category"> 추가할 카테고리명 :</label>
					<div class="mb-3 mt-3 input-group">
				  		<input type="text" class="form-control category-input" placeholder="새로운 카테고리명을 입력하세요." name = "category"/>
					</div>
					<button type="submit" class="btn btn-primary col-12 insert-btn">등록</button>
				</form>
			</div>
			
		<!-- 게시판 등록 -->
			<div class="board-box">
				<h3 class="mb-4">게시판 등록</h3>
				<div class="container justify-content-center min-vh-100">
					<form name="caForm" action="<c:url value="/admin/page"/>" enctype="multipart/form-data">
						<select id="selectCa" class="form-select bg-info" name="selectCategory" onchange="chageSelect()">
							<option value="-1">카테고리 선택</option>
							<c:forEach items="${caList}" var="caList">
								<option value="${caList.ca_name}" <c:if test="${caList.ca_name == caSelect}">selected</c:if> >${caList.ca_name}</option>
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
								<option value="-2">삭제할 게시판 선택</option>
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


<!--카테고리 추가 -->
<script type="text/javascript">
//입력받은 카테고리를 가져옴

let content = $(".form-control").val();

$.ajax({
	url : '<c:url value="/category/insert"/>',
	method : "POST",
	contentType: "application/json",
	data: JSON.stringify({ // 전달할 데이터 설정
		ca_ca_name: content // 변수명을 서버에서 인식할 변수명으로 변경
	}),
	success : function(data){
		if(data == "true"){
			alert("카테고리를 등록했습니다.");
			$(".category-input").val("");
		}else{
			alert("카테고리를 등록하지 못했습니다.");
		}
	}, 
	error : function(a, b, c){
		console.log(error);
	}
});
</script>

<!-- 카테고리 수정 구현 -->
<script type="text/javascript">
$(document).on("click", ".btn-category-update", function(){
		initCategory();
		//현재 댓글 보여주는 창이 textarea태그로 변경
		//기존 댓글 창을 감춤
		
	$(this).parents(".btn-group").hide();
	
		let caName = $(this).parents(".ca-box").find(".ca-text").text();
		console.log(caName)
		$(this).parents(".ca-box").find(".ca-text").hide();
		
		let btn = 
			`
				<button class="btn btn-outline-success btn-complete" data-ca="\${caName}">수정완료</button>
			`;
		let input = 
			`
			<div  class="input-group com-input-box ">
				<input class="form-control com-input" value ="\${caName}">
				\${btn}
			</div>
			`
		$(this).parents(".ca-box").find(".ca-text").after(input);
	
		//수정 삭제 버튼 대신 수정 완료 버튼으로 변경
		
		
});//click end
	function initCategory(){
		//감추었던 카테고리 내용을 보여줌
		$(".btn-group").show();
		//감추었던 수정/삭제 버튼을 보여줌
		$(".ca-text").show();
		//추가했던 댓글 input태그를 삭제
		$(".com-input-box").remove();
		//추가했던 수정 완료 버튼을 삭제
		$(".btn-complete").remove();
	}
//수정 완료 버튼 클릭 이벤트
//바꿀 카테고리랑 따로 저장
//1번을 2번

$(document).on("click",".btn-complete", function(){
	//수정하기 위해 필요한 정보를 가져옴 : 수정된 내용, 댓글 번호
	
	let content = $(".com-input").val(); //수정될 내용
	let caName = $(".btn-complete").data("ca"); //전에 있던 이름을 가져옴
	$(this).parents(".ca-box").find(".ca-text").text(content);
	
	$.ajax({
		url : '<c:url value="/category/update"/>',
		method : 'Post',
		data : {
			content : content,
			caName : caName
		},
		success : function(data){
			if(data == "true"){
				alert("카테고리를 수정했습니다.");
				initCategory();
			}else{
				alert("카테고리를 수정하지 못했습니다.");
			}
		}, 
		error : function(xhr, status, error){
				alert("카테고리를 수정하지 못했습니다.");
			
		}
	});
});

</script>
</body>
</html>