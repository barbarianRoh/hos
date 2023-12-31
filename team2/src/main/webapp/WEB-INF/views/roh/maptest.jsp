<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="UTF-8">

<title>카카오 지도 테스트</title>

<!-- 카카오맵API와 서비스, 클러스터기능 라이브러리 불러옴 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f4352b5c75fa4dee61f430ab3f1ff6f4&libraries=services,clusterer"></script>

<!-- 지도 크기변경 margin:0 auto는 가운데정렬 -->
<div id="map" style="width:100%;height:80vh;margin: 0 auto;"></div>

<!-- Jquery 불러옴 -->
<script src="//code.jquery.com/jquery-3.7.0.min.js"></script>

<script>
// 변수선언
var a1 = null;
var a2 = null;
var markers;

// 카카오맵 API 지도설정 및 생성
// 1:20m, 2:30m, 3:50m, 4:100m, 5:250m, 6:500m, 7:1km, 8:2km
// 9:4km, 10:8km, 11:16km, 12:32km, 13:64km, 14:128km
var container = document.getElementById('map'); // 지도를 표시할 div
var options = {
   center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도 중심좌표 위도, 경도 순으로 입력
   level: 6
};

// 지도 생성
var map = new kakao.maps.Map(container, options);

// 클러스터 객체 생성
var clusterer = new kakao.maps.MarkerClusterer({
    map: map,
    averageCenter: true,
    minLevel: 5
});

//주소-좌표 변환 객체를 생성
var geocoder = new kakao.maps.services.Geocoder();

