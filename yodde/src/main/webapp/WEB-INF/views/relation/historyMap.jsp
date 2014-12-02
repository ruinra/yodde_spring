<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		
		<link rel="stylesheet" type="text/css" href="${root}/resources/css/commons/common.css"/>		<!-- footer, title css -->
		<link rel="stylesheet" type="text/css" href="${root}/resources/css/commons/category.css" />		<!-- category css -->
		<link rel="stylesheet" type="text/css" href="${root}/resources/css/main/main.css"/>			<!-- main css -->
		<link rel="stylesheet" type="text/css" href="${root}/resources/css/follow/follow.css"/>
		<script type="text/javascript" src="http://openapi.map.naver.com/openapi/naverMap.naver?ver=2.0&key=15319f937084dc86f076a48652007f45&coord=latlng"></script>
		<script>
		   $(document).ready(function() {
		      jQuery.ajax({            
		            type:"GET",
		            url:"http://apis.daum.net/local/geo/transcoord",
		            data:"apikey=aea5d21e8e375ed8d2aa0c5d97a6b62af132a0ce&x="+${storeDto.latitude}+"&y="+${storeDto.longitude}+"&fromCoord=KTM&toCoord=WGS84&output=json",
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
		                     zoom : 11,
		                     enableWheelZoom : true,
		                     enableDragPan : true,
		                     enableDblClickZoom : false,
		                     mapMode : 0,
		                     activateTrafficMap : false,
		                     activateBicycleMap : false,
		                     minMaxLevel : [ 5, 13 ],
		                     size : new nhn.api.map.Size(490, 200)
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
		                                 true, oMarker);
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
		   
		   function loginFollow(){
		      alert("로그인을 해주세요.");
		   }
		   
		   function followCheck(){
		      var mail="${email}";
		   var store="${storeDto.storeId}";
		   var url="followStore?email=" + mail + "&storeId=" + store;
		   
		   $.ajax({
		      url:url,
		      type:"get",
		      contentType:"text/xml; charset=utf-8", 
		      dataType: "text",
		      error: function(xhr, status, error) { alert("error : " +status); },
		      success: function(data){
		         //alert(data);
		         if(data ==1){
		            $("#follow").attr("src", "${root}/resources/images/images/follow.png");   
		         }else{
		            $("#follow").attr("src", "${root}/resources/images/images/notfollow.png");
		         }
		      } }); // Ajax 호출 및 이벤트 핸들러 함수 정의
		   }
		</script>		
	</head>
	<body style="min-width:1260px;">
		<div>
			<jsp:include page="../common/title.jsp"/>			<!-- title -->
		</div>
		
		<div class="content">									<!-- content -->
			<div class="historyMap_content">
				<div class="historymap_box">
					<div class="result_title">					<!-- login title -->
						<img src="${root}/resources/images/images/historyMap.png" height="50">
					</div>
					
					<div class="map_box">
						MAP
					</div>
				</div>
				
				<div class="historyrate_box">
					<div class="historyrate_img">				<!-- 평균평점을 별점으로 표시 -->
						<img src="${root}/resources/images/images/starrate_ex.png" height="50">
					</div>
					<div class="historyrate_num">
						3.6
					</div>
				</div>
				
				<div class="historyreview_box">
					최근 리뷰 타임라인 기반으로 띄워주기
				</div>
			</div>
		</div>
		
		<div>
			<jsp:include page="../common/footer.jsp"/>			<!-- footer -->
		</div>
	</body>
</html>