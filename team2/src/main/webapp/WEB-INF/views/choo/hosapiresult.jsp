<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${hos == null}">
	<script>
		alert('병원을 찾을 수 없습니다');
		history.go(-1);
	</script>
</c:if>

<head>
    <meta charset="utf-8">
    <title>주소로 검색한 병원정보</title>
</head>

<style>
html, body {width:100%;height:100%;margin:0;padding:0;} 
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
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
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
</style>

<div class="map_wrap">
	<!-- 지도를 표시할 div 입니다 -->
	<div id="map" style="width:2000px;height:800px;position:relative;overflow:hidden;"></div>
	
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

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2100589fb32df980773796dffa657449&libraries=services,clusterer"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(${x}, ${y}), // 지도의 중심좌표
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

var imageSrc = '/hos/resources/img/hosmark.png',				//마커이미지 주소
	imageSize = new kakao.maps.Size(29, 34),					//마커이미지 크기
	imageOption = {offset: new kakao.maps.Point(27,69)};		//마커이미지 옵션

//마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다.
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);

//마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
var positions=[
				<c:forEach var="dto" items="${hos}">
					{
						content: '<div style="width: 300px; height: 80px; padding:5px;">${dto.dutyName}<br>' + 
						'<font size = 3> 전화번호 : ${dto.dutyTel1} </font><br>' + 
						'<font size = 3> 주소 : ${dto.dutyAddr} </font><br>' + 
						'<a href="https://map.kakao.com/link/map/ ${dto.dutyName} , ${dto.wgs84Lat} , ${dto.wgs84Lon} " style="color:blue" target="_blank">큰지도보기</a>&nbsp;' + 
						'<a href="https://map.kakao.com/link/to/  ${dto.dutyName} , ${dto.wgs84Lat} , ${dto.wgs84Lon} " style="color:blue" target="_blank">길찾기</a>&nbsp;' + 
						'<a href="/hos/choo/hosgrade?name=${dto.dutyName}&addr=${dto.dutyAddr}" style="color:blue" target="_blank">병원평점</a></div>',
						title: '${dto.dutyName}',
						latlng: new kakao.maps.LatLng(${dto.wgs84Lat},${dto.wgs84Lon})
					},
				</c:forEach>
			];

marker2 = [];
infowindow2 = [];
for (var i = 0; i < positions.length; i ++) {
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, 	// 마커를 표시할 위치
        title : positions[i].title, 	// 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image: markerImage				//마커이미지 설정
    });
    
  	//마커를 지도에 표시
    marker.setMap(map);
  	
  	var infowindow;
    
    //마커에 클릭이벤트 등록코드
    (function(marker, content){
  		infowindow = new kakao.maps.InfoWindow({
    	content: content,			//인포윈도우에 표시할 내용
    	removable: true
    });
    
 // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
    	     // 마커 위에 인포윈도우를 표시합니다
    	     infowindow.open(map, marker);
     });
   })(marker, positions[i].content); 
    
    infowindow2[i]=infowindow;
	marker2[i] = marker;
}

//사이드바의 각 병원을 클릭했을 때 해당 병원의 마커 인포윈도우를 출력하게 함
function showme(i){
	console.log(marker2[i]);
	infowindow2[i].open(map,marker2[i]);
}

</script>

<style>
.gps-icon{
 	position:absolute;
 	top: 22%;
 	right: 0.65%;
 	z-index:1;
}
</style>

<div id="menu_wrap" class="bg_white">

<c:forEach var="dto" items="${hos}" varStatus="i">

	<div id="" style="border: 1px solid gray;margin: 15px 0px 15px 0px;">
	<a href="javascript:showme('${i.index}')">
	병원이름 : ${dto.dutyName} <br />
	주 소 : ${dto.dutyAddr} <br />
	전화번호 : ${dto.dutyTel1} <br />
	</a>
	</div>
	
</c:forEach> 
</div>