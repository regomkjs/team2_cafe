<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!-- 부트스트렙5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<div class="container">
	<form action="<c:url value="/signup"/>" method="post">
		<h1>회원가입</h1>
   		<div class="mb-3 mt-3">
   			<label for="id">아이디:</label>
   			<input type="text" class="form-control" id="id" placeholder="아이디 입력" name="id">
		</div>
   		<div class="mb-3">
  			<label for="pw">비밀번호:</label>
  			<input type="password" class="form-control" id="pw" placeholder="비밀번호 입력" name="pw">
   		</div>
   		<div class="mb-3">
   			<label for="pw2">비밀번호 확인:</label>
   			<input type="password" class="form-control" id="pw2" placeholder="비밀번호 확인" name="pw2">
   		</div>
   		<div class="mb-3">
   			<label for="email">이메일:</label>
   			<input type="text" class="form-control" id="email" placeholder="이메일 입력" name="email">
   		</div>
   		<div class="mb-3">
   			<label for="phone">핸드폰:</label>
   			<input type="text" class="form-control" id="phone" placeholder="핸드폰 입력" name="phone">
   		</div>
   		<button type="submit" class="btn btn-outline-success col-12">회원가입</button>
	</form>
</div>

<script src="//code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">
		let flag = false;
		$("#idCheck").click(function(){
			let id = $("[name=id]").val();
			fetch(`<c:url value="/id/check"/>?id=\${id}`)
			.then(response=>response.text())
			.then(data => {
				if(data == "true"){
					alert("사용 가능한 아이디입니다.");
					flag = true;
				}else{
					alert("이미 사용 중인 아이디입니다.");
				}
			})
			.catch(error => console.error("Error : ", error));
		});
		$("[name=id]").change(function(){
			flag = false;
		});
		$("form").submit(function(){
			^[a-zA-Z][a-zA-Z0-9_]{3,15}$
			
			if(!flag){
				alert("아이디 중복 확인을 하세요.");
				return false;
			}
		});

</script>
</body>
</html>