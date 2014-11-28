<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Insert title here</title>
      <link rel="stylesheet" type="text/css" href="../common/common.css"/>      <!-- footer, title css -->
      <link rel="stylesheet" type="text/css" href="../common/category.css" />      <!-- category css -->
      <link rel="stylesheet" type="text/css" href="../main/main.css"/>         <!-- main css -->
   </head>
   <body style="min-width:1260px;">
      <div>
         <jsp:include page="../common/title.jsp"/>         <!-- title -->
      </div>
      <div>
         <jsp:include page="../main/searchBar.jsp"/>         <!-- searchBar -->
      </div>
      
    
      <div class="content">                           <!-- content -->
         <div class="HR_content">					
            <div class="HR_box">
               <div class="HR_title">					<!-- latestFollowReview title -->
                  <img src="./../images/manyLikes.png" height="40px;"/>		<!-- image change -->
                  <!-- FollowReview timeline -->
               </div>
               
               <div class="HR_board">
 					<!-- 첫번째 댓글 예시 -->
 					<div class="HR_storeimg">			<!-- 첫번째 리뷰 해당 스토어img -->
 						<img src="./../images/dechoco.jpg" style="width:170px; height:150px;">
 						<span class="HRstore_name">
 							디초콜릿 판교점
 						</span>
 					</div>
 					
 					<div class="HReview" >							<!-- DB에서 리뷰 받아와서 뿌려줌 -->
						
						<span class="HReviewer_profile">
							<span class="review_content">			<!-- 리뷰어 내용 -->
								<span class="HR_starrate">
									<img src="./../images/starrate_ex.png" height="25">
								</span>
								<span class="updown_position" style="min-width:106px;">		<!-- 리뷰 찬반 -->
									<a href=""><img src="./../images/up.png" height="30"></a>
										50
									<a href=""><img src="./../images/down.png" height="30"></a>
										0
								</span>
								<p class="HRscroll_tag">아메리카노 1+1<br/> 꿀맛<br/>
								ㅋ<br/>ㅋㅋㅋ<br/>ㅋㅋㅋㅋ<br/>ㅋㅋ<br/>ㅋ</p>
								<span>
									<span class="HR_photo_position">			<!-- 리뷰에 첨부된 사진들 -->
										<a href=""><img src="./../images/pic1.png" height="40"></a>
										<a href=""><img src="./../images/pic2.png" height="40"></a>
										<a href=""><img src="./../images/pic3.png" height="40"></a>
									</span>
									
								</span>
						
							</span>
							<span class="profile">			<!-- 리뷰어 프로필사진 -->
								<img src="./../images/profile.png" height="100">
							</span>
							<span class="HReviewer_NICK">	<!-- 리뷰어 닉네임 -->
								예쁜나영이
							</span>
						</span>
					</div>
 					
 					
 					
 					<!-- 두번째 댓글 예시 -->
					
					<div class="HR_storeimg">			<!-- 두번째 리뷰 해당 스토어img -->
						<img src="./../images/bono.jpg" style="width:170px; height:150px;">
						<span class="HRstore_name">			<!-- 해당스토어 이름 -->
								보노보노 삼성점
						</span>
					</div>
					<div class="HReview">							<!-- DB에서 리뷰 받아와서 뿌려줌 -->
						<span class="HReviewer_profile">
							<span class="review_content">			<!-- 리뷰어 내용 -->
								<span class="HR_starrate">
									<img src="./../images/starrate_ex.png" height="25">
								</span>
								<span class="updown_position" style="min-width:106px;">		<!-- 리뷰 찬반 -->
									<a href=""><img src="./../images/up.png" height="30"></a>
										40
									<a href=""><img src="./../images/down.png" height="30"></a>
										3
								</span>
								<p class="HRscroll_tag">가격대비 별로인..그래도 해산물을 많이 먹을 수 있어서 좋았네^^</p>
								<span>
									<span class="HR_photo_position" style="min-width:150px;">			<!-- 리뷰에 첨부된 사진들 -->
										<a href=""><img src="./../images/pic1.png" height="40"></a>
										<a href=""><img src="./../images/pic2.png" height="40"></a>
										<a href=""><img src="./../images/pic3.png" height="40"></a>
										<a href=""><img src="./../images/pic4.png" height="40"></a>
										<a href=""><img src="./../images/pic1.png" height="40"></a>
									</span>
									
								</span>
								
							</span>
							<span class="profile">			<!-- 리뷰어 프로필사진 -->
								<img src="./../images/profile.png" height="100">
							</span>
							<span class="HReviewer_NICK">	<!-- 리뷰어 닉네임 -->
								두번째나영이
							</span>
						</span>
					</div>
					
										<!-- 세번째 댓글 예시 -->
										
					<div class="HR_storeimg">			<!-- 세번째 리뷰 해당 스토어img -->
						<img src="./../images/yamu.jpg" style="width:170px; height:150px;">
						<span class="HRstore_name">			<!-- 해당스토어 이름 -->
								야무진 경성대점
						</span>
					</div>
					<div class="HReview">							<!-- DB에서 리뷰 받아와서 뿌려줌 -->
						<span class="HReviewer_profile">
							<span class="review_content">			<!-- 리뷰어 내용 -->
								<span class="HR_starrate">
									<img src="./../images/starrate_ex.png" height="25">
								</span>
								<span class="updown_position" style="min-width:106px;">		<!-- 리뷰 찬반 -->
									<a href=""><img src="./../images/up.png" height="30"></a>
										38
									<a href=""><img src="./../images/down.png" height="30"></a>
										3
								</span>
								<p class="HRscroll_tag">갈때마다 새로운 메뉴에 도전!!! 역시 기대에 부응해주는 맛!!!</p>
								<span>
									<span class="HR_photo_position" style="min-width:150px;">			<!-- 리뷰에 첨부된 사진들 -->
										<a href=""><img src="./../images/pic1.png" height="40"></a>
										<a href=""><img src="./../images/pic2.png" height="40"></a>
									</span>
								</span>
								
							</span>
							<span class="profile">			<!-- 리뷰어 프로필사진 -->
								<img src="./../images/profile.png" height="100">
							</span>
							<span class="HReviewer_NICK">	<!-- 리뷰어 닉네임 -->
								세번째나영이
							</span>
						</span>
					</div>
					
										<!-- 네번째 댓글 예시 -->
					<div class="HR_storeimg">			<!-- 네번째 리뷰 해당 스토어img -->
						<img src="./../images/dechoco.jpg" style="width:170px; height:150px;">
						<span class="HRstore_name">			<!-- 해당스토어 이름 -->
								디초콜릿커피 서현점
						</span>
					</div>
					<div class="HReview">							<!-- DB에서 리뷰 받아와서 뿌려줌 -->
						<span class="HReviewer_profile">
							<span class="review_content">			<!-- 리뷰어 내용 -->
								<span class="HR_starrate">
									<img src="./../images/starrate_ex.png" height="25">
								</span>
								<span class="updown_position" style="min-width:106px;">		<!-- 리뷰 찬반 -->
									<a href=""><img src="./../images/up.png" height="30"></a>
										5
									<a href=""><img src="./../images/down.png" height="30"></a>
										5
								</span>
								<p class="HRscroll_tag">분위기만 좋은...^^ 미팅룸이 있어서 편한..?!ㅋㅋ</p>
								<span>
									<span class="HR_photo_position" style="min-width:150px;">			<!-- 리뷰에 첨부된 사진들 -->
										<a href=""><img src="./../images/pic1.png" height="40"></a>
										<a href=""><img src="./../images/pic2.png" height="40"></a>
										<a href=""><img src="./../images/pic3.png" height="40"></a>
										<a href=""><img src="./../images/pic4.png" height="40"></a>
										<a href=""><img src="./../images/pic1.png" height="40"></a>
									</span>
									
								</span>
								
							</span>
							<span class="profile">			<!-- 리뷰어 프로필사진 -->
								<img src="./../images/profile.png" height="100">
							</span>
							<span class="HReviewer_NICK">	<!-- 리뷰어 닉네임 -->
								네번째나영이
							</span>
						</span>
					</div>
					
										<!-- 다섯번째 댓글 예시 -->
										
					<div class="HR_storeimg">			<!-- 다섯번째 리뷰 해당 스토어img -->
						<img src="./../images/bono.jpg" style="width:170px; height:150px;">
						<span class="HRstore_name">			<!-- 해당스토어 이름 -->
								보노보노 마포점
						</span>
					</div>
					<div class="HReview">							<!-- DB에서 리뷰 받아와서 뿌려줌 -->
						<span class="HReviewer_profile">
							<span class="review_content">			<!-- 리뷰어 내용 -->
								<span class="HR_starrate">
									<img src="./../images/starrate_ex.png" height="25">
								</span>
								<span class="updown_position" style="min-width:106px;">		<!-- 리뷰 찬반 -->
									<a href=""><img src="./../images/up.png" height="30"></a>
										5
									<a href=""><img src="./../images/down.png" height="30"></a>
										5
								</span>
								<p class="HRscroll_tag">맛도좋고 분위기도 좋고 가격도 좋고...^^</p>
								<span>
									<span class="HR_photo_position" style="min-width:150px;">			<!-- 리뷰에 첨부된 사진들 -->
										<a href=""><img src="./../images/pic1.png" height="40"></a>
										<a href=""><img src="./../images/pic2.png" height="40"></a>
										<a href=""><img src="./../images/pic3.png" height="40"></a>
										<a href=""><img src="./../images/pic4.png" height="40"></a>
										<a href=""><img src="./../images/pic1.png" height="40"></a>
									</span>
									
								</span>
								
							</span>
							<span class="profile">			<!-- 리뷰어 프로필사진 -->
								<img src="./../images/profile.png" height="100">
							</span>
							<span class="HReviewer_NICK">	<!-- 리뷰어 닉네임 -->
								다섯째나영이
							</span>
						</span>
					</div>
					
										<!-- 여섯째 댓글 예시 -->
					<div class="HReview">							<!-- DB에서 리뷰 받아와서 뿌려줌 -->
						<span class="HReviewer_profile">
							<span class="review_content">			<!-- 리뷰어 내용 -->
								<span class="HR_starrate">
									<img src="./../images/starrate_ex.png" height="25">
								</span>
								<span class="updown_position" style="min-width:106px;">		<!-- 리뷰 찬반 -->
									<a href=""><img src="./../images/up.png" height="30"></a>
										5
									<a href=""><img src="./../images/down.png" height="30"></a>
										5
								</span>
								<p class="HRscroll_tag">별로 안존맛인데 뭔솔;;</p>
								<span>
									<span class="HR_photo_position" style="min-width:150px;">			<!-- 리뷰에 첨부된 사진들 -->
										<a href=""><img src="./../images/pic1.png" height="40"></a>
										<a href=""><img src="./../images/pic2.png" height="40"></a>
										<a href=""><img src="./../images/pic3.png" height="40"></a>
										<a href=""><img src="./../images/pic4.png" height="40"></a>
										<a href=""><img src="./../images/pic1.png" height="40"></a>
									</span>
									
								</span>
							
							</span>
							<span class="profile">			<!-- 리뷰어 프로필사진 -->
								<img src="./../images/profile.png" height="100">
							</span>
							<span class="HReviewer_NICK">	<!-- 리뷰어 닉네임 -->
								육번째나영이
							</span>
						</span>
					</div>
					
										<!-- 일곱번째 댓글 예시 -->
					<div class="HReview">							<!-- DB에서 리뷰 받아와서 뿌려줌 -->
						<span class="HReviewer_profile">
							<span class="review_content">			<!-- 리뷰어 내용 -->
								<span class="HR_starrate">
									<img src="./../images/starrate_ex.png" height="25">
								</span>
								<span class="updown_position" style="min-width:106px;">		<!-- 리뷰 찬반 -->
									<a href=""><img src="./../images/up.png" height="30"></a>
										5
									<a href=""><img src="./../images/down.png" height="30"></a>
										5
								</span>
								<p class="HRscroll_tag">별로 안존맛인데 뭔솔;;</p>
								<span>
									<span class="HR_photo_position" style="min-width:150px;">			<!-- 리뷰에 첨부된 사진들 -->
										<a href=""><img src="./../images/pic1.png" height="40"></a>
										<a href=""><img src="./../images/pic2.png" height="40"></a>
										<a href=""><img src="./../images/pic3.png" height="40"></a>
										<a href=""><img src="./../images/pic4.png" height="40"></a>
										<a href=""><img src="./../images/pic1.png" height="40"></a>
									</span>
									
								</span>
								
							</span>
							<span class="profile">			<!-- 리뷰어 프로필사진 -->
								<img src="./../images/profile.png" height="100">
							</span>
							<span class="HReviewer_NICK">	<!-- 리뷰어 닉네임 -->
								칠번째나영이
							</span>
						</span>
					</div>
					
										<!-- 팔번째 댓글 예시 -->
					<div class="HReview">							<!-- DB에서 리뷰 받아와서 뿌려줌 -->
						<span class="HReviewer_profile">
							<span class="review_content">			<!-- 리뷰어 내용 -->
								<span class="HR_starrate">
									<img src="./../images/starrate_ex.png" height="25">
								</span>
								<span class="updown_position" style="min-width:106px;">		<!-- 리뷰 찬반 -->
									<a href=""><img src="./../images/up.png" height="30"></a>
										5
									<a href=""><img src="./../images/down.png" height="30"></a>
										5
								</span>
								<p class="HRscroll_tag">별로 안존맛인데 뭔솔;;</p>
								<span>
									<span class="HR_photo_position" style="min-width:150px;">			<!-- 리뷰에 첨부된 사진들 -->
										<a href=""><img src="./../images/pic1.png" height="40"></a>
										<a href=""><img src="./../images/pic2.png" height="40"></a>
										<a href=""><img src="./../images/pic3.png" height="40"></a>
										<a href=""><img src="./../images/pic4.png" height="40"></a>
										<a href=""><img src="./../images/pic1.png" height="40"></a>
									</span>
									
								</span>
								
							</span>
							<span class="profile">			<!-- 리뷰어 프로필사진 -->
								<img src="./../images/profile.png" height="100">
							</span>
							<span class="HReviewer_NICK">	<!-- 리뷰어 닉네임 -->
								팔번째나영이
							</span>
						</span>
					</div>
					
										<!-- 구번째 댓글 예시 -->
					<div class="HReview">							<!-- DB에서 리뷰 받아와서 뿌려줌 -->
						<span class="HReviewer_profile">
							<span class="review_content">			<!-- 리뷰어 내용 -->
								<span class="HR_starrate">
									<img src="./../images/starrate_ex.png" height="25">
								</span>
								<span class="updown_position" style="min-width:106px;">		<!-- 리뷰 찬반 -->
									<a href=""><img src="./../images/up.png" height="30"></a>
										5
									<a href=""><img src="./../images/down.png" height="30"></a>
										5
								</span>
								<p class="HRscroll_tag">별로 안존맛인데 뭔솔;;</p>
								<span>
									<span class="HR_photo_position" style="min-width:150px;">			<!-- 리뷰에 첨부된 사진들 -->
										<a href=""><img src="./../images/pic1.png" height="40"></a>
										<a href=""><img src="./../images/pic2.png" height="40"></a>
										<a href=""><img src="./../images/pic3.png" height="40"></a>
										<a href=""><img src="./../images/pic4.png" height="40"></a>
										<a href=""><img src="./../images/pic1.png" height="40"></a>
									</span>
									
								</span>
						
							</span>
							<span class="profile">			<!-- 리뷰어 프로필사진 -->
								<img src="./../images/profile.png" height="100">
							</span>
							<span class="HReviewer_NICK">	<!-- 리뷰어 닉네임 -->
								구번째나영이
							</span>
						</span>
					</div>
					
               </div>
             </div>
         </div>
      </div>
      
      <div>
         <jsp:include page="../common/footer.jsp"/>      <!-- footer -->
      </div>
   </body>
</html>