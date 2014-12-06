<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>요때</title>
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" type="text/css"
	href="${root}/resources/css/commons/common.css" />
<!-- footer, title css -->
<link rel="stylesheet" type="text/css"
	href="${root}/resources/css/commons/category.css" />
<!-- category css -->
<link rel="stylesheet" type="text/css"
	href="${root}/resources/css/main/main.css" />
<!-- main css -->
<link rel="stylesheet" type="text/css"
	href="${root}/resources/css/owner/owner.css" />

<script type="text/javascript"
	src="${root}/resources/scripts/jquery-2.1.1.js"></script>
<script type="text/javascript"
	src="${root}/resources/scripts/jquery.validate.js"></script>

<script type="text/javascript">
function idCheck(root) {
	var url = root+"/member/idCheck?email="+$("input[name='email']").val();
	window.open(url, "", "width=450, height=150");
}
</script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#valiex").validate({
			rules : {
				name : {
					required : true,
					minlength : 2,
					maxlength : 20
				},
				email : {
					required : true,
					email : true
				},

				business : {
					required : true,
					business : true
				},

				password : {
					required : true,
					minlength : 3,
					maxlength : 12
				},

				pwchk : {
					required : true,
					minlength : 3,
					maxlength : 12,
					equalTo : "#password"
				}
			},

			messages : {
				name : {
					required : " 닉네임을 입력하세요.",
					minlength : " {0}글자 이상으로 입력하세요.",
					maxlength : " {0}글자 이하로 입력하세요."
				},
				email : {
					required : " 이메일을 입력하세요.",
					email : " 이메일을 바르게 입력하세요."
				},

				business : {
					required : " 사업자번호를 입력하세요.",
					business : " 잘못된 사업자 등록번호입니다."
				},

				password : {
					required : " 비밀 번호를 입력하세요.",
					minlength : " {0}글자 이상으로 입력하세요.",
					maxlength : " {0}글자 이하로 입력하세요."
				},
				pwchk : {
					required : " 비밀 번호를 입력하세요.",
					minlength : " {0}글자 이상으로 입력하세요.",
					maxlength : " {0}글자 이하로 입력하세요.",
					equalTo : " 비밀 번호가 서로 일치하지 않습니다."
				}
			}
		});
	});
</script>
</head>
<body>
	<div>
		<jsp:include page="../common/title.jsp" />
		<!-- title -->
	</div>

	<div class="content">
		<div class="content_storeJoin">
			<div class="storeJoin_box">
				<form id="valiex" novalidate="novalidate" action="storeJoin"
					method="post">
					<div class="result_title">
						<!-- login title -->
						<img src="${root}/resources/images/images/join_buss.png"
							height="55">
					</div>
					<div style="margin-left: 40px;">
						<p>
							<img src="${root}/resources/images/images/pick.png" height="25">
							<input type="text" class="join_input error"
								style="ime-mode: active;" name="email" placeholder=" ID@EMAIL"
								onfocus="this.placeholder=''"
								onblur="this.placeholder=' ID@EMAIL'" value="">
								<label for="email" generated="true" class="error"> 이메일을 입력하세요.</label>
								
								<!-- 중복체크 -->
								<a id="idCheck" name="idCheck"	
			                     type="button" onclick="idCheck('${root}')"> <img
			                     src="${root}/resources/images/images/zipcode.png" height="30">
               	 				</a>
						</p>

						<p>
							<img src="${root}/resources/images/images/pick.png" height="25">
							<input type="text" class="join_input error"
								style="ime-mode: active;" name="name" placeholder=" STORE_NAME"
								onfocus="this.placeholder=''"
								onblur="this.placeholder=' NICKNAME'"> <label for="name"
								generated="true" class="error"> (지역)상호명으로 입력해주세요.</label>
						</p>

						<p>
							<img src="${root}/resources/images/images/pick.png" height="25">
							<input type="text" class="join_input error"
								style="ime-mode: active;" id="business" name="business"
								placeholder=" REGISTRATION_NUMBER" onfocus="this.placeholder=''"
								onblur="this.placeholder=' REGISTRATION_NUMBER'"> <label
								for="business" generated="true" class="error"> 사업자 번호를
								입력하세요.</label>
						</p>

						<p>
							<img src="${root}/resources/images/images/pick.png" height="25">
							<input type="password" class="join_input error"
								style="ime-mode: active;" id="password" name="password"
								placeholder=" PASSWORD" onfocus="this.placeholder=''"
								onblur="this.placeholder=' PASSWORD'"> <label
								for="password" generated="true" class="error"> 비밀 번호를
								입력하세요.</label>
						</p>

						<p>
							<img src="${root}/resources/images/images/pick.png" height="25">
							<input type="password" class="join_input error"
								style="ime-mode: active;" id="pwchk" name="pwchk"
								placeholder=" PASSWORD" onfocus="this.placeholder=''"
								onblur="this.placeholder=' PASSWORD'"> <label
								for="pwchk" generated="true" class="error"> 비밀번호를 다시 한 번
								입력하세요.</label>
						</p>
					</div>

					<div class="bottom_Btn">
						<input type="IMAGE" src="${root}/resources/images/images/ok.png"
							height="30" name="Submit" value="Submit"> <a href=""
							onclick=""> <img
							src="${root}/resources/images/images/cancel.png" height="30">
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div>
		<jsp:include page="../common/footer.jsp" />
		<!-- footer -->
	</div>
</body>
</html>