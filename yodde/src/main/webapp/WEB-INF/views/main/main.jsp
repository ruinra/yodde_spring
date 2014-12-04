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
		<link rel="stylesheet" type="text/css" href="${root}/resources/css/commons/common.css"/>		<!-- footer, title css -->
		<link rel="stylesheet" type="text/css" href="${root}/resources/css/commons/category.css" />		<!-- category css -->
		<link rel="stylesheet" type="text/css" href="${root}/resources/css/main/main.css"/>			<!-- main css -->
		<link rel="stylesheet" type="text/css" href="${root}/resources/css/main/demo.css" />
		<link rel="stylesheet" type="text/css" href="${root}/resources/css/main/elastislide.css" />
		<script src="${root}/resources/scripts/modernizr.custom.17475.js"></script>
	</head>
	<body>
		<c:choose>
         <c:when test="${email==''}">
            <c:set var="email" value="" scope="session"/>
            <c:set var="nick" value="" scope="session"/>
            <c:set var="profilePic" value="" scope="session"/>
            <c:set var="status" value="" scope="session"/>
         </c:when>
         <c:otherwise>
            <c:set var="email" value="${email}" scope="session"/>
            <c:set var="nick" value="${nick}" scope="session"/>
            <c:set var="profilePic" value="${profilePic}" scope="session"/>
			<c:set var="status" value="${status}" scope="session"/>
         </c:otherwise>
      </c:choose>
		<div>
			<jsp:include page="../common/title.jsp"/>		<!-- title -->
		</div>
		<div>
			<jsp:include page="searchBar.jsp"/>				<!-- searchBar -->
		</div>
		
		<div class="content">
			<div class="main_content">
			
				<div class="store_box">
					<div class="store_box_title">
						<img src="${root}/resources/images/images/1_HOT.png" height="40"> 핫플레이스!
					</div>
					<div class="stores" id="pic_slide">
						<div class="slide_title">
							<ul id="carousel1" class="elastislide-list">
								<li class="main_recommend">
									<a href="#">
										<div class="pic1" style="background: url(/home/resources/images/images/ex1.jpg); background-size: 250px;">
											<div class="text">
												<span class="tit">7Train</span><br/>
												<span class="add">강남역 11번 출구</span>
											</div>
										</div>
									</a>
								</li>
								<li class="main_recommend">
									<a href="#">
										<div class="pic1" style="background: url(/home/resources/images/images/ex2.jpg); background-size: 250px;">
											<div class="text">
												<span class="tit">코카콜라</span><br/>
												<span class="add">KOSTA~~</span>
											</div>
										</div>
									</a>
								</li>
								<li class="main_recommend">
									<a href="#">
										<div class="pic1" style="background: url(/home/resources/images/images/ex0.jpg); background-size: 250px;">
											<div class="text">
												<span class="tit">무한리필 고깃집</span><br/>
												<span class="add">새마을식당</span>
											</div>
										</div>
									</a>
								</li>
								<li class="main_recommend">
									<a href="#">
										<div class="pic1" style="background: url(/home/resources/images/images/ex3.jpg); background-size: 250px;">
											<div class="text">
												<span class="tit">호식이 두마리</span><br/>
												<span class="add">나영이집</span>
											</div>
										</div>
									</a>
								</li>
								<li class="main_recommend">
									<a href="#">
										<div class="pic1" style="background: url(/home/resources/images/images/ex4.jpg); background-size: 250px;">
											<div class="text">
												<span class="tit">눈꽃빙수</span><br/>
												<span class="add">valley's coffee</span>
											</div>
										</div>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				
				<div class="store_box">
					<div class="store_box_title">
						<img src="${root}/resources/images/images/2_REGION.png" height="40"> 지역 중심 상점
					</div>
					<div class="stores" id="pic_slide">
						<div class="slide_title">
							<ul id="carousel2" class="elastislide-list">
								<li class="main_recommend">
									<a href="#">
										<div class="pic1" style="background: url(/home/resources/images/images/ex1.jpg); background-size: 250px;">
											<div class="text">
												<span class="tit">7Train</span><br/>
												<span class="add">강남역 11번 출구</span>
											</div>
										</div>
									</a>
								</li>
								<li class="main_recommend">
									<a href="#">
										<div class="pic1" style="background: url(/home/resources/images/images/ex2.jpg); background-size: 250px;">
											<div class="text">
												<span class="tit">코카콜라</span><br/>
												<span class="add">KOSTA~~</span>
											</div>
										</div>
									</a>
								</li>
								<li class="main_recommend">
									<a href="#">
										<div class="pic1" style="background: url(/home/resources/images/images/ex0.jpg); background-size: 250px;">
											<div class="text">
												<span class="tit">무한리필 고깃집</span><br/>
												<span class="add">새마을식당</span>
											</div>
										</div>
									</a>
								</li>
								<li class="main_recommend">
									<a href="#">
										<div class="pic1" style="background: url(/home/resources/images/images/ex3.jpg); background-size: 250px;">
											<div class="text">
												<span class="tit">호식이 두마리</span><br/>
												<span class="add">나영이집</span>
											</div>
										</div>
									</a>
								</li>
								<li class="main_recommend">
									<a href="#">
										<div class="pic1" style="background: url(/home/resources/images/images/ex4.jpg); background-size: 250px;">
											<div class="text">
												<span class="tit">눈꽃빙수</span><br/>
												<span class="add">valley's coffee</span>
											</div>
										</div>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				
				<div class="store_box">
					<div class="store_box_title">
						<img src="${root}/resources/images/images/3_LIKES.png" height="40"> 좋아요 많은 리뷰
					</div>
					<div class="stores" id="pic_slide">
						<div class="slide_title">
							<ul id="carousel3" class="elastislide-list">
								<li class="main_recommend">
									<a href="#">
										<div class="pic1" style="background: url(/home/resources/images/images/ex1.jpg); background-size: 250px;">
											<div class="text">
												<span class="tit">7Train</span><br/>
												<span class="add">강남역 11번 출구</span>
											</div>
										</div>
									</a>
								</li>
								<li class="main_recommend">
									<a href="#">
										<div class="pic1" style="background: url(/home/resources/images/images/ex2.jpg); background-size: 250px;">
											<div class="text">
												<span class="tit">코카콜라</span><br/>
												<span class="add">KOSTA~~</span>
											</div>
										</div>
									</a>
								</li>
								<li class="main_recommend">
									<a href="#">
										<div class="pic1" style="background: url(/home/resources/images/images/ex0.jpg); background-size: 250px;">
											<div class="text">
												<span class="tit">무한리필 고깃집</span><br/>
												<span class="add">새마을식당</span>
											</div>
										</div>
									</a>
								</li>
								<li class="main_recommend">
									<a href="#">
										<div class="pic1" style="background: url(/home/resources/images/images/ex3.jpg); background-size: 250px;">
											<div class="text">
												<span class="tit">호식이 두마리</span><br/>
												<span class="add">나영이집</span>
											</div>
										</div>
									</a>
								</li>
								<li class="main_recommend">
									<a href="#">
										<div class="pic1" style="background: url(/home/resources/images/images/ex4.jpg); background-size: 250px;">
											<div class="text">
												<span class="tit">눈꽃빙수</span><br/>
												<span class="add">valley's coffee</span>
											</div>
										</div>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				
				<div class="store_box">
					<div class="store_box_title">
						<img src="${root}/resources/images/images/4_NEW.png" height="40"> 새로 오픈한 상점
					</div>
					<div class="stores" id="pic_slide">
						<div class="slide_title">
							<ul id="carousel4" class="elastislide-list">
								<li class="main_recommend">
									<a href="#">
										<div class="pic1" style="background: url(/home/resources/images/images/ex1.jpg); background-size: 250px;">
											<div class="text">
												<span class="tit">7Train</span><br/>
												<span class="add">강남역 11번 출구</span>
											</div>
										</div>
									</a>
								</li>
								<li class="main_recommend">
									<a href="#">
										<div class="pic1" style="background: url(/home/resources/images/images/ex2.jpg); background-size: 250px;">
											<div class="text">
												<span class="tit">코카콜라</span><br/>
												<span class="add">KOSTA~~</span>
											</div>
										</div>
									</a>
								</li>
								<li class="main_recommend">
									<a href="#">
										<div class="pic1" style="background: url(/home/resources/images/images/ex0.jpg); background-size: 250px;">
											<div class="text">
												<span class="tit">무한리필 고깃집</span><br/>
												<span class="add">새마을식당</span>
											</div>
										</div>
									</a>
								</li>
								<li class="main_recommend">
									<a href="#">
										<div class="pic1" style="background: url(/home/resources/images/images/ex3.jpg); background-size: 250px;">
											<div class="text">
												<span class="tit">호식이 두마리</span><br/>
												<span class="add">나영이집</span>
											</div>
										</div>
									</a>
								</li>
								<li class="main_recommend">
									<a href="#">
										<div class="pic1" style="background: url(/home/resources/images/images/ex4.jpg); background-size: 250px;">
											<div class="text">
												<span class="tit">눈꽃빙수</span><br/>
												<span class="add">valley's coffee</span>
											</div>
										</div>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				
				<c:if test="${email != ''}">
				
					<div class="store_box">
					<div class="store_box_title">
						<img src="${root}/resources/images/images/4_NEW.png" height="40"> 새로 오픈한 상점
					</div>
					<div class="stores" id="pic_slide">
						<div class="slide_title">
							<ul id="carousel5" class="elastislide-list">
								<li class="main_recommend">
									<a href="#">
										<div class="pic1" style="background: url(/home/resources/images/images/ex1.jpg); background-size: 250px;">
											<div class="text">
												<span class="tit">7Train</span><br/>
												<span class="add">강남역 11번 출구</span>
											</div>
										</div>
									</a>
								</li>
								<li class="main_recommend">
									<a href="#">
										<div class="pic1" style="background: url(/home/resources/images/images/ex2.jpg); background-size: 250px;">
											<div class="text">
												<span class="tit">코카콜라</span><br/>
												<span class="add">KOSTA~~</span>
											</div>
										</div>
									</a>
								</li>
								<li class="main_recommend">
									<a href="#">
										<div class="pic1" style="background: url(/home/resources/images/images/ex0.jpg); background-size: 250px;">
											<div class="text">
												<span class="tit">무한리필 고깃집</span><br/>
												<span class="add">새마을식당</span>
											</div>
										</div>
									</a>
								</li>
								<li class="main_recommend">
									<a href="#">
										<div class="pic1" style="background: url(/home/resources/images/images/ex3.jpg); background-size: 250px;">
											<div class="text">
												<span class="tit">호식이 두마리</span><br/>
												<span class="add">나영이집</span>
											</div>
										</div>
									</a>
								</li>
								<li class="main_recommend">
									<a href="#">
										<div class="pic1" style="background: url(/home/resources/images/images/ex4.jpg); background-size: 250px;">
											<div class="text">
												<span class="tit">눈꽃빙수</span><br/>
												<span class="add">valley's coffee</span>
											</div>
										</div>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				
				<div class="store_box">
					<div class="store_box_title">
						<img src="${root}/resources/images/images/4_NEW.png" height="40"> 새로 오픈한 상점
					</div>
					<div class="stores" id="pic_slide">
						<div class="slide_title">
							<ul id="carousel6" class="elastislide-list">
								<li class="main_recommend">
									<a href="#">
										<div class="pic1" style="background: url(/home/resources/images/images/ex1.jpg); background-size: 250px;">
											<div class="text">
												<span class="tit">7Train</span><br/>
												<span class="add">강남역 11번 출구</span>
											</div>
										</div>
									</a>
								</li>
								<li class="main_recommend">
									<a href="#">
										<div class="pic1" style="background: url(/home/resources/images/images/ex2.jpg); background-size: 250px;">
											<div class="text">
												<span class="tit">코카콜라</span><br/>
												<span class="add">KOSTA~~</span>
											</div>
										</div>
									</a>
								</li>
								<li class="main_recommend">
									<a href="#">
										<div class="pic1" style="background: url(/home/resources/images/images/ex0.jpg); background-size: 250px;">
											<div class="text">
												<span class="tit">무한리필 고깃집</span><br/>
												<span class="add">새마을식당</span>
											</div>
										</div>
									</a>
								</li>
								<li class="main_recommend">
									<a href="#">
										<div class="pic1" style="background: url(/home/resources/images/images/ex3.jpg); background-size: 250px;">
											<div class="text">
												<span class="tit">호식이 두마리</span><br/>
												<span class="add">나영이집</span>
											</div>
										</div>
									</a>
								</li>
								<li class="main_recommend">
									<a href="#">
										<div class="pic1" style="background: url(/home/resources/images/images/ex4.jpg); background-size: 250px;">
											<div class="text">
												<span class="tit">눈꽃빙수</span><br/>
												<span class="add">valley's coffee</span>
											</div>
										</div>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				
				</c:if>
				
				<script type="text/javascript" src="${root}/resources/scripts/jquery.min.js"></script>
				<script type="text/javascript" src="${root}/resources/scripts/jquerypp.custom.js"></script>
				<script type="text/javascript" src="${root}/resources/scripts/jquery.elastislide.js"></script>
				<script type="text/javascript">
					$('#carousel1').elastislide();
					$('#carousel2').elastislide();
					$('#carousel3').elastislide();
					$('#carousel4').elastislide();
					$('#carousel5').elastislide();
					$('#carousel6').elastislide();
				</script>
				<script type="text/javascript"> 
					$.fn.getLeft = function() { 
					   var element = $(this).get(0); 
					   var x = 0; 
					   for ( var e = element; e; e = e.offsetParent) { 
					      x += e.offsetLeft; 
					   } 
					   return x; 
					}; 
					$.fn.getTop = function() { 
					   var element = $(this).get(0); 
					   var y = 0; 
					   for ( var e = element; e; e = e.offsetParent) { 
					      y += e.offsetTop; 
					   } 
					   return y; 
					}; 
					$(document).ready(function(){ 
					   $(".target").mouseenter(function(){ 
					      var left = $(this).getLeft();
					      var top = $(this).getTop(); 
					      var width = $(this).width(); 
					      var height = $(this).height(); 
					      var text = $(this).attr("text"); 
					      var overlay = $("<div id='overlay_"+$(this).index()+"' class='overlay'></div>"); 
					      overlay.css({ 
					         "left":left+"px", 
					         "top":top+"px", 
					         "width":width+"px", 
					         "height":height+"px", 
					         "line-height":height+"px", 
					         "display":"none" 
					         }).text(text).mouseleave(function(){ 
					         $(".overlay").fadeOut(function(){ 
					            $(this).remove(); 
					         }); 
					      }).appendTo($("body")).fadeIn(); 
					   }); 
					   $("#images").css({ 
					      "width":($(".target").eq(0).width()*3)+"px", 
					      "margin-left":Math.max(($(window).width()/2-($(".target").eq(0).width()*3)/2),0)+"px", 
					      "margin-top":Math.max(($(window).height()/2 -($(".target").eq(0).height()*(Math.ceil($(".target").size()/3)))/2),0)+"px" 
					   }); 
					   $(window).resize(function(){ 
					      $(".overlay").remove(); 
					      setResize(); 
					   }); 
					}); 
					var setResize = function(){ 
					   $("#images").css({ 
					      "margin-left":Math.max(($(window).width()/2-($(".target").eq(0).width()*3)/2),0)+"px", 
					      "margin-top":Math.max(($(window).height()/2 -($(".target").eq(0).height()*(Math.ceil($(".target").size()/3)))/2),0)+"px" 
					   }); 
					} 
				</script>
				
				<script type="text/javascript" src="${root}/resources/scripts/jQueryWeb.js"></script> 
				<script type="text/javascript" src="${root}/resources/scripts/jQueryWeb2.js"></script>
			</div>
		</div>
		
		<div>
			<jsp:include page="../common/footer.jsp"/>			<!-- footer -->
		</div>
	</body>
</html>