<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>정보등록 요청</title>
		<link rel="stylesheet" type="text/css" href="${root}/resources/css/search/search.css" />
	</head>
<body style="margin: 8px;">
	<c:set var="nick" value="${nick}" scope="session"/>
	<form action="${root}/requestRegStore" method="post">
		<div class="storeRegInfo_content">
			<div class="title">
				<img src="${root}/resources/images/images/store_reg.png" height="50px;">
			</div>
			
			<!-- 요청할 사람의 닉네임 끌어오기 -->
			<ul>
				<li>
					<!-- 요청하는 사람의 닉네임 끌어오기 -->
					<div class="sub">
						닉네임
					</div>
					<input type="text" value="${nick}" class="reg_nick" name="nick" readonly>
				</li>
				
				<li>
					<div class="sub">
						가게 이름
					</div>
					<input type="text" class="reg_name" name="storeName">
				</li>
				
				<li>
					<div class="sub">
						가게 주소
					</div>
					<textarea cols="80" class="reg_address" id="context" name="address" style="resize:none;"></textarea>
				</li>		
				
				<li class="bottom_Btn">
					<button type="submit" style="height:25px; width:75px; border:none; background-image: url(${root}/resources/images/images/ok.png); background-size: 100%;"></button>
					<button type="reset" style="height:25px; width:75px; border:none; background-image: url(${root}/resources/imagesimages/close_btn.png); background-size: 100%;"></button>
				</li>
			</ul>
		</div>
	</form>
</body>
</html>