// 약국 API 호출 및 지도에 반영
function mapStart(s1 , s2){ // ------------------------------------------------------------------------------------------------------------------------------------------
	if(s1 == null){
      a1 = '서울특별시';
      a2 = '강남구';
   }
   var xhr = new XMLHttpRequest();
   var url = 'http://apis.data.go.kr/B552657/ErmctInsttInfoInqireService/getParmacyListInfoInqire';
   var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + '4c%2BBa%2BaPJxSbLQnLM24kicpVPXAEBmsK1V5nqbo7d6AJ4VRKUVVz8vKzYaRLTJFVaHWJ9IUKmf9L01QnZeCEig%3D%3D'; /* Service Key */

   queryParams += '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(a1);
   queryParams += '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(a2);
   queryParams += '&' + encodeURIComponent('QT') + '=' + encodeURIComponent('');
   queryParams += '&' + encodeURIComponent('QN') + '=' + encodeURIComponent('');
   queryParams += '&' + encodeURIComponent('ORD') + '=' + encodeURIComponent('NAME');
   queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1');
   queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('50');
   xhr.open('GET', url + queryParams);

   var pharmacies = []; // 약국 위치정보를 담기위한 배열

   xhr.onreadystatechange = function () {
      if (this.readyState === 4 && this.status === 200) {
         var parser = new DOMParser();
           var xmlDoc = parser.parseFromString(this.responseText, 'text/xml');
           var items = xmlDoc.getElementsByTagName('item');
           
           // 약국 정보를 반복을 통해 추출하여 좌표를 꺼내고 좌표로 지도에 마커생성
           for (var i = 0; i < items.length; i++) {
               var pharmacy = items[i];
               var dutyAddrElement = pharmacy.getElementsByTagName('dutyAddr')[0];
               var dutyNameElement = pharmacy.getElementsByTagName('dutyName')[0];
               var dutyTelElement = pharmacy.getElementsByTagName('dutyTel1')[0];
               var dutyTime1cElement = pharmacy.getElementsByTagName('dutyTime1c')[0];
               var dutyTime2cElement = pharmacy.getElementsByTagName('dutyTime2c')[0];
               var dutyTime3cElement = pharmacy.getElementsByTagName('dutyTime3c')[0];
               var dutyTime4cElement = pharmacy.getElementsByTagName('dutyTime4c')[0];
               var dutyTime5cElement = pharmacy.getElementsByTagName('dutyTime5c')[0];
               var dutyTime6cElement = pharmacy.getElementsByTagName('dutyTime6c')[0];
               var dutyTime7cElement = pharmacy.getElementsByTagName('dutyTime7c')[0];
               var dutyTime8cElement = pharmacy.getElementsByTagName('dutyTime8c')[0];
               var dutyTime1sElement = pharmacy.getElementsByTagName('dutyTime1s')[0];
               var dutyTime2sElement = pharmacy.getElementsByTagName('dutyTime2s')[0];
               var dutyTime3sElement = pharmacy.getElementsByTagName('dutyTime3s')[0];
               var dutyTime4sElement = pharmacy.getElementsByTagName('dutyTime4s')[0];
               var dutyTime5sElement = pharmacy.getElementsByTagName('dutyTime5s')[0];
               var dutyTime6sElement = pharmacy.getElementsByTagName('dutyTime6s')[0];
               var dutyTime7sElement = pharmacy.getElementsByTagName('dutyTime7s')[0];
               var dutyTime8sElement = pharmacy.getElementsByTagName('dutyTime8s')[0];
               var lat2 = parseFloat(pharmacy.getElementsByTagName('wgs84Lat')[0].textContent);
               var lng2 = parseFloat(pharmacy.getElementsByTagName('wgs84Lon')[0].textContent);
               
               // 널체크
               var dutyAddr2 = dutyAddrElement ? dutyAddrElement.textContent : '';
               var dutyName2 = dutyNameElement ? dutyNameElement.textContent : '';
               var dutyTel2 = dutyTelElement ? dutyTelElement.textContent : '';
               var dutyTime1c2 = dutyTime1cElement ? dutyTime1cElement.textContent : '';
               var dutyTime2c2 = dutyTime2cElement ? dutyTime2cElement.textContent : '';
               var dutyTime3c2 = dutyTime3cElement ? dutyTime3cElement.textContent : '';
               var dutyTime4c2 = dutyTime4cElement ? dutyTime4cElement.textContent : '';
               var dutyTime5c2 = dutyTime5cElement ? dutyTime5cElement.textContent : '';
               var dutyTime6c2 = dutyTime6cElement ? dutyTime6cElement.textContent : '';
               var dutyTime7c2 = dutyTime7cElement ? dutyTime7cElement.textContent : '';
               var dutyTime8c2 = dutyTime8cElement ? dutyTime8cElement.textContent : '';
               var dutyTime1s2 = dutyTime1sElement ? dutyTime1sElement.textContent : '';
               var dutyTime2s2 = dutyTime2sElement ? dutyTime2sElement.textContent : '';
               var dutyTime3s2 = dutyTime3sElement ? dutyTime3sElement.textContent : '';
               var dutyTime4s2 = dutyTime4sElement ? dutyTime4sElement.textContent : '';
               var dutyTime5s2 = dutyTime5sElement ? dutyTime5sElement.textContent : '';
               var dutyTime6s2 = dutyTime6sElement ? dutyTime6sElement.textContent : '';
               var dutyTime7s2 = dutyTime7sElement ? dutyTime7sElement.textContent : '';
               var dutyTime8s2 = dutyTime8sElement ? dutyTime8sElement.textContent : '';
               
               // 추출된 요소 pharmacies 배열에 추가
               pharmacies.push({
                  dutyAddr: dutyAddr2,
                  dutyName: dutyName2,
                  dutyTel: dutyTel2,
                  dutyTime1c: dutyTime1c2,
                  dutyTime2c: dutyTime2c2,
                  dutyTime3c: dutyTime3c2,
                  dutyTime4c: dutyTime4c2,
                  dutyTime5c: dutyTime5c2,
                  dutyTime6c: dutyTime6c2,
                  dutyTime7c: dutyTime7c2,
                  dutyTime8c: dutyTime8c2,
                  dutyTime1s: dutyTime1s2,
                  dutyTime2s: dutyTime2s2,
                  dutyTime3s: dutyTime3s2,
                  dutyTime4s: dutyTime4s2,
                  dutyTime5s: dutyTime5s2,
                  dutyTime6s: dutyTime6s2,
                  dutyTime7s: dutyTime7s2,
                  dutyTime8s: dutyTime8s2,
                  lat: lat2,
                  lng: lng2
               });
           }
           
           // 카카오맵 API 마커와 클러스터 생성 부분
           // 반복문으로 pharmacies의 위치정보를 이용해 마커객체 생성
           markers = pharmacies.map(function(pharmacy) {
               var pharmacyMarker = new kakao.maps.Marker({
                   position: new kakao.maps.LatLng(pharmacy.lat, pharmacy.lng)
               });
               
               // 인포윈도우 내용
               // 컨텐츠 안에 공백이 들어있으면 해당 한 줄을 안보여주도록 처리함
               var infoContent = '<div style="padding:10px;">' +
                '<center>'+ pharmacy.dutyName + '</center>' +
                '<hr />' +
                '<font size=2>대표전화 : ' + pharmacy.dutyTel + '</font><br />' +
                '<font size=2>주소 : ' + pharmacy.dutyAddr + '</font><br />' +
                '<hr />';
                if (pharmacy.dutyTime1s !== '') {
                   infoContent += '<font size=2>월요일 ' + pharmacy.dutyTime1s + ' ~ ' + pharmacy.dutyTime1c + '</font><br />';
               }
                if (pharmacy.dutyTime2s !== '') {
                   infoContent += '<font size=2>화요일 ' + pharmacy.dutyTime2s + ' ~ ' + pharmacy.dutyTime2c + '</font><br />';
               }
                if (pharmacy.dutyTime3s !== '') {
                   infoContent += '<font size=2>수요일 ' + pharmacy.dutyTime3s + ' ~ ' + pharmacy.dutyTime3c + '</font><br />';
               }
                if (pharmacy.dutyTime4s !== '') {
                   infoContent += '<font size=2>목요일 ' + pharmacy.dutyTime4s + ' ~ ' + pharmacy.dutyTime4c + '</font><br />';
               }
                if (pharmacy.dutyTime5s !== '') {
                   infoContent += '<font size=2>금요일 ' + pharmacy.dutyTime5s + ' ~ ' + pharmacy.dutyTime5c + '</font><br />';
               }
                if (pharmacy.dutyTime6s !== '') {
                   infoContent += '<font size=2>토요일 ' + pharmacy.dutyTime6s + ' ~ ' + pharmacy.dutyTime6c + '</font><br />';
               }
                if (pharmacy.dutyTime7s !== '') {
                   infoContent += '<font size=2>일요일 ' + pharmacy.dutyTime7s + ' ~ ' + pharmacy.dutyTime7c + '</font><br />';
               }
                if (pharmacy.dutyTime8s !== '') {
                   infoContent += '<font size=2>공휴일 ' + pharmacy.dutyTime8s + ' ~ ' + pharmacy.dutyTime8c + '</font><br />';
               }
                infoContent += '<hr /><br />' + 
                '</div>';
               
               // 인포윈도우 생성
               var infoWindow = new kakao.maps.InfoWindow({
                 content: infoContent
              });
           
              // 마커에 마우스오버 이벤트 발생시 인포윈도우 생성
              kakao.maps.event.addListener(pharmacyMarker, 'mouseover', function() {
                 infoWindow.open(map, pharmacyMarker);   
              });
              
              // 마커에 마우스아웃 이벤트 발생시 인포윈도우 제거
              kakao.maps.event.addListener(pharmacyMarker, 'mouseout', function() {
                  infoWindow.close();
              });
              
              return pharmacyMarker;
           });
           
           // 마커와 마커클러스터러 생성
           clusterer.addMarkers(markers);
       }
   };

   xhr.send('');

} //mapStart(); ------------------------------------------------------------------------------------------------------------------------------------------

