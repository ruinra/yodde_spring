<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>팔로우 리스트</title>
		<link rel="stylesheet" type="text/css" href="${root}/resources/css/commons/common.css"/>		<!-- footer, title css -->
		<link rel="stylesheet" type="text/css" href="${root}/resources/css/commons/category.css" />		<!-- category css -->
		<link rel="stylesheet" type="text/css" href="${root}/resources/css/main/main.css"/>			<!-- main css -->
		<link rel="stylesheet" type="text/css" href="${root}/resources/css/follow/follow.css"/>
	</head>
	<script type="text/javascript">
	</script>
	<body style="min-width:1260px;">
		<div>
			<jsp:include page="../common/title.jsp"/>			<!-- title -->
		</div>
		
		<div class="content">									<!-- content -->
			<div class="followerList_content">
				<div class="followerList_box">
					<div class="result_title">					<!-- login title -->
						<img src="${root}/resources/images/images/follower.png" height="55">
						${email}
					</div>
					<ul class="content_box">
						<c:choose>
							<c:when test="${followList==null}">
								<div>팔로워 멤버가 없습니다.</div>
							</c:when>
							<c:otherwise>
								<div>
									<c:forEach var="itemMember" items="${memberList}">
										<div class="myPhoto" style="padding-top:20px">
											<img src="${root}/resources/images/images/profile.png" width="130px">
										</div>
										<div class="follower_nickname">
											예쁜나영이
										</div>
									</c:forEach>
								</div>
							</c:otherwise>
						</c:choose>
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