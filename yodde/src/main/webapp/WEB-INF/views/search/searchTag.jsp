<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${root}/resources/css/commons/common.css" />
<!-- footer, title css -->
<link rel="stylesheet" type="text/css" href="${root}/resources/css/commons/category.css" />
<!-- category css -->
<link rel="stylesheet" type="text/css" href="${root}/resources/css/main/main.css" />
<!-- main css -->
<link rel="stylesheet" type="text/css" href="${root}/resources/css/store/store.css" />
<!-- search css -->
<link rel="stylesheet" href="search.css" type="text/css" />
</head>
<body>
   <div>
      <jsp:include page="../common/title.jsp" />
      <!-- title -->
   </div>
   <div>
		<jsp:include page="../main/searchBar.jsp"/>			<!-- searchBar -->
	</div>

   <div class="content">
      <div class="picCollection_content">
         <div class="result_img">
            <!--  result title-->
            <img src="${root}/resources/images/images/about.png" height="55" /> <span
               class="result_value"> <!-- 검색해서 넘어온 가게 이름 7Train -->
            </span>
         </div>

         <div>
            <!-- 리뷰에 쓰인 이미지들 모아서 보여주기 -->
            <div id="page">
               <div id="gallery">
                  <div id="thumbs">
                     <img src="${root}/resources/images/images/ex1.jpg" alt="" /> 
                     <img src="${root}/resources/images/images/ex2.jpg" alt="" />
                     <img src="${root}/resources/images/images/ex3.jpg" alt="" /> 
                     <img src="${root}/resources/images/images/ex4.jpg" alt="" />
                     <img src="${root}/resources/images/images/ex2.jpg" alt="" /> 
                     <img src="${root}/resources/images/images/ex1.jpg" alt="" />
                     <img src="${root}/resources/images/images/ex3.jpg" alt="" /> 
                     <img src="${root}/resources/images/images/ex4.jpg" alt="" />
                     <img src="${root}/resources/images/images/ex1.jpg" alt="" /> 
                     <img src="${root}/resources/images/images/ex3.jpg" alt="" />
                     <img src="${root}/resources/images/images/ex2.jpg" alt="" />
                     <img src="${root}/resources/images/images/ex1.jpg" alt="" />
                     <img src="${root}/resources/images/images/ex2.jpg" alt="" />
                     <img src="${root}/resources/images/images/ex3.jpg" alt="" />
                     <img src="${root}/resources/images/images/ex4.jpg" alt="" />
                     <img src="${root}/resources/images/images/ex1.jpg" alt="" />
                     <img src="${root}/resources/images/images/ex2.jpg" alt="" />
                     <img src="${root}/resources/images/images/ex3.jpg" alt="" />
                     <img src="${root}/resources/images/images/ex4.jpg" alt="" />
                     <img src="${root}/resources/images/images/ex1.jpg" alt="" />
                     <img src="${root}/resources/images/images/ex2.jpg" alt="" />
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>

   <div>
      <jsp:include page="../common/footer.jsp" />
      <!-- footer -->
   </div>
</body>
</html>