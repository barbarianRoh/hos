<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta charset="utf-8">
	<title>증상으로 병원찾기</title>

<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<!-- 제이쿼리 -->
<script src="//code.jquery.com/jquery-3.7.0.min.js"></script>
<!-- 폰트어썸 -->
<script src="https://kit.fontawesome.com/f507061817.js" crossorigin="anonymous"></script>
<!-- 카카오 로그인 -->        
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- 닥터게이트 -->
<link rel="stylesheet" type="text/css" href="/hos/resources/css/font.css">
<link rel="stylesheet" type="text/css" href="/hos/resources/css/main.css">
<link rel="stylesheet" type="text/css" href="/hos/resources/css/main2.css">

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
    top: 20px;
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
	width: 35px; /* 필요한 크기에 맞게 조정해주세요 */
	height: 35px;
	border-radius: 50%;
	overflow: hidden; /* 이 속성으로 넘치는 내용을 가리게 됩니다 */
	position: absolute;
	top: 20px;
	right: 20px;
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
	/* ... (other styles) ... */
}
</style>

<c:if test="${loginFailed}">
	<script>
		alert("아이디 혹은 비밀번호를 확인하세요");
		window.location.href = '/hos/kim/main';
	</script>
</c:if>

<!-- 헤더이면서 사이드바와 로그인버튼을 헤더부분에 고정시키는 곳 -->
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
	                  <c:if test="${sessionScope.sid != null || sessionScope.knick != null}">
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
</script>

<div>
<br />
<p align="center" style="font-size: 20px;font-weight:400;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>증상으로 병원 검색</strong></p>
<br />
</div>
<div class="d-flex justify-content-start mb-0">
<!-- W0은 선택된 부위의 값 W1 선택된 증상의 값 -->
<form method="get" name="selectHos" action="/hos/choo/resultHos">
	
	<div class="d-flex justify-content-start" style="width:80%;">
		&nbsp;&nbsp;&nbsp;&nbsp;<select style="width: 150px;" class="form-select form-select-sm" aria-lable="Small select example" name="where1" id="where1"></select>&nbsp;&nbsp;
		<select style="width: 150px;" class="form-select form-select-sm" aria-lable="Small select example" name="apa1" id="apa1"></select>&nbsp;&nbsp;
	
		<input type="hidden" id="W0" name="W0" value="">
		<input type="hidden" id="W1" name="W1" vlaue="">
		<input type="hidden" id="Q0" name="Q0" value="">
		<input type="hidden" id="Q1" name="Q1" value="">
	
	
	<input class="btn btn-primary" type="submit" value="검색">
	</div>
</form>
<div class="">
<div class="container mb-0"></div>
<button class="btn btn-info" onclick="panTo()" style="height: 40px;">내 위치로 이동</button>
</div></div>



<!-- 카카오맵API와 서비스, 클러스터기능 라이브러리 불러옴 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2100589fb32df980773796dffa657449&libraries=services,clusterer"></script>

<!-- 지도를 표시할 div 입니다 -->
<div id="map" style="width:1918px;height:788px;"></div>


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

	//카카오 로그인할 때 필요한 부분
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

