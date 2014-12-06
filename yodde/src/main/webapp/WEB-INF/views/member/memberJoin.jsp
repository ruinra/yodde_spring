<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
   
   function idCheck(root) {
		var url = root+"/member/idCheck?email="+$("input[name='email']").val();
		window.open(url, "", "width=450, height=150");
	}

	function nickNameCheck(root) {
		var url = root+"/member/nickNameCheck?name="+$("input[name='name']").val();
		window.open(url, "", "width=450, height=150");
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
<body>
   <div>
      <jsp:include page="../common/title.jsp" />
      <!-- title -->
   </div>

   <div class="content">
      <div class="content_memberJoin">
         <div class="memberJoin_box">
            <form id="valiex" novalidate="novalidate"
               action="${root}/member/memberJoin" method="post">
               <div class="result_title">
                  <!-- login title -->
                  <img src="${root}/resources/images/images/join_title.png" height="55">
               </div>
               
                <p>	<!-- 이메일입력 -->
               <input type="hidden" name="idCheckOk" id="idCheckOk" value="0">
                  <img src="${root}/resources/images/images/pick.png" height="25"> <input
                     type="text" class="join_input error" style="ime-mode: active;"
                     name="email" placeholder=" ID@EMAIL"
                     onfocus="this.placeholder=''"
                     onblur="this.placeholder=' ID@EMAIL'" value="">
                     
                     <label for="email" id="emailError" generated="true" class="error"> 이메일을 입력하세요.</label>
              		 
              		 <!-- 중복체크 -->
              		 <a id="idCheck" name="idCheck"	
                     type="button" onclick="idCheck('${root}')"> <img
                     src="${root}/resources/images/images/zipcode.png" height="30">
                 	 </a>
               </p>
               
               <p>	<!-- 닉네임입력 -->
               <input type="hidden" name="nickNameCheckOk" id="nickNameCheckOk" value="0">
                  <img src="${root}/resources/images/images/pick.png" height="25"> <input
                     type="text" class="join_input error" style="ime-mode: active;"
                     name="name" placeholder=" NICKNAME" 
                     onfocus="this.placeholder=''"
                     onblur="this.placeholder=' NICKNAME'" value="">
                     
                     <label for="name" generated="true" class="error"> 2글자 이상으로 입력하세요.</label>

					<!-- 중복체크 -->
              		 <a id="nickNameCheck" name="nickNameCheck"
                     type="button" onclick="nickNameCheck('${root}')"> <img
                     src="${root}/resources/images/images/zipcode.png" height="30">
                 	 </a>
               </p>
               
               <p>	<!-- 비밀번호입력 -->
                  <img src="${root}/resources/images/images/pick.png" height="25"> <input
                     type="password" class="join_input error"
                     style="ime-mode: active;" id="password" name="password"
                     placeholder=" PASSWORD" onfocus="this.placeholder=''"
                     onblur="this.placeholder=' PASSWORD'"> <label
                     for="password" generated="true" class="error"> 비밀 번호를
                     입력하세요.</label>
               </p>
               <p>	<!-- 비밀번호확인입력 -->
                  <img src="${root}/resources/images/images/pick.png" height="25"> <input
                     type="password" class="join_input error"
                     style="ime-mode: active;" id="pwchk" name="pwchk"
                     placeholder=" PASSWORD" onfocus="this.placeholder=''"
                     onblur="this.placeholder=' PASSWORD'"> <label for="pwchk"
                     generated="true" class="error"> 비밀번호를 다시 한 번 입력하세요.</label>
               </p>

               <p>	<!-- 우편번호입력 -->
                  <img src="${root}/resources/images/images/pick.png" height="25"> <input
                     type="text" id="zip1" name="zip1" class="join_input_half error"
                     style="ime-mode: active;"> - <input type="text" id="zip2"
                     name="zip2" class="join_input_half error"
                     style="ime-mode: active;"> <a id="zipcode" name="zipcode"
                     type="button" onclick="openDaumPostcode()"> <img
                     src="${root}/resources/images/images/zipcode.png" height="30">
                  </a> <label id="postCheck" name="postCheck" for="zip2"
                     generated="true" class="error">우편번호를 입력하세요.</label>

               </p>

               <div class="bottom_Btn">
                  <input type="IMAGE" src="${root}/resources/images/images/ok.png" height="30"
                     name="Submit" value="Submit">
                  <%--                      <a href="${root}/member/memberJoin.do" onclick=""> --%>
                  <!--                         <img src="./../images/ok.png" height="30"> -->
                  <!--                      </a> -->
                  <a href="" onclick=""> <img src="${root}/resources/images/images/cancel.png"
                     height="30">
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