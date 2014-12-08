
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
	</head>
	<body>
		<div>
			<jsp:include page="../common/title.jsp"/>			<!-- title -->
		</div>
		<script>
			var msg = "${msg}";
			if (msg.length > 0) {
				alert(msg);
			}
		</script>
		
		<div class="content">
			<div class="content_login">
				<div class="login_box">
					<form onsubmit="return checkForm()" action="/home/j_spring_security_check" method="post">
						<div class="result_title">				<!-- login title -->
							<img src="${root}/resources/images/images/logintitle.png" height="55">
						</div>
						<div class="login_form">				<!-- login form -->
							<div>
								<input id="user_id" name="user_id" type="text" class="login_input" tabindex="5" style="ime-mode: active;"
								placeholder=" ID@EMAIL" onfocus="this.placeholder=''" onblur="this.placeholder='ID@EMAIL'"/>
							</div>
							
							<div>
								<input id="password" name="password" type="password" class="login_input" tabindex="5" style="ime-mode: active;"
								placeholder=" PASSWORD" onfocus="this.placeholder=''" onblur="this.placeholder='PASSWORD'"/>
							</div>
						</div>
						<div class="bottom_Btn">
							<!-- 
							<a href="" onclick="">
								<img src="${root}/resources/images/images/LOGINbtn.png" height="30">
							</a>
							 -->
							<input type="IMAGE" src="${root}/resources/images/images/LOGINbtn.png" height="30" name="Submit" value="Submit">
							<a href="/home/member/join" onclick="">
								<img src="${root}/resources/images/images/JOIN.png" height="30">
							</a>
							<a href="${root}/passwordMail" onclick="">
								<img src="${root}/resources/images/images/FIND.png" height="30">
							</a>
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