<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>주소로 병원검색</title>
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<%-- 2100589fb32df980773796dffa657449 --%>

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
</script>

<select name="sido1" id="sido1"></select>
<select name="gugun1" id="gugun1"></select>

<!-- Jquery를 이용한 지역선택기능 -->
<script>
var s1="";
// 8은 세종시라서 없음
$('document').ready(function() {
	var area0 = ["시/도 선택","서울특별시","부산광역시","대구광역시","인천광역시","광주광역시","대전광역시","울산광역시","세종특별자치시","경기도","강원특별자치도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주특별자치도"];
	var area1 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
	var area2 = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
	var area3 = ["남구","달서구","달성군","동구","북구","서구","수성구","중구"];
	var area4 = ["강화군","계양구","남동구","동구","미추홀구","부평구","서구","연수구","옹진군","중구"];
	var area5 = ["광산구","남구","동구","북구","서구"];
	var area6 = ["대덕구","동구","서구","유성구","중구"];
	var area7 = ["남구","동구","북구","중구","울주군"];
	var area9 = ["가평군","고양시","고양시덕양구","고양시일산동구","고양시일산서구","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","성남시분당구","성남시수정구","성남시중원구","수원시","수원시권선구","수원시영통구","수원시장안구","수원시팔달구","시흥시","안산시","안산시단원구","안산시상록구","안성시","안양시","안양시동안구","안양시만안구","양주시","양평군","여주시","연천군","오산시","용인시","용인시기흥구","용인시수지구","용인시처인구","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시"];
	var area10 = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
	var area11 = ["괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","제천시","청주시","청주시상당구","청주시서원구","청주시청원구","청주시흥덕구","충주시"];
	var area12 = ["계룡시","공주시","금산군","논산시","당진시","보령시","부여군","서산시","서천군","아산시","예산군","천안시","천안시동남구","천안시서북구","청양군","태안군","홍성군"];
	var area13 = ["고창군","군산시","김제시","남원시","무주군","부안군","순창군","완주군","익산시","임실군","장수군","전주시","전주시덕진구","전주시완산구","정읍시","고창군","진안군"];
	var area14 = ["강진군","고흥군","곡성군","광양시","구례군","나주시","담양군","목포시","무안군","보성군","순천시","신안군","여수시","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
	var area15 = ["경산시","경주시","고령군","구미시","군위군","김천시","문경시","봉화군","상주시","성주군","안동시","영덕군","영양군","영주시","영천시","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군","포항시","포항시남구","포항시북구"];
	var area16 = ["거제시","거창군","고성군","김해시","남해군","밀양시","사천시","산청군","양산시","의령군","진주시","창녕군","창원시","창원시마산합포구","창원시마산회원구","창원시성산구","창원시의창구","창원시진해구","통영시","하동군","함안군","함양군","합천군"];
	var area17 = ["서귀포시","제주시"];

	// 시/도 선택 박스 초기화
	// 이름이 sido로 시작하는 속성 name을 가진 select요소를 선택하여 each문을 이용해 반복
   // 반복에서 현재요소를 참조하는 this를 사용하여 selsido 변수에 현재 select 요소를 할당
   // area0을 배열로 판단 및 각 항목에 option값(서울특별시 등)을 selsido에 추가
   // 현 셀렉트문의 형제요소로 구군선택을 추가
	$("select[name^=sido]").each(function() {
		$selsido = $(this);
		$.each(eval(area0), function() {
			$selsido.append("<option value='"+this+"'>"+this+"</option>");
		});
		$selsido.next().append("<option value=''>구/군 선택</option>");
	});
	
	// 시/도 선택시 구/군 설정
	// sido가 변경될 때 실행되도록 설정
   // 시/도 드롭다운 내에서 선택한 옵션의 인덱스를 기반으로 area1, area2등 동적 변수이름 설정
   // 시/도 드롭다운의 다음 형제요소를 할당함
   // 기존 구군 요소를 지움
   // area가 0인 경우 기본옵션인 구/군 선택 드롭다운을 추가
   // area가 0이 아닌 경우 area 변수를 기반으로 구/군 배열을 검색하고 드롭다운에 추가
	$("select[name^=sido]").change(function() {
		var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
		var $gugun = $(this).next(); // 선택영역 군구 객체
		$("option",$gugun).remove(); // 구군 초기화
	
		if(area == "area0") {
			$gugun.append("<option value=''>구/군 선택</option>");
		} else {
			$.each(eval(area), function() {
			$gugun.append("<option value='"+this+"'>"+this+"</option>");
			});
		}
		
		// 시도시 선택시 자동으로 구/군도 들어가는 곳
 		var sidoValue = $("select[name=sido1]").val();
		$("input[name=Q0]").val(sidoValue);
		var gugunValue = $("select[name=gugun1]").val();
		$("input[name=Q1]").val(gugunValue);
	});
		 
		//구/군 변경시 동작하는 곳
		$("select[name=gugun1]").change(function() {
		gugunValue = $(this).val();
		$("input[name=Q1]").val(gugunValue);
		});
		console.log(gugunValue);
});


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
    } else {
        console.log('좌표를 사용할 수 없습니다.');
    }
}
</script>

