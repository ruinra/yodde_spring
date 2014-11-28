<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="${root}/resources/css/commons/common.css"/>		<!-- footer, title css -->
		<link rel="stylesheet" type="text/css" href="${root}/resources/css/commons/category.css" />		<!-- category css -->
		<link rel="stylesheet" type="text/css" href="${root}/resources/css/main/main.css"/>			<!-- main css -->
		<link rel="stylesheet" type="text/css" href="${root}/resources/css/follow/follow.css"/>
	</head>
	<body style="min-width:1260px;">
		<div>
			<jsp:include page="../common/title.jsp"/>			<!-- title -->
		</div>
		
		<div class="content">									<!-- content -->
			<div class="followerList_content">
				<div class="followerList_box">
					<div class="result_title">					<!-- login title -->
						<img src="${root}/resources/images/images/storefollowing.png" height="55">
					</div>
					
					<ul class="content_box">
						<li class="myProfile">					<!-- 스토어의 사진과 가게이름 받아오는 부분 12개. -->
							<div class="myPhoto" style="padding-top:20px">
								<img src="${root}/resources/images/images/ex1.jpg" width="130px">
							</div>
							<div class="follower_nickname">
								7Train
							</div>
							<img src="${root}/resources/images/images/fcancel.png" height="20">
						</li>
						
						<li class="myProfile">
							<div class="myPhoto" style="padding-top:20px">
								<img src="${root}/resources/images/images/ex1.jpg" width="130px">
							</div>
							<div class="follower_nickname">
								7Train
							</div>
							<img src="${root}/resources/images/images/fcancel.png" height="20">
						</li>
						<li class="myProfile">
							<div class="myPhoto" style="padding-top:20px">
								<img src="${root}/resources/images/images/ex1.jpg" width="130px">
							</div>
							<div class="follower_nickname">
								7Train
							</div>
							<img src="${root}/resources/images/images/fcancel.png" height="20">
						</li>
						<li class="myProfile">
							<div class="myPhoto" style="padding-top:20px">
								<img src="${root}/resources/images/images/ex1.jpg" width="130px">
							</div>
							<div class="follower_nickname">
								7Train
							</div>
							<img src="${root}/resources/images/images/fcancel.png" height="20">
						</li>
						<li class="myProfile">
							<div class="myPhoto" style="padding-top:20px">
								<img src="${root}/resources/images/images/ex1.jpg" width="130px">
							</div>
							<div class="follower_nickname">
								7Train
							</div>
							<img src="${root}/resources/images/images/fcancel.png" height="20">
						</li>
						<li class="myProfile">
							<div class="myPhoto" style="padding-top:20px">
								<img src="${root}/resources/images/images/ex1.jpg" width="130px">
							</div>
							<div class="follower_nickname">
								7Train
							</div>
							<img src="${root}/resources/images/images/fcancel.png" height="20">
						</li>
						<li class="myProfile">
							<div class="myPhoto" style="padding-top:20px">
								<img src="${root}/resources/images/images/ex1.jpg" width="130px">
							</div>
							<div class="follower_nickname">
								7Train
							</div>
							<img src="${root}/resources/images/images/fcancel.png" height="20">
						</li>
						<li class="myProfile">
							<div class="myPhoto" style="padding-top:20px">
								<img src="${root}/resources/images/images/ex1.jpg" width="130px">
							</div>
							<div class="follower_nickname">
								7Train
							</div>
							<img src="${root}/resources/images/images/fcancel.png" height="20">
						</li>
						<li class="myProfile">
							<div class="myPhoto" style="padding-top:20px">
								<img src="${root}/resources/images/images/ex1.jpg" width="130px">
							</div>
							<div class="follower_nickname">
								7Train
							</div>
							<img src="${root}/resources/images/images/fcancel.png" height="20">
						</li>
						<li class="myProfile">
							<div class="myPhoto" style="padding-top:20px">
								<img src="${root}/resources/images/images/ex1.jpg" width="130px">
							</div>
							<div class="follower_nickname">
								7Train
							</div>
							<img src="${root}/resources/images/images/fcancel.png" height="20">
						</li>
						<li class="myProfile">
							<div class="myPhoto" style="padding-top:20px">
								<img src="${root}/resources/images/images/ex1.jpg" width="130px">
							</div>
							<div class="follower_nickname">
								7Train
							</div>
							<img src="${root}/resources/images/images/fcancel.png" height="20">
						</li>
						<li class="myProfile">
							<div class="myPhoto" style="padding-top:20px">
								<img src="${root}/resources/images/images/ex1.jpg" width="130px">
							</div>
							<div class="follower_nickname">
								7Train
							</div>
							<img src="${root}/resources/images/images/fcancel.png" height="20">
						</li>
						
					</ul>
					
					<div class="more">							<!-- 더보기 버튼 -->
						<a href=""><img src="${root}/resources/images/images/review_more.png" height="25"></a>
					</div>
				</div>
			</div>
		</div>
		
		<div>
			<jsp:include page="../common/footer.jsp"/>			<!-- footer -->
		</div>
	</body>
</html>