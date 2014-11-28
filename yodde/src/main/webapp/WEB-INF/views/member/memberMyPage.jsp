<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<c:set var="root" value="${pageContext.request.contextPath}"/>
		
		<link rel="stylesheet" type="text/css" href="${root}/resources/css/commons/common.css"/>		<!-- footer, title css -->
		<link rel="stylesheet" type="text/css" href="${root}/resources/css/commons/category.css" />		<!-- category css -->
		<link rel="stylesheet" type="text/css" href="${root}/resources/css/main/main.css"/>			<!-- main css -->
		<link rel="stylesheet" type="text/css" href="${root}/resources/css/member/member.css"/>
		
		<script type="text/javascript" src="${root}/resources/scripts/jquery-2.1.1.js"></script>
		<script>
			function loginFollow(){
				alert("로그인을 해주세요.");
			}
	         
			function followCheck(){
			var follower="${email}";
			var following="${member.email}";
			var url="followMember?follower=" + follower + "&following=" + following;
			$.ajax({
				url:url,
				type:"get",
				contentType:"text/xml; charset=utf-8", 
				dataType: "text",
				error: function(xhr, status, error) { alert("error : " +status); },
				success: function(data){
					//alert(data);
					if(data ==1){
						$("#follow").attr("src", "${root}/resources/images/images/follow.png");	
					}else{
						$("#follow").attr("src", "${root}/resources/images/images/notfollow.png");
					}
				} }); // Ajax 호출 및 이벤트 핸들러 함수 정의
			}
		</script>
	</head>
	<body style="min-width:1260px;">
		
		
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
								<img src="${root}${member.profilePic}" width="150px">
							</div>
							<div class="myNick">
								${member.nickName}
							</div>
						</li>
						<li style="float:left;">
							<!-- user정보 : 순서대로 level, email, 우편번호, 남긴 리뷰갯수  -->
							<div class="profile_content" style="width: 300px; padding-left:0px">	
								<p style="margin-left: 20px;">
									<img src="${root}/resources/images/images/pick.png" height="25"><b class="label">Level</b>
									<input type="text" class="profile_input error" value="${member.memberLv}" name="level" readonly>
								</p>
								<p style="margin-left: 20px;">
									<img src="${root}/resources/images/images/pick.png" height="25"><b class="label" >이메일</b>
									<input type="text" class="profile_input error" style="width:170px;" value="${member.email}" name="e-mail" readonly>
								</p>
								<p style="margin-left: 20px;">
									<img src="${root}/resources/images/images/pick.png" height="25"><b class="label">우편번호</b>
									<input type="text" class="profile_input error" style="width:140px;" value="${member.zipcode}" name="zipcode" readonly>
								</p>
								<p style="margin-left: 20px;">
									<img src="${root}/resources/images/images/pick.png" height="25"><b class="label">리뷰</b>
									<input type="text" class="profile_input error" value="${reviewCnt }" readonly><b>개</b>
								</p>
							</div>
							<div>
							<c:if test="${email != member.email}">
								<c:choose>
								<c:when test="${email != ''}">									
									<script type="text/javascript">
									$(document).ready(function(){
										//alert("asdf");
										var follower="${email}";
										var following="${member.email}";
										var url="followMemberCheck?follower=" + follower + "&following=" + following;
										$.ajax({
											url:url,
											type:"get",
											contentType:"text/xml; charset=utf-8", 
											dataType: "text",
											error: function(xhr, status, error) { alert("error : " +status); },
											success: function(data){
												alert(data);
												if(data ==1){
													$("#follow").attr("src", "${root}/resources/images/images/follow.png");	
												}else{
													$("#follow").attr("src", "${root}/resources/images/images/notfollow.png");
												}
											} 
											}); // Ajax 호출 및 이벤트 핸들러 함수 정의
										});
									</script>
									
									<a href="javascript:followCheck()"><img src="${root}/resources/images/images/follow.png" height="35" id="follow"></a>
								</c:when>
								<c:otherwise>
									<a href="javascript:loginFollow()"><img src="${root}/resources/images/images/notfollow.png" height="30"></a>
								</c:otherwise>
								</c:choose>
							</c:if>
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