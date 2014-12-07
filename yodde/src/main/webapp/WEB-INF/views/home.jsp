<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<c:set var="root" value="${pageContext.request.contextPath}" />
<style type="text/css">
            html {
                height: 100%
            }
            body {
                height: 100%;
                margin: 0px;
                padding: 0px
            }
            #map_canvas {
                height: 100%
            }
 </style>
<!-- script 태그를 사용하여 Maps API 자바스크립트를 포함합니다. -->
<script type="text/javascript" src="${root}/resources/scripts/jquery-2.1.1.js"></script>
<script type="text/javascript" src="${root}/resources/scripts/jquery.raty.js"></script>
<script type="text/javascript" src="https://maps.google.com/maps/api/js?sensor=true">
// sensor = 사용자의 위치를 확인하는 데 센서를 사용할지 여부
</script>
<script type="text/javascript">
// Note that using Google Gears requires loading the Javascript
// at http://code.google.com/apis/gears/gears_init.js
            
        var initialLocation;
        var siberia = new google.maps.LatLng(60, 105);
        var newyork = new google.maps.LatLng(50.69847032728747, -73.9514422416687);
        var browserSupportFlag = new Boolean();
        
        function initialize(){
            // Try W3C Geolocation (Preferred)
            if (navigator.geolocation) {
                browserSupportFlag = true;                    
                navigator.geolocation.getCurrentPosition(function(position){
                	document.getElementById("lat").innerHTML=position.coords.latitude;
                	document.getElementById("lng").innerHTML=position.coords.longitude;
                	GoogleMap.initialize(position.coords.latitude, position.coords.longitude);
                }, function(){
                    handleNoGeolocation(browserSupportFlag);
                });
                // Try Google Gears Geolocation
            }            
			else {
			    browserSupportFlag = false;
			    handleNoGeolocation(browserSupportFlag);
			}
            
            GoogleMap = {initialize : function(latitude, logitude) {
            	var geocoder = new google.maps.Geocoder();
            	geocoder.geocode({'latLng': new google.maps.LatLng(latitude, logitude)},
            	function(result, status) {
            		
            		alert(result[2].formatted_address);
            	});
            	}
            }			            
            function handleNoGeolocation(errorFlag){
                if (errorFlag == true) {
                	document.getElementById("address").innerHTML="blank";	
                }
                else {
                	document.getElementById("lat").innerHTML="blank";
                }
            }
        }          
</script>
    </head>
    <body onload="initialize()">
        <div id="lat"></div>
        <div id="lng"></div>
        <div id="address"></div>
    </body>
</html>