// 중심 좌표나 확대 수준이 변경됐을 때 실행할 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'idle', function() {
	searchAddrFromCoords(map.getCenter(), displayCenterInfo);
	clusterer.clear(); // 기존의 마커와 클러스터러를 전부 지웁니다
});

mapStart(a1,a2);

function searchAddrFromCoords(coords, callback) {
    // 좌표로 행정동 주소 정보를 요청합니다
    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);
}

// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
function displayCenterInfo(result, status) {
    if (status === kakao.maps.services.Status.OK) {
        var infoDiv = document.getElementById('centerAddr');
      
        for(var i = 0; i < result.length; i++) {
            // 행정동의 region_type 값은 'H' 이므로
            if (result[i].region_type === 'H') {
                infoDiv.innerHTML = result[i].address_name;
                a1 = result[i].address_name.split(" ")[0];
                a2 = result[i].address_name.split(" ")[1];     
                mapStart(a1,a2);
                break;
            }
        }
    }    
}

// 지도에 확대 축소 컨트롤 객체를 생성한다
var zoomControl = new kakao.maps.ZoomControl();
// 지도의 우측에 확대 축소 컨트롤을 추가한다
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

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

//지도 중심좌표 이동시 해당 지점만 검색기능 만들어야함 ------------------------------------------------------------
// 지도가 이동, 확대, 축소로 인해 중심좌표가 변경되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'center_changed', function() {

    // 지도의  레벨을 얻어옵니다
    var level = map.getLevel();

    // 지도의 중심좌표를 얻어옵니다 
    var latlng = map.getCenter(); 

});
//지도 중심좌표 이동시 해당 지점만 검색기능 만들어야함 ------------------------------------------------------------

// 내 위치로 중심좌표 이동(첫 접속에 불러오는 좌표가 기준)
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

<!-- Jquery를 이용한 지역선택기능 -->
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
      var $gugun = $(this).next(); // 선택영역 구군 객체
      $("option",$gugun).remove(); // 구군 초기화
   
      if(area == "area0") {
         $gugun.append("<option value=''>구/군 선택</option>");
      } else {
         $.each(eval(area), function() {
         $gugun.append("<option value='"+this+"'>"+this+"</option>");
         });
      }
   });
});
</script>

<p><em>지도가 다시 로딩되면 지도 정보가 표출됩니다</em></p>
<p id="result"></p>
<p id="centerAddr"></p>

<select name="sido" id="sido"></select>
<select name="gugun" id="gugun"></select>

<button onclick="panTo()">내 위치로 이동</button>