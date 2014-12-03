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
		<link rel="stylesheet" type="text/css" href="${root}/resources/css/main/main.css"/>				<!-- main css -->
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
						$("#follow").attr("src", "${root}/resources/images/images/follow_list.png");	
					}else{
						$("#follow").attr("src", "${root}/resources/images/images/notfollow_list.png");
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
				<div class="myPage_box" style="margin-left:15%; width:890px;">
					<div class="result_title">					<!-- login title -->
						<img src="${root}/resources/images/images/member_mypage.png" height="45">
					</div>
					<ul class="mypage_content_box">
						<li class="myProfile">					<!-- user의 프로필사진과 닉네임 받아오는 부분 -->
							<div class="myPhoto" style="margin-top: 25px;">
								<c:choose>
									<c:when test="${member.profilePic != null}">
										<img id="profilePic" src="${root}${profilePic}" height="90" style="border-radius: 75px;">
									</c:when>
									<c:otherwise>
										<img id="profilePic" src="${root}/resources/images/images/profile.png" height="90" style="border-radius: 75px;">
									</c:otherwise>
							</c:choose>
							</div>
							<div class="myNick">
								${member.nickName}
							</div>
							<div class="profile_content" style="width: 300px; padding-left:0px">	
								<ul class="follow">
									<li style="float:left; width:120px;">
										<b>팔로잉</b>
										${followingCnt}<b>명</b>
										${followingStoreCnt}<b>곳</b>
									</li>
									<li style="float:left; width:120px;">
										<b>팔로워</b>
										${followerCnt}<b>명</b>
									</li>
								</ul>
								<div class="myinfo_style">
									<div class="line">
										<div class="info_title">
											<b class="label">Level</b>
										</div>
										<input type="text" class="profile_input error" value="${member.memberLv}" name="level" readonly>
									</div>
									<div class="line">
										<div class="info_title">
											<b class="label" >이메일</b>
										</div>
										<input type="text" class="profile_input error" style="width:170px;" value="${member.email}" name="e-mail" readonly>
									</div>
									<div class="line">
										<div class="info_title">
											<b class="label">우편번호</b>
										</div>
										<input type="text" class="profile_input error" style="width:140px;" value="${member.zipcode}" name="zipcode" readonly>
									</div>
								</div>
								
								<div>							<!-- 팔로우버튼 활성화 조건 -->
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
																//alert(data);
																if(data ==1){
																	$("#follow").attr("src", "${root}/resources/images/images/follow_list.png");	
																}else{
																	$("#follow").attr("src", "${root}/resources/images/images/notfollow_list.png");
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
							</div>
						</li>
						<li class="review_box">
							<div>
								<div class="reviewTitle_line">
									<b>최근 리뷰</b>
								</div>
								
								<c:if test="${reviewCnt==0}">
									<div class="no_review">
										등록된 리뷰가 없습니다. 리뷰를 남겨 보세요!
									</div>
								</c:if>
								
								<ul class="review_line">
									<c:forEach var="reviewRateList" begin="0" end="5" items="${selectRecentReviewRate}" varStatus="s">
										<li class="reviews">
											<div class="my_rate">
												<c:choose>
													<c:when test="${selectRecentReviewRate[s.count-1].rate==1.0}">
														<img src="${root}/resources/images/images/rate_1.png" width="100">
													</c:when>
													<c:when test="${selectRecentReviewRate[s.count-1].rate==2.0}">
														<img src="${root}/resources/images/images/rate_2.png" width="100">
													</c:when>
													<c:when test="${selectRecentReviewRate[s.count-1].rate==3.0}">
														<img src="${root}/resources/images/images/rate_3.png" width="100">
													</c:when>
													<c:when test="${selectRecentReviewRate[s.count-1].rate==4.0}">
														<img src="${root}/resources/images/images/rate_4.png" width="100">
													</c:when>
													<c:when test="${selectRecentReviewRate[s.count-1].rate==5.0}">
														<img src="${root}/resources/images/images/rate_5.png" width="100">
													</c:when>
												</c:choose>
											</div>
											<%-- 
											<div class="store_pic">
												<img src="${root}/resources/images/images/ex1.jpg" width="110">
											</div>
											 --%>
											<div>
												<div class="store_name">
													<c:out value="${selectRecentReviewName[s.count-1].storeName}"/>
												</div>
											</div>
										</li>
									</c:forEach>
								</ul>
								
								<c:if test="${reviewCnt>6}">
									<div class="reviewCnt_line">
										<a href="${root}/info/history">전체 리뷰  ${reviewCnt}개 더보기</a>
									</div>
								</c:if>
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