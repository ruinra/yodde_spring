<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>요때</title>
	<c:set var="root" value="${pageContext.request.contextPath}" />
	<c:set var="email" value="${sessionScope.email}" />
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
		href="${root}/resources/css/store/store.css" />
	<script type="text/javascript" src="${root}/resources/scripts/jquery-2.1.1.js"></script>
	<script type="text/javascript" src="http://openapi.map.naver.com/openapi/naverMap.naver?ver=2.0&key=2043d7b7bca2a35d8a16427791132a29&coord=latlng"></script>
	<script type="text/javascript">
		function writeReview() {
			alert("write");
		}
		function showReviewEditor(email) {
			if (email == "") {
				alert("로그인 후 이용하세요.");
				return;
			}
			var obj = document.getElementById("reviewEditorDiv");
	
			if (obj.style.display == "")
				obj.style.display = "none";
			else
				obj.style.display = "";
		}
	</script>
	<script>
		$(document).ready(function() {
			jQuery.ajax({		  	 
				type:"GET",
				url:"http://apis.daum.net/local/geo/transcoord",
				data:"apikey=f28206be65f6dff3d46be8d6dd9c01c167d73b86&x="+${storeDto.latitude}+"&y="+${storeDto.longitude}+"&fromCoord=KTM&toCoord=WGS84&output=json",
				dataType:"jsonp", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
				jsonp:"callback",
				success : function(data) {
				      // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
				      // TODO
						nhn.api.map.setDefaultPoint('LatLng');
						var oMap = new nhn.api.map.Map(document
								.getElementById('scholes'), {
							point : new nhn.api.map.LatLng(
									data.y , data.x), //아까 구한 위도, 경도   
							zoom : 9,
							enableWheelZoom : true,
							enableDragPan : true,
							enableDblClickZoom : false,
							mapMode : 0,
							activateTrafficMap : false,
							activateBicycleMap : false,
							minMaxLevel : [ 5, 13 ],
							size : new nhn.api.map.Size(490, 185)
						});

						var oSlider = new nhn.api.map.ZoomControl();
						oMap.addControl(oSlider);
						oSlider.setPosition({
							top : 10,
							left : 10
						});

						var oSize = new nhn.api.map.Size(20, 20);
						var oOffset = new nhn.api.map.Size(20, 20);
						var oPoint = new nhn.api.map.LatLng(
								data.y, data.x);
						var oIcon = new nhn.api.map.Icon(
								'http://static.naver.com/maps2/icons/pin_spot2.png',
								oSize, oOffset);
						var oMarker = new nhn.api.map.Marker(oIcon,
								{
									point : oPoint,
									zIndex : 1,
									title : '${storeDto.storeName}'
								});

						var oLabel = new nhn.api.map.MarkerLabel();
						oMap.addOverlay(oLabel);
						oMap.addOverlay(oMarker);
						oLabel.setVisible(true, oMarker);

						oMap.attach(
							'mouseenter',
							function(oCustomEvent) { //마우스엔터,휠,클릭 등 api에서 제공하는 것 중에 골라서
								var oTarget = oCustomEvent.target;
								if (oTarget instanceof nhn.api.map.Marker) {
									var oMarker = oTarget;
									oLabel.setVisible(
											true,
											oMarker);
								}
						});
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
</head>
<body>
	<div>
		<jsp:include page="../common/title.jsp" />
		<!-- title -->
	</div>

	<div class="content">
		<div class="storeInfo_content">
			<div class="result_img">
				<!-- result title -->
				<img src="${root}/resources/images/images/about.png" height="55" />
				<span class="result_value"> <!-- 검색해서 넘어온 가게 이름 -->
					${storeDto.storeName}
				</span> <span class="status_position"> <span class="status">
						<!-- store의 status 값을 받아와서 open / close 중 하나를 띄움 --> <c:choose>
							<c:when test="${storeDto.status == 0}">
								<img src="${root}/resources/images/images/close.png" height="30" />
							</c:when>
							<c:otherwise>
								<img src="${root}/resources/images/images/open.png" height="30" />
							</c:otherwise>
						</c:choose>
				</span>
				</span> <span class="category_position"> <span class="category">
						<!-- store의 category 값을 받아와서 txt로 띄움 --> <c:choose>
							<c:when test="${storeDto.category3 != ''}">
									${storeDto.category1}>${storeDto.category2}>${storeDto.category3}	
								</c:when>
							<c:otherwise>
									${storeDto.category1}>${storeDto.category2}
								</c:otherwise>
						</c:choose>
				</span>
				</span>
			</div>
			<div class="first_box">
				<ul class="storeInfo_ul">
					<li class="storeInfo_box">
						<div class="starrate">
							<!-- 별점표시 -->
							<span class="rate_title"> <img
								src="${root}/resources/images/images/rate_title.png" height="50">
							</span> <img src="${root}/resources/images/images/starrate_ex.png"
								height="50" style="margin-left: 30px;">
						</div>
						<div class="txt">
							<!-- 스토어 정보 -->
							<!-- service Time -->
							영업시간 : ${storeDto.serviceTime}<br />
							<!-- Address -->
							주소 : ${storeDto.address}<br />
							<!-- open Date -->
							개업일 : ${storeDto.openDate}<br />
							<!-- homepage Address -->
							홈페이지 : ${storeDto.homepage}<br />
							<!-- phone Number -->
							연락처 : ${storeDto.phoneNum}<br />
						</div>
						<div style="position: absolute;">
							<div class="request_btn">
								<a href=""><img
									src="${root}/resources/images/images/update_reqpuest.png"
									height="20"></a>
							</div>
							<!-- 스토어 위치 -->

							<div class="map">
								<!-- 스토어 위치 -->
								<div id="scholes" style="border: 1px solid #000; width: 490px; height: 185px; margin: 5px;"></div>
							</div>
							<div class="follow_btn">
								<!-- 팔로우 한 스토어와 안 한 스토어를 구별 -->
								<!-- 
									<a href=""><img src="${root}/resources/images/images/follow.png" height="35"></a>
								 -->
								<a href=""><img
									src="${root}/resources/images/images/notfollow.png" height="35"></a>
							</div>
						</div>
					</li>

					<li class="store_pic"><img
						src="${root}/resources/images/images/ex1.jpg" height="300"></li>

					<li class="store_icon">
						<!-- 스토어 info --> <img
						src="${root}/resources/images/images_store_info/card.png"
						width="55" style="margin-right: 10px;"> <img
						src="${root}/resources/images/images_store_info/group.png"
						width="55" style="margin-right: 10px;"> <img
						src="${root}/resources/images/images_store_info/toilet.png"
						width="45" style="margin-right: 10px;"> <img
						src="${root}/resources/images/images_store_info/wifi.png"
						width="50" style="margin-right: 10px;"> <img
						src="${root}/resources/images/images_store_info/parking.png"
						width="55" style="margin-right: 10px;"> <img
						src="${root}/resources/images/images_store_info/reservation.png"
						width="45" style="margin-right: 10px;">
					</li>
				</ul>
			</div>

			<div class="img_collection">
				<!-- 모아보기 -->
				<div class="review_title">
					<div style="background-color: white;">
						<img src="${root}/resources/images/images/review_pic.png"
							height="50">
					</div>
				</div>
				<div class="reviewImg_box">
					<!-- 최근 리뷰의 사진 순으로 7개만 모아서 보여줌 -->
					<span class="review_img"> <img
						src="${root}/resources/images/images/pic1.png" height="118">
					</span> <span class="review_img"> <img
						src="${root}/resources/images/images/pic2.png" height="118">
					</span> <span class="review_img"> <img
						src="${root}/resources/images/images/pic3.png" height="118">
					</span> <span class="review_img"> <img
						src="${root}/resources/images/images/pic4.png" height="118">
					</span> <span class="review_img"> <img
						src="${root}/resources/images/images/pic1.png" height="118">
					</span> <span class="review_img"> <img
						src="${root}/resources/images/images/pic2.png" height="118">
					</span> 
					<span class="review_img">
						<a href="morePicture?storeId=${storeDto.storeId}&storeName=${storeDto.storeName}"><img src="${root}/resources/images/images/pic_more.png" height="118"></a>
					</span>
				</div>
			</div>

			<div class="write_box">
				<!-- 리뷰쓰기 창 -->
				<div class="review_title">
					<span style="text-align: left; background-color: white;"> <img
						src="${root}/resources/images/images/review_title.png" height="50">
					</span> <span class="write_btn"> <a
						href="javascript:showReviewEditor('${email}')"><img
							src="${root}/resources/images/images/write.png" height="30"></a>
					</span>
				</div>

				<!-- 작성 버튼을 누르면 나타나는 작성 창 -->
				<div id="reviewEditorDiv" style="display: none;"
					class="review_write">
					<form action="writeReivew" method="post">
						<textarea name="content" cols=120 rows=5></textarea>
						<input type="hidden" name="writer" , value="${email}"> <input
							type="hidden" name="storeId" , value="${storeDto.storeId}">
						<input type="IMAGE" src="${root}/resources/images/images/ok.png"
							height="30" name="Submit" value="Submit">
					</form>
				</div>
				<br /> <br />

				<div class="review_board">
					<!-- 리뷰 보드 -->
					<c:forEach var="itemReview" items="${reviewList}">
						<div class="review">
							<!-- DB에서 리뷰 받아와서 뿌려줌 -->
							<span class="reviewer_profile"> <span
								class="review_content"> <!-- 리뷰어 내용 --> <span
									class="review_starrate"> <img
										src="${root}/resources/images/images/starrate_ex.png"
										height="25">
								</span> <span class="updown_position"> <!-- 리뷰 찬반 --> <a href=""><img
											src="${root}/resources/images/images/up.png" height="30"></a>
										${itemReview.like1} <a href=""><img
											src="${root}/resources/images/images/down.png" height="30"></a>
										${itemReview.unlike}
								</span>
									<p class="scroll_tag">${itemReview.content}</p> <span> <span
										class="review_photo_position"> <!-- 리뷰에 첨부된 사진들 --> <a
											href=""><img
												src="${root}/resources/images/images/pic1.png" height="40"></a>
											<a href=""><img
												src="${root}/resources/images/images/pic2.png" height="40"></a>
											<a href=""><img
												src="${root}/resources/images/images/pic3.png" height="40"></a>
									</span>

								</span> <span class="content_btn"> <!-- 본인 댓글이면 수정, 타인 댓글이면 신고 -->
										<span class="btn_position"> <a href=""><img
												src="${root}/resources/images/images/update.png" height="30"></a>
									</span> <%-- 
											<a href=""><img src="${root}/resources/images/images/report.png" height="30"></a>
											--%>
								</span>
							</span> <span class="profile"> <!-- 리뷰어 프로필사진 --> <img
									src="${root}/resources/images/images/profile.png" height="100">
							</span> <span class="reviewer_NICK"> <!-- 리뷰어 닉네임 -->
									${itemReview.writer}
							</span>
							</span>
						</div>
					</c:forEach>
					<div class="review_more">
						<!-- 더 많은 리뷰 보는 버튼-->
						<a href=""><img
							src="${root}/resources/images/images/review_more.png" height="25"></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div>
		<jsp:include page="../common/footer.jsp" />
		<!-- footer -->
	</div>
</body>
</html>