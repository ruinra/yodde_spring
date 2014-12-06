<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>요때</title>
   <c:set var="root" value="${pageContext.request.contextPath}"/>
   <link rel="stylesheet" type="text/css" href="${root}/resources/css/commons/common.css"/>      <!-- footer, title css -->
   <link rel="stylesheet" type="text/css" href="${root}/resources/css/commons/category.css" />      <!-- category css -->
   <link rel="stylesheet" type="text/css" href="${root}/resources/css/main/main.css"/>               <!-- main css -->
   <link rel="stylesheet" type="text/css" href="${root}/resources/css/search/search.css"/>
</head>
<script type="text/javascript" src="${root}/resources/scripts/jquery-2.1.1.js"></script>
   <body>
      <div>
         <jsp:include page="../common/title.jsp"/>            <!-- title -->
      </div>
      
      <div>
         <jsp:include page="../main/searchBar.jsp"/>            <!-- searchBar -->
      </div>
      
      <script type="text/javascript" src="${root}/resources/scripts/jQueryWeb.js"></script> 
      <script type="text/javascript" src="${root}/resources/scripts/jQueryWeb2.js"></script>
      
      <div class="content">                              <!-- content -->
         <div class="result_content">
            <ul class="result_img" style="margin-bottom:30px;">   <!-- member title -->
               <li class="result_title_img">
                  <img src="${root}/resources/images/images/about.png" height="30">
               </li>
               <li class="result_title_txt">
                  ${query}
               </li>
            </ul>
            
            <div id="resultCount"></div>
            
            <c:choose>
               <c:when test="${memberList == null }">
                  <div class="none"> 검색하신 회원이 존재하지 않습니다.</div>
               </c:when>
               <c:otherwise>
                  <div class="result_box">               <!-- member store -->
                     <c:forEach var="itemMember" items="${memberList}">
                        <div class="result_stores">
                           <div class='recommend' style='float:left'><a href="${root}/member/memberMyPage?email=${itemMember.email}"><img src='${root}/resources/images/images/ex1.jpg' height='180'></a></div>
                           <div style='float:left; padding-left:20px; padding-top: 20px;'>
                              닉네임 : <a href="${root}/member/memberMyPage?email=${itemMember.email}">${itemMember.nickName}</a></br>
                              e-mail : ${itemMember.email}</br>
                              <c:if test="${itemMember.memberLv == 0}">
                                 회원등급 : 일반회원<br/>
                              </c:if>
                           </div>
                        </div>
                     </c:forEach>
                  </div>
               </c:otherwise>
            </c:choose>
         </div>
         
         <div class="request_Btn">
            <a href=""><img src="${root}/resources/images/images/request.png" height="20"></a>
         </div>
      </div>
      
      <div>
         <jsp:include page="../common/footer.jsp"/>            <!-- footer -->
      </div>
   </body>
</html>