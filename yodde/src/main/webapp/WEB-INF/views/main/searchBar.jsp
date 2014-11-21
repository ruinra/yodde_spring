<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<script type="text/javascript" src="${root}/resources/scripts/jquery-2.1.1.js"></script>
<script type="text/javascript">
	function search(){
		var query=$("#query").val();
		//alert(query);

		if(query.match("@")){
			query=query.substring(1, query.length);
			$(location).attr("href", "${root}/searchMember?query=" + query);
		}else if(query.match("#")){
			query=query.substring(1, query.length);
			$(location).attr("href", "${root}/searchTag?query=" + query);
		}else{
			$(location).attr("href", "${root}/searchStore?query=" + query);
		} 
	}
</script>
	<body>
		<div class="search_bar">
			<span class="option_btn">
				<a href="#">
					<img src="${root}/resources/images/images/option.png" height="47">
				</a>
			</span>
			<span id="search">
				<input type="text" id="query" class="input_text" tabindex="5" style="ime-mode: active;" 
					placeholder=" STORE/#TAG/@NICKNAME" onfocus="this.placeholder=''" 
					onblur="this.placeholder=' STORE/#TAG/@NICKNAME'"/>
			</span>
			<span class="enter_btn">
				<a href="javascript:search()">
					<img src="${root}/resources/images/images/enter.png" height="50">
					
				</a>
			</span>
		</div>
	</body>
</html>