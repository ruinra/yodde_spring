<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>요때</title>
		<c:set var="root" value="${pageContext.request.contextPath}"/>
		<link rel="stylesheet" type="text/css" href="${root}/resources/css/commons/common.css"/>		<!-- footer, title css -->
		<link rel="stylesheet" type="text/css" href="${root}/resources/css/commons/category.css" />		<!-- category css -->
		<link rel="stylesheet" type="text/css" href="${root}/resources/css/main/main.css"/>			<!-- main css -->
		<link rel="stylesheet" type="text/css" href="${root}/resources/css/member/member.css"/>
	</head>
	<body>
		<div>
			<jsp:include page="../common/title.jsp"/>								<!-- title -->
		</div>
		
		<div class="content">
			<div class="join_content">
				<div class="join_box">
					<form onsubmit="return checkForm()">
						<div class="result_title">				<!-- login title -->
							<img src="${root}/resources/images/images/join_title.png" height="55">
						</div>
						<div class="Btn" style="text-align:center; padding-top:25px;">
							<span class="Btn_member">
								<a href="/home/member/memberJoin" onclick="">
									<img src="${root}/resources/images/images/member.png" height="200">
								</a>
							</span>
							<span class="Btn_buss">
								<a href="ownerJoin" onclick="">
									<img src="${root}/resources/images/images/buss.png" height="200">
								</a>
							</span>
						</div>
					</form>
				</div>
			</div>
		</div>
		
		<div>
			<jsp:include page="../common/footer.jsp"/>			<!-- footer -->
		</div>
	</body>
</html>