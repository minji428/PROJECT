<%@page import="ticket.locationDAO"%>
<%@page import="ticket.locationDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyBf8mgQPFOOLKCLCmEDFYhKpIBVUpPfV_o" ></script>

<style>
#map_ma {width:100%; height:800px; clear:both; border:solid 1px red;}
</style>
</head>

<body>
<h2>어디로 여행 가시나요?</h2>
<%
	ArrayList<locationDTO> location = locationDAO.instance.getAlllocation();
%>
<div id="map_ma"></div>
	
<script type="text/javascript">
	
	$(document).ready(function() {
		var myLatlng = new google.maps.LatLng(37.5111200000, 127.09597300000); // 위치값 위도 경도
	var Y_point			= 37.5111200000;		// Y 좌표
	var X_point			= 127.09597300000;		// X 좌표
	var markerTitle		= "롯데월드";		// 현재 위치 마커에 마우스를 오버을때 나타나는 정보
	var zoomLevel		= 18;				// 지도의 확대 레벨 : 숫자가 클수록 확대정도가 큼
	var markerMaxWidth	= 300;				// 마커를 클릭했을때 나타나는 말풍선의 최대 크기

// 말풍선 내용
	var contentString	= '<div>' +
	'<h2>롯데월드 아이스링크</h2>'+
	'<p>안녕하세요. 구글지도입니다.</p>' +
	'</div>';
	
	var myLatlng = new google.maps.LatLng(Y_point, X_point);
	var mapOptions = {
						zoom: zoomLevel,
						center: myLatlng,
						mapTypeId: google.maps.MapTypeId.ROADMAP
					}
	var map = new google.maps.Map(document.getElementById('map_ma'), mapOptions);
	var marker = new google.maps.Marker({
											position: myLatlng,
											map: map,
											title: markerTitle
	});
	var infowindow = new google.maps.InfoWindow(
												{
													content: contentString,
													maxWizzzdth: markerMaxWidth
												}
			);
	google.maps.event.addListener(marker, 'click', function() {
		infowindow.open(map, marker);
	});
});
</script>
</body>

</html>