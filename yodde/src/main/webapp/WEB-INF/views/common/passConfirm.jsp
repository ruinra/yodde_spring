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
							<img src="./../images/passconfirm.png" height="55">
						</div>
						<div class="pass_form">					<!-- login form -->
							<input type="password" class="pass_input" tabindex="5" style="ime-mode: active;"
							placeholder="PASSWORD" onfocus="this.placeholder=''" onblur="this.placeholder='PASSWORD'"/>
						</div>
						<div class="bottom_Btn2">
							<a href="" onclick="">
								<img src="./../images/ok.png" height="30">
							</a>
							<a href="" onclick="">
								<img src="./../images/cancel.png" height="30">
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