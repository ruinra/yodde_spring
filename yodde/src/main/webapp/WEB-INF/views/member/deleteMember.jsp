<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>회원 탈퇴</title>
      <c:set var="root" value="${pageContext.request.contextPath}"/>
      
      <link rel="stylesheet" type="text/css" href="${root}/resources/css/commons/common.css"/>      <!-- footer, title css -->
      <link rel="stylesheet" type="text/css" href="${root}/resources/css/commons/category.css" />      <!-- category css -->
      <link rel="stylesheet" type="text/css" href="${root}/resources/css/main/main.css"/>         <!-- main css -->
      <link rel="stylesheet" type="text/css" href="${root}/resources/css/member/member.css"/>
      
      <script type="text/javascript" src="${root}/resources/scripts/jquery-2.1.1.js"></script>
      <script>
         var check = "${check}";
//          alert(check);
         if(check==1){
            alert("그동안 이용해주셔서 감사합니다.");
            document.location.href="/home/signout";
            
         }else if(check==0){
            alert("비밀번호 오류입니다. 다시 입력해주시기 바랍니다.");
            document.location.href="${root}/info/deleteMember/?email='${email}'";

         }         
      
      </script>
   </head>
   <body>
      <div>
         <jsp:include page="../common/title.jsp"/>         <!-- title -->
      </div>
      
      <script type="text/javascript" src="${root}/resources/scripts/jQueryWeb.js"></script> 
      <script type="text/javascript" src="${root}/resources/scripts/jQueryWeb2.js"></script>
      <c:set var="password" value="${password}" scope="session"/>
      <form action="${root}/info/deleteMember" method="post">
      <div class="content">                           <!-- content -->
         <div class="delete_content">
            <div class="Password_box" >
               <div class="result_title">               <!-- login title -->
                  <img src="${root}/resources/images/images/passconfirm.png" height="45">
               </div>
               <ul class="delete_content_box">
                  <li class="confirm_box">
                     <div class="Password">Password</div>
                     <input type="password" value="${password}" class="password" name="password" >
               <input type="hidden" name="email"  value="${email}">
                 </li>
                 
                 <li class="delete_Btn">
               <button type="submit" style="height:25px; width:75px; border:none; background-image: url(${root}/resources/images/images/ok.png); background-size: 100%;" onclick="javascript:deleteMember(${check})"></button>
               <button type="reset" style="height:25px; width:75px; border:none; background-image: url(${root}/resources/images/images/close_btn.png); background-size: 100%;" onclick="javascript:history.back()"></button>
            </li>
             </ul>
           </div>
         </div>
      </div>
      </form>
      <div>
         <jsp:include page="../common/footer.jsp"/>         <!-- footer -->
      </div>
   </body>
</html>