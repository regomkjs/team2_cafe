<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!-- 부트스트렙5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>



<script src="//code.jquery.com/jquery-3.6.1.js"></script>
<!-- jquery validtaion -->	
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/additional-methods.min.js"></script>


<style type="text/css">

.body{
  text-align: center;
  margin: 0;
  justify-content: left;
  transform:translate;
  align-items: center;
  display: flex;
  height: 100vh;
}

.master-container {
    max-width: 1200px; /* 최대 너비 */
    min-width: 1024px; /* 최소 너비 */
    margin: 0 auto; /* 가운데 정렬을 위해 margin을 auto로 설정 */
	
}
.singup-box{
	width:500px;
	margin:0 auto;
	margin-top:100px;
	padding: 50px;
	border: 1px solid #ccc;
	border-radius: 10px;
}
.signup-box h5{
	text-align:center;
	color: rgb(255, 127, 80);
	font-size: 30px;
	font-weight:bold;
	margin-bottom: 20px;
}

#id{
	width:100%;
	height:50px;
	border-radius:5px 5px 5px 5px;
	border:1px solid #ededed;
	padding-left:50px;
	background-image: url("/team2_cafe/images/id_icon.svg");
	background-repeat:no-repeat;
	background-size: 20px;
	background-position:15px center;
	outline-color:rgb(255, 127, 80);
	margin-bottom: 20px;
}
#id::placeholder{
	color:#ccc;
}
#pw{
	width:100%;
	height:50px;
	border:1px solid #ededed;
	border-radius:0 0 5px 5px;
	padding-left:50px;
	background-image: url("/team2_cafe/images/lock_icon.svg");
	background-repeat:no-repeat;
	background-size: 20px;
	background-position:15px center;
	outline-color:rgb(255, 127, 80);
	margin-bottom: 20px;

}
#pw::placeholder{
	color:#ccc;

}
#pw2{
	width:100%;
	height:50px;
	border:1px solid #ededed;
	border-radius:0 0 5px 5px;
	padding-left:50px;
	background-image: url("/team2_cafe/images/lock_icon.svg");
	background-repeat:no-repeat;
	background-size: 20px;
	background-position:15px center;
	outline-color:rgb(255, 127, 80);
	margin-bottom: 20px;

}
#pw2::placeholder{
	color:#ccc;

}
#email{
	width:100%;
	height:50px;
	border:1px solid #ededed;
	border-radius:0 0 5px 5px;
	padding-left:50px;
	background-image: url("/team2_cafe/images/email.svg");
	background-repeat:no-repeat;
	background-size: 20px;
	background-position:15px center;
	outline-color:#03c75a;
	margin-bottom: 20px;

}
#email::placeholder{
	color:#ccc;

}
#phone{
	width:100%;
	height:50px;
	border:1px solid #ededed;
	border-radius:0 0 5px 5px;
	padding-left:50px;
	background-image: url("/team2_cafe/images/phone.svg");
	background-repeat:no-repeat;
	background-size: 20px;
	background-position:15px center;
	outline-color:rgb(255, 127, 80);
	margin-bottom: 20px;

}
#phone::placeholder{
	color:#ccc;

}

.btn-block{
    display: block;
    width: 100%;
    padding: 13px 0 13px;
    border-radius: 6px;
    border: solid 1px rgba(0, 0, 0, .15);
    background-color:rgb(255, 127, 80);
    box-sizing: border-box; 
    color:white;
    margin-bottom: 30px;
   	 
 }
  .foot-txt{
	 color: rgb(255, 127, 80);
	text-decoration: none;
 }
 
 .foot-txt:hover{
 	 text-decoration: underline;
 }
 
 .signup-box input{
 	 
	 padding:0;
	 margin:0;
	 display: flex;
	 justify-content: center;
 
 
 }
 .form-control{
  	  margin: 0 auto;
	  position: relative;
 
 }
</style>

</head>

<body>
<div class="master-container">
<jsp:include page="/WEB-INF/views/header.jsp"/>

<div class="signup-box">
	<form action="<c:url value="/signup"/>" method="post">
		<br>		
		<h5><b>환영합니다.</b></h5>
		<h5><b>'with my pet'cafe입니다.</b></h5>
		 <input type="text" class="form-control" id="id" placeholder="사용할 아이디를 입력하세요." name="id">

		 <div class="mb-3">
			<input type="password" class="form-control" id="pw" placeholder="사용할 비밀번호를 입력하세요." name="pw">
		 </div>
		 <div class="mb-3">
			 <input type="password" class="form-control" id="pw2" placeholder="비밀번호를 한번 더 입력하세요." name="pw2">
		 </div>
		 <div class="mb-3">
			 <input type="text" class="form-control" id="email" placeholder="이메일을 입력하세요." name="email">
		 </div>
		 <div class="mb-3">
			 <input type="text" class="form-control" id="phone" placeholder="핸드폰 번호를 입력하세요." name="phone">
		</div>
		   </form>
		   <button type="submit" class="btn-block">회원가입</button>
	</div>
<div>
	<a class="foot-txt" href="<c:url value="/login"/>">이미 가입한 회원이신가요?</a>
</div>
</div>




<!-- 유효성 검사 -->
<script type="text/javascript">
$("form").validate({
	rules : {
		me_id : {
			required : true,
			regex : /^\w{6,12}$/
		},
		me_pw : {
			required : true,
			regex : /^[a-zA-Z0-9!@#]{6,15}$/
		},
		me_pw2 : {
			equalTo : pw //name이 아닌 id를 써 줌
		},
		me_email : {
			required : true,
			email : true
		},
		me_phone : {
			required : true,
			regex : /^[0-9-]{5,13}$/
		}
	}, 
	messages : {
		me_id : {
			required : "필수 항목입니다.",
			regex : "아이디는 숫자 영문 6~12자입니다."
		},
		me_pw : {
			required : "필수 항목입니다.",
			regex : "비밀번호는 숫자,영문, !@#만 사용가능하며 6~15자입니다."
		},
		me_pw2 : {
			equalTo : "비밀번호와 일치하지 않습니다."
		},
		me_email : {
			required : "필수 항목입니다.",
			email : "이메일 형식이 아닙니다."
		},
		me_phone : {
			required : "필수 항목입니다.",
			regex : "숫자와 -만 입력 가능합니다. "
		}
	},
	submitHandler : function(form) {
		return idCheckDup();
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

<!-- 아이디 중복 검사 -->
<script type="text/javascript">
function idCheckDup() {
	$("#id-error2").text("");
	$("#id-error2").hide();
	//입력된 아이디를 가져옴
	let id = $('[name=me_id]').val();
	let obj = {
		id : id
	}
	let idRegex = /^\w{6,13}$/;
	if(!idRegex.test(id)){
		return false;
	}
	let result = false;
	//서버에 아이디 전송하여 사용 가능/불가능 처리
	$.ajax({
		async : false, //비동기 : true(비동기), false(동기)
		url : '<c:url value="/id/check/dup" />', 
		type : 'get', 
		data : obj, 
		dataType : "json", 
		success : function (data){
			result = data.result;
			if(!result){
				console.log(result);
				$("#id-error2").text("이미 사용중인 아이디 입니다.");
				$("#id-error2").show();
			}
			
		}, 
		error : function(jqXHR, textStatus, errorThrown){

		}
	});
	return result;
}

$('[name=me_id]').on('input',function(){
	idCheckDup();
});
</script>


</body>
</html>