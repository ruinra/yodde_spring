<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>요때</title>
		<c:set var="root" value="${pageContext.request.contextPath}"/>
		
		<link rel="stylesheet" type="text/css" href="${root}/resources/css/commons/common.css"/>		<!-- footer, title css -->
		<link rel="stylesheet" type="text/css" href="${root}/resources/css/commons/category.css" />		<!-- category css -->
		<link rel="stylesheet" type="text/css" href="${root}/resources/css/main/main.css"/>			<!-- main css -->
		<link rel="stylesheet" type="text/css" href="${root}/resources/css/owner/owner.css"/>
		
		<script type="text/javascript" src="${root}/resources/scripts/jquery-2.1.1.js"></script>
		<script type="text/javascript" src="${root}/resources/scripts/date_picker.js"></script>
		<script type="text/javascript">
			function checkForm(){
				if($("input[name='time']").val()==""){
					alert("영업시간을 입력해주세요.");
					$("input[name='time']").focus();
					return false;
				}
				
				if($("input[name='day']").val()==""){
					alert("오픈날짜를 입력해주세요.");
					$("input[name='day']").focus();
					return false;
				}
				
				if($("input[name='phone']").val()==""){
					alert("전화번호를 입력해주세요");
					$("input[name='phone']").focus();
					return false;
				}
				
				var info="";
				$("input[name='info']:checked").each(function(){
					info+=$(this).val() + ",";
				});
				
				if(info==""){
					alert("하나이상 체크해 주세요.");
					$("input[name='info']").focus();
					return false;
				}
				//alert(info);
				$("input[name='infomation']").attr("value",	info);
				
			}
			
			function readURL(input) {
			      if (input.files && input.files[0]) {
			         var reader = new FileReader();
			         reader.onload = function(e) {
			            $("#profile").attr("src", e.target.result)
			         }
			         reader.readAsDataURL(input.files[0]);
			      }
			   }
		</script>
	</head>
	<body style="min-width:1260px;">
		<div>
			<jsp:include page="../common/title.jsp"/>		<!-- title -->
		</div>
	
		<div class="content">								<!-- content -->
			<div class="content_modifyStore">
			<form onsubmit="return checkForm()" action="modifyStore?storeId=${storeDto.storeId}&email=${email}" method="post" enctype="multipart/form-data">
				<div class="modifyStore_box">
						<div class="result_title">
							<img src="${root}/resources/images/images/store_info.png" height="55">
						</div>
						<div style="text-align: center">
	
							<!-- <input type="text" class="input_text" tabindex="5" style="ime-mode: active;"/> -->
		
							<div class="photo_input">
								<div class="file_input">
									<c:choose>
										<c:when test="${storeDto.profilePic != null}">
											<img src="${root}${storeDto.profilePic}"  id="profile">
										</c:when>
										<c:otherwise>
											<img id="profile" src="${root}/resources/images/images/profile.png" height="90" style="border-radius: 75px;">
										</c:otherwise>
									</c:choose>
									
								</div>
								<div class="file_input">
								    <label>
								        <input type="file" onchange="readURL(this);" name="file">
								        	사진등록
								    </label>
								</div>
							</div>
							
							<div class="file_input">* 영업시간!!!
								<input type="text" name="time" tabindex="5" value="${storeDto.serviceTime}"></div>
							<div class="file_input">* 오픈날짜!!!
								<input type="text" name="day" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${storeDto.openDate}"/>"/>
								<input type="button" value="달력보기" onclick="datePicker(event,'day')">
							</div>
							<div class="file_input"> 홈페이지!!!
								<input type="text" name="page" value="${storeDto.homepage}"></div>
							<div class="file_input">* 전화번호!!!
								<input type="text" name="phone" value="${storeDto.phoneNum}"></div>
							
							<div class="file_input">가게 상황!!!
								<select name="conditions" id="conditions">
									<option></option>
									<option>open</option>
									<option>close</option>
								</select>
								<script type="text/javascript">
									var conditions=${storeDto.status}
									if(conditions==1){
										$("#conditions").val("open");
									}else{
										$("#conditions").val("close");
									}
								</script>
							</div>
							
							store info
							<div>
								<div class="store_info" style="border-bottom: 0px;">
										<div style="float:left;">
											<div style="width:100px; height:70px;"><img src="${root}/resources/images/images_store_info/card.png" width="60"></div>
											<div style="width:100px; height:30px;"><input type="checkbox" size="30" name="info" value="카드 결제">카드 결제</div>
										</div>
										<div style="float:left;">
											<div style="width:100px; height:70px;"><img src="${root}/resources/images/images_store_info/delivery.png" width="60"></div>
											<div style="width:100px; height:30px;"><input type="checkbox" size="30" name="info" value="배달">배달</div>
										</div>
										<div style="float:left;">
											<div style="width:100px; height:70px;"><img src="${root}/resources/images/images_store_info/drive_through.png" width="50"></div>
											<div style="width:100px; height:30px;"><input type="checkbox" size="30" name="info" value="Drive through">Drive through</div>
										</div>
										<div style="float:left;">
											<div style="width:100px; height:70px;"><img src="${root}/resources/images/images_store_info/group.png" width="60"></div>
											<div style="width:100px; height:30px;"><input type="checkbox" size="30" name="info" value="단체 예약">단체 예약</div>
										</div>
										<div style="float:left;">
											<div style="width:100px; height:70px;"><img src="${root}/resources/images/images_store_info/kids.png" width="60"></div>
											<div style="width:100px; height:30px;"><input type="checkbox" size="30" name="info" value="어린이">어린이</div>
										</div>
										<div style="float:left;">
											<div style="width:100px; height:70px;"><img src="${root}/resources/images/images_store_info/parking.png" width="50"></div>
											<div style="width:100px; height:30px;"><input type="checkbox" size="30" name="info" value="주차">주차</div>
										</div>
									</div>
	<!-- 								<div class="firstline_name"> -->
	<!-- 									<input type="hidden" name="infomation"> -->
	
									<div class="store_info" style="border-top: 0px;">	
										<div style="float:left;">
											<div style="width:100px; height:70px;"><img src="${root}/resources/images/images_store_info/reservation.png" width="45"></div>
											<div style="width:100px; height:30px;"><input type="checkbox" size="30" name="info" value="예약">예약</div>
										</div>
										<div style="float:left;">
											<div style="width:100px; height:70px;"><img src="${root}/resources/images/images_store_info/seating.png" width="60"></div>
											<div style="width:100px; height:30px;"><input type="checkbox" size="30" name="info" value="좌식">좌식</div>
										</div>
										<div style="float:left;">
											<div style="width:100px; height:70px;"><img src="${root}/resources/images/images_store_info/takeout.png" width="50"></div>
											<div style="width:100px; height:30px;"><input type="checkbox" size="30" name="info" value="포장">포장</div>
										</div>
										<div style="float:left;">
											<div style="width:100px; height:70px;"><img src="${root}/resources/images/images_store_info/toilet.png" width="50"></div>
											<div style="width:100px; height:30px;"><input type="checkbox" size="30" name="info" value="화장실">화장실</div>
										</div>
										<div style="float:left;">
											<div style="width:100px; height:70px;"><img src="${root}/resources/images/images_store_info/tv.png" width="50"></div>
											<div style="width:100px; height:30px;"><input type="checkbox" size="30" name="info" value="TV">TV</div>
										</div>
										<div style="float:left;">
											<div style="width:100px; height:70px;"><img src="${root}/resources/images/images_store_info/wifi.png" width="50"></div>
											<div style="width:100px; height:30px;"><input type="checkbox" size="30" name="info" value="WI-FI">WI-FI</div>
										</div>
									</div>
									<input type="hidden" name="infomation">
								</div>
<!-- 								<div class="secondline_name"> -->
									
<!-- 									<input type="hidden" name="infomation"> -->
<!-- 								</div> -->
							</div> 
						</div>
						<div class="Btn">
							<input type="submit" value="수정 완료">
							<input type="button" value="취소">
						</div>
					</form>					
				</div>
			</div>
		
		<div>
			<jsp:include page="../common/footer.jsp"/>		<!-- footer -->
		</div>
	</body>
</html>