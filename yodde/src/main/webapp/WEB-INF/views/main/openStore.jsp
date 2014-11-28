<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="../common/common.css"/>		<!-- footer, title css -->
		<link rel="stylesheet" type="text/css" href="../common/category.css" />		<!-- category css -->
		<link rel="stylesheet" type="text/css" href="../main/main.css"/>			<!-- main css -->
		
	</head>
	<body style="min-width:1260px;">
		<div>
			<jsp:include page="../common/title.jsp"/>			<!-- title -->
		</div>
		<div>
			<jsp:include page="../main/searchBar.jsp"/>			<!-- searchBar -->
		</div>
		
		<script type="text/javascript" src="../jQueryWeb.js"></script> 
		<script type="text/javascript" src="../jQueryWeb2.js"></script>
		
		<div class="content">									<!-- content -->
			<div class="RC_content">
				<div class="RC_box">
					<div class="RC_title">
						<img src="./../images/newstore.png" height="40px;"/>
						<!-- N E W  S T O R E -->
					</div>
					
					<ul style="none;" class="RC_thumbnails">
					
						<!-- 지역기반 추천 1 -->
						<li class="RC_stores">
							<div class="RC_store_name" style="text-align:center;">
								7Train
							</div>
							<span class="RC_store_address">
								<span>서울 강남구 역삼동</span>		<!-- 주소값 -->
							</span>
							<div class="RC_store_pic">
								<a href="#"><img src="./../images/ex1.jpg" width="225px;"/></a>
							</div>
							<div class="RC_store_starrate">		<!-- 평점값 -->
								<img src="./../images/starrate_ex.png" width="160px;">
							</div>
							<div class="RC_store_reviewnum">
								<span class="reviewnum_title">
									<img src="./../images/reviewnum_title.png" height="25px;">
								</span>
								<span class="RC_review_num">	<!-- 리뷰 갯수 -->
									48건
								</span>
							</div>
						</li>
						
						<!-- 지역기반 추천 2 -->
						<li class="RC_stores">
							<div class="RC_store_name" style="text-align:center;">
								코카콜라 맛있어
							</div>
							<span class="RC_store_address">
								<span>KOSTA 나영이자리</span>		<!-- 주소값 -->
							</span>
							<div class="RC_store_pic">
								<a href="#"><img src="./../images/ex2.jpg" width="225px;"/></a>
							</div>
							<div class="RC_store_starrate">		<!-- 평점값 -->
								<img src="./../images/starrate_ex.png" width="160px;">
							</div>
							<div class="RC_store_reviewnum">
								<span class="reviewnum_title">
									<img src="./../images/reviewnum_title.png" height="25px;">
								</span>
								<span class="RC_review_num">	<!-- 리뷰 갯수 -->
									16건
								</span>
							</div>
						</li>
						
						<!-- 지역기반 추천 3 -->
						<li class="RC_stores">
							<div class="RC_store_name" style="text-align:center;">
								호식이 두마리 치킨
							</div>
							<span class="RC_store_address">
								<span>나영이 포항집</span>			<!-- 주소값 -->
							</span>
							<div class="RC_store_pic">
								<a href="#"><img src="./../images/ex3.jpg" width="225px;"/></a>
							</div>
							<div class="RC_store_starrate">		<!-- 평점값 -->
								<img src="./../images/starrate_ex.png" width="160px;">
							</div>
							<div class="RC_store_reviewnum">
								<span class="reviewnum_title">
									<img src="./../images/reviewnum_title.png" height="25px;">
								</span>
								<span class="RC_review_num">	<!-- 리뷰 갯수 -->
									195건
								</span>
							</div>
						</li>
						
						<!-- 지역기반 추천 4 -->
						<li class="RC_stores"> 
							<div class="RC_store_name" style="text-align:center;">
								valley's coffee
							</div>
							<span class="RC_store_address">
								<span>KOSTA 1층</span>			<!-- 주소값 -->
							</span>
							<div class="RC_store_pic">
								<a href="#"><img src="./../images/ex4.jpg" width="225px;"/></a>
							</div>
							<div class="RC_store_starrate">		<!-- 평점값 -->
								<img src="./../images/starrate_ex.png" width="160px;">
							</div>
							<div class="RC_store_reviewnum">
								<span class="reviewnum_title">
									<img src="./../images/reviewnum_title.png" height="25px;">
								</span>
								<span class="RC_review_num">	<!-- 리뷰 갯수 -->
									51건
								</span>
							</div>
						</li>
						
						
						<!-- 지역기반 추천 5 -->
						<li class="RC_stores">
							<div class="RC_store_name" style="text-align:center;">
								7Train
							</div>
							<span class="RC_store_address">
								<span>서울 강남구 역삼동</span>		<!-- 주소값 -->
							</span>
							<div class="RC_store_pic">
								<a href="#"><img src="./../images/ex1.jpg" width="225px;"/></a>
							</div>
							<div class="RC_store_starrate">		<!-- 평점값 -->
								<img src="./../images/starrate_ex.png" width="160px;">
							</div>
							<div class="RC_store_reviewnum">
								<span class="reviewnum_title">
									<img src="./../images/reviewnum_title.png" height="25px;">
								</span>
								<span class="RC_review_num">	<!-- 리뷰 갯수 -->
									48건
								</span>
							</div>
						</li>
						
						<!-- 지역기반 추천 6 -->
						<li class="RC_stores">
							<div class="RC_store_name" style="text-align:center;">
								코카콜라 맛있어
							</div>
							<span class="RC_store_address">
								<span>KOSTA 나영이자리</span>		<!-- 주소값 -->
							</span>
							<div class="RC_store_pic">
								<a href="#"><img src="./../images/ex2.jpg" width="225px;"/></a>
							</div>
							<div class="RC_store_starrate">		<!-- 평점값 -->
								<img src="./../images/starrate_ex.png" width="160px;">
							</div>
							<div class="RC_store_reviewnum">
								<span class="reviewnum_title">
									<img src="./../images/reviewnum_title.png" height="25px;">
								</span>
								<span class="RC_review_num">	<!-- 리뷰 갯수 -->
									16건
								</span>
							</div>
						</li>
						
						<!-- 지역기반 추천 7 -->
						<li class="RC_stores">
							<div class="RC_store_name" style="text-align:center;">
								호식이 두마리 치킨
							</div>
							<span class="RC_store_address">
								<span>나영이 포항집</span>			<!-- 주소값 -->
							</span>
							<div class="RC_store_pic">
								<a href="#"><img src="./../images/ex3.jpg" width="225px;"/></a>
							</div>
							<div class="RC_store_starrate">		<!-- 평점값 -->
								<img src="./../images/starrate_ex.png" width="160px;">
							</div>
							<div class="RC_store_reviewnum">
								<span class="reviewnum_title">
									<img src="./../images/reviewnum_title.png" height="25px;">
								</span>
								<span class="RC_review_num">	<!-- 리뷰 갯수 -->
									195건
								</span>
							</div>
						</li>
						
						<!-- 지역기반 추천 8 -->
						<li class="RC_stores"> 
							<div class="RC_store_name" style="text-align:center;">
								valley's coffee
							</div>
							<span class="RC_store_address">
								<span>KOSTA 1층</span>			<!-- 주소값 -->
							</span>
							<div class="RC_store_pic">
								<a href="#"><img src="./../images/ex4.jpg" width="225px;"/></a>
							</div>
							<div class="RC_store_starrate">		<!-- 평점값 -->
								<img src="./../images/starrate_ex.png" width="160px;">
							</div>
							<div class="RC_store_reviewnum">
								<span class="reviewnum_title">
									<img src="./../images/reviewnum_title.png" height="25px;">
								</span>
								<span class="RC_review_num">	<!-- 리뷰 갯수 -->
									51건
								</span>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
		
		<div>
			<jsp:include page="../common/footer.jsp"/>		<!-- footer -->
		</div>
	</body>
</html>