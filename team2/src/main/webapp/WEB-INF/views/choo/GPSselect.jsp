<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<meta charset="utf-8">
	<title>본인주변 병원표시</title>
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

<!-- 카카오맵API와 서비스, 클러스터기능 라이브러리 불러옴 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2100589fb32df980773796dffa657449&libraries=services,clusterer"></script>

<!-- 지도를 표시할 div 입니다 -->
<div id="map" style="width:1200px;height:650px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2100589fb32df980773796dffa657449"></script>

<script>

var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
var mapOption = { 
        center: new kakao.maps.LatLng(37.350701, 127.0016), // 지도의 중심좌표
        level: 13 // 지도의 확대 레벨
    };
    
//지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption);

<!-- Geolocation API -->        
var geolat = "", geolon = ""; // 현 위치로 이동 기능 변수

	// GeoLocation(GPS를 받아 내 위치를 표시하는 기능)
	// 크롬에선 HTTPS환경에서만 작동함
	if (navigator.geolocation) {
  
	// GeoLocation을 이용해서 접속 위치를 얻어옵니다
	navigator.geolocation.getCurrentPosition(function(position) {
		geolat = position.coords.latitude, // 위도
		geolon = position.coords.longitude; // 경도
      
		var locPosition = new kakao.maps.LatLng(geolat, geolon), // 마커가 표시될 위치를 Geolocation으로 얻어온 좌표로 생성합니다
		message = '<div style="padding:5px;">현재 위치입니다</div>'; // 인포윈도우에 표시될 내용입니다
      
		// 마커와 인포윈도우를 표시합니다
		displayMarker(locPosition, message);
        
		document.getElementsByName("WGS84_LAT")[0].value = geolat;
		document.getElementsByName("WGS84_LON")[0].value = geolon;
		
	});
  
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    
	var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
	message = 'geolocation을 사용할수 없습니다'
        
    displayMarker(locPosition, message);
}

	// 지도에 마커와 인포윈도우를 표시하는 함수입니다
	function displayMarker(locPosition, message) {

	    // 마커를 생성합니다
		var marker = new kakao.maps.Marker({  
	        map: map, 
	        position: locPosition
	    }); 
	    
	    var iwContent = message, // 인포윈도우에 표시할 내용
	        iwRemoveable = true;

	    // 인포윈도우를 생성합니다
	    var infowindow = new kakao.maps.InfoWindow({
	        content : iwContent,
	        removable : iwRemoveable
	    });
	    
	    // 인포윈도우를 마커위에 표시합니다 
	    infowindow.open(map, marker);
	    
	    // 지도 중심좌표를 접속위치로 변경합니다
	    map.setCenter(locPosition);
	}

	//본인위치로 이동시킬 메소드
	function panTo() {
	    // 변수가 정의되었는지 확인
	    if (typeof geolat !== 'undefined' && typeof geolon !== 'undefined') {
	        // 이동할 좌표 생성
	        var moveLatLon = new kakao.maps.LatLng(geolat, geolon);
	        
	        // 지도중심을 부드럽게 이동
	        // 이동 거리가 지도화면보다 큰 경우 효과없이 이동
	        map.panTo(moveLatLon);
	        
	        document.getElementsByName("WGS84_LAT")[0].value = geolat;
			document.getElementsByName("WGS84_LON")[0].value = geolon;
	    } else {
	        console.log('좌표를 사용할 수 없습니다.');
	    }
	}
</script>

<button onclick="panTo()">내 위치로 이동</button>


<form method = "post" name="GPSselect" action="/hos/choo/GPSresult">
	<table width="600" height="300" border="1" cellspacing="0" cellpadding="0" align="center">
		<tr width="250" colspan="3">
			<td width="250" height="100" align="center">좌표Y</td>
			<td width="250"><input type="text" size="50" maxlength="50" name="WGS84_LAT"></td>
		</tr>
		<tr width="250" colspan="3">
			<td width="250" height="100" align="center">좌표X</td>
			<td width="250"><input type="text" size="50" maxlength="50" name="WGS84_LON"></td>
		</tr>
		<tr>
			<td width="50" height="50" align="center">진료과선택</td>
			<td width="50"><input type="text" size="50" maxlength="50" name="QD" id="QDInput"></td>
			<td width="50">
			<select name="selectOption" id="selectOption" onchange="assignValue()">
				<option value="">진료과선택</option>
				<option value="D001">내 과</option>
				<option value="D002">소아과</option>
				<option value="D003">신경과</option>
				<option value="D004">정신건강의학과</option>
				<option value="D005">피부과</option>
				<option value="D006">외 과</option>
				<option value="D007">흉부외과</option>
				<option value="D008">정형외과</option>
				<option value="D009">신경외과</option>
				<option value="D010">성형외과</option>
				<option value="D011">산부인과</option>
				<option value="D012">안 과</option>
				<option value="D013">이비인후과</option>
				<option value="D014">비뇨기과</option>
				<option value="D016">재활의학과</option>
				<option value="D017">마취통증의학과</option>
				<option value="D018">영상의학과</option>
				<option value="D019">치료방사선과</option>
				<option value="D020">임상병리과</option>
				<option value="D021">해부병리과</option>
				<option value="D022">가정의학과</option>
				<option value="D023">핵의학과</option>
				<option value="D024">응급의학과</option>
				<option value="D026">치 과</option>
				<option value="D034">구강악안면외과</option>
			</select>
			</td>
		</tr>
		<tr>
			<td width="50" height="50" colspan="3" align="center">
				<input type="submit" value="검색">
			</td>
		</tr>
	</table>
	<script>
			//위에 select의 option값을 선택했을 때 QD에 자동으로 들어가게 하는 곳
			function assignValue(){
				var selectElement = document.getElementById("selectOption");
				var selectedValue = selectElement.value;
				document.getElementById("QDInput").value = selectedValue;
			}
	</script>
</form>