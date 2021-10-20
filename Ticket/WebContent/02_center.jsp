<%@page import="ticket.managerDAO"%>
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
<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=API키" ></script>
<script src="https://maps.googleapis.com/maps/api/js?key=API키&callback=initMap&libraries=&v=weekly" async></script>


<style type="text/css">
   /* Set the size of the div element that contains the map */
   #map {
       height: 800px;
       width: 100%;
   }
</style>
</head>
 
<body>
<h2>어디로 여행 가시나요?</h2>
<h6>위도 : <span id="latitude"></span> 경도 : <span id="longitude"></span></h6>
<%
	ArrayList<locationDTO> location = managerDAO.instance.getAlllocation();
	int size = location.size();
	
	int[] t_number = new int[size];
	String[] t_name= new String[size];
	String[] t_category = new String[size];
	String[] y_pos = new String[size];
	String[] x_pos = new String[size];
	
	for(int i=0; i<location.size(); i++){
		locationDTO bean = location.get(i);
		
		t_number[i] = bean.getTicket_number();
		t_name[i] = bean.getTicket_name();
		t_category[i] = bean.getTicket_category();
		y_pos[i] = bean.getY_position();
		x_pos[i] = bean.getX_position();
	}
%>


    <script>
    var latitude=0;
    var longitude=0;
    
    // 현재 위치 추적
	$(document).ready(function(){
		if ("geolocation" in navigator) {	// geolocation 사용 가능 
			navigator.geolocation.getCurrentPosition(function(data) {
				latitude = data.coords.latitude;
				longitude = data.coords.longitude;
				$('#latitude').text(latitude);
				$('#longitude').text(longitude);
			}, function(error) {
				alert(error);
			}, {
				enableHighAccuracy: true,
				timeout: Infinity,
				maximumAge: 0
			});
		} else {	// geolocation 사용 불가능
			alert('geolocation 사용 불가능');
		}
	});
    
    var ti_name = new Array();
    var y_posi = new Array();
    var x_posi = new Array();
    
    <%for(int i=0; i<size; i++){%>
    	ti_name.push('<%=t_name[i]%>');
    <%}%>
    <%for(int i=0; i<size; i++){%>
    	y_posi.push('<%=y_pos[i]%>');
    <%}%>
    <%for(int i=0; i<size; i++){%>
    	x_posi.push('<%=x_pos[i]%>');
    <%}%>
    
    function initMap() {

        const map = new google.maps.Map(document.getElementById("map"), {
            zoom: 14,
            center: { lat: 37.5407622, lng: 127.0706095 },
        });

        for (var i = 0; i < "<%=size %>"; i++) {
            var marker = new google.maps.Marker({
                map: map,
                label: ti_name[i],
                position: new google.maps.LatLng(y_posi[i], x_posi[i]),
            });
        }
    }
        
    </script>
    
    <div id="map"></div>

</body>

</html>