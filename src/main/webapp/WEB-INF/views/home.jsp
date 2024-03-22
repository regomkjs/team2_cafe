<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<!-- 부트스트랩5 -->
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
	.carousel.slide img.d-block{
		padding: 5px;
		width: 100%;
		height: 300px!important;
		object-fit: cover;
	}
	
	.smallPicPost-list{
		display: flex;
		
	}
	
	.smallPicPost{
		text-size-adjust: auto;
		text-align: center;
		display : block;
		text-decoration: none;
		float: left;
		margin-left: 5px;
		margin-right: 5px;
	}
	
	.smallPicPost .img-thumbnail{
		
		flex-basis: 0px; flex-basis: 0%;
		width: 200px; 
		min-width: 200px;
    	height: 200px; 
		min-height: 200px;
    	object-fit: cover;
    	border: 1px solid silver;
	  	border-radius: 4px;	
	  	overflow: hidden;
	  	padding: 3px;
	}
	
		
	.img-thumbnail{

		border: 1px solid silver;
	  	border-radius: 4px;	
		padding: 3px;
	
		
	}
	
	.img-thumbnail:hover {

  		box-shadow: 0 0 2px 2px rgba(0, 140, 186, 0.5);
	}
	
	
	
</style>
</head>

<body>
<div class="container master-container">
	<jsp:include page="/WEB-INF/views/header.jsp"/>
    <div class="main-img-box">
        <a href="<c:url value='/'/>"> 
        	<img src="/team2_Shingyeongjae/images/error.png" alt="images">
        </a>
    </div>
    <div class="main-box d-flex align-content-stretch">
        <jsp:include page="/WEB-INF/views/sidebar.jsp"/>
        <div class="main-content flex-grow-1">
            <div id="carouselExample" class="carousel slide">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="/team2_Shingyeongjae/images/cat_img_2.jpg" class="d-block w-100" alt="images" />
                    </div>
                    <div class="carousel-item">
                        <img src="/team2_Shingyeongjae/images/error.png" class="d-block w-100" alt="images" />
                    </div>
                    <div class="carousel-item">
                        <img src="/team2_Shingyeongjae/images/cat_img_9.jpg" class="d-block w-100" alt="images" />
                    </div>
                </div>

                <!-- 사진 하단 버튼 -->
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
                    <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
                    <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
                </div>

                <!-- 사진 넘기기 버튼 -->
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
            
            <!-- 사진이 게시글의 사진으로 나오도록 할 수 있을지 -->
            <!-- 씨:포이치 items="${poList}" var="post -->
            <div class="smallPicPost-list d-flex justify-content-around">
            
	            <a href="#" class="smallPicPost mt-3">
				  <img src="/team2_Shingyeongjae/images/cat_img_11.jpg" class="img-thumbnail" alt="Cinque Terre" width="304" height="236"> 
				<span class="smallPicPostName mt-3">
				  <h5>게시글 이름 나오도록</h5>
				</span>
				</a>
				
	            <a href="#" class="smallPicPost mt-3">
				  <img src="/team2_Shingyeongjae/images/cat_img_7.jpg" class="img-thumbnail" alt="Cinque Terre" width="304" height="236"> 
				<span class="smallPicPostName mt-3">
				  <h5>게시글 이름 나오도록</h5>
				</span>
				</a>
				
	            <a href="#" class="smallPicPost mt-3">
				  <img src="/team2_Shingyeongjae/images/cat_img_6.jpg" class="img-thumbnail" alt="Cinque Terre" width="304" height="236"> 
				<span class="smallPicPostName mt-3">
				  <h5>게시글 이름 나오도록</h5>
				</span>
				</a>

	            <a href="#" class="smallPicPost mt-3">
				  <img src="/team2_Shingyeongjae/images/cat_img_3.jpg" class="img-thumbnail" alt="Cinque Terre" width="304" height="236"> 
			 	<span class="smallPicPostName mt-3">
				  <h5>게시글 이름 나오도록</h5>
				</span>
				</a>
			</div>
			
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/footer.jsp"/>

</body>
</html>