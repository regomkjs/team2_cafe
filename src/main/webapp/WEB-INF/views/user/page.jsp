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
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- jquery validtaion -->	
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/additional-methods.min.js"></script>

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
		<div class="container">
			<form action="<c:url value="/user/page"/>" method="post" class="info">
				<h1>${user.me_id}님 회원정보 수정</h1>
				<div class="mb-3 mt-3">
					<label for="id">아이디:</label>
					<input value="${user.me_id}" type="text" class="form-control" id="id" placeholder="아이디 입력" name="id" readOnly>
				</div>
				
				<div class="mb-3 mt-3">
					<label for="pw">비밀번호:</label>
					<input type="password" class="form-control" id="pw" placeholder="비밀번호 입력" name="pw">
					<label id="pw-error" class="error text-danger" for="pw"></label>
				</div>
				<div class="mb-3 mt-3">
					<label for="pw2">비밀번호 확인:</label>
					<input type="password" class="form-control" id="pw2" placeholder="비밀번호 확인" name="pw2">
					<label id="pw2-error" class="error text-dange" for="pw2"></label>
				</div>
				<div class="mb-3 mt-3">
					<label for="email">이메일:</label>
					<input value="${user.me_email}" type="text" class="form-control" id="email" placeholder="이메일 입력" name="email">
					<label id="email-error" class="error text-danger" for="email"></label>
				</div>
				<div class="mb-3 mt-3">
					<label for="phone">핸드폰:</label>
					<input value="${user.me_phone}" type="text" class="form-control" id="phone" placeholder="핸드폰 입력" name="phone">
				</div>
				<button type="submit" class="btn btn-outline-success col-12">회원정보수정</button>
			</form>
			<form action="<c:url value="/user/page"/>" method="post" class="nick">
				<div class="input-group mb-3 name mt-3">
					<input value="${user.me_nick}" type="text" class="name form-control" placeholder="닉네임 등록/수정" aria-describedby="btn1" name="name">
					<button class="btn btn-outline-secondary">등록/수정</button>
				</div>
				<label id="name-error" class="error text-danger" for="name"></label>
				<label id="name-error2" class="error text-danger"></label>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
$(".info").validate({
	rules : {
		pw : {
			regex : /^[a-zA-Z0-9!@#]{6,15}$/
		},
		pw2 : {
			equalTo : pw //name이 아닌 id를 써 줌
		},
		email : {
			required : true,
			email : true
		},
		phone : {
			required : true,
			regex : /^[0-9-]{5,13}$/
		}
	}, 
	messages : {
		pw : {
			regex : "비밀번호는 숫자,영문, !@#만 사용가능하며 6~15자입니다."
		},
		pw2 : {
			equalTo : "비밀번호와 일치하지 않습니다."
		},
		email : {
			required : "필수 항목입니다.",
			email : "이메일 형식이 아닙니다."
		},
		phone : {
			required : "필수 항목입니다.",
			regex : "숫자와 -만 입력 가능합니다. "
		}
	}
});

$.validator.addMethod(
	"regex",
	function (value, element, regexp){
		var re= new RegExp(regexp);
		return this.optional(element) || re.test(value);
	},
	"정규표현식에 맞지 않습니다."
)
	
</script>
 
<!-- 닉네임 중복 검사 -->
<script type="text/javascript">
$(".nick").validate({
	rules : {
		name : {
			regex : /^[a-zA-Z0-9가-힣]{2,12}$/
		}
	}, 
	messages : {
		name : {
			regex : "닉네임은 2자 이상 12자 이하 한글,영문,숫자만 가능합니다."
		}
	},
	submitHandler : function(form) {
		return nickCheckDup();
	}
	
});



function nickCheckDup() {
	$("#name-error2").text("");
	$("#name-error2").hide();
	//입력된 아이디를 가져옴
	let nick = $('[name=name]').val();
	let obj = {
		nick : nick
	}
	let nickRegex = /^[a-zA-Z0-9가-힣]{2,12}$/;
	if(!nickRegex.test(nick)){
		return false;
	}
	let result = false;
	//서버에 아이디 전송하여 사용 가능/불가능 처리
	$.ajax({
		async : false, //비동기 : true(비동기), false(동기)
		url : '<c:url value="/nick/check/dup" />', 
		type : 'get', 
		data : obj, 
		dataType : "json", 
		success : function (data){
			result = data.result;
			if(!result){
				$("#name-error2").text("사용할 수 없는 닉네임 입니다.");
				$("#name-error2").show();
			}
			
		}, 
		error : function(jqXHR, textStatus, errorThrown){

		}
	});
	return result;
}

$('[name=name]').on('input',function(){
	nickCheckDup();
});
</script>
 
 
</body>
</html>