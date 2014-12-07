<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<script>
			//var cate1 = ["공공,사회기관", "교육,학문", "금융", "서비스,산업", "쇼핑,유통", "건강,의료", "생활,편의", "숙박", "문화,예술", "스포츠,오락", "식", "교통,운수", "카페,디저트"]
			var cate2 = [																//전체 : 94
			             "관공서", "도서관", "우체국", 										//공공,사회기관 : 3
			             "어린이집", "학원", "어학원", "스포츠", "예술", "직업/기술학원", "기타",		//교육,학문 : 7
			             "은행", "신협", "저축은행", "기타",									//금융 : 4
			             "자동차", "자전거", "스키,보드",										//서비스,산업 : 3
			             "마트/슈퍼", "재래시장", "편의점",										//쇼핑,유통 : 3
			             "치과", "피부과", "한의원", "내과", "보건소", "비뇨기과", "산부인과", "성형외과", "소아과", "신경외과", "안과", "외과", "응급실", "이비인후과", "정신과", "정형외과", "종합/대학병원", "기타",	//건강,의료 : 18
			             "백화점/면세점", "목욕/찜질방", "헬스/체육시설", "사진", "헤어샵", "화장품", "수선", "세탁소", "미용", "안경점", "펫샵", "자전거", "문구점", "꽃집", "철물점", "부동산", "수리/AS", "운세/사주", "약국",	//생활,편의 : 19
			             "게스트하우스", "펜션", "호텔", "유스호스텔", "콘도/리조트", "캠핑장",			//숙박 : 6
						 "영화관", "공연장",													//문화,예술 : 2
						 "PC방", "스크린골프", "볼링장", "멀티방", "노래방", "당구장", "기타 레포츠", 	//스포츠,오락 : 7
						 "한식", "양식", "일식", "중식", "치킨", "패밀리레스토랑", "패스트푸드", "세계요리", "분식", "뷔페", "도시락", "배달음식", "술집", "퓨전음식",		//음식 : 14
						 "차량정비", "주유소", "LPG충전소", "주차장", "세차장",						//교통,운수 : 5
						 "까페/디저트", "베이커리", "키즈까페"									//카페,디저트 : 3
						 ]

			function addCategory(startNum, endNum){
				$(document).ready(function(){
					for(var i=startNum; i<=endNum; i++){
						//alert(cate2[i]);
						$('#add_here').append("<div class='small_Category'><a href='${root}/categorySearch?categoryLevel=category2&category="+cate2[i]+"'>"+cate2[i]+"</a></div>");
					}
				});
			}
		</script>
		
		<c:if test="${categoryName eq '공공,사회기관'}">				<!-- 첫번째 카테고리 : 공공기관 -->
			<script>addCategory(0, 2);</script>
		</c:if>
		
		<c:if test="${categoryName eq '교육,학문'}">				<!-- 첫번째 카테고리 : 교육,학문 -->
			<script>addCategory(3, 9);</script>
		</c:if>
		
		<c:if test="${categoryName eq '금융'}">					<!-- 첫번째 카테고리 : 금융 -->
			<script>addCategory(10, 13);</script>
		</c:if>
		
		<c:if test="${categoryName eq '서비스,산업'}">				<!-- 첫번째 카테고리 : 서비스,산업 -->
			<script>addCategory(14, 16);</script>
		</c:if>
		
		<c:if test="${categoryName eq '쇼핑,유통'}">				<!-- 첫번째 카테고리 : 쇼핑,유통 -->
			<script>addCategory(17, 19);</script>
		</c:if>
		
		<c:if test="${categoryName eq '건강,의료'}">				<!-- 첫번째 카테고리 : 건강,의료 -->
			<script>addCategory(20, 37);</script>
		</c:if>
		
		<c:if test="${categoryName eq '생활,편의'}">				<!-- 첫번째 카테고리 : 생활,편의 -->
			<script>addCategory(38, 56);</script>
		</c:if>
		
		<c:if test="${categoryName eq '숙박'}">					<!-- 첫번째 카테고리 : 숙박 -->
			<script>addCategory(57, 62);</script>
		</c:if>
		
		<c:if test="${categoryName eq '문화,예술'}">				<!-- 첫번째 카테고리 : 문화,예술 -->
			<script>addCategory(63, 64);</script>
		</c:if>
		
		<c:if test="${categoryName eq '스포츠,오락'}">				<!-- 첫번째 카테고리 : 스포츠,오락 -->
			<script>addCategory(65, 71);</script>
		</c:if>
		
		<c:if test="${categoryName eq '식'}">					<!-- 첫번째 카테고리 : 식 -->
			<script>addCategory(72, 85);</script>
		</c:if>
		
		<c:if test="${categoryName eq '교통,운수'}">				<!-- 첫번째 카테고리 : 교통,운수 -->
			<script>addCategory(86, 90);</script>
		</c:if>
		
		<c:if test="${categoryName eq '카페,디저트'}">				<!-- 첫번째 카테고리 : 카페,디저트 -->
			<script>addCategory(91, 93);</script>
		</c:if>
		
		<div id="add_here"></div>
	</body>
</html>