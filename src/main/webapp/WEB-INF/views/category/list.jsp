<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Category</title>
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
		background-color: white;
	}
	.main-content{
		width: 100%;
		height: 1000px;
		background-color: white;
	}
</style>
</head>
<body>
<!-- 추가할 카테고리 입력하기
추가할 카테고리 : 
 -->

<jsp:include page="/WEB-INF/views/header.jsp"/>

<div class="container-fluid p-5 bg-dark text-white text-center">
	<p>카테고리 설정 페이지</p>
	
</div>
    <label for="community" class="form-label">카테고리:</label>
            <select class="form-control cm_num" name="category" id="category">
               <c:forEach items="${categoryList}" var="category">
                  <option value="${community.c_num}" <c:if test="${board.bo_co_num != null}">selected</c:if>>
                    ${category.ca_name }
                  </option>
               
               </c:forEach>
               
            </select>
            <button type="button" class="btn btn-outline-danger float-end ml-3">삭제</button>
            <button type="button" class="btn btn-outline-success float-end ml-3">수정</button>
            <button type="button" class="btn btn-outline-success float-end ml-3">추가</button>
      </div>


</body>
</html>