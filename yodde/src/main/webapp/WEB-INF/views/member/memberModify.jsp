<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../common/common.css" />
<!-- footer, title css -->
<link rel="stylesheet" type="text/css" href="../common/category.css" />
<!-- category css -->
<link rel="stylesheet" type="text/css" href="../main/main.css" />
<!-- main css -->
<link rel="stylesheet" type="text/css" href="../member/member.css" />
<script type="text/javascript" src="../jquery-2.1.1.js"></script>
<script type="text/javascript" src="../jquery.validate.js"></script>
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
   $(document)
         .ready(
               function() {
                  $("#valiex")
                        .validate(
                              {
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
   <c:set var="root" value="${pageContext.request.contextPath}" />

   <div>
      <jsp:include page="../common/title.jsp" />
      <!-- title -->
   </div>

   <script type="text/javascript" src="../jQueryWeb.js"></script>
   <script type="text/javascript" src="../jQueryWeb2.js"></script>

   <div class="content">
      <!-- content -->
      <div class="myPage_content">
         <div class="myPage_box">
            <form id="valiex" novalidate="novalidate"
               action="${root}/member/modifyMember.do" method="post">
               <div class="result_title">
                  <!-- login title -->
                  <img src="./../images/modify.png" height="55">
               </div>
               <ul class="content_box">
                  <li class="myProfile">
                     <!-- user의 프로필사진과 닉네임 받아오는 부분 -->
                     <div class="myPhoto">
                        <img src="./../images/profile.png" id="profile"
                           style="Width: 150px; Height: 150px; border-radius: 75px;">
                     </div>
                     <div class="modify_myphoto">
                        <!-- 프로필 사진 변경 부분 -->
                        <div id="fileInputForm"
                           style="position: relative; float: center; width: 50px; height: 25px; overflow: hidden; margin-left: 50px; cursor: pointer; background-image: url('./../images/modify_submit.png'); background-size: 100%;">
                           <input type="file" name="file" onchange="readURL(this);"
                              style='margin-left: -10px; width: 50px; height: 25px; filter: alpha(opacity = 0); opacity: 0; -moz-opacity: 0; cursor: pointer;'>
                        </div>


                        <!--                         <a href="#" onclick="javascrip:picUpload()"> -->
                        <!--                            <img src="./../images/modify_submit.png" height="25"> -->
                        <!--                         </a> -->
                     </div>
                  </li>
                  <li>
                     <div class="profile_content">
                        <!-- user정보 : 순서대로 level, email, 우편번호, 남긴 리뷰갯수  -->
                        <p>
                           <!-- user의 닉네임 미리 뿌려줘야함 -->
                           <img src="./../images/pick.png" height="25"><b
                              class="label">닉네임</b> <input type="text"
                              class="profile_input error" value="나영이" name="level" readonly>
                        </p>
                        <p>
                           <img src="./../images/pick.png" height="25"><b
                              class="label">레벨</b> <input type="text"
                              class="profile_input error" value="level" name="level"
                              readonly>
                        </p>
                        <p>
                           <img src="./../images/pick.png" height="25"><b
                              class="label">아이디</b> <input type="text"
                              class="profile_input error" style="width: 170px;"
                              value="e-mail" name="e-mail" readonly>
                        </p>
                        <p>
                           <img src="./../images/pick.png" height="25"> <input
                              type="text" id="zip1" name="zip1"
                              class="join_input_half error" style="ime-mode: active;">
                           - <input type="text" id="zip2" name="zip2"
                              class="join_input_half error" style="ime-mode: active;">
                           <a id="zipcode" name="zipcode" type="button"
                              onclick="openDaumPostcode()"> <img
                              src="./../images/zipcode.png" height="30">
                           </a> <label id="postCheck" name="postCheck" for="zip2"
                              generated="true" class="error"> <br/>우편번호를 입력하세요.</label>
                        </p>
                     </div>
                  </li>
               </ul>

               <div class="bottom_Btn">
                  <input type="IMAGE" src="./../images/ok.png" height="30"
                     name="Submit" value="Submit"> <a href="" onclick="">
                     <img src="./../images/cancel.png" height="30">
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