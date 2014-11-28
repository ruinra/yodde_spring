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
<link rel="stylesheet" type="text/css" href="${root}/resources/css/commons/common.css" />
<!-- footer, title css -->
<link rel="stylesheet" type="text/css" href="${root}/resources/css/commons/category.css" />
<!-- category css -->
<link rel="stylesheet" type="text/css" href="${root}/resources/css/main/main.css" />
<!-- main css -->
<link rel="stylesheet" type="text/css" href="${root}/resources/css/member/member.css" />
<script type="text/javascript" src="${root}/resources/scripts/jquery-2.1.1.js"></script>
<script type="text/javascript" src="${root}/resources/scripts/jquery.validate.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.js"></script>
<script type="text/javascript">
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
<script type="text/javascript">
   function openDaumPostcode() {
      new daum.Postcode({
         oncomplete : function(data) {

            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분. 
            // 우편번호와 주소 정보를 해당 필드에 넣고, 커서를 상세주소 필드로 이동한다. 
            document.getElementById('zip1').value = data.postcode1;
            document.getElementById('zip2').value = data.postcode2;
            //                   document.getElementById('addr1').value = data.address;

            document.getElementById('zip2').focus();
            //                   document.getElementById('zip1').focus();

            var input = document.getElementById("zip2");
            if (input.value != "") {
               var label = document.getElementById("postCheck");
               for (var i = 0; i < label.childNodes.length; i++) {
                  if (label.childNodes[i].nodeType == 3) {
                     label.childNodes[i].nodeValue = "";
                  }
               }
            }
         }
      }).open();
   }
</script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#valiex").validate({
			rules : {
			   name : {
			      required : true,
			      minlength : 2,
			      maxlength : 15
			   },
			   email : {
			      required : true,
			      email : true,
			      email : /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/
			   },
			   homepage : {
			      required : true,
			      url : true
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
			   },
			   zip2 : {
			      required : true
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
			   },
			
			   zip2 : {
			      required : " 우편번호를 입력하세요."
			   }
			}
		});
	});
</script>
</head>
<body style="min-width: 1260px;">
   <div>
      <jsp:include page="../common/title.jsp" />
      <!-- title -->
   </div>

   <script type="text/javascript" src="${root}/resources/scripts/jQueryWeb.js"></script>
   <script type="text/javascript" src="${root}/resources/scripts/jQueryWeb2.js"></script>

   <div class="content">
      <!-- content -->
      <div class="myPage_content">
         <div class="myPage_box">
            <form id="valiex" novalidate="novalidate" action="${root}/modifyMember" method="post" enctype="multipart/form-data">
               <div class="result_title">
                  <!-- login title -->
                  <img src="${root}/resources/images/images/modify.png" height="55">
               </div>
               <ul class="content_box">
                  <li class="myProfile">
                     <!-- user의 프로필사진과 닉네임 받아오는 부분 -->
                     <div class="myPhoto">
                        <img src="${root}${memberDto.profilePic}" id="profile" style="Width: 150px; Height: 150px; border-radius: 75px;">
                     </div>
                     <div class="modify_myphoto">
                        <!-- 프로필 사진 변경 부분 -->
                        <div id="fileInputForm"
                           style="position: relative; float: center; width: 50px; height: 25px; overflow: hidden; margin-left: 50px; cursor: pointer; background-image: url('${root}/resources/images/images/modify_submit.png'); background-size: 100%;">
                           <input type="file" name="uploadfile" onchange="readURL(this);"
                              style='margin-left: -10px; width: 50px; height: 25px; filter: alpha(opacity = 0); opacity: 0; -moz-opacity: 0; cursor: pointer;'>
                        </div>
                     </div>
                  </li>
                  <li>
                     <div class="profile_content">
                        <!-- user정보 : 순서대로 level, email, 우편번호, 남긴 리뷰갯수  -->
                        <p>
                           <!-- user의 닉네임 미리 뿌려줘야함 -->
                           <img src="${root}/resources/images/images/pick.png" height="25"><b
                              class="label">닉네임</b> <input type="text"
                              class="profile_input error" value="${memberDto.nickName}" name="nickName">
                        </p>
                        <p>
                           <img src="${root}/resources/images/images/pick.png" height="25"><b
                              class="label">레벨</b> 
                              <c:if test="${memberDto.memberLv == 0}">
                                 <input type="text"
                                 class="profile_input error" value="일반회원" name="level"
                                 readonly>
                              </c:if>
                              
                        </p>
                        <p>
                           <img src="${root}/resources/images/images/pick.png" height="25"><b
                              class="label">아이디</b> <input type="text"
                              class="profile_input error" style="width: 170px;"
                              value="${memberDto.email}" name="email" readonly>
                        </p>
                        <p>
                           <img src="${root}/resources/images/images/pick.png" height="25"> <input
                              type="text" id="zip1" name="zip1" value="${zip1}"
                              class="join_input_half error" style="ime-mode: active;">
                           - <input type="text" id="zip2" name="zip2" value="${zip2}"
                              class="join_input_half error" style="ime-mode: active;">
                           <a id="zipcode" name="zipcode" type="button"
                              onclick="openDaumPostcode()"> <img
                              src="${root}/resources/images/images/zipcode.png" height="30">
                           </a> <label id="postCheck" name="postCheck" for="zip2"
                              generated="true" class="error"> <br/>우편번호를 입력하세요.</label>
                        </p>
                        <p>
							<img src="${root}/resources/images/images/pick.png" height="25"><b class="label" >비밀번호</b>
							<input type="password" class="profile_update error" style="ime-mode: active; width:100px;" id="password" name="password"
							placeholder="" onfocus="this.placeholder=''" onblur="this.placeholder=''">
							<label for="password" generated="true" class="error"> <br/></label>
						</p>
						<p>
							<img src="${root}/resources/images/images/pick.png" height="25"><b class="label" >비밀번호 확인</b>
							<input type="password" class="profile_update error" style="ime-mode: active; width:100px;" id="pwchk" name="pwchk"
							placeholder="" onfocus="this.placeholder=''" onblur="this.placeholder=''">
							<label for="pwchk" generated="true" class="error"> <br/></label>
						</p>
                     </div>
                  </li>
               </ul>

               <div class="bottom_Btn">
                  <input type="IMAGE" src="${root}/resources/images/images/ok.png" height="30"
                     name="Submit" value="Submit"> <a href="" onclick="">
                     <img src="${root}/resources/images/images/cancel.png" height="30">
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