<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="${root}/resources/css/common/common.css"/>		<!-- footer, title css -->
		<link rel="stylesheet" type="text/css" href="${root}/resources/css/common/category.css" />		<!-- category css -->
		<link rel="stylesheet" type="text/css" href="${root}/resources/css/main/main.css"/>			<!-- main css -->
		<link rel="stylesheet" type="text/css" href="${root}/resources/css/member/member.css"/>
		
		<script type="text/javascript" src="${root}/resources/scripts/jquery-2.1.1.js"></script>
	</head>
	<body style="min-width:1260px;">
		<c:set var="root" value="${pageContext.request.contextPath}"/>
		
		<div>
			<jsp:include page="../common/title.jsp"/>			<!-- title -->
		</div>
		
		<script type="text/javascript" src="${root}/resources/scripts/jQueryWeb.js"></script> 
		<script type="text/javascript" src="${root}/resources/scripts/jQueryWeb2.js"></script>
		
		<div class="content">									<!-- content -->
			<div class="myPage_content">
				<div class="myPage_box" style="margin-left:10%; width: 1000px;">
					<div class="result_title">					<!-- login title -->
						<img src="${root}/resources/images/images/member_mypage.png" height="55">
					</div>
					<ul class="content_box">
						<li class="myProfile">					<!-- user의 프로필사진과 닉네임 받아오는 부분 -->
							<div class="myPhoto" style="margin-top: 20px;">
								<img src="${root}/resources/images/images/profile.png" width="150px">
							</div>
							<div class="myNick">
								나영이
							</div>
						</li>
						<li style="float:left;">
							<!-- user정보 : 순서대로 level, email, 우편번호, 남긴 리뷰갯수  -->
							<div class="profile_content" style="width: 300px; padding-left:0px">	
								<p style="margin-left: 20px;">
									<img src="${root}/resources/images/images/pick.png" height="25"><b class="label">레벨</b>
									<input type="text" class="profile_input error" value="level" name="level" readonly>
								</p>
								<p style="margin-left: 20px;">
									<img src="${root}/resources/images/images/pick.png" height="25"><b class="label" >아이디</b>
									<input type="text" class="profile_input error" style="width:170px;" value="e-mail" name="e-mail" readonly>
								</p>
								<p style="margin-left: 20px;">
									<img src="${root}/resources/images/images/pick.png" height="25"><b class="label">우편번호</b>
									<input type="text" class="profile_input error" style="width:140px;" value="zipcode" name="zipcode" readonly>
								</p>
								<p style="margin-left: 20px;">
									<img src="${root}/resources/images/images/pick.png" height="25"><b class="label">리뷰</b>
									<input type="text" class="profile_input error" value="리뷰 갯수" readonly><b>개</b>
								</p>
							</div>
						</li>
						<li class="review_box">
							<div>
								ddd
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
		
		<div>
			<jsp:include page="../common/footer.jsp"/>			<!-- footer -->
		</div>
	</body>
</html>