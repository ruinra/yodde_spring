<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Insert title here</title>
      <link rel="stylesheet" type="text/css" href="${root}/resources/css/commons/common.css"/>      <!-- footer, title css -->
      <link rel="stylesheet" type="text/css" href="${root}/resources/css/commons/category.css" />      <!-- category css -->
      <link rel="stylesheet" type="text/css" href="${root}/resources/css/main/main.css"/>               <!-- main css -->
   </head>
   <body>
      <div>
         <jsp:include page="../common/title.jsp"/>         <!-- title -->
      </div>
      <div>
         <jsp:include page="searchBar.jsp"/>               <!-- searchBar -->
      </div>
      
      <div class="content">                           <!-- content -->
         <div class="result_content">
            <div class="result_img">                  <!-- result title -->
               <img src="${root}/resources/images/images/about.png" height="55">
               <span class="result_value">               <!-- 검색해서 넘어온 가게 이름 -->
                  7Train
               </span>
            </div>
         
            <div class="result_box">                  <!-- result store -->
               <div class="result_stores">
                  <span class="recommend">
                     <a href=""><img src="${root}/resources/images/images/ex1.jpg" height="170"></a>
                  </span>
                  <span class="result_stores_title">
                     <img src="${root}/resources/images/images/1_HOT.png" height="55">
                  </span>
               </div>
            </div>
            <div class="result_box">
               <div class="result_stores">
                  <span class="recommend">
                     <a href=""><img src="${root}/resources/images/images/ex1.jpg" height="170"></a>
                  </span>
                  <span class="result_stores_title">
                     <img src="${root}/resources/images/images/1_HOT.png" height="55">
                  </span>
               </div>
            </div>
            
            <div class="request_Btn">
               <a href=""><img src="${root}/resources/images/images/request.png" height="20"></a>
            </div>
         </div>
      </div>
      
      <div>
         <jsp:include page="../common/footer.jsp"/>      <!-- footer -->
      </div>
   </body>
</html>