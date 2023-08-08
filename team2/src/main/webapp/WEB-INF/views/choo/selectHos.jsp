<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta charset="utf-8">
	<title>증상으로 병원찾기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- 카카오맵API와 서비스, 클러스터기능 라이브러리 불러옴 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2100589fb32df980773796dffa657449&libraries=services,clusterer"></script>

<!-- 지도를 표시할 div 입니다 -->
<div id="map" style="width:2000px;height:800px;"></div>

<script>

var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
var mapOption = { 
        center: new kakao.maps.LatLng(37.350701, 127.0016), // 지도의 중심좌표
        level: 13 // 지도의 확대 레벨
    };
    
//지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption);
</script>

<div class="d-flex justify-content-start">
<select style="width: 150px;" class="form-select form-select-sm" aria-lable="Small select example" name="where1" id="where1"></select>
<select style="width: 150px;" class="form-select form-select-sm" aria-lable="Small select example" name="apa1" id="apa1"></select>
</div>

<script>
$('document').ready(function(){
	var area0 = ["아픈부위","머리","얼굴","목","가슴","배","골격계","피부","비뇨기"];
	var area1 = ["두통","어지럼증","편두통","손떨림"];
	var area2 = ["눈충혈","저시력","눈간지럼","귀통증","이명","난청","이통증","이시림","잇몸출혈","코막힘","얼굴떨림"];
	var area3 = ["목통증","가래"]
	var area4 = ["객혈","호흡곤란","흉통","기침","가슴쓰림"];
	var area5 = ["구역질/구토","복통","설사","변비","속쓰림"];
	var area6 = ["골다공증","관절통증","허리통증","근육통증","저림"];
	var area7 = ["고름","두드러기"];
	var area8 = ["통증","혈뇨","요실금"];
	
	$("select[name^=where]").each(function(){
		$selwhere = $(this);
		$.each(eval(area0), function(){
			$selwhere.append("<option value='"+this+"'>"+this+"</option>");
		});
		$selwhere.next().append("<option value=''>증상선택</option>");
	});
	
	$("select[name^=where]").change(function(){
		var area = "area"+$("option",$(this)).index($("option:selected",$(this)));
		var $apa = $(this).next();			//선택영역 증상선택 객체
		$("option",$apa).remove();			//증상선택 초기화
		
		if(area == "area0"){
			$apa.append("<option value=''>증상선택</option>");
		}else{
			$.each(eval(area), function(){
			$apa.append("<option value='"+this+"'>"+this+"</option>");
			});
		}
		
		//부위가 선택되면 해당 부위의 값과 증상의 선택값이 들어가는 곳
		var whereValue = $("select[name=where1]").val();
		$("input[name=W0]").val(whereValue);
		var apaValue = $("select[name=apa1]").val();
		$("input[name=W1]").val(apaValue);
	});
		
		//증상 select를 변경시 해당 변경값이 대입
		$("select[name=apa1]").change(function(){
			apaValue = $(this).val();
		$("input[name=W1]").val(apaValue);
		});
		console.log(apaValue);
});

<!-- Geolocation API -->        
var geolat = "", geolon = ""; // 현 위치로 이동 기능 변수

	// GeoLocation(GPS를 받아 내 위치를 표시하는 기능)
	// 크롬에선 HTTPS환경에서만 작동함
	if (navigator.geolocation) {
  
	// GeoLocation을 이용해서 접속 위치를 얻어옵니다
		navigator.geolocation.getCurrentPosition(function(position) {
		geolat = position.coords.latitude,  // 위도
		geolon = position.coords.longitude; // 경도
      
		var locPosition = new kakao.maps.LatLng(geolat, geolon), // 마커가 표시될 위치를 Geolocation으로 얻어온 좌표로 생성합니다
		message = '<div style="padding:5px;">현재 위치입니다</div>'; // 인포윈도우에 표시될 내용입니다
      
		// 마커와 인포윈도우를 표시합니다
		displayMarker(locPosition, message);
        
		//GPS로 본인위치의 좌표를 가져왔을 때 해당 좌표를 폼태그 안에 값을 자동으로 넣기 위한 코드
		document.getElementsByName("WGS84_LAT")[0].value = geolat;
		document.getElementsByName("WGS84_LON")[0].value = geolon;	
		});
	
		//좌표를 주소로 변경하기 위한 코드
		var options = {
  		enableHighAccuracy: true,
  		timeout: 5000,
  		maximumAge: 0
		};
			
		var sidovalue;
		var gugunvalue;
		
		function success(position) {
			
			var geocoder = new kakao.maps.services.Geocoder();
	
			var coord = new kakao.maps.LatLng(position.coords.latitude, position.coords.longitude);
			var callback = function(result, status) {
			    if (status === kakao.maps.services.Status.OK) {
			        sidovalue = result[0].address.region_1depth_name;
			        gugunvalue = result[0].address.region_2depth_name;
			        document.getElementById("Q0").value = sidovalue;
			        document.getElementById("Q1").value = gugunvalue;
			    	console.log('좌표의 시나 도는 ' + result[0].address.region_1depth_name);
			        console.log('좌표의 시나 도는 ' + result[0].address.region_2depth_name);
			    }
			};
	
			geocoder.coord2Address(position.coords.longitude, position.coords.latitude, callback);
		};
		
		function error(err) {
			console.warn('ERROR(' + err.code + '): ' + err.message);
		}
		
		navigator.geolocation.getCurrentPosition(success, error, options);

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

<!-- W0은 선택된 부위의 값 W1 선택된 증상의 값 -->
<form method="get" name="selectHos" action="/hos/choo/resultHos">
	<input type="hidden" id="W0" name="W0" value="">
	<input type="hidden" id="W1" name="W1" vlaue="">
	<input type="hidden" id="Q0" name="Q0" value="">
	<input type="hidden" id="Q1" name="Q1" value="">
	<br>
	
	<input class="btn btn-primary" type="submit" value="검색">
</form>

<button class="btn btn-info" onclick="panTo()">내 위치로 이동</button>