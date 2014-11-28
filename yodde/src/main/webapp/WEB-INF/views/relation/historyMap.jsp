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
			<div class="historyMap_content">
				<div class="historymap_box">
					<div class="result_title">					<!-- login title -->
						<img src="${root}/resources/images/images/historyMap.png" height="50">
					</div>
					
					<div class="map_box">
						MAP
					</div>
				</div>
				
				<div class="historyrate_box">
					<div class="historyrate_img">				<!-- 평균평점을 별점으로 표시 -->
						<img src="${root}/resources/images/images/starrate_ex.png" height="50">
					</div>
					<div class="historyrate_num">
						3.6
					</div>
				</div>
				
				<div class="historyreview_box">
					최근 리뷰 타임라인 기반으로 띄워주기
				</div>
			</div>
		</div>
		
		<div>
			<jsp:include page="../common/footer.jsp"/>			<!-- footer -->
		</div>
	</body>
</html>