<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>요때</title>
		<c:set var="root" value="${pageContext.request.contextPath}"/>
		<link rel="stylesheet" type="text/css" href="${root}/resources/css/commons/common.css" /> 		<!-- footer, title css -->
		<link rel="stylesheet" type="text/css" href="${root}/resources/css/commons/category.css" /> 	<!-- category css -->
		<link rel="stylesheet" type="text/css" href="${root}/resources/css/main/main.css" /> 			<!-- main css -->
		<link rel="stylesheet" type="text/css" href="${root}/resources/css/store/store.css" />
		
		<link rel="stylesheet" type="text/css" href="${root}/resources/css/store/thumb.css" />
		<script type="text/javascript" src="${root}/resources/scripts/store/thumb.js"></script>
	</head>
	<body>
		<div>
			<jsp:include page="../common/title.jsp" /> 			<!-- title -->
		</div>
	
		<div class="content">
			<div class="picCollection_content">
				<div class="result_img">						<!-- result title -->
					<img src="${root}/resources/images/images/about.png" height="55" /> 
					<span class="result_value"> 				<!-- 검색해서 넘어온 가게 이름 --> 
						${storeName}
					</span>
				</div>
	
				<div> 											<!-- 리뷰에 쓰인 이미지들 모아서 보여주기 -->
					<div id="page">
						<div id="gallery">
							<div id="panel">
								<img id="largeImage" src="${root}${pictureList[0].path}" />
							</div>
	
							<div id="thumbs">
								<c:forEach var="itemPicture" items="${pictureList}">
									<img src="${root}${itemPicture.path}" alt="" /> 
								</c:forEach>
							</div>
						</div>
					</div>
	
					<script>
						$('#thumbs').delegate( 'img', 'click',
							function() {
								$('#largeImage').attr( 'src',
										$(this).attr('src').replace('thumb', 'large'));
								$('#description').html($(this).attr('alt'));
							});
					</script>
				</div>
			</div>
		</div>
	
		<div>
			<jsp:include page="../common/footer.jsp" /> 		<!-- footer -->
		</div>
	</body>
</html>