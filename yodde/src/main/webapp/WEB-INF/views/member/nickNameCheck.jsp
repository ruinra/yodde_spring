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
	var url = root+"/member/idCheck?email="+$("input[name='email']").val();
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

<div align="center">
	<c:if test="${check==1}">
	<div align="center">
		이미 사용중인 닉네임 입니다.
		<form action="${root}/member/nickNameCheck" method="post" id="valiex" novalidate="novalidate">

				<p>
					<img src="${root}/resources/images/images/pick.png" height="25">
					<input type="text" class="join_input error" style="ime-mode: active;" name="name" placeholder=" NICKNAME"
						onfocus="this.placeholder=''" onblur="this.placeholder=' NICKNAME'">
					<br/>
					
					<label for="name" generated="true" class="error">
						닉네임을 입력하세요.
					</label>
					<br/>
					<input type="submit" value="확인"/>
					
				</p>



				<!-- 			<input type="text" name="email"/> -->
		</form>
	</div>
	
	</c:if>
	
	<c:if test="${check==0}">
		<div align="center">사용가능한 닉네임 입니다.</div>
		<script type="text/javascript">
			$(opener.document).find("input[name='name']").val("${name}");
			$(opener.document).find("input[name='nickNameCheckOk']").val("1");
		</script>
		
	</c:if>
	
	<c:if test="${check==2}">
		<div align="center">
			 부적절한 단어나 문자가 포함되어 있습니다.
			<br/>
			
		</div>
	</c:if>
		
	<c:if test="${check==3}">
		<div align="center">
			닉네임을 올바르게 입력해주세요.
			<br/>
			
		</div>
	</c:if>
	
	<div>
		<a href="javascript:self.close()">닫기</a>
	</div>
</div>
	
</body>
</html>