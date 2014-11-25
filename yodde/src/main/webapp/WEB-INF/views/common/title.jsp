<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="true"%>
<html>
	<head>
		<c:set var="root" value="${pageContext.request.contextPath}"/>
		<c:set var="email" value="${sessionScope.email}"/>
		<script type="text/javascript">
			function logout() {
				alert("bye~");
			}
		</script>
	</head>
	<body style="min-width:1260px;">		
		<div class="title_box">
			<!-- 타이틀 왼쪽 버튼 -->
			<span class="title_left">
				<span class="title_btn1">		<!-- 슬라이드 메뉴 버튼 -->	
					<span id="pageslide" style="right: auto; left: -300; display: none;">
						<span id="slideNav" class="panel"> 
							<a href="javascript:jQuery.pageslide.close()" class="closeBtn"></a> 
							<span id="mainNav"> 
								<span class="title_btn2">		<!-- 프로필 버튼 -->
									<a href="#">
										<img src="${root}/resources/images/images/profile.png" height="90">
									</a>
								</span>
							
								<span class="menu-menu-1-container">
									<ul id="menu-menu-1" class="">
										<li id=""><a href="">Food</a></li>
		
										<li id=""><a href="">카페/제과 </a></li>
		
										<li id=""><a href="">금융서비스 </a></li>
		
										<li id=""><a href="">공공기관 </a></li>
		
										<li id=""><a href="">자동차 </a></li>
		
										<li id=""><a href="">마트 </a></li>
		
										<li id=""><a href="">숙박 </a></li>
		
										<li id=""><a href="">영화/공연 </a></li>
		
										<li id=""><a href="">병원 </a></li>
		
										<li id=""><a href="">오락서비스 </a></li>
		
										<li id=""><a href="">생활서비스 </a></li>
		
										<li id=""><a href="">렌탈 </a></li>
		
										<li id=""><a href="">교육 </a></li>
									</ul>
								</span>
							</span>
						</span>
					</span> 
				<span id="container"> 
					<span id="header"> 
						<span class="inside clearfix"> 
							<a href="#slideNav" class="menuToggle"></a>
						</span>
					</span>
				</span> 
				

				</span>
			</span>
			
			<!-- 센터 로고 -->
			<span class="title_center">
				<a href="/home" class="title_logo">
					<img src="${root}/resources/images/images/title.png" height="43">
				</a>
			</span>
			
			<!-- 타이틀 오른쪽 버튼 -->
			<span class="title_right">
				<c:if test="${fn:length(email) < 3}">
					<a href="/home/login" onclick="" style="padding-right:8px;">
						<img src="${root}/resources/images/images/login.png" height="18">
					</a>
				</c:if>
				<c:if test="${fn:length(email) > 3 }">
					<a href="/home/signout" onclick="javascript:logout()" style="padding-right:8px;">
						<img src="${root}/resources/images/images/logout.png" height="18">
					</a>
				</c:if>
				
				<a href="" onclick="">
					<img src="${root}/resources/images/images/moning.png" height="18">
				</a>
			</span>
		</div>
		
		<script type="text/javascript" src="${root}/resources/scripts/jQueryWeb.js"></script> 
		<script type="text/javascript" src="${root}/resources/scripts/jQueryWeb2.js"></script>
	</body>
</html>