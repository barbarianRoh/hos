<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="주변에 있는 약국 정보를 제공하는 페이지" />
        <meta name="author" content="Roh" />
        <title>아파, 어디가? 약국지도</title>
        
        <!-- 부트스트랩 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
        <!-- 카카오맵API -->
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f4352b5c75fa4dee61f430ab3f1ff6f4&libraries=services,clusterer"></script>
		<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
		<!-- 제이쿼리 -->
		<script src="//code.jquery.com/jquery-3.7.0.min.js"></script>
		<!-- 폰트어썸 아이콘 -->
		<script src="https://kit.fontawesome.com/f507061817.js" crossorigin="anonymous"></script>
		<!-- 닥터게이트 -->
		<link rel="stylesheet" type="text/css" href="/hos/resources/css/font.css">
		<link rel="stylesheet" type="text/css" href="/hos/resources/css/main.css">
		<link rel="stylesheet" type="text/css" href="/hos/resources/css/main2.css">
		
		<script>
		document.addEventListener("DOMContentLoaded", function () {
			var loginButton = document.querySelector(".loginButton");
			var loginModal = document.getElementById("loginModal");
			var modalOverlay = document.getElementById("modalOverlay");
			var closeLoginModalButton = document.getElementById("closeLoginModal");
			var myInfoForm = document.getElementById("myInfoForm");
			
			loginButton.addEventListener("click", function (event) {
				event.preventDefault();
				loginModal.style.display = "block";
				modalOverlay.style.display = "block";
				toggleForms(); // 폼 전환 함수 호출
		    });
		
			modalOverlay.addEventListener("click", function () {
				loginModal.style.display = "none";
				modalOverlay.style.display = "none";
		    });
		
		    closeLoginModalButton.addEventListener("click", function () {
		      loginModal.style.display = "none";
		      modalOverlay.style.display = "none";
		    });
		
		    // 페이지 로딩 시 폼 전환 함수 호출
		    toggleForms();
		});
		
		function toggleForms() {
			var loginButton = document.querySelector(".loginButton");
			var myInfoForm = document.getElementById("myInfoForm");
			var sessionSid = "${sessionScope.sid}";
			var sessionKnick = "${sessionScope.knick}";
		
			if (sessionSid || sessionKnick) {
				loginButton.style.display = "none"; // 세션이 있을 때 로그인 버튼 숨기기
				myInfoForm.style.display = "block"; // 세션이 있을 때 로그인 후 버튼 보이기
			} else {
				loginButton.style.display = "block"; // 세션이 없을 때 로그인 버튼 보이기
				myInfoForm.style.display = "none"; // 세션이 없을 때 로그인 후 버튼 숨기기
			}
		}
		</script>
	</head>
	

    <body>
        <!-- 헤더 -->
        <div class="">
            <div class="p-header d-flex flex-row text-white align-items-center">
               	<header>
				<!-- 버튼 프라이머리 2가 햄버거 -->        
				<a class="btn btn-primary2" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" aria-controls="offcanvasExample"><i class="fa-solid fa-bars" style="color: #000000;"></i></a>
				
				<div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
					<div class="offcanvas-header">
						<h5 class="offcanvas-title" id="offcanvasExampleLabel">아파, 어디가?</h5>
						<button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
					</div>
					
					<div>
						<hr style="margin-top: 10px; margin-bottom: 10px; border-color: black;">
					</div>
					
					<div class="offcanvas2-body">
						<div class="dropdown mt-3">
							<ul class="nav flex-column">
								<li class="nav-item">
									<a class="nav-link active" aria-current="page" href="/hos/choo/selectHos">병원지도</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="/hos/roh/pharmacyMap">약국지도</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="/hos/kim/symptom">부위별 증상 찾기</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="/hos/hong/search">약품정보</a>
								</li>						
							</ul>
							<div>
								<hr style="margin-top: 10px; margin-bottom: 10px; border-color: black;">
							</div>
							
							<ul class = "nav flex-column">
								<li><a class = "nav-link active" aria-current="page" href="/hos/choo/addressselect">병원찾기</a></li>
								<li>
                  					<c:if test="${sessionScope.sid != null}">
                     					<a class = "nav-link active" aria-current="page" href="/hos/choo/userhosselect">최근 찾은 병원</a>                  
                  					</c:if>
               					</li>   
							</ul>
						
							<div>
								<hr style="margin-top: 10px; margin-bottom: 10px; border-color: black;">
							</div>
						
							<ul class = "nav flex-column">
								<li><a class = "nav-link active" aria-current="page" href="/hos/choo/gesipanmain">고객센터</a></li>
							</ul>										
						</div>
					</div>
				</div>
				<!-- 로그인 아이콘 있는곳 -->
				<a class="loginButton" href="#"><img alt="Cindy Baker2" src="//image.medigate.net/static/mobile/ver_3/images/icon_profilethumb.gif" class="MuiAvatar-img"></a>
				<div id="loginModal" class="modal">
					<div class="modal-dialog">
						<div class="contwrap modal-content">
							<c:if test="${sessionScope.sid == null && sessionScope.knick == null}">
								<button id="closeLoginModal" class="close-button">×</button>
								<form action="/hos/roh/signinPro">
									<div class="profilearea login">
										<p class="input_row txt" style="color: rgb(26, 26, 26);">아파, 어디가?</p>
										<div class="input_row">
											<input type="text" id="id" name="id" placeholder="아이디" class="form-control" value="">
										</div>
							            <div class="input_row">
							              <input type="password" id="pw" name="pw" placeholder="비밀번호" class="form-control" value="">
							            </div>
							            <button type="submit" class="mdc-button mdc-button--raised select left">로그인</button>
							            <button type="button" id="kakao-login-btn">카카오 로그인</button>
							            <div class="gridcontainer signin_options">
											<div class="input_row padding-10px"></div>
											<div class="input_row pc padding-10px border-top-1px">
												<a class="forgotid" href="/hos/roh/findMyIdForm" target="_blank" style="color: rgb(26, 26, 26); font-size: 12px;">아이디 찾기</a>
								                <a class="forgotpassword" href="/hos/roh/findMyPwForm" style="color: rgb(26, 26, 26); font-size: 12px;">비밀번호 찾기</a>
								                <a class="join" href="/hos/roh/signupForm" style="font-size: 12px;">회원 가입</a>
											</div>
											<div class="input_row mobile padding-10px border-top-1px"></div>
										</div>
									</div>
								</form>
							</c:if>
							<div id="myInfoForm" class="profilearea">
								<p class="input_row txt" style="color: rgb(26, 26, 26);">
                  					<c:if test="${sessionScope.sid != null}">환영합니다! ${sid}님</c:if>
                  					<c:if test="${sessionScope.knick != null}">환영합니다! ${knick}님</c:if>                  
               					</p>
								<a href="/hos/roh/myProfileForm">내 프로필</a>
								<a id="logoutButton" href="/hos/kim/main">로그아웃</a>
							</div>
							<c:if test="${logout}">
								<script>
									alert("로그아웃 되었습니다");
									// 새로고침 할 때 마다 또 로그아웃 되는것을 방지
									window.location.href = '/hos/kim/main';
								</script>
							</c:if>
						</div>
					</div>
				</div>
				<div id="modalOverlay" class = "overlay"></div>
			</header>
            </div>
            
            <div class="p-header2 align-items-center d-flex row-g3 search-header">
	            <ul>
	            	<li style="padding: 0 40px;">
	            		<input type="text" id="areaKeyword" placeholder="지역입력" onkeydown="searchEnter(event)" /><button id="searchBtn"><i class="fa-solid fa-magnifying-glass"></i></button>
	            	</li>
	            	<li>
	            		<select name="sido" id="sido"></select>
	            	</li>
	            	<li>
	            		<select name="gugun" id="gugun"></select>
	            	</li>
	            </ul>
        	</div>
        </div>
        
        <!-- 검색필드에서 엔터로 검색 -->
        <script>
        	function searchEnter(event) {
        		if(event.key === "Enter") {
        			event.preventDefault();
        			document.getElementById("searchBtn").click(); // 검색버튼 클릭
        		}
        	}
        </script>
		        
        <!-- 지도 크기변경 margin:0 auto는 가운데정렬 -->
		<div id="map" style="width:100%;height:85vh;margin: 0 auto;"></div>
		
		<!-- 사이드바 영역 -->
		<div class="sidebarContainer">
			<input type="checkbox" id="toggle-menu" />
			<label for="toggle-menu" class="menu-button"><i class="fa-solid fa-chevron-right fa-2x" style="color: #3f3f3f;"></i></label>
			
			<aside class="sidebar">
				<ul id="pharmacies-list"></ul>
				<div id="pagination">
					<button id="first-page">처음</button>
					<button id="prev-page">이전</button>
					<span id="current-page">1</span>/<span id="total-pages">1</span>
					<button id="next-page">다음</button>
					<button id="last-page">마지막</button>
				</div>
			</aside>
		</div>
		
		<!-- 중심좌표 테스트용 -->
		<!-- <p id="result"></p> -->
		<!-- <p id="centerAddr"></p> -->
		
		<script>
			<!-- Geolocation API -->        
			var geolat = null, geolon = null; // 현 위치로 이동 기능 변수
			var geoInfoWindow = null; // 줌 변경 이벤트를 위해 미리 선언
			var keyword = null; // 장소검색용 키워드 변수
			
			if(navigator.geolocation) {
			
				// GeoLocation을 이용해서 접속 위치를 얻어옵니다
				navigator.geolocation.getCurrentPosition(function(position) {
					geolat = position.coords.latitude, // 위도
					geolon = position.coords.longitude; // 경도
			   
					var locPosition = new kakao.maps.LatLng(geolat, geolon), // 마커가 표시될 위치를 Geolocation으로 얻어온 좌표로 생성합니다
					message = '<div style="padding:5px; width:9rem; text-align:center; display:inline-block;">접속위치</div>'; // 인포윈도우에 표시될 내용입니다
			   
					// 마커와 인포윈도우를 표시합니다
					displayMarker(locPosition, message);
				});
			
			} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
			 	// Geolocation 사용이 불가능할 때 기본좌표 지정
				var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
				message = 'Geolocation을 사용할 수 없습니다'
				displayMarker(locPosition, message);
			}
			
			// 지도에 마커와 인포윈도우를 표시하는 함수
			function displayMarker(locPosition, message) {
			
				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({  
			        map: map, 
			        position: locPosition
				}); 
			    
			    var geoInfoContent = message // 인포윈도우에 표시할 내용
			
			    // 인포윈도우를 생성합니다
			    geoInfowindow = new kakao.maps.InfoWindow({
			        content: geoInfoContent,
			        removable: true,
			        zIndex: 1
			    });
			    
			    // 인포윈도우를 마커위에 표시합니다 
			    geoInfowindow.open(map, marker);
			    
			    // 지도 중심좌표를 접속위치로 변경합니다
			    map.setCenter(locPosition);
			}
			
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
			
			// 카카오맵 API 지도설정 및 생성
			// 1:20m, 2:30m, 3:50m, 4:100m, 5:250m, 6:500m, 7:1km, 8:2km
			// 9:4km, 10:8km, 11:16km, 12:32km, 13:64km, 14:128km
			var container = document.getElementById('map'); // 지도를 표시할 div
			var options = {
			    center: new kakao.maps.LatLng(geolat, geolon), // 지도 중심좌표 위도, 경도 순으로 입력
			   	level: 4
			};
			
			// 지도 생성
			var map = new kakao.maps.Map(container, options);
			
			
			// 클러스터러 생성
			var clusterer = new kakao.maps.MarkerClusterer({
			    map: map,
			    averageCenter: true,
			    minLevel: 4
			});
			
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			
			// 장소검색 객체 생성
			var ps = new kakao.maps.services.Places();
			
			// 현재위치, 약국위치 비교 메서드
			function calculateDistance(mylat, mylon, pharlat, pharlon) {
				const earthRadius = 6371; // 지구의 반지름 km
			
				// 각도를 라디안으로 변환
				const toRadians = (degrees) => (degrees * Math.PI) / 180;
			
				// 위도와 경도 차이계산
				const dLat = toRadians(pharlat - mylat);
				const dLon = toRadians(pharlon - mylon);
			
				// 하버사인 공식 적용
				const a =
					Math.sin(dLat / 2) * Math.sin(dLat / 2) +
					Math.cos(toRadians(mylat)) *
					Math.cos(toRadians(pharlat)) *
					Math.sin(dLon / 2) *
					Math.sin(dLon / 2);
			
				const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
			
				// 거리계산
				const distanceKm = earthRadius * c;
				// km -> m로 변환
				const distance = Math.round(distanceKm * 1000);
				
				return distance;
			}
			
			// 열린 인포윈도우 추적용 변수
			var currentInfoWindow = null;
			
			// 지도 확대, 축소시 인포윈도우를 닫음
			kakao.maps.event.addListener(map, 'zoom_changed', function() {        
				if(currentInfoWindow) {
					currentInfoWindow.close();
				}
			});
			// Geocoder를 이용한 버전
			// 검색한 지역을 좌표로 변환하고 해당 지역으로 이동하는 기능
			function moveMapToArea(areaKeyword) {
				geocoder.addressSearch(areaKeyword, function(result, status) {
					if(status === kakao.maps.services.Status.OK) {
						var areaLat = result[0].y;
						var areaLng = result[0].x;
						areaLatLng = new kakao.maps.LatLng(areaLat, areaLng);
						map.setCenter(areaLatLng);
					} else {
						console.log('geocoding service failed: ' + status);
					}
				});
			}
			
			// 카카오 플레이스를 이용한 버전
			function moveMapToArea2(areaKeyword) {
				ps.keywordSearch(areaKeyword, function(result, status) {
					if(status === kakao.maps.services.Status.OK) {
						var areaLat = result[0].y;
						var areaLng = result[0].x;
						areaLatLng = new kakao.maps.LatLng(areaLat, areaLng);
						map.setCenter(areaLatLng);
					} else {
						console.log('place service failed: ' + status);
					}
				});
			}
			
			// 키워드 입력후 검색버튼 이용해 이동기능 작동
			document.getElementById('searchBtn').addEventListener('click', function() {
				var areaKeyword = document.getElementById('areaKeyword').value;
				moveMapToArea2(areaKeyword);
			});
				
			// 약국 API 호출 및 지도에 반영
			function mapStart(s1, s2){ // ------------------------------------------------------------------------------------------------------------------------------------------
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
				queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('500');
				xhr.open('GET', url + queryParams);
				
				// 요청정보 확인용
				//console.log(url+queryParams);
				
				var pharmacies = []; // 약국 위치정보를 담기위한 배열
				
				// 사이드바 기능 변수
				var pharList = document.getElementById('pharmacies-list');
				pharList.innerHTML = '';
				
				// 페이지가 준비되면 파싱시작
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
							
							// 약국 API의 좌표길이가 너무 길면 오류가 발생하여 처리한 부분
							var latElement = pharmacy.getElementsByTagName('wgs84Lat')[0];
							var latValue = latElement ? parseFloat(latElement.textContent) : 0;
							var lat2 = latValue.toFixed(14);
							var lngElement = pharmacy.getElementsByTagName('wgs84Lon')[0];
							var lngValue = lngElement ? parseFloat(lngElement.textContent) : 0;
							var lng2 = lngValue.toFixed(14);
			
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
							var distance = calculateDistance(geolat, geolon, lat2, lng2);
							
							// 추출된 요소 pharmacies 배열에 추가
							pharmacies.push({
								dutyAddr : dutyAddr2,
								dutyName : dutyName2,
								dutyTel : dutyTel2,
								dutyTime1c : dutyTime1c2,
								dutyTime2c : dutyTime2c2,
								dutyTime3c : dutyTime3c2,
								dutyTime4c : dutyTime4c2,
								dutyTime5c : dutyTime5c2,
								dutyTime6c : dutyTime6c2,
								dutyTime7c : dutyTime7c2,
								dutyTime8c : dutyTime8c2,
								dutyTime1s : dutyTime1s2,
								dutyTime2s : dutyTime2s2,
								dutyTime3s : dutyTime3s2,
								dutyTime4s : dutyTime4s2,
								dutyTime5s : dutyTime5s2,
								dutyTime6s : dutyTime6s2,
								dutyTime7s : dutyTime7s2,
								dutyTime8s : dutyTime8s2,
								lat : lat2,
								lng : lng2,
								distance : distance
							});
						}
						
						// 카카오맵 API 마커와 클러스터 생성 부분
						// 반복문으로 pharmacies의 위치정보를 이용해 마커객체 생성
						var markers = pharmacies.map(function(pharmacy) {
							var pharmacyMarker = new kakao.maps.Marker({
								position: new kakao.maps.LatLng(pharmacy.lat, pharmacy.lng)
							});
							
							// 마우스오버 인포윈도우 내용 약국 이름만 출력함
							var mouseInfoContent = '<div style="padding:5px; width:9rem;">' +
												   '<center>' +
												   pharmacy.dutyName +
												   '</center>' +
												   '</div>';
							
							// 클릭 인포윈도우 내용
							var clickInfoContent = '<div style="padding: 10px;line-height: 20px;">' +
								'<center>' + pharmacy.dutyName + '</center>' +
								'<hr />' +
								'<font size=2>대표전화 : ' + pharmacy.dutyTel + '</font> <br />' +
								'<font size=2>주소 : ' + pharmacy.dutyAddr + '</font> <br />' +
								'<hr />';
								
							if (pharmacy.dutyTime1s !== '') {
								clickInfoContent += '<font size=2>월요일 ' + pharmacy.dutyTime1s + ' ~ ' + pharmacy.dutyTime1c + '</font> <br />';
							}
				 			if (pharmacy.dutyTime2s !== '') {
				 				clickInfoContent += '<font size=2>화요일 ' + pharmacy.dutyTime2s + ' ~ ' + pharmacy.dutyTime2c + '</font> <br />';
							}
				 			if (pharmacy.dutyTime3s !== '') {
				 				clickInfoContent += '<font size=2>수요일 ' + pharmacy.dutyTime3s + ' ~ ' + pharmacy.dutyTime3c + '</font> <br />';
							}
				 			if (pharmacy.dutyTime4s !== '') {
				 				clickInfoContent += '<font size=2>목요일 ' + pharmacy.dutyTime4s + ' ~ ' + pharmacy.dutyTime4c + '</font> <br />';
							}
							if (pharmacy.dutyTime5s !== '') {
								clickInfoContent += '<font size=2>금요일 ' + pharmacy.dutyTime5s + ' ~ ' + pharmacy.dutyTime5c + '</font> <br />';
							}
							if (pharmacy.dutyTime6s !== '') {
								clickInfoContent += '<font size=2>토요일 ' + pharmacy.dutyTime6s + ' ~ ' + pharmacy.dutyTime6c + '</font> <br />';
							}
							if (pharmacy.dutyTime7s !== '') {
								clickInfoContent += '<font size=2>일요일 ' + pharmacy.dutyTime7s + ' ~ ' + pharmacy.dutyTime7c + '</font> <br />';
							}
							if (pharmacy.dutyTime8s !== '') {
								clickInfoContent += '<font size=2>공휴일 ' + pharmacy.dutyTime8s + ' ~ ' + pharmacy.dutyTime8c + '</font> <br />';
							}
							clickInfoContent += '<hr /> <br />' + 
							'</div>';
				            
							// 마우스오버 인포윈도우 객체 생성
							var mouseInfoWindow = new kakao.maps.InfoWindow({
								content: mouseInfoContent,
								removable: true,
								zIndex: 1
							});
							
							// 클릭 인포윈도우 객체 생성
							var clickInfoWindow = new kakao.maps.InfoWindow({
								content: clickInfoContent,
								removable: true,
								zIndex: 1
							});
				
							// 마커에 마우스클릭 이벤트 발생시 인포윈도우 생성
							kakao.maps.event.addListener(pharmacyMarker, 'click', function() {
								if(currentInfoWindow) {
									currentInfoWindow.close();
								}
								clickInfoWindow.open(map, pharmacyMarker);
								currentInfoWindow = clickInfoWindow;
							});
							
							// 마커에 마우스오버 이벤트 발생시 인포윈도우 생성
							kakao.maps.event.addListener(pharmacyMarker, 'mouseover', function() {
								if(currentInfoWindow) {
									currentInfoWindow.close();
								}
								mouseInfoWindow.open(map, pharmacyMarker);
								currentInfoWindow = mouseInfoWindow;
							});
							
							// 마커에 마우스아웃 이벤트 발생시 인포윈도우 제거
							kakao.maps.event.addListener(pharmacyMarker, 'mouseout', function() {
								mouseInfoWindow.close();
							});
							
						return pharmacyMarker;
						});
						
						// 기존의 마커와 클러스터러를 전부 지웁니다
						clusterer.clear();
						
						// 마커와 마커클러스터러 생성
						clusterer.addMarkers(markers);
						
						// 약국 정보배열을 거리순으로 정렬
						pharmacies.sort((a, b) => a.distance - b.distance);
						
						// 사이드바 시작부분 ----------------------------------------------------------------------------------------------------------------------------
						// 사이드바에 목록추가
						pharmacies.forEach(function(pharmacy) {
							var listItem = document.createElement('li');
							listItem.innerHTML = '<hr />' +
							pharmacy.dutyName + '<br />' +
							pharmacy.dutyAddr + '<br />' +
							pharmacy.dutyTel + '<br />' +
							pharmacy.distance + 'm' + '<hr />';
							pharList.appendChild(listItem);
							
							// 이벤트에 쓰일 변수
							var eventPosition, eventMarker, eventInfoWindow;
							
							var mouseInfoContent = '<div style="padding:5px; width:9rem;">' +
												   '<center>' +
					    						   pharmacy.dutyName +
												   '</center>' +
												   '</div>';
												   
							var clickInfoContent = '<div style="padding:10px;">' +
							'<center>' + pharmacy.dutyName + '</center>' +
							'<hr />' +
							'<font size=2>대표전화 : ' + pharmacy.dutyTel + '</font> <br />' +
							'<font size=2>주소 : ' + pharmacy.dutyAddr + '</font> <br />' +
							'<hr />';
							
							if (pharmacy.dutyTime1s !== '') {
								clickInfoContent += '<font size=2>월요일 ' + pharmacy.dutyTime1s + ' ~ ' + pharmacy.dutyTime1c + '</font><br />';
							}
							if (pharmacy.dutyTime2s !== '') {
								clickInfoContent += '<font size=2>화요일 ' + pharmacy.dutyTime2s + ' ~ ' + pharmacy.dutyTime2c + '</font><br />';
							}
							if (pharmacy.dutyTime3s !== '') {
								clickInfoContent += '<font size=2>수요일 ' + pharmacy.dutyTime3s + ' ~ ' + pharmacy.dutyTime3c + '</font><br />';
							}
							if (pharmacy.dutyTime4s !== '') {
								clickInfoContent += '<font size=2>목요일 ' + pharmacy.dutyTime4s + ' ~ ' + pharmacy.dutyTime4c + '</font><br />';
							}
							if (pharmacy.dutyTime5s !== '') {
								clickInfoContent += '<font size=2>금요일 ' + pharmacy.dutyTime5s + ' ~ ' + pharmacy.dutyTime5c + '</font><br />';
							}
							if (pharmacy.dutyTime6s !== '') {
								clickInfoContent += '<font size=2>토요일 ' + pharmacy.dutyTime6s + ' ~ ' + pharmacy.dutyTime6c + '</font><br />';
							}
							if (pharmacy.dutyTime7s !== '') {
								clickInfoContent += '<font size=2>일요일 ' + pharmacy.dutyTime7s + ' ~ ' + pharmacy.dutyTime7c + '</font><br />';
							}
							if (pharmacy.dutyTime8s !== '') {
								clickInfoContent += '<font size=2>공휴일 ' + pharmacy.dutyTime8s + ' ~ ' + pharmacy.dutyTime8c + '</font><br />';
							}
							clickInfoContent += '<hr /><br />' + 
							'</div>';
							
							// 사이드바 마우스오버 이벤트
							listItem.addEventListener('mouseover', function() {
								eventPosition = new kakao.maps.LatLng(pharmacy.lat, pharmacy.lng);
								eventMarker = new kakao.maps.Marker({ position : eventPosition });
								
								if(currentInfoWindow) {
									currentInfoWindow.close();
								}
								eventInfoWindow = new kakao.maps.InfoWindow({
									content: mouseInfoContent,
									removable: true,
									disableAutoPan: true,
									zIndex: 1
								});
								eventInfoWindow.open(map, eventMarker);
								currentInfoWindow = eventInfoWindow;
							});
							
							// 사이드바 마우스아웃 이벤트
							listItem.addEventListener('mouseout', function() {
								eventMarker.setMap(null);
								eventInfoWindow.close();
							});
							
							// 사이드바 클릭 이벤트
							listItem.addEventListener('click', function() {
								eventPosition = new kakao.maps.LatLng(pharmacy.lat, pharmacy.lng);
								eventMarker = new kakao.maps.Marker({ position: eventPosition });
								
								if (currentInfoWindow) {
									currentInfoWindow.close();
								}
								
								var eventInfoWindow2 = new kakao.maps.InfoWindow({
									content: clickInfoContent,
									removable: true,
									disableAutoPan: true,
									zIndex: 1
								});
								eventInfoWindow2.open(map, eventMarker);
								currentInfoWindow = eventInfoWindow2;
							});
							
							// 사이드바 약국정보 페이지네이션 기능
							function displayPagination(currentPage, itemsPerPage) {
								var pharList = document.getElementById('pharmacies-list');
								var listItems = pharList.getElementsByTagName('li');
								var totalPages = Math.ceil(listItems.length / itemsPerPage);
			
								// Show the relevant items for the current page
								var startIndex = (currentPage - 1) * itemsPerPage;
								var endIndex = Math.min(startIndex + itemsPerPage, listItems.length);
			
								for (var i = 0; i < listItems.length; i++) {
									listItems[i].style.display = 'none';
								}
			
								for (var j = startIndex; j < endIndex; j++) {
									listItems[j].style.display = 'block';
								}
			
								// Update pagination buttons
								var currentPageSpan = document.getElementById('current-page');
								var totalPageSpan = document.getElementById('total-pages');
								currentPageSpan.textContent = currentPage;
								totalPageSpan.textContent = totalPages;
							}
			
							// Assuming each page displays 10 items
							var itemsPerPage = 5;
							var currentPage = 1;
			
							// Call the pagination function to display the initial page
							displayPagination(currentPage, itemsPerPage);
			
							// Add event listeners to pagination buttons
							document.getElementById('first-page').addEventListener('click', function () {
								currentPage = 1;
								displayPagination(currentPage, itemsPerPage);
							});
			
							document.getElementById('prev-page').addEventListener('click', function () {
								currentPage = Math.max(currentPage - 1, 1);
								displayPagination(currentPage, itemsPerPage);
							});
			
							document.getElementById('next-page').addEventListener('click', function () {
								currentPage = Math.min(currentPage + 1, Math.ceil(pharmacies.length / itemsPerPage));
								displayPagination(currentPage, itemsPerPage);
							});
			
							document.getElementById('last-page').addEventListener('click', function () {
								currentPage = Math.ceil(pharmacies.length / itemsPerPage);
								displayPagination(currentPage, itemsPerPage);
							});
							
						}); // 사이드바 끝부분 ----------------------------------------------------------------------------------------------------------------------------
					}
				};
				xhr.send('');
			} // mapStart(); ------------------------------------------------------------------------------------------------------------------------------------------
			var a1 = null, a2 = null;
			
			mapStart(a1, a2);
			
			var sidoSelect = document.getElementById('sido');
			var gugunSelect = document.getElementById('gugun');
			
			function handleSelectChange() {
				var sidoCode = sidoSelect.value;
				var gugunCode = gugunSelect.value;
			
				// 시/도와 구/군이 둘 다 지정되었을 때
				if (sidoCode && gugunCode) {
					// Select문으로 선택한 시/도와 구/군 선택값을 텍스트로 가져와 저장
					var address = sidoSelect.options[sidoSelect.selectedIndex].text + ' ' + gugunSelect.options[gugunSelect.selectedIndex].text;
				    // 저장된 텍스트를 기반으로 검색 후 결과값으로 지도 위치를 변경함
					geocoder.addressSearch(address, function(result, status) {
						if (status === kakao.maps.services.Status.OK) {
							var center = new kakao.maps.LatLng(result[0].y, result[0].x);
							map.setCenter(center);
						}
					});
				}
				// 세종시는 구/군 select가 따로 없어 시/도가 선택되면 이동되도록 만듬
				if (sidoCode == "세종특별자치시") {
					var address = sidoSelect.options[sidoSelect.selectedIndex].text
					
					geocoder.addressSearch(address, function(result, status) {
						if (status === kakao.maps.services.Status.OK) {
							var center = new kakao.maps.LatLng(result[0].y, result[0].x);
							map.setCenter(center);
						}
					});
				}
			}
			
			// select문 sido와, gugun이 선택되어 변화될때 해당하는 지역으로 이동하는 기능
			sidoSelect.addEventListener('change', handleSelectChange);
			gugunSelect.addEventListener('change', handleSelectChange);
			
			
			// 확대수준이 변경되거나 지도가 이동했을때 타일 이미지 로드가 모두 완료되면 발생함.
			kakao.maps.event.addListener(map, 'tilesloaded', function() {
				searchAddrFromCoords(map.getCenter(), displayCenterInfo);
				//clusterer.clear(); // 기존의 마커와 클러스터러를 전부 지웁니다
			});
			
			function searchAddrFromCoords(coords, callback) {
				// 좌표로 행정동 주소 정보를 요청합니다
				geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);
			}
			
			// 지도 중심좌표에 대한 주소정보를 표출하는 메서드
			function displayCenterInfo(result, status) {
				if (status === kakao.maps.services.Status.OK) {
					// 테스트용
					// var infoDiv = document.getElementById('centerAddr');
			        for(var i = 0; i < result.length; i++) {
			            // 행정동의 region_type 값은 'H' 이므로
			            if (result[i].region_type === 'H') {
			               // 테스트용
			               // infoDiv.innerHTML = result[i].address_name;
			                a1 = result[i].address_name.split(" ")[0];
			                a2 = result[i].address_name.split(" ")[1];     
			                mapStart(a1, a2);
			                break;
			            }
			        }
			    }
			}
			
			// 지도 우측 상단에 확대 축소 컨트롤을 생성하는 부분
			var zoomControl = new kakao.maps.ZoomControl();
			map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
			
			<!-- Jquery를 이용한 지역선택기능 -->
			// 8은 세종시라서 없음
			$('document').ready(function() {
				var area0 = ["시/도 선택","서울특별시","부산광역시","대구광역시","인천광역시","광주광역시","대전광역시","울산광역시","세종특별자치시","경기도","강원특별자치도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주특별자치도"];
				var area1 = ["구/군 선택","강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
				var area2 = ["구/군 선택","강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
				var area3 = ["구/군 선택","남구","달서구","달성군","동구","북구","서구","수성구","중구"];
				var area4 = ["구/군 선택","강화군","계양구","남동구","동구","미추홀구","부평구","서구","연수구","옹진군","중구"];
				var area5 = ["구/군 선택","광산구","남구","동구","북구","서구"];
				var area6 = ["구/군 선택","대덕구","동구","서구","유성구","중구"];
				var area7 = ["구/군 선택","남구","동구","북구","중구","울주군"];
				var area9 = ["구/군 선택","가평군","고양시","고양시덕양구","고양시일산동구","고양시일산서구","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","성남시분당구","성남시수정구","성남시중원구","수원시","수원시권선구","수원시영통구","수원시장안구","수원시팔달구","시흥시","안산시","안산시단원구","안산시상록구","안성시","안양시","안양시동안구","안양시만안구","양주시","양평군","여주시","연천군","오산시","용인시","용인시기흥구","용인시수지구","용인시처인구","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시"];
				var area10 = ["구/군 선택","강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
				var area11 = ["구/군 선택","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","제천시","청주시","청주시상당구","청주시서원구","청주시청원구","청주시흥덕구","충주시"];
				var area12 = ["구/군 선택","계룡시","공주시","금산군","논산시","당진시","보령시","부여군","서산시","서천군","아산시","예산군","천안시","천안시동남구","천안시서북구","청양군","태안군","홍성군"];
				var area13 = ["구/군 선택","고창군","군산시","김제시","남원시","무주군","부안군","순창군","완주군","익산시","임실군","장수군","전주시","전주시덕진구","전주시완산구","정읍시","고창군","진안군"];
				var area14 = ["구/군 선택","강진군","고흥군","곡성군","광양시","구례군","나주시","담양군","목포시","무안군","보성군","순천시","신안군","여수시","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
				var area15 = ["구/군 선택","경산시","경주시","고령군","구미시","군위군","김천시","문경시","봉화군","상주시","성주군","안동시","영덕군","영양군","영주시","영천시","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군","포항시","포항시남구","포항시북구"];
				var area16 = ["구/군 선택","거제시","거창군","고성군","김해시","남해군","밀양시","사천시","산청군","양산시","의령군","진주시","창녕군","창원시","창원시마산합포구","창원시마산회원구","창원시성산구","창원시의창구","창원시진해구","통영시","하동군","함안군","함양군","합천군"];
				var area17 = ["구/군 선택","서귀포시","제주시"];
			
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
					$selsido.parent().siblings("li").find("select[name='gugun']").append("<option value=''>구/군 선택</option>");
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
					var $gugun = $(this).parent().siblings("li").find("select[name='gugun']"); // 선택영역 구군 객체
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
			
			// 사이드바 부분
			var toggleMenu = document.getElementById('toggle-menu');
			var sidebar = document.querySelector('.sidebar');
			var menuButton = document.querySelector('.menu-button');
			
			toggleMenu.addEventListener('change', function() {
				if (toggleMenu.checked) {
					sidebar.classList.add('open');
					menuButton.style.transform = 'translateX(500px)';
			  	} else {
			    	sidebar.classList.remove('open');
			    	menuButton.style.transform = 'translateX(0)';
			  	}
			});
		</script>
		
		<button onclick="panTo()" draggable="false" title="내위치" type="button" class="gps-icon" style="background-color:#fff; cursor: pointer; width: 32px; height: 32px; user-select: none; -webkit-user-drag: none; border-top: none; border-right: none; border-bottom: 1px solid rgb(226, 226, 226); border-left: none; border-image: initial; border-radius: 3px 3px 3px 3px;"><i class="fa-solid fa-location-crosshairs" style="color: #444444;"></i></button>
		<script>
		var loginBtnElement = document.getElementById('kakao-login-btn');

		//로그인
		Kakao.init('f4352b5c75fa4dee61f430ab3f1ff6f4'); // javascript키
		//console.log(Kakao.isInitialized()); // 카카오디벨로퍼 활성화시 true
		Kakao.Auth.createLoginButton({
			container: loginBtnElement,
			success: function(authObj) {
				Kakao.API.request({
					url: '/v2/user/me',
					success: function(result) {
						console.log(result);
						$('#result').append(result);
						id = result.id;
						connected_at = result.connected_at;
						kakao_account = result.kakao_account;
						$('#result').append(kakao_account);
						resultdiv = "<h2>로그인 성공 !!";
						resultdiv += '<h4>id: ' + id + '<h4>';
						resultdiv += '<h4>connected_at: '+connected_at+'<h4>';

						nick = kakao_account.profile.nickname;
						resultdiv += '<h4>nick: ' + nick + '<h4>';

						gender = kakao_account.gender;
						resultdiv += '<h4>gender: ' + gender + '<h4>';

						age_range = kakao_account.age_range;
		                resultdiv += '<h4>age_range: ' + age_range + '<h4>';
		                
						$('#result').append(resultdiv);
						// 서버로 값 전송
						$.ajax({
							type : 'POST',
							url : 'kakaoSigninPro',
							data : {
								id : id,
								nick : nick,
								gender : gender ? gender : null,
		                        age_range : age_range ? age_range : null
								// 필요한경우 추가작성
							},
							success : function(response) {
								// 서버로부터 응답 처리
								console.log(response);
								//location.reload()
								// 원하는 작업 수행
							},
							error: function(jqXHR, textStatus, errorThrown) {
					            // 현재 에러가 나오고는 있으나 DB, 로그인 자체는 정상적으로 진행되는것으로 확인됨
								console.log(jqXHR);
					            console.log(textStatus);
					            console.log(errorThrown);
							},
							complete: function() {
								location.reload();
							}
						});
					},
					fail: function(error) {
						alert('login success, but failed to request user information: ' +JSON.stringify(error))
					},
				})
			},
			fail: function(err) {
				alert('failed to login: ' + JSON.stringify(err))
			},
		})
		</script>
    </body>
    <style>
    #kakao-login-btn {
	    background-color: #FFEB00;
	    color: #000000;
	    border: none;
	    padding: 1px 6px;
	    font-size: 16px;
	    cursor: pointer;
	    border-radius: 5px;
	    width:100px;
    }
    
	#kakao-login-btn img{width:100%;}
    
	.btn-primary {
	    --bs-btn-color: black;
	    --bs-btn-bg: white;
	    --bs-btn-border-color: white;
	    --bs-btn-hover-color: #fff;
	    --bs-btn-hover-bg: #0b5ed7;
	    --bs-btn-hover-border-color: #0a58ca;
	    --bs-btn-focus-shadow-rgb: 49,132,253;
	    --bs-btn-active-color: #fff;
	    --bs-btn-active-bg: #0a58ca;
	    --bs-btn-active-border-color: #0a53be;
	    --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
	    --bs-btn-disabled-color: #fff;
	    --bs-btn-disabled-bg: #0d6efd;
	    --bs-btn-disabled-border-color: #0d6efd;
	}

	.btn-primary2 {
	    --bs-btn-color: black;
	    --bs-btn-bg: white;
	    --bs-btn-border-color: white;
	    --bs-btn-hover-color: #fff;
	    --bs-btn-hover-bg: #0b5ed7;
	    --bs-btn-hover-border-color: #0a58ca;
	    --bs-btn-focus-shadow-rgb: 49,132,253;
	    --bs-btn-active-color: #fff;
	    --bs-btn-active-bg: #0a58ca;
	    --bs-btn-active-border-color: #0a53be;
	    --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
	    --bs-btn-disabled-color: #fff;
	    --bs-btn-disabled-bg: #0d6efd;
	    --bs-btn-disabled-border-color: #0d6efd;
	    position: absolute;
	    top: 12px;
	    left: 20px;
	}

	.offcanvas{
	    --bs-offcanvas-zindex: 1045;
	    --bs-offcanvas-width: 220px;
	    --bs-offcanvas-height: 30vh;
	    --bs-offcanvas-padding-x: 1rem;
	    --bs-offcanvas-padding-y: 1rem;
	    --bs-offcanvas-color: var(--bs-body-color);
	    --bs-offcanvas-bg: var(--bs-body-bg);
	    --bs-offcanvas-border-width: var(--bs-border-width);
	    --bs-offcanvas-border-color: var(--bs-border-color-translucent);
	    --bs-offcanvas-box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
	    --bs-offcanvas-transition: transform 0.3s ease-in-out;
	    --bs-offcanvas-title-line-height: 1.5;
	}

	#offcanvasRight{
	    --bs-offcanvas-zindex: 1045;
	    --bs-offcanvas-width: 400px;
	    --bs-offcanvas-height: 30vh;
	    --bs-offcanvas-padding-x: 1rem;
	    --bs-offcanvas-padding-y: 1rem;
	    --bs-offcanvas-color: var(--bs-body-color);
	    --bs-offcanvas-bg: var(--bs-body-bg);
	    --bs-offcanvas-border-width: var(--bs-border-width);
	    --bs-offcanvas-border-color: var(--bs-border-color-translucent);
	    --bs-offcanvas-box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
	    --bs-offcanvas-transition: transform 0.3s ease-in-out;
	    --bs-offcanvas-title-line-height: 1.5;
	}

	.MuiAvatar-img{
		width: 35px;
		height: 35px;
		border-radius: 50%;
		overflow: hidden;
		position: absolute;
		top: 14px;
		right: 25px;
	}

	.dropdown-divider{
		content: "";
		display: block;
		width: 3px;
		border-bottom: 3px;
	}

	#closeLoginModal {
		position: absolute;
		top: 0px;
		right: 10px;
		font-size: 20px;
		background: none;
		border: none;
		cursor: pointer;
	}

	#loginModal {
		position: absolute;
		top: 48.8%;
		left: 91.2%;
		transform: translate(-50%, -50%);
		width: 300px;
	}
	
	.p-header {
		background:#fff;
		height: 64px;
	}
		
	.p-header > div {
		padding: 0px 15px 0px 15px;
	}
	
	.p-header2 {
		height: 54px;
		
	}
	
	.p-header2 > div {
		padding: 0px 15px 0px 15px;
	}
	
	.gps-icon {
	 	position:absolute;
	 	top: 34.2%;
	 	right: 0.2%;
	 	z-index:1;
	}
	
	#toggle-menu { 
	    display: none;
	    z-index:3;
	}
	
	.container {
		background-color: #fff;
		display: flex;
	}
	
	.sidebar {
		width: 500px;
	  	background-color: #fff;
	  	transition: transform 0.5s ease;
	  	transform: translateX(-500px);
	  	position: fixed;
	  	top: 118px;
	  	z-index:1;
	  	overflow-y: auto;
	  	height: 85vh;
	}
	
	.sidebar ul {
		margin-left: 27px;
		height: 95%;
	}
	.sidebar li {
		display: block;
		width: 24rem;
	}
	.sidebar.open {
	  	transform: translateX(0);
	}
	
	#pagination {
		display: flex;
   		justify-content: center;
   		gap: 5px;
	}
	
	.content {
		flex: 1;
	  	padding: 20px;
	}
	
	.menu-button {
		cursor: pointer;
		position: absolute;
		top:52vh;
	  	z-index: 2;
	  	border-color: #fff;
	  	background-color: #fff;
	  	cursor: pointer;
	  	width: 23px;
	  	height: 50px;
	  	border-radius: 0px 3px 3px 0px;
	  	display: flex;
	  	justify-content: center;
	  	align-items: center;
	  	padding-right: 4px;
	  	transition: transform 0.5s ease;
	}
	a{color:#111;}
	</style>
</html>