<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="UTF-8">

<title>테스트</title>

<!-- 카카오맵API와 서비스, 클러스터기능 라이브러리 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f4352b5c75fa4dee61f430ab3f1ff6f4&libraries=services"></script>

<div id="centerAddr">위치정보 표시자리</div>

<script>
var address = null;
var sido = null;
var gugun = null;

if(navigator.geolocation) {
	navigator.geolocation.getCurrentPosition(onSuccess, onError);
} else {
	console.log("Geolocation 위치정보 오류")
}

function onSuccess(position) {
	var latitude = position.coords.latitude;
	var longitude = position.coords.longitude;
	var coords = new kakao.maps.LatLng(latitude, longitude);
	
	var geocoder = new kakao.maps.services.Geocoder();
	
	geocoder.coord2Address(coords.getLng(), coords.getLat(), function(result, status) {
		if(status === kakao.maps.services.Status.OK) {
			address = result[0].address.address_name;
			
			var infoDiv = document.getElementById('centerAddr');
			infoDiv.innerHTML = address;
			
			sido = result[0].address.address_name.split(" ")[0];
			gugun = result[0].address.address_name.split(" ")[1];
			
			console.log(address);
			console.log(sido);
			console.log(gugun);
		} else {
			console.error("Error getting address: ", status);
		}
	});
}

function onError(error) {
	console.error("Error getting location: ", error.message);
}
</script>