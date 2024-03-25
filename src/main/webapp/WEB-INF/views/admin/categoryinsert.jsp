<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지-카테고리 등록</title>
<!-- 부트스트렙5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
	/* 공통 레이아웃 css */
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
		height: 200px;
		background-color: white;
		text-align: center;
	}
	.main-content{
		height: 1000px;
	}
	
	/* 카테고리 등록 css */
	

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
		<jsp:include page="/WEB-INF/views/sidebar.jsp"/>
		<div class="main-content flex-grow-1">
			
			<div class="container">
				<h2 class="mb-4">카테고리 등록 화면</h2>
				<h3>기존 카테고리 리스트</h3>
				<ul>
					<c:forEach items="${categoryList}" var="category" >
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
					<div class="mb-3 mt-3 input-group">
						<label for="category"> 추가할 카테고리명 :</label>
				  		<input type="text" class="form-control" placeholder="새로운 카테고리명을 입력하세요." name = "category"/>
					</div>
					<button type="submit" class="btn btn-primary col-12 insert-btn">등록</button>
				</form>
			</div>
		</div>
	</div>
</div>
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
			$(".form-control").val("");
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