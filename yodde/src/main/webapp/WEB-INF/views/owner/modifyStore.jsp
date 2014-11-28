<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<script type="text/javascript">
			function checkForm(){
				if($("input[name='time']").val()==""){
					alert("영업시간을 입력해주세요.");
					$("input=[name='time']").focus();
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
				
				$("input[name='infomation']").attr("value",	info);
				
			}
		</script>
	</head>
	<body style="min-width:1260px;">
		<div>
			<jsp:include page="../common/title.jsp"/>		<!-- title -->
		</div>
	
		<div class="content">								<!-- content -->
			<div class="content_modifyStore">
				<div class="modifyStore_box">
					<form onsubmit="return checkForm()">
						<div class="result_title">
							<img src="${root}/resources/images/images/store_info.png" height="55">
						</div>
						<div style="text-align: center">
	
							<!-- <input type="text" class="input_text" tabindex="5" style="ime-mode: active;"/> -->
		
							<div class="photo_input">
								<div class="file_input">
									<img alt="" src="">
									<img alt="" src="">
									<img alt="" src="">
								</div>
								<div class="file_input">
									사진
									<input type="text" readonly="readonly" title="File Route" id="file_route">
								    <label>
								        <input type="file" onchange="javascript:document.getElementById('file_route').value=this.value">
								        	등록
								    </label>
								</div>
							</div>
							
							<div class="file_input">* 영업시간!!!
								<input type="text" name="time" tabindex="5"></div>
							<div class="file_input">* 오픈날짜!!!
								<input type="text" name="day"></div>
							<div class="file_input"> 홈페이지!!!
								<input type="text" name="page"></div>
							<div class="file_input">* 전화번호!!!
								<input type="text" name="phone"></div>
							
							<div class="file_input">가게 상황!!!
								<select name="conditions">
									<option></option>
									<option>open</option>
									<option>close</option>
								</select>
							</div>
							
							store info
							<div class="store_info">
								<div class="firstline_icon">
									<span class="info_icon">
										<img src="${root}/resources/images/images_store_info/card.png" width="60">
									</span>
									<span class="info_icon">
										<img src="${root}/resources/images/images_store_info/delivery.png" width="60">
									</span>
									<span class="info_icon">
										<img src="${root}/resources/images/images_store_info/drive_through.png" width="50">
									</span>
									<span class="info_icon">
										<img src="${root}/resources/images/images_store_info/group.png" width="60">
									</span>
									<span class="info_icon">
										<img src="${root}/resources/images/images_store_info/kids.png" width="60">
									</span>
									<span class="info_icon">
										<img src="${root}/resources/images/images_store_info/parking.png" width="50">
									</span>
								</div>
								<div class="firstline_name">
									<input type="checkbox" size="30" name="info">카드 결제
									<input type="checkbox" size="30" name="info">배달
									<input type="checkbox" size="30" name="info">drive through
									<input type="checkbox" size="30" name="info">단체 예약
									<input type="checkbox" size="30" name="info">어린이
									<input type="checkbox" size="30" name="info">주차
									<input type="hidden" name="infomation">
								</div>
								<div class="secondline_icon">
									<span class="info_icon">
										<img src="${root}/resources/images/images_store_info/reservation.png" width="45">
									</span>
									<span class="info_icon">
										<img src="${root}/resources/images/images_store_info/seating.png" width="60">
									</span>
									<span class="info_icon">
										<img src="${root}/resources/images/images_store_info/takeout.png" width="50">
									</span>
									<span class="info_icon">
										<img src="${root}/resources/images/images_store_info/toilet.png" width="50">
									</span>
									<span class="info_icon">
										<img src="${root}/resources/images/images_store_info/tv.png" width="50">
									</span>
									<span class="info_icon">
										<img src="${root}/resources/images/images_store_info/wifi.png" width="50">
									</span>
								</div>
								<div class="secondline_name">
									<input type="checkbox" size="30" name="info">카드 결제
									<input type="checkbox" size="30" name="info">배달
									<input type="checkbox" size="30" name="info">drive through
									<input type="checkbox" size="30" name="info">단체 예약
									<input type="checkbox" size="30" name="info">어린이
									<input type="checkbox" size="30" name="info">주차
									<input type="hidden" name="infomation">
								</div>
							</div> 
						</div>
						
						<div class="Btn">
							<input type="submit" value="수정 완료">
							<input type="button" value="취소">
						</div>
					</form>
				</div>
			</div>
		</div>
		
		<div>
			<jsp:include page="../common/footer.jsp"/>		<!-- footer -->
		</div>
	</body>
</html>