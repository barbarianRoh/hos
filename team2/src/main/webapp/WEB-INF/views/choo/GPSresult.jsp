<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<meta charset="utf-8">
	<title>주변 병원정보</title>
<c:if test="${hos == null}">
	<script>
		alert('병원을 찾을 수 없습니다');
		history.go(-1);
	</script>
</c:if>
<style>
html, body {width:100%;height:100%;margin:0;padding:0;} 
.map_wrap {position:relative;overflow:hidden;width:100%;height:800px;}
.radius_border{border:1px solid #919191;border-radius:5px;}     
.custom_typecontrol {position:absolute;top:10px;right:10px;overflow:hidden;width:130px;height:30px;margin:0;padding:0;z-index:1;font-size:12px;font-family:'Malgun Gothic', '맑은 고딕', sans-serif;}
.custom_typecontrol span {display:block;width:65px;height:30px;float:left;text-align:center;line-height:30px;cursor:pointer;}
.custom_typecontrol .btn {background:#fff;background:linear-gradient(#fff,  #e6e6e6);}       
.custom_typecontrol .btn:hover {background:#f5f5f5;background:linear-gradient(#f5f5f5,#e3e3e3);}
.custom_typecontrol .btn:active {background:#e6e6e6;background:linear-gradient(#e6e6e6, #fff);}    
.custom_typecontrol .selected_btn {color:#fff;background:#425470;background:linear-gradient(#425470, #5b6d8a);}
.custom_typecontrol .selected_btn:hover {color:#fff;}   
.custom_zoomcontrol {position:absolute;top:50px;right:10px;width:36px;height:80px;overflow:hidden;z-index:1;background-color:#f5f5f5;} 
.custom_zoomcontrol span {display:block;width:36px;height:40px;text-align:center;cursor:pointer;}     
.custom_zoomcontrol span img {width:15px;height:15px;padding:12px 0;border:none;}             
.custom_zoomcontrol span:first-child{border-bottom:1px solid #bfbfbf;}
</style>
	
<div class="map_wrap">
	<!-- 지도를 표시할 div 입니다 -->
	<div id="map" style="width:1200px;height:650px;position:relative;overflow:hidden;"></div>
	
	<!--  지도타입 컨트롤 div 입니다 -->
	<div class="custom_typecontrol radius_border">
		<span id="btnRoadmap" class="selected_btn" onclick="setMapType('roadmap')">지도</span>
		<span id="btnSkyview" class="btn" onclick="setMapType('skyview')">스카이뷰</span>
	</div>
	
	<!-- 지도 확대, 축소 컨트롤 div입니다 -->
	<div class="custom_zoomcontrol radius_border">
		<span onclick="zoomIn()"><img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png" alt="확대"></span>
		<span onclick="zoomOut()"><img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png" alt="축소"></span>
	</div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2100589fb32df980773796dffa657449"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(${y}, ${x}), // 지도의 중심좌표
        level: 7 // 지도의 확대 레벨
    };

// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption);

//지도타입 컨트롤의 지도 또는 스카이뷰 버튼을 클릭하면 호출되어 지도타입을 바꾸는 함수
function setMapType(maptype){
	var roadmapControl = document.getElementById("btnRoadmap");
	var skyviewControl = document.getElementById("btnSkyview");
	if(maptype === 'roadmap'){
		map.setMapTypeId(kakao.maps.MapTypeId.ROADMAP);
		roadmapControl.className = 'selected_btn';
		skyviewControl.className = 'btn';
	}else{
		map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);
		skyviewControl.className = 'selected_btn';
		roadmapControl.className = 'btn';
	}
}

//지도 확대 및 축소 컨트롤에 확대 버튼을 누르면 호출되어 지도를 확대
function zoomIn(){
	map.setLevel(map.getLevel() - 1);
}

//지도 확대 및 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 축소
function zoomOut(){
	map.setLevel(map.getLevel() + 1);
}

var imageSrc = '/hos/resources/img/hosmark.jpg',		//마커이미지 주소
	imageSize = new kakao.maps.Size(29, 34),												//마커이미지 크기
	imageOption = {offset: new kakao.maps.Point(27,69)};								//마커이미지 옵션

//마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다.
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);

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
        image: markerImage				//마커이미지 설정
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
