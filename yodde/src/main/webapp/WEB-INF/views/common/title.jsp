<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="true"%>
<html>
	<head>
		<c:set var="root" value="${pageContext.request.contextPath}"/>
		<c:set var="email" value="${sessionScope.email}"/>
		<c:set var="profilePic" value="${profilePic}" scope="session"/>	
		<c:set var="status" value="${status}" scope="session"/>
		<script type="text/javascript">
			function logout() {
				alert("bye~");
			}
		</script>
		<!--
		<script>
		    $(document).ready(function() {
		    	if ('${email}' == "") return;
		   		var email = '${email}';
		       jQuery.ajax({            
		          type:"GET",
		          url:"profilePic",
		          data:"email="+ email,
		          success : function(data) {
		                //alert(data);		      
		               	$("#profilePic").attr("src", '${root}'+data)
		          },
		          complete : function(data) {
		                // 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.
		                // TOD
		          },
		          error : function(xhr, status, error) {
		                alert("에러발생");
		          }
		       });
		    });
		 </script>
		 -->
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
									<c:choose>
										<c:when test="${status == 'member'}">
											<a href="modifyMember?email=${email}">
												<img id="profilePic" src="${root}${profilePic}" height="90" style="border-radius: 75px;">
											</a>
										</c:when>
										<c:when test="${status == 'owner'}">
											<a href="modifyOwner?email=${email}">
												<img id="profilePic" src="${root}${profilePic}" height="90" style="border-radius: 75px;">
											</a>
										</c:when>
										<c:otherwise>
											<a href="modifyMember?email=${email}">
												<img id="profilePic" src="${root}/resources/images/images/profile.png" height="90" style="border-radius: 75px;">
											</a>
										</c:otherwise>
									</c:choose>
								</span>
								<span class="menu-menu-1-container">
		                           <ul class="category" style="margin-left:0px">
		                              <li class="category_li" id=""><a href="">공공기관</a></li>
		                              <li class="category_li" id=""><a href="">교육</a></li>
		                              <li class="category_li" id=""><a href="">금융서비스 </a></li>
		                              <li class="category_li" id=""><a href="">렌탈</a></li>
		                              <li class="category_li" id=""><a href="">마트</a></li>
		                              <li class="category_li" id=""><a href="">병원</a></li>
		                              <li class="category_li" id=""><a href="">생활서비스</a></li>
		                              <li class="category_li" id=""><a href="">숙박</a></li>
		                              <li class="category_li" id=""><a href="">영화/공연</a></li>
		                              <li class="category_li" id=""><a href="">오락서비스</a></li>
		                              <li class="category_li" id=""><a href="">음식</a></li>
		                              <li class="category_li" id=""><a href="">자동차</a></li>
		                              <li class="category_li" id=""><a href="">카페/제과</a></li>
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