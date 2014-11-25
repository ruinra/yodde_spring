<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>요때</title>
      <c:set var="root" value="${pageContext.request.contextPath}"/>
      <link rel="stylesheet" type="text/css" href="${root}/resources/css/commons/common.css"/>      <!-- footer, title css -->
      <link rel="stylesheet" type="text/css" href="${root}/resources/css/commons/category.css" />      <!-- category css -->
      <link rel="stylesheet" type="text/css" href="${root}/resources/css/main/main.css"/>         <!-- main css -->
      
      <link rel="stylesheet" type="text/css" href="${root}/resources/css/main/demo.css" />
      <link rel="stylesheet" type="text/css" href="${root}/resources/css/main/elastislide.css" />
      <script src="${root}/resources/scripts/modernizr.custom.17475.js"></script>
   </head>
   <body>
      <c:choose>
         <c:when test="${email==''}">
            <c:set var="email" value="" scope="session"/>
            <c:set var="nick" value="" scope="session"/>
         </c:when>
         <c:otherwise>
            <c:set var="email" value="${email}" scope="session"/>
            <c:set var="nick" value="${nick}" scope="session"/>            
         </c:otherwise>
      </c:choose>
      <div>
         <jsp:include page="../common/title.jsp"/>      <!-- title -->
      </div>
      <div>
         <jsp:include page="searchBar.jsp"/>            <!-- searchBar -->
      </div>
      
      <div class="content">
         <div class="main_content">
            <div class="store_box">
               <div class="store_box_title">
                  <img src="${root}/resources/images/images/1_HOT.png" height="40">
               </div>
               <div class="stores" id="pic_slide">
                  <div class="slide_title">
                     <ul id="carousel" class="elastislide-list">
                        <li class="recommend"><a href="#"><img src="${root}/resources/images/images/ex1.jpg"/></a></li>
                        <li class="recommend"><a href="#"><img src="${root}/resources/images/images/ex2.jpg"/></a></li>
                        <li class="recommend"><a href="#"><img src="${root}/resources/images/images/ex3.jpg" /></a></li>
                        <li class="recommend"><a href="#"><img src="${root}/resources/images/images/ex4.jpg"/></a></li>
                        <li class="recommend"><a href="#"><img src="${root}/resources/images/images/ex1.jpg"/></a></li>
                        <li class="recommend"><a href="#"><img src="${root}/resources/images/images/ex2.jpg"/></a></li>
                        <li class="recommend"><a href="#"><img src="${root}/resources/images/images/ex3.jpg"/></a></li>
                        <li class="recommend"><a href="#"><img src="${root}/resources/images/images/ex4.jpg"/></a></li>
                     </ul>
                  </div>
               </div>
            </div>
            
            <script type="text/javascript" src="${root}/resources/scripts/jquery.min.js"></script>
            <script type="text/javascript" src="${root}/resources/scripts/jquerypp.custom.js"></script>
            <script type="text/javascript" src="${root}/resources/scripts/jquery.elastislide.js"></script>
            <script type="text/javascript">
               $('#carousel').elastislide();
            </script>
            
            <script type="text/javascript" src="${root}/resources/scripts/jQueryWeb.js"></script> 
            <script type="text/javascript" src="${root}/resources/scripts/jQueryWeb2.js"></script>
            
            <div class="store_box">
               <div class="store_box_title">
                  <img src="${root}/resources/images/images/2_REGION.png" height="40">
               </div>
               <div class="stores">
                  접속 지역 기준 스토어 추천
               </div>
            </div>
            
            <div class="store_box">
               <div class="store_box_title">
                  <img src="${root}/resources/images/images/3_LIKES.png" height="40">
               </div>
               <div class="stores">
                  추천수 기준 리뷰 추천
               </div>
            </div>
            
            <div class="store_box">
               <div class="store_box_title">
                  <img src="${root}/resources/images/images/4_NEW.png" height="40">
               </div>
               <div class="stores">
                  새로 오픈된 스토어 추천
               </div>
            </div>
         </div>
      </div>
      
      <div class="main_footer">               <!-- footer -->
         <div class="letter">
            CRAFTED IN THE MONING PROJECT<br />copyright. 2014 Yodde
         </div>
      </div>
   </body>
</html>