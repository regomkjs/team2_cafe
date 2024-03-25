<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세</title>
<!-- 부트스트렙5, 썸머노트, j query -->
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

		 min-height: 1000px;

	}
	.main-img-box{
		width: 100%;
	}
	.main-content{
		margin-bottom: 300px;
	}
	.side_menu{
		width: 300px; min-height: 100%; max-height: 3000px;
	}
	.nav-box{
		width: 300px;
		height: 300px;
		border: 1px solid black;
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
		<jsp:include page="/WEB-INF/views/sidebar.jsp"/>
		<div class="main-content flex-grow-1">
			<div class="container  mt-3 mb-3">
				<div class="container mt-3 mb-3">
	
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
					  			<div class="col-2" style="font-size: small;">작성자 : ${post.po_writer}</div>
					  			<div class="col-4" style="font-size: small;">조회수 : ${post.po_view}</div>
					  			<div class="col-6" style="font-size: small; text-align: center;">작성일 : ${post.po_datetime}</div>
					  		</div>
						</div>
					</div>
					<hr>
			  		<div class="mb-3 form-control" style="min-height: 300px">
			  			${post.po_content}
			  		</div>
			  		<button type="button" class="me-2 btn btn-outline-primary btn-like">좋아요</button>[<span class="text-like">${post.po_totalLike}</span>]
				</div>
				
				<div class="mt-3 mb-3 comment-box container">
					<h4>댓글(<span class="comment-total">2</span>)</h4>
					<br>
					<!-- 댓글 리스트를 보여주는 박스 -->
					<div class="comment-list">
						
					</div>
					<!-- 댓글 페이지네이션 박스 -->
					<div class="comment-pagination">
						<ul class="pagination justify-content-center">
						
						</ul>
					</div>
					<!-- 댓글 입력 박스 -->
					<div class="comment-input-box">
						<div class="input-group">
							<textarea rows="4" class="form-control comment-content"></textarea>
							<button type="button" class="btn btn-outline-success col-2 btn-comment-insert">등록</button>
						</div>
					</div>
	
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
</div>
<!-- 댓글 리스트 출력 스크립트 -->
<script type="text/javascript">
let cri = {
	page : 1,
	poNum : '${post.po_num}'
}
getCommentList(cri)
function getCommentList(cri) {
	$.ajax({
		url : '<c:url value="/comment/list"/>',
		method : "post",
		data : cri,
		success : function(data){
			let commentList = data.list;
			let str = '';
			if(commentList == null || commentList.length == 0){
				str = '<div class="container text-center mb-3 mt-3">아직 등록된 댓글이 없습니다.</div>';
			}
			for(comment of commentList){
				let btns = "";
				if('${user.me_id}' == comment.co_me_id){
					btns += 
					`
					<div class="btn-comment-group col-2">
						<button class="btn btn-outline-warning btn-comment-update me-2" data-num="\${comment.co_num}">수정</button>
						<button class="btn btn-outline-danger btn-comment-delete " data-num="\${comment.co_num}">삭제</button>
					</div>
					`
				}
				else if('${user.me_gr_num}' == '0' && '${user}' != null){
					btns += 
					`
					<div class="btn-comment-group col-2 ">
						<button class="btn btn-outline-danger btn-comment-delete " data-num="\${comment.co_num}">삭제</button>
					</div>
					`
				}	
				if(comment.co_num == comment.co_ori_num){
					str +=
						`
						<div class="comment-container">
							<div class="input-group mb-3 box-comment">
								<div class="col-2"><h5>\${comment.co_writer}<h5></div>
								<div class="co_content col-8">\${comment.co_content}</div>
								\${btns}
							</div>
							<span style="font-size: small;" class="me-4">작성일 : \${comment.co_datetime}</span>
							<a href="javascript:void(0);" class="reply" data-ori="\${comment.co_ori_num}">답글쓰기</a>
						</div>	
						<hr>
							
						`
				}
				else{
					str +=
						`
						<div class="comment-container" style="margin-left: 100px;">
							<div class="input-group mb-3 box-comment" >
								<div class="col-2"><h5>\${comment.co_writer}<h5></div>
								<div class="co_content col-8">\${comment.co_content}</div>
								\${btns}
							</div>
							<span style="font-size: small;" class="">\${comment.co_datetime}</span>
							<hr>
						</div>	
						`
				}
				
			}
			$(".comment-list").html(str);
			//JSON.parse(문자열) : json형태의 문자열을 객체로 변환
			//JSON.stringify(객체) : 객체를 json형태의 문자열로 변환
			let pm = JSON.parse(data.pm);
			let pmStr = "";
			//이전 버튼 활성화 여부
			if(pm.prev){
				pmStr += `
				<li class="page-item">
					<a class="page-link" href="javascript:void(0);" data-page="\${pm.startPage-1}">이전</a>
				</li>
				`;
			}
			//숫자 페이지
			for(let i = pm.startPage; i<= pm.endPage; i++){
				let active = pm.cri.page == i ? "active" : "";
				pmStr += `
			    <li class="page-item \${active}">
					<a class="page-link" href="javascript:void(0);" data-page="\${i}">\${i}</a>
				</li>
				`
			}
			//다음 버튼 활성화 여부
			if(pm.next){
				pmStr += `
				<li class="page-item">
					<a class="page-link" href="javascript:void(0);" data-page="\${pm.endPage + 1}">다음</a>
				</li>
				`
			}
			$(".comment-pagination>ul").html(pmStr);
			$('.comment-total').text(pm.totalCount);
		},
		error : function (a,b,c) {
			console.error("에러 발생");
		}
	});
}

$(document).on("click", ".comment-pagination .page-link", function () {
	cri.page = $(this).data("page");
	getCommentList(cri);
})

</script>

<!-- 댓글 작성 스크립트 -->
<script type="text/javascript">
//댓글 등록 버튼 클릭 이벤트를 등록
$(".btn-comment-insert").click(function () {
	if('${user.me_id}' == ''){
		if(confirm("로그인이 필요한 서비스 입니다. 로그인으로 이동하시겠습니까?")){
			location.href = "<c:url value='/login'/>"
			return;
		}
		else{
			return;
		}
	}
	
	let content = $(".comment-content").val();
	let poNum = '${post.po_num}';
	
	$.ajax({
		url : '<c:url value="/comment/insert"/>',
		method : "post",
		data : {
			"content" : content,
			"poNum" : poNum
		},
		success : function (data) {
			if(data == "true"){
				alert("댓글이 등록되었습니다.");
				cri.page = 1;
				getCommentList(cri);
				$(".comment-content").val("");
			}else{
				alert("댓글 등록 실패")
			}
		},
		error : function (a,b,c) {
			console.error("에러 발생");
		}
	});		
});
</script>

<!-- 댓글 삭제 스크립트 -->
<script type="text/javascript">
	
	
	$(document).on("click",".btn-comment-delete",function(){
		if('${user.me_id}' == ''){
			if(confirm("로그인이 필요한 서비스 입니다. 로그인으로 이동하시겠습니까?")){
				location.href = "<c:url value='/login'/>"
				return;
			}
			else{
				return;
			}
		}
		
		let num = $(this).data("num");
		$.ajax({
			url : '<c:url value="/comment/delete"/>',
			method : "post",
			data : {
				"num" : num
			},
			success : function (data) {
				if(data == "true"){
					alert("댓글이 삭제되었습니다.");
					getCommentList(cri);
				}
				else{
					alert("댓글 삭제에 실패했습니다.");
				}
			},
			error : function (a,b,c) {
				console.error("에러 발생");
			}
		});
	});
	
</script>

<!-- 댓글 수정 스크립트 -->
<script type="text/javascript">
	$(document).on("click",".btn-comment-update",function(){
		initComment()
		// 현재 댓글 보여주는 창이 textarea태그로 변경
		// 기존 댓글 창을 감춤
		$(this).parents(".box-comment").find(".co_content").hide();
		let comment = $(this).parents(".box-comment").find(".co_content").text();
		let textarea =
		`
		<textarea rows="3" class="form-control com-input">\${comment}</textarea>
		`
		$(this).parents(".box-comment").find(".co_content").after(textarea);
		// 수정 삭제 버튼 대신 수정 완료 버튼으로 변경
		$(this).parents(".btn-comment-group").hide();
		let num = $(this).data("num");
		let btn = 
		`
		<button class="btn btn-outline-success btn-complete" data-num="\${num}" type="button">수정완료</button>
		`
		$(this).parent().after(btn);
	});
	
	$(document).on("click",".btn-complete",function(){
		let num = $(this).data("num");
		let content = $(".com-input").val();
		$.ajax({
			url : '<c:url value="/comment/update"/>',
			method : "post",
			data : {
				"num" : num,
				"content" : content
			},
			success : function (data) {
				if(data == "true"){
					alert("댓글을 수정했습니다.");
					getCommentList(cri);
				}
				else{
					alert("댓글 수정에 실패했습니다.");
				}
			},
			error : function (a, b, c) {
				console.error("에러 발생")
			}
		});
	});
	
	
	function initComment() {
		//감추었던 댓글 내용을 보여줌
		$(".co_content").show();
		$(".reply").show();
		//감추었던 수정 삭제 버튼을 보여줌
		$(".btn-comment-group").show();
		//textarea 삭제
		$(".com-input").remove();
		$(".reply-box").remove();
		//수정 버튼 
		$(".btn-complete").remove();
	}

</script>

<!-- 대댓글 작성 스크립트 -->
<script type="text/javascript">
	$(document).on("click",".reply",function(){
		initComment();
		if('${user.me_id}' == ''){
			if(confirm("로그인이 필요한 서비스 입니다. 로그인으로 이동하시겠습니까?")){
				location.href = "<c:url value='/login'/>"
				return;
			}
			else{
				return;
			}
		}
		
		let ori = $(this).data("ori");
		
		$(this).hide();
		let textarea = 
			`
				<div class="input-group reply-box mt-3 mb-3">
					<textarea rows="3" class="form-control reply-content"></textarea>
					<button type="button" class="btn btn-outline-success col-2 btn-reply-insert" data-ori="\${ori}">등록</button>
				</div>
			`;
		$(this).parent().after(textarea);
	});
	
	$(document).on("click",".btn-reply-insert",function(){
		let ori = $(this).data("ori");
		let content = $(".reply-content").val();
		let poNum = '${post.po_num}';
		
		$.ajax({
			url : '<c:url value="/reply/insert"/>',
			method : "post",
			data : {
				"ori" : ori,
				"content" : content,
				"poNum" : poNum
			},
			success : function (data) {
				if(data == "true"){
					alert("댓글이 등록되었습니다.");
					cri.page = 1;
					initComment();
					getCommentList(cri);
				}else{
					alert("댓글 등록 실패")
				}
			},
			error : function (a,b,c) {
				console.error("에러 발생");
			}
		});		
		
	});
</script>

<!-- 좋아요 구현 스크립트 -->
<script type="text/javascript">
$(".btn-like").on("click", function(){
	if('${user.me_id}' == ''){
		if(confirm("로그인이 필요한 서비스 입니다. 로그인으로 이동하시겠습니까?")){
			location.href = "<c:url value='/login'/>"
			return;
		}
		else{
			return;
		}
	}
	let po_num = ${post.po_num};
	$.ajax({
		url : '<c:url value="/post/like"/>',
		method : "post",
		data : {
			"po_num" : po_num,
		},
		success : function (data) {
			switch (data) {
			case "1":
				alert("게시글을 추천했습니다.");
				break;
			case "0":
				alert("추천을 취소했습니다.");
				break;
			case "-1":
				alert("에러 발생")
				break;
			}
			getLike();
		},
		error : function (a,b,c) {
			console.error("에러 발생2");
		}
	});
	
});


function getLike() {
	let po_num = ${post.po_num};
	$.ajax({
		url : '<c:url value="/post/countlike"/>',
		method : "post",
		data : {
			"po_num" : po_num,
		},
		success : function (data) {
			displayLike(data.result);
			displayUpdateLike(data.totalCountLike);
		},
		error : function (a,b,c) {
			console.error("에러 발생1");
		}
	});
}

function displayUpdateLike(totalCountLike) {
	$(".text-like").text(totalCountLike);
}

function displayLike(result) {
	$('.btn-like').addClass("btn-outline-primary");
	$('.btn-like').removeClass("btn-primary");
	if(result){
		$('.btn-like').addClass("btn-primary");
		$('.btn-like').removeClass("btn-outline-primary");
	}else{
		$('.btn-like').addClass("btn-outline-primary");
		$('.btn-like').removeClass("btn-primary");
	}
	
}
getLike();
</script>

<!-- 썸머노트 스크립트 -->
<script type="text/javascript">
$('#content').summernote({
    placeholder: '내용',
    tabsize: 2,
    height: 400,
    toolbar: [
      ['style', ['style']],
      ['font', ['bold', 'underline', 'clear']],
      ['color', ['color']],
      ['para', ['ul', 'ol', 'paragraph']],
      ['table', ['table']],
      ['insert', ['picture']],
      ['view', ['fullscreen', 'codeview', 'help']]
    ]
	});
</script>

</body>
</html>