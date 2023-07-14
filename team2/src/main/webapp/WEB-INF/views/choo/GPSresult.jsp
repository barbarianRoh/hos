<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<meta charset="utf-8">
	<title>주변 병원정보</title>
<c:if test="${back == null}">
	<script>
		alert('병원을 찾을 수 없습니다');
		history.go(-1);
	</script>
</c:if>	
<!-- 지도를 표시할 div 입니다 -->
<div id="map" style="width:1200px;height:650px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2100589fb32df980773796dffa657449"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(${y}, ${x}), // 지도의 중심좌표
        level: 7 // 지도의 확대 레벨
    };

// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption);

//마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
var positions=[
				<c:forEach var="dto" items="${hos}">
					{
						content: '<div style="padding:5px;">${dto.dutyName}<br>' + 
						'<font size = 2> 전화번호 : ${dto.dutyTel1} </font><br>' + 
						'<font size = 2> 주소 : ${dto.dutyAddr} </font><br></div>',
						title: '${dto.dutyName}',
						latlng: new kakao.maps.LatLng(${dto.wgs84Lat},${dto.wgs84Lon})
					},
				</c:forEach>
			];

    
for (var i = 0; i < positions.length; i ++) {
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, 	// 마커를 표시할 위치
        title : positions[i].title, 	// 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
    });
    
    var infowindow = new kakao.maps.InfoWindow({
    	content: positions[i].content			//인포윈도우에 표시할 내용
    });
    
 	// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
   	kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
    
    //마커를 지도에 표시
    marker.setMap(map);
}

	//인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	function makeOverListener(map, marker, infowindow) {
    	return function() {
        	infowindow.open(map, marker);
    	};	
	}

	//인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(infowindow) {
    	return function() {
        	infowindow.close();
    	};
	} 
</script>

<table width="1400" border="1" cellspacing="0" cellpadding="0" align="center">
	<tr height="20">
		<td align="center" width="220">병원이름</td>
		<td align="center" width="480">주 소</td>
		<td align="center" width="550">진료과</td>
		<td align="center" width="150">전화번호</td>
	</tr>
	<c:forEach var="dto" items="${hos}">
	<tr height="20">
		<td align="center" width="220">${dto.dutyName}</td>
		<td align="center" width="480">${dto.dutyAddr}</td>
		<td align="center" width="550">${dto.dgidIdName}</td>
		<td align="center" width="150">${dto.dutyTel1}</td>
	</tr>
	</c:forEach>
</table>
