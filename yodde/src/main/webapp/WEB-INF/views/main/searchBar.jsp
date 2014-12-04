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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script> 
   $(document).ready(function(){
      $("#flip").click(function(){
         $("#panel").slideToggle("slow");
      });
   });
</script>
<style> 
   #panel{
      text-align:center;
      border:solid 2px #c3c3c3;
      padding:10px;
      display:none;
      position: fixed;
      background-color:white;
   }
</style>
   <body>
      <div style="width:100%;">
         <ul class="search_bar">
            <li class="option_btn">
               <a href="#" style="font-size: 20px;" id="flip">
                  ▼ 
               </a>
    
               <div id="panel" >
                  <script>
                     var option = ["card.png", "delivery.png", "drive_through.png", "group.png", "kids.png", "parking.png",
                                   "reservation.png", "seating.png", "takeout.png", "toilet.png", "tv.png", "wifi.png"];
                     var optionUrl = [];
                     var j=0;
                     var url = "";
                     
                     for (i=0; i<option.length; i++){
                        optionUrl.push("${root}/resources/images/images_store_info/"+option[i]);
                        $(document).ready(function() {
	                        url ="url("+optionUrl[j]+")"
                        	//alert(j);
                        	//alert(url);
							$('#icon'+(j+1)).css('background-image', url);
							j++;
					    });
                     }
                     
                     function check(id){
                    	 var id = id;
                    	 alert(id);
                     }
                   </script>
               		<form action ="">
               		<div>
               			<c:forEach begin="0" end="11" varStatus="s">
               				<input type="checkbox" name="icon${s.count}" id="icon${s.count}" class="css-checkbox">
               				<label for="icon${s.count}" class="css-label"></label>
               			</c:forEach>
                  	</div>
               		</form>
               </div>
            </li>
            <li id="search" class="search">
               <input type="text" id="query" class="input_text" tabindex="5" style="ime-mode: active;"
                  placeholder=" STORE/#TAG/@NICKNAME" onfocus="this.placeholder=''" 
                  onblur="this.placeholder=' STORE/#TAG/@NICKNAME'" autocomplete="off"
                  onkeydown="if(event.keyCode==13){javascript:search();}"/>
            </li>
            <li class="enter_btn">
               <a href="javascript:search()">
                  <img src="${root}/resources/images/images/search4.png" height="40">
               </a>
            </li>
         </ul>
      </div>
   </body>
</html>