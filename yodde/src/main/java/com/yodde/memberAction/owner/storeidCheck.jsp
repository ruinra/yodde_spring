<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 중복 체크</title>
<script type="text/javascript" src="${root}/resources/scripts/jquery-2.1.1.js"></script>
<script type="text/javascript" src="${root}/resources/scripts/jquery.validate.js"></script>
<script type="text/javascript" src="script.js"></script>
<link rel="stylesheet" type="text/css" href="style.css" />


<script type="text/javascript">
    function idCheck(root) {
	var url = root+"/owner/storeidCheck?email="+$("input[name='email']").val();
	window.open(url, "", "width=470, height=150");
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




	<c:if test="${check==1}">
	<div align="center">
		이미 사용중인 e-mail 입니다.
		<form action="${root}/owner/storeidCheck" method="post" id="valiex" novalidate="novalidate">

				<p>
					<img src="${root}/resources/images/images/pick.png" height="25">
					<input type="text" class="join_input error" style="ime-mode: active;" name="email" placeholder=" ID@EMAIL"
						onfocus="this.placeholder=''" onblur="this.placeholder=' ID@EMAIL'">
					<br/>
					
					<label for="email" generated="true" class="error">
						이메일을 입력하세요.
					</label>
					<br/>
					<input type="submit" value="확인"/>
					<a href="javascript:self.close()">닫기</a>
				</p>



				<!-- 			<input type="text" name="email"/> -->
		</form>
	</div>
	
	</c:if>
	
	<c:if test="${check==0}">
		<div align="center">사용가능한 e-mail 입니다.</div>
		<script type="text/javascript">
			$(opener.document).find("input[name='email']").val("${email}");
			$(opener.document).find("input[name='idCheckOk']").val("1");
			
		</script>
		<a href="javascript:self.close()">닫기</a>
	</c:if>
	
	<c:if test="${check==3}">
		<div align="center">
			e-mail을 올바르게 입력해주세요.
			<br/>
		<a href="javascript:self.close()">닫기</a>
		</div>
	</c:if>

	
</body>
</html>