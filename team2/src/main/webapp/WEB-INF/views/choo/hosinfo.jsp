<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta charset="utf-8">
    <title>병원이름으로 검색한 페이지</title>
    
    <script src="https://kit.fontawesome.com/c99caed150.js" crossorigin="anonymous"></script>
</head>


<c:if test="${dto.dutyName == null}">
	<script>
		alert("입력하신 병원을 찾지 못했습니다");
		history.back(-1);
	</script>
</c:if>

<c:if test="${dto.dutyName != null}">

<!-- 지도를 표시할 div 입니다 -->
<div id="map" style="width:1200px;height:650px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2100589fb32df980773796dffa657449"></script>
<script>

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(${dto.wgs84Lat},${dto.wgs84Lon}), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption);

		var imageSrc = '/hos/resources/img/hosmark.jpg', // 마커이미지의 주소입니다    
			imageSize = new kakao.maps.Size(29, 34), // 마커이미지의 크기입니다
			imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
  
		//마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
			markerPosition = new kakao.maps.LatLng(${dto.wgs84Lat},${dto.wgs84Lon}); // 마커가 표시될 위치입니다
		
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition,
		    image: markerImage
		});
		
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		
		var iwContent = '<div style="padding:5px;">  ${dto.dutyName} <hr>' + 
		'<font size=2> 전화번호 : ${dto.dutyTel1} </font><br>' + 
		'<font size=2> 주 소 : ${dto.dutyAddr} </font><br>' + 
		'<a href="https://map.kakao.com/link/map/ ${dto.dutyName}  ,  ${dto.wgs84Lat}  ,  ${dto.wgs84Lon}  " style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/  ${dto.dutyName}  ,  ${dto.wgs84Lat}  ,  ${dto.wgs84Lon}  " style="color:blue" target="_blank">길찾기</a></div>', 
		iwPosition = new kakao.maps.LatLng(${dto.wgs84Lat},${dto.wgs84Lon});
			
		//인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
		position : iwPosition, 
		content : iwContent 
		});
		
		//마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
		infowindow.open(map, marker);
</script>
</c:if>