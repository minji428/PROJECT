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
<!-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBf8mgQPFOOLKCLCmEDFYhKpIBVUpPfV_o&callback=initMap&libraries=&v=weekly&sensor=true" async></script>-->


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
<%
	ArrayList<locationDTO> location = locationDAO.instance.getAlllocation();
%>

    <script>
        function initMap() {

            const map = new google.maps.Map(document.getElementById("map"), {
                zoom: 14,
                center: { lat: 37.5407622, lng: 127.0706095 },
            });

            for (var i = 0; i < locations.length; i++) {
                var marker = new google.maps.Marker({
                    map: map,
                    label: locations[i].place,
                    position: new google.maps.LatLng(locations[i].lat, locations[i].lng),
                });
            }
        }
        const locations = [
            { place:"[송파]롯데월드 아이스링크", lat: 37.51112, lng: 127.095973 },
            { place:"[마포]미스터힐링", lat: 37.5403412, lng: 126.9487133 },
            { place:"[안덕]카멜리아힐", lat: 33.288974, lng: 126.370141 },
            { place:"[서귀포]윈드카트", lat: 33.289068, lng: 126.587548 },
            { place:"[조천]에코랜드", lat: 33.456533, lng: 126.667037 },
            { place:"[안덕]산방산 탄산온천", lat: 33.248889, lng: 126.298877 },
            { place:"[애월]9.81파크", lat: 33.391093, lng: 126.366486 },
            
            
        ];

    </script>
    
    <div id="map"></div>

</body>

</html>