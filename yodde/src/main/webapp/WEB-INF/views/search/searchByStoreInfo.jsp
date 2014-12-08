<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<c:set var="root" value="${pageContext.request.contextPath}"/>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${root}/resources/css/commons/common.css"/>		<!-- footer, title css -->
<link rel="stylesheet" type="text/css" href="${root}/resources/css/commons/category.css" />		<!-- category css -->
<link rel="stylesheet" type="text/css" href="${root}/resources/css/main/main.css"/>				<!-- main css -->
<script type="text/javascript" src="${root}/resources/scripts/jquery-2.1.1.js"></script>
<script type="text/javascript" src="${root}/resources/scripts/jquery.raty.js"></script>
<!-- <script>
	$.fn.raty.defaults.path = '${root}/resources/images/images';
	$('#averageRate').raty({
		round : { down: .26, full: .6, up: .76 },
		halfShow : true,
		readOnly: true,
		starOff : 'history_btnOff.png',
		starOn  : 'history_btnOn.png',
		starHalf: 'history_half.png',
		score: 
	});
</script>  -->
</head>
<body style="min-width:1260px;">
	<div>
		<jsp:include page="../common/title.jsp"/>			<!-- title -->
	</div>
	<div>
		<jsp:include page="../main/searchBar.jsp"/>					<!-- searchBar -->
	</div>
	<script type="text/javascript" src="${root}/resources/scripts/jQueryWeb.js"></script> 
	<script type="text/javascript" src="${root}/resources/scripts/jQueryWeb2.js"></script>
      
	<div class="content"> 						<!-- content -->
		<div class="HP_content">
			<div class="HP_box">
				<c:choose>
					<c:when test="${storeInfo.size()==0}">
						<div style="text-align:center;">
							등록된 정보가 없습니다
						</div>
					</c:when>
					<c:otherwise>
						<ul style="none;" class="HP_thumbnails">
							<c:forEach items="${storeInfo}" var="storeInfo">
								<li class="HP_stores">
									<div class="HP_store_name" style="text-align:center;">
										${storeInfo.storeName}
									</div>
									<span class="HP_store_address">
										<span>${storeInfo.address}</span>
									</span>
									<div class="HP_store_pic">
										<a href="${root}/AjaxStore?storeId=${storeInfo.storeId}"><img src="${root}/resources/images/images/ex1.jpg" width="300px;"/></a>
									</div>
									<div class="HP_store_starrate">
										<span id="averageRate" class="input"></span>${storeInfo.rate}

									</div>
									<ul class="HP_store_reviewnum">
					                  <li class="store_icon">
					                     <!-- 스토어 info -->
					                     <c:if test="${storeInfo.reservation==1}">
					                        <img src="${root}/resources/images/images_store_info/reservation.png" width="45" style="margin-right: 10px;">
					                     </c:if>
					                     <c:if test="${storeInfo.delivery==1}">
					                        <img src="${root}/resources/images/images_store_info/delivery.png" width="45" style="margin-right: 10px;">
					                     </c:if>
					                     <c:if test="${storeInfo.takeOut==1}">
					                        <img src="${root}/resources/images/images_store_info/takeout.png" width="55" style="margin-right: 10px;">
					                     </c:if>
					                     <c:if test="${storeInfo.creditCard==1}">
					                        <img src="${root}/resources/images/images_store_info/card.png" width="55" style="margin-right: 10px;">
					                     </c:if>
					                     <c:if test="${storeInfo.parking==1}">
					                        <img src="${root}/resources/images/images_store_info/parking.png" width="55" style="margin-right: 10px;">
					                     </c:if>
					                     <c:if test="${storeInfo.group1==1}">
					                        <img src="${root}/resources/images/images_store_info/group.png" width="55" style="margin-right: 10px;">
					                     </c:if>
					                     <c:if test="${storeInfo.toilet==1}">
					                        <img src="${root}/resources/images/images_store_info/toilet.png" width="45" style="margin-right: 10px;">
					                     </c:if>
					                     <c:if test="${storeInfo.wifi==1}">
					                        <img src="${root}/resources/images/images_store_info/wifi.png" width="50" style="margin-right: 10px;">
					                     </c:if>
					                     <c:if test="${storeInfo.tv==1}">
					                        <img src="${root}/resources/images/images_store_info/tv.png" width="55" style="margin-right: 10px;">
					                     </c:if>
					                     <c:if test="${storeInfo.seating==1}">
					                        <img src="${root}/resources/images/images_store_info/seating.png" width="55" style="margin-right: 10px;">
					                     </c:if>
					                     <c:if test="${storeInfo.kids==1}">
					                        <img src="${root}/resources/images/images_store_info/kids.png" width="55" style="margin-right: 10px;">
					                     </c:if>
					                     <c:if test="${storeInfo.driveThrough==1}">
					                        <img src="${root}/resources/images/images_store_info/drive_through.png" width="55" style="margin-right: 10px;">
					                     </c:if>
					                  </li>
									</ul>
								</li>
							</c:forEach>
						</ul>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div> 
 	
 	
	<div>
		<jsp:include page="../common/footer.jsp"/>      <!-- footer -->
	</div>
</body>
</html>