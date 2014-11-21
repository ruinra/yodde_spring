<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="../common/common.css"/>		<!-- footer, title css -->
		<link rel="stylesheet" type="text/css" href="../common/category.css" />		<!-- category css -->
		<link rel="stylesheet" type="text/css" href="../main/main.css"/>			<!-- main css -->
	</head>
	<body>
		<div>
			<jsp:include page="../common/title.jsp"/>			<!-- title -->
		</div>
		
		<div class="content">
			<div class="content_findPass">
				<div class="findPass_box">
					<form onsubmit="return checkForm()">
						<div class="result_title">				<!-- login title -->
							<img src="./../images/findPass.png" height="55">
						</div>
						<div style="text-align:center;">
							<br/>등록하신 이메일 주소를 입력하시면 해당 메일 주소로 key를 보내드립니다.
						</div>
						<div class="find_form">				<!-- login form -->
							<input type="text" class="login_input" tabindex="5" style="ime-mode: active;"
							placeholder=" ID@EMAIL" onfocus="this.placeholder=''" onblur="this.placeholder='ID@EMAIL'"/>
						</div>
						<div class="bottom_Btn2">
							<a href="" onclick="">
								<img src="./../images/send.png" height="30">
							</a>
							<a href="" onclick="">
								<img src="./../images/LOGINbtn.png" height="30">
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