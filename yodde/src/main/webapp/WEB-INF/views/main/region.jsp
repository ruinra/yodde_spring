<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ul id="carousel2" class="elastislide-list">
	<c:forEach var="store" items="${storeList}">
		<li class="main_recommend">
			<a href="#">
				<!--<div class="pic1" style="background: url(/home/${store.profilePic}); background-size: 250px;">-->
				<div class="pic1" style="background: url(/home/resources/images/images/ex1.jpg); background-size: 250px;">
					<div class="text">					
						<span class="tit">${store.storeName}</span><br/>				
						<span class="add">${store.category1}</span>
					</div>
				</div>
			</a>
		</li>
	</c:forEach>
</ul>