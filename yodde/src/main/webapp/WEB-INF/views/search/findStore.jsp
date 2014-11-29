<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>요때</title>
	<c:set var="root" value="${pageContext.request.contextPath}"/>
	<link rel="stylesheet" type="text/css" href="${root}/resources/css/commons/common.css"/>		<!-- footer, title css -->
	<link rel="stylesheet" type="text/css" href="${root}/resources/css/commons/category.css" />		<!-- category css -->
	<link rel="stylesheet" type="text/css" href="${root}/resources/css/main/main.css"/>					<!-- main css -->
	<link rel="stylesheet" type="text/css" href="${root}/resources/css/search/search.css"/>					<!-- main css -->
</head>
<script type="text/javascript" src="${root}/resources/scripts/jquery-2.1.1.js"></script>
<script>
	var params = {"target" : "local", "query" : "", "display":5} // OpenAPI 요청변수 정의
	function callOpenAPI(query) {
		params.query = encodeURIComponent(query);
		var q = $.param(params);
		var ajax_url = "/home/proxy?" + q; // OpenAPI 요청 URL 구성
		$.ajax({ type: "get", url: ajax_url,
			contentType: "text/xml; charset=utf-8", dataType: "xml",
			error: function(xhr, status, error) { alert("error : " +status); },
			success: showResult }); // Ajax 호출 및 이벤트 핸들러 함수 정의
	}
	function showResult(xml) {// Ajax 호출 성공시 실행되는 함수
		var totalCount = $(xml).find("total").text(); // <total>값 추출
		$("#resultCount").text(totalCount + "건 검색"); // <total>값 표시
		$(xml).find("rss").find("channel").find("item").each(function(idx) {
			var title = $(this).find("title").text(); // <title>값 추출
			var category = $(this).find("category").text();
			var telephone = $(this).find("telephone").text();
			var address = $(this).find("address").text();
			var roadAddress = $(this).find("roadAddress").text();
			var mapx = $(this).find("mapx").text();
			var mapy = $(this).find("mapy").text();
			var item = "title="+ title + "&category="+ category + "&telephone=" + telephone + "&address=" + address + "&roadAddress=" + roadAddress + "&mapx=" + mapx + "&mapy=" + mapy;
			
			var info = "<div class='result_stores'>"
				info += "<div class='recommend' style='float:left'><a href='javascript:insertStore(\""+item+"\")'>" + "<img src='${root}/resources/images/images/ex1.jpg' height='180'></a></div>"
				info += "<div style='float:left; padding-left:20px; padding-top: 20px;'><a href='javascript:insertStore(\""+item+"\")'>" + title + "</a>" + "</br>" + category + "</br>" + telephone + "</br>" + address + "</br>" + roadAddress +"</div></div>";
				$("#result").append(info); // <title>값 표시
		});
	}
	function insertStore(item){				   		
		$(location).attr("href", "/home/getStoreInfo?" + item);
	}
</script>
	<body onload="javascript:callOpenAPI('${query}')">
		<div>
			<jsp:include page="../common/title.jsp"/>			<!-- title -->
		</div>
		
		<div>
			<jsp:include page="../main/searchBar.jsp"/>					<!-- searchBar -->
		</div>
		
		<script type="text/javascript" src="${root}/resources/scripts/jQueryWeb.js"></script> 
		<script type="text/javascript" src="${root}/resources/scripts/jQueryWeb2.js"></script>
		
		<div class="content">									<!-- content -->
			<div class="result_content">
				<ul class="result_img">						<!-- result title -->
					<li class="result_title_img">
						<img src="${root}/resources/images/images/about.png" height="30">
					</li>
					<li class="result_title_txt">
						${query}
					</li>
				</ul>
				
				<div id="resultCount" class="resultCount"></div>
					
				<div id="result"></div>
				
				<div class="request_Btn">
					<a href="${root}/requestRegStore"><img src="${root}/resources/images/images/request.png" height="20"></a>
				</div>
			</div>
		</div>
		
		<div>
			<jsp:include page="../common/footer.jsp"/>		<!-- footer -->
		</div>
	</body>
</html>