<br>
<br>

<form method = "post" name="hosselect" action="/hos/choo/hosapiresult">
	<label for="selectOption"></label>
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
		<option value="D022">가정의학과</option>
		<option value="D026">치 과</option>
	</select>
	
	<label for="hosType"></label>
	<select name="hosType" id="hosType" onchange="TypeValue()">
		<option value="">병원분류</option>
		<option value="A">상급/종합병원</option>
		<option value="B">병원</option>
		<option value="C">의원</option>
		<option value="M">치과병원</option>
		<option value="N">치과의원</option>
	</select>
	
	<input type="hidden" id="Q0" name="Q0" value="">
	<input type="hidden" id="Q1" name="Q1" value="">
	<input type="hidden" id="selectedjinryo" name="QD" value="">
	<input type="hidden" id="selecthos" name="QZ" value="">
			
	<input type="submit" value="검 색">
</form>
	
<script>
	//위에 select의 option값을 선택했을 때 QD에 자동으로 들어가게 하는 곳
	function assignValue(){
	var selectElement = document.getElementById("selectOption");
	var selectedValue = selectElement.value;
	document.getElementById("selectedjinryo").value = selectedValue;
	
	//선택한 진료과가 치과일 경우 병원분류에 치과병원 혹은 치과의원을 select에 보이게 하는 곳
	if(selectedValue === "D026"){
		showDentalOptions();
	}else{
		hideDentalOptions();
	}
}
	
	function TypeValue(){
		var selectElement = document.getElementById("hosType");
		var selectedValue = selectElement.value;
		document.getElementById("selecthos").value = selectedValue;
	}
	
	//진료과를 치과로 선택했을 경우
	function showDentalOptions() {
	    var hosType = document.getElementById("hosType");
	    for (var i = 0; i < hosType.options.length; i++) {
	        var optionValue = hosType.options[i].value;
	        if (optionValue === "M" || optionValue === "N") {
	            hosType.options[i].style.display = "block"; 	//병원분류를 보여주는 옵션
	        }
	    }
	}
	
	//진료과가 치과가 아닐 경우
	function hideDentalOptions() {
	    var hosType = document.getElementById("hosType");
	    for (var i = 0; i < hosType.options.length; i++) {
	        var optionValue = hosType.options[i].value;
	        if (optionValue === "M" || optionValue === "N") {
	            hosType.options[i].style.display = "none"; 		//병원 분류를 감추는 옵션
	        }
	    }
	}

	//초기설정부분이며 처음에 진료과가 선택되지 않는 경우 치과 옵션 숨기는 곳
	document.addEventListener("DOMContentLoaded", function () {
	    assignValue();
	});
</script>

<button onclick="panTo()">내 위치로 이동</button>

<%-- <c:forEach var="dto" items="${hos}">
	${dto.wgs84Lat}
</c:forEach>--%>