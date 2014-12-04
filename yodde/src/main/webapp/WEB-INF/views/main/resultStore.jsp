<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		
		<link rel="stylesheet" type="text/css" href="${root}/resources/css/commons/common.css"/>		<!-- footer, title css -->
		<link rel="stylesheet" type="text/css" href="${root}/resources/css/commons/category.css" />		<!-- category css -->
		<link rel="stylesheet" type="text/css" href="${root}/resources/css/main/main.css"/>					<!-- main css -->
		<script type="text/javascript" src="${root}/resources/scripts/jquery-2.1.1.js"></script>
		<script type="text/javascript">
			window.onload=category('${categoryName}')
			
			function category(query){
				//alert(query);
				var path = "${root}/resources/images/images/";
				var category = ["공공,사회기관","교육,학문","금융","서비스,산업","쇼핑,유통","건강,의료","생활,편의","숙박","문화,예술","스포츠,오락","식","교통,운서","카페,디저트"];
				//alert(category.length);
				
				
			 	for(i =0; i < category.length;i++){
					if(category[i]==query && $("#categoryImg").attr("src","")){
						path+="ct_"+(i+1)+".png"
						//alert(path);
					    $(document).ready(function() {
							$('#categoryImg').attr('src', path);
					    });
					}
				}

			 	
			}
		</script>
		
		
	</head>
   <body style="min-width:1260px;">
      <div>
         <jsp:include page="../common/title.jsp"/>         <!-- title -->
      </div>
      <div>
         <jsp:include page="searchBar.jsp"/>               <!-- searchBar -->
      </div>
      
		<script type="text/javascript" src="${root}/resources/scripts/jQueryWeb.js"></script> 
		<script type="text/javascript" src="${root}/resources/scripts/jQueryWeb2.js"></script>

      
      <div class="content">                           <!-- content -->
         <div class="RS_content">
            <div class="RS_box">
               <div class="RS_title">
					<div id = "categoryy"></div>
                  <img src="${root}/resources/images/images/ct_1.png" height="40px;" id="categoryImg"/>
                  <!-- 
                  <img src="./../images/ct_2.png" height="40px;"/>
                  <img src="./../images/ct_3.png" height="40px;"/>
                  <img src="./../images/ct_4.png" height="40px;"/>
                  <img src="./../images/ct_5.png" height="40px;"/>
                  <img src="./../images/ct_6.png" height="40px;"/>
                  <img src="./../images/ct_7.png" height="40px;"/>
                  <img src="./../images/ct_8.png" height="40px;"/>
                  <img src="./../images/ct_9.png" height="40px;"/>
                  <img src="./../images/ct_10.png" height="40px;"/>
                  <img src="./../images/ct_11.png" height="40px;"/>
                  <img src="./../images/ct_12.png" height="40px;"/>
                  <img src="./../images/ct_13.png" height="40px;"/>
                   -->
               </div>
               
   <div class="content">                           <!-- content -->
         <div class="HP_content">
            <div class="HP_box">
               <ul style="none;" class="HP_thumbnails">
               <c:forEach items="${storeDto}" var="storeDto">
                  <li class="HP_stores">               <!-- hotplace 추천 11111111 -->
                     <div class="HP_store_name" style="text-align:center;">
                        ${storeDto.storeName}
                     </div>
                     <span class="HP_store_address">
                        <span>${storeDto.address }</span>      <!-- 주소값 -->
                     </span>
                     <div class="HP_store_pic">
                        <a href="${root}/"><img src="${root}/resources/images/images/ex1.jpg" width="300px;"/></a>
                     </div>
                     <div class="HP_store_starrate">      <!-- 평점값 -->
						<span id="averageRate" class="input"></span>${storeDto.rate}
 		   			<script>
                   			$.fn.raty.defaults.path = '${root}/resources/images/images';
							$('#averageRate').raty({
								round : { down: .26, full: .6, up: .76 },
								halfShow : true,
								readOnly: true,
								starOff : 'history_btnOff.png',
								starOn  : 'history_btnOn.png',
								starHalf: 'history_half.png',
								score: ${storeDto.rate}
							});
					</script>
                     </div>
                     <div class="HP_store_reviewnum">
                        <span class="reviewnum_title">
                           <img src="${root}/resources/images/images/reviewnum_title.png" height="40px;">
                        </span>
                     </div>
                  </li>
               </c:forEach>
               </ul>
            </div>
         </div>
      </div>      
      
      
               
               <div class="RS_Category">
                  <jsp:include page="resultCategory.jsp"/>   
               </div>
            </div>
         </div>
      </div>
      
      <div>
         <jsp:include page="../common/footer.jsp"/>      <!-- footer -->
      </div>
   </body>
</html>