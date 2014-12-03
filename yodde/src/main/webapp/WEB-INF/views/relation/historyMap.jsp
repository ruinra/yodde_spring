<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="root" value="${pageContext.request.contextPath}" />
<c:set var="email" value="${sessionScope.email}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

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
	href="${root}/resources/css/follow/follow.css" />
<script type="text/javascript"
	src="${root}/resources/scripts/jquery-2.1.1.js"></script>
<script type="text/javascript"
	src="${root}/resources/scripts/jquery.raty.js"></script>

</head>
<body style="min-width: 1260px;">
	<div>
		<jsp:include page="../common/title.jsp" />
		<!-- title -->
	</div>

	<div class="content">
		<!-- content -->
		<div class="historyMap_content">
			<div class="historymap_box">
				<div class="result_title">
					<!-- login title -->
					<img src="${root}/resources/images/images/historyMap.png"
						height="50">
				</div>
				<div class="map_box">
					<div id="scholes"
						style="border: 2px solid #DCDCDF; width: 800px; height: 320px; margin: 5px;"></div>
					</div>
			</div>
			${nameList[0].longitude}
			${nameList[0].latitude}
			<div class="historyrate_box">
				<span id="averageRate" class="input"></span>
				<!-- 평균별점을 표시 -->
				<span class="historyrate_num">${average}</span>
			</div>
			<script>
				$.fn.raty.defaults.path = '${root}/resources/images/images';
				$('#averageRate').raty({
					round : { down: .26, full: .6, up: .76 },
					halfShow : true,
					readOnly: true,
					starOff : 'history_btnOff.png',
					starOn  : 'history_btnOn.png',
					starHalf: 'history_half.png',
					score: ${average}
				});
	</script>
	${nameList[0].address}


			<div class="historyreview_box">
				여기부터 시작
				<div class="HR_board">
					<c:forEach begin ="0" end = "${fn:length(reviewList)}" var="itemReview" varStatus="itemStatus" items="${reviewList}">
						<!-- 리뷰 댓글 -->
						<div class="HR_storeimg">
							<img src="${root}/resources/images/images/ex0.jpg"style="width: 170px; height: 150px;"> 
							<span class="HRstore_name"> ㅇㅇㅇㅇ<!-- storeDto.storeName -->
							<c:forEach begin="0" end="${fn:length(nameList)}" var="storeName" items="${nameList}">
								<c:if test="${itemReview.storeId == storeName.storeId}">
									${storeName.storeName}
								</c:if>
							</c:forEach>
							</span>
						</div>

						<div class="HReview">
							<!-- DB에서 리뷰 받아와서 뿌려줌 -->

							<span class="HReviewer_profile"> <span
								class="review_content"> <!-- 리뷰어 내용 --> <span
									class="HR_starrate"> <span class="review_starrate"
										id="user_rate"> 
										<c:if test="${itemReview.rate==1}">
												<img src="${root}/resources/images/images/rate_1.png">
											</c:if> <c:if test="${itemReview.rate==2}">
												<img src="${root}/resources/images/images/rate_2.png">
											</c:if> <c:if test="${itemReview.rate==3}">
												<img src="${root}/resources/images/images/rate_3.png">
											</c:if> <c:if test="${itemReview.rate==4}">
												<img src="${root}/resources/images/images/rate_4.png">
											</c:if> <c:if test="${itemReview.rate==5}">
												<img src="${root}/resources/images/images/rate_5.png">
											</c:if>
									</span>

								</span> <span class="updown_position" style="min-width: 106px;">
										<!-- 리뷰 찬반 --> <a href=""><img
											src="${root}/resources/images/images/up.png" height="30"></a>
										50 <a href=""><img
											src="${root}/resources/images/images/down.png" height="30"></a>
										0
								</span>
									<p class="HRscroll_tag">${itemReview.content}</p> <span>
										<span class="HR_photo_position"> <!-- 리뷰에 첨부된 사진들 --> <a
											href=""><img
												src="${root}/resources/images/images/pic1.png" height="40"></a>
											<a href=""><img
												src="${root}/resources/images/images/pic2.png" height="40"></a>
											<a href=""><img
												src="${root}/resources/images/images/pic3.png" height="40"></a>
									</span>

								</span>

							</span> <span class="profile"> <!-- 리뷰어 프로필사진 --> <img
									src="${root}/resources/images/images/profile.png" height="100">
							</span> <span class="HReviewer_NICK"> <!-- 리뷰어 닉네임 -->
									${itemReview.writer}
							</span>
							</span>
						</div>

					</c:forEach>
				</div>
			</div>
		</div>
	</div>

	<div>
		<jsp:include page="../common/footer.jsp" />
		<!-- footer -->
	</div>

	<!-- 지도부분 -->
	<script type="text/javascript"
		src="http://openapi.map.naver.com/openapi/naverMap.naver?ver=2.0&key=15319f937084dc86f076a48652007f45&coord=latlng"></script>
<!-- <script type="text/javascript"> 

var oCenterPoint = new nhn.api.map.LatLng(35.1601396, 129.1733139); 
nhn.api.map.setDefaultPoint('LatLng'); 
oMap = new nhn.api.map.Map((document.getElementById('scholes'), { 
            point : oCenterPoint, 
            zoom : 11, // - 초기 줌 레벨 
            boundary : m, 
            enableWheelZoom : true, 
            enableDragPan : true, 
            enableDblClickZoom : false, 
            mapMode : 0, 
            activateTrafficMap : false, 
            activateBicycleMap : false, 
            minMaxLevel : [ 1, 14 ], 
            size : new nhn.api.map.Size(770, 500), 
            detectCoveredMarker : true 
}); 
var mapZoom = new nhn.api.map.ZoomControl(); // - 줌 컨트롤 선언 
mapZoom.setPosition({left:10, bottom:240}); // - 줌 컨트롤 위치 지정 
oMap.addControl(mapZoom); // - 줌 컨트롤 추가. 
mapTypeChangeButton = new nhn.api.map.MapTypeBtn(); // - 지도 타입 버튼 선언 
mapTypeChangeButton.setPosition({top:10, left:680}); // - 지도 타입 버튼 위치 지정 
oMap.addControl(mapTypeChangeButton); //지도타입버튼 

var markerCount = 1; 
var oSize = new nhn.api.map.Size(28, 37); 
var oOffset = new nhn.api.map.Size(14, 37); 
var oIcon = new nhn.api.map.Icon('./image/m'+markerCount+'.gif', oSize, oOffset); 

var mapInfoTestWindow = new nhn.api.map.InfoWindow(); // - info window 생성 
mapInfoTestWindow.setVisible(false); // - infowindow 표시 여부 지정. 
oMap.addOverlay(mapInfoTestWindow);    // - 지도에 추가.     

var oLabel = new nhn.api.map.MarkerLabel(); // - 마커 라벨 선언. 
oMap.addOverlay(oLabel); // - 마커 라벨 지도에 추가. 기본은 라벨이 보이지 않는 상태로 추가됨. 

for(i=0;i<m.length;i++){ //마커생성 
    var oIcon = new nhn.api.map.Icon('http://static.naver.com/maps2/icons/pin_spot2.png', oSize, oOffset); 
    var oPoint = m[i]; 
    var oMarker = new nhn.api.map.Marker(oIcon, { title : i }); 
    oMarker.setPoint(oPoint); 
    oMap.addOverlay(oMarker); 
}
oMap.attach('click', function(oCustomEvent) { 
    var oPoint = oCustomEvent.point; 
    var oTarget = oCustomEvent.target; 
    
    mapInfoTestWindow.setVisible(false); 
    // 마커 클릭하면 
    if (oTarget instanceof nhn.api.map.Marker) { 
        var ip = oCustomEvent.target.getTitle(); 
        // 겹침 마커 클릭한거면 
        if (oCustomEvent.clickCoveredMarker) { 
            return; 
        } 
        //클릭 
        map_list_select(ip,m.length); 
        return; 
    } 
}); 
</script>
 -->
<script type="text/javascript">
var m = new Array(); 
/* 
m[0] = new nhn.api.map.LatLng(35.1601396, 129.1733139);
m[1] = new nhn.api.map.LatLng(35.1621496, 129.1735431);
m[2] = new nhn.api.map.LatLng(35.1611306, 129.1736411);
  */
 //alert(${nameList.size()});
 //alert(${nameList[0].longitude});
 var i ;
 for(i=0; i < ${nameList.size()}; i++){
	//m[i] = new nhn.api.map.LatLng(${nameList[i].longitude},${nameList[i].latitude});
 	alert(${nameList[0].longitude});
	//alert(${nameList[i].longitude});
 	//alert(i);
 	
} 
 	var longitude=${nameList[0].longitude};
 	alert(longitude);

 
 
 nhn.api.map.setDefaultPoint('LatLng');
var oMap = new nhn.api.map.Map(document.getElementById('scholes'), {  
      point : new nhn.api.map.LatLng(37.562561888215,126.984436157441),         //아까 구한 위도, 경도   
      zoom : 6,                                                                        
      enableWheelZoom : true,                                                  
      enableDragPan : true,                                                      
      enableDblClickZoom : false,                                            
      mapMode : 0,                                                               
      activateTrafficMap : false,                                              
      activateBicycleMap : false,                                            
      minMaxLevel : [ 5, 13 ],                                                  
      size : new nhn.api.map.Size(800, 320)  
});  
 
var oSlider = new nhn.api.map.ZoomControl();
oMap.addControl(oSlider);
oSlider.setPosition({
      top : 10,
      left : 10
});
  
var oSize = new nhn.api.map.Size(20, 20);
var oOffset = new nhn.api.map.Size(20, 20);
var oPoint = new nhn.api.map.LatLng(37.562561888215,126.984436157441);
var oIcon = new nhn.api.map.Icon('http://static.naver.com/maps2/icons/pin_spot2.png', oSize, oOffset); 
var oMarker = new nhn.api.map.Marker(oIcon, {
      point:oPoint,
      zIndex:1,
      title: '${storeDto.storeName}'
});
    
var oLabel = new nhn.api.map.MarkerLabel();
oMap.addOverlay(oLabel); 
oMap.addOverlay(oMarker);
oLabel.setVisible(true,oMarker);
  
oMap.attach('mouseenter',function(oCustomEvent){    //마우스엔터,휠,클릭 등 api에서 제공하는 것 중에 골라서
      var oTarget = oCustomEvent.target;
      if(oTarget instanceof nhn.api.map.Marker){
            var oMarker = oTarget;
            oLabel.setVisible(true,oMarker);
      }
});
</script>
</body>
</html>