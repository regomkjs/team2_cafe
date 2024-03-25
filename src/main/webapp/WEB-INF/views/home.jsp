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
		height: 1000px;
	}
	.carousel.slide img.d-block{
		padding: 5px;
		width: 100%;
		height: 300px!important;
		object-fit: cover;
	}
	
	.line{
		margin-top: 3px;
		margin-bottom: 2px;
		margin-left: 30px;
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
	
	a:link {
  		color : black;
	}
	a:visited {
  		color : black;
	}
	
	.smallPicPostName{
		display : block;
		text-decoration: none;
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
        	<img src="/team2_cafe/images/logo.jpg" alt="images">
        </a>

    </div>
    <div class="main-box d-flex align-content-stretch">
        <jsp:include page="/WEB-INF/views/sidebar.jsp"/>
        <div class="main-content flex-grow-1">
            <div id="carouselExample" class="carousel slide">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="/team2_cafe/images/banner_1.jpg" class="d-block w-100" alt="images" />
                    </div>
                    <div class="carousel-item">
                        <img src="/team2_cafe/images/banner_2.jpg" class="d-block w-100" alt="images" />
                    </div>
                    <!-- 배너 3번째 작동X 
                    <div class="carousel-item">
                        <img src="team2_cafe/images/banner_1.jpg" class="d-block w-100" alt="images" />
                    </div>
                    -->
                </div>

                <!-- 사진 하단 버튼 -->
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
                    <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
                     <!-- 배너 3번째 작동X 
                    <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
                     -->
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
            
			<h5 class="line margin-right-3 mb-3 mt-3"><b>소개 게시판<b></h5>
			<hr class="line" size="5" width="1050px" align="right">
            <div class="smallPicPost-list d-flex justify-content-around">
            
	            <a href="#" class="smallPicPost mt-3">
				  <img src="/team2_cafe/images/ad1.jpg" class="img-thumbnail" alt="Cinque Terre" width="304" height="236"> 
				<span class="smallPicPostName mt-3">
				  <h6><동물병원>봄철 애견 예방접종</h6>
				</span>
				</a>
				
	            <a href="#" class="smallPicPost mt-3">
				  <img src="/team2_cafe/images/ad2.jpg" class="img-thumbnail" alt="Cinque Terre" width="304" height="236"> 
				<span class="smallPicPostName mt-3">
				  <h6> <이벤트> 공식 인스타그램 팔로우</h6>
				</span>
				</a>
				
	            <a href="#" class="smallPicPost mt-3">
				  <img src="/team2_cafe/images/ad3.jpg" class="img-thumbnail" alt="Cinque Terre" width="304" height="236"> 
				<span class="smallPicPostName mt-3">
				  <h6> <봄신상>강아지 산책 용품</h6>
				</span>
				</a>

	            <a href="#" class="smallPicPost mt-3">
				  <img src="/team2_cafe/images/ad4.jpg" class="img-thumbnail" alt="Cinque Terre" width="304" height="236"> 
			 	<span class="smallPicPostName mt-3">
				  <h6> <특가>고양이 용품점 할인! </h6>
				</span>
				</a>
			</div>
            
			<h5 class="line margin-right-3 mb-3 mt-3"><b>광고 게시판<b></h5>
			<hr class="line" size="5" width="1050px" align="right">
            <div class="smallPicPost-list d-flex justify-content-around">
            
	            <a href="#" class="smallPicPost mt-3">
				  <img src="/team2_cafe/images/ad1.jpg" class="img-thumbnail" alt="Cinque Terre" width="304" height="236"> 
				<span class="smallPicPostName mt-3">
				  <h6><동물병원>봄철 애견 예방접종</h6>
				</span>
				</a>
				
	            <a href="#" class="smallPicPost mt-3">
				  <img src="/team2_cafe/images/ad2.jpg" class="img-thumbnail" alt="Cinque Terre" width="304" height="236"> 
				<span class="smallPicPostName mt-3">
				  <h6> <이벤트> 공식 인스타그램 팔로우</h6>
				</span>
				</a>
				
	            <a href="#" class="smallPicPost mt-3">
				  <img src="/team2_cafe/images/ad3.jpg" class="img-thumbnail" alt="Cinque Terre" width="304" height="236"> 
				<span class="smallPicPostName mt-3">
				  <h6> <봄신상>강아지 산책 용품</h6>
				</span>
				</a>

	            <a href="#" class="smallPicPost mt-3">
				  <img src="/team2_cafe/images/ad4.jpg" class="img-thumbnail" alt="Cinque Terre" width="304" height="236"> 
			 	<span class="smallPicPostName mt-3">
				  <h6> <특가>고양이 용품점 할인! </h6>
				</span>
				</a>
			</div>
            
            <h5 class="line margin-right-3 mb-3 mt-3"><b>광고 게시판<b></h5>
			<hr class="line" size="5" width="1050px" align="right">
            <div class="smallPicPost-list d-flex justify-content-around">
            
	            <a href="#" class="smallPicPost mt-3">
				  <img src="/team2_cafe/images/ad1.jpg" class="img-thumbnail" alt="Cinque Terre" width="304" height="236"> 
				<span class="smallPicPostName mt-3">
				  <h6><동물병원>봄철 애견 예방접종</h6>
				</span>
				</a>
				
	            <a href="#" class="smallPicPost mt-3">
				  <img src="/team2_cafe/images/ad2.jpg" class="img-thumbnail" alt="Cinque Terre" width="304" height="236"> 
				<span class="smallPicPostName mt-3">
				  <h6> <이벤트> 공식 인스타그램 팔로우</h6>
				</span>
				</a>
				
	            <a href="#" class="smallPicPost mt-3">
				  <img src="/team2_cafe/images/ad3.jpg" class="img-thumbnail" alt="Cinque Terre" width="304" height="236"> 
				<span class="smallPicPostName mt-3">
				  <h6> <봄신상>강아지 산책 용품</h6>
				</span>
				</a>

	            <a href="#" class="smallPicPost mt-3">
				  <img src="/team2_cafe/images/ad4.jpg" class="img-thumbnail" alt="Cinque Terre" width="304" height="236"> 
			 	<span class="smallPicPostName mt-3">
				  <h6> <특가>고양이 용품점 할인! </h6>
				</span>

				</a>
			</div>
			
        </div>
    </div>
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
</div>


</body>
</html>