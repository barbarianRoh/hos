<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script defer type="text/javascript" src="/hos/resources/js/body.content.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f4352b5c75fa4dee61f430ab3f1ff6f4&libraries=services"></script>
<link rel="stylesheet" type="text/css" href="/hos/resources/css/symptom2.css">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<!-- 제이쿼리 -->
<script src="//code.jquery.com/jquery-3.7.0.min.js"></script>
<!-- 폰트어썸 -->
<script src="https://kit.fontawesome.com/f507061817.js" crossorigin="anonymous"></script>
<!-- 챗봇 -->
<script src="/hos/resources/js/chatForm2.js"></script>
<script src="/hos/resources/js/chatForm.js"></script>
<link rel="stylesheet" type="text/css" href="/hos/resources/css/chatbot.css">
<!-- 카카오 로그인 -->        
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- 닥터게이트 -->

<title>증상체크</title>
    <style>
        .symptompage {
            display: flex;
            flex-direction: column;
            min-height: 88vh;
        }

        #buttonContainer {
            margin-bottom: auto;
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
		.MuiAvatar-img{
			width: 35px; /* 필요한 크기에 맞게 조정해주세요 */
		    height: 35px;
		    border-radius: 50%;
		    overflow: hidden; /* 이 속성으로 넘치는 내용을 가리게 됩니다 */
		    position: absolute;
		    top: 20px;
		    right: 20px;
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

    </style>
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
	<c:if test="${loginFailed}">
	<script>
		alert("아이디 혹은 비밀번호를 확인하세요");
		window.location.href = '/hos/kim/main';
	</script>
</c:if>
</head>


<body>
	<div class ="symptompage">
		<header class = "bg-dark py-3">
			<div class="text-center text-white">
				<h1 class="display-4 fw-bolder">아파, 어디가?</h1>
			</div>			
			<!-- 버튼 프라이머리 2가 햄버거 -->        
			<a class="btn btn-primary2" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" aria-controls="offcanvasExample"><i class="fa-solid fa-bars" style="color: #000000;"></i></a>
			
			<div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
				<div class="offcanvas-header">
					<a class="offcanvas-title" id="offcanvasExampleLabel" href="/hos/kim/main">아파:어디가?</a>
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
								<c:if test="${sessionScope.sid != null || sessionScope.knick != null  }">
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
								<c:if test="${sessionScope.sid != null && sessionScope.knick == null}">
									<button id="closeLoginModal" class="close-button">×</button>
								</c:if>						    	
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
		<article id ="content">
			<div class="content-header" data-cms-content="/health/_content/title"><!-- 뭔지 모르겠음 -->
			</div>
			<div class="content-body cms-search cms-print" id="cms-content">
				<div class="box-guide d-down-md" style="text-align: center;">
				</div>
				<div class="body-search">
					<div id="body-image" class="body-imaege"style="
						margin-left: 100px;
						margin-right: 100px;
						
					">
						<button class="ghost-button"></button>
						<input type="button" class="ghost-button" value="머리" id="head" onclick="addNewButton('head', 3)">

					    <script>
					        var customButtonNames = {
					            head: ['두통', '어지럼증', '편두통'],
					            urology:['통증','혈뇨','요실금'],
					            abdomen:['구토','복통','설사','변비','속쓰림'],
					            face:['눈 충혈','저시력','눈간지럼','코 막힘'],
					            chest:['객혈','호흡곤란','흉통','가슴쓰림'],
					            ear:['귀 통증','이명','난청'],
					            mouth:['이 통증','이 시림','잇몸 출혈'],
					            neck:['기침'],
					            hand:['손떨림']
					        
					            	
					            // Add more custom button names and links here
					        };
					        
							var hos1 = 'http://localhost:8080/hos/choo/resultHos';
					
					        var customButtonLinks = {
					            head: {
					                '두통': '',
					                '어지럼증': '',
					                '편두통': '',
					                '손 떨림': ''
					            },
					            urology: {
					                '통증': '',
					                '혈뇨': '',
					                '요실금': ''
					            },
					            abdomen: {
					                '구토': '',
					                '복통': '',
					                '설사': '',
					                '변비': '',
					                '속쓰림': ''
					                
					            },
					            face: {
					                '눈 충혈': '',
					                '저시력': '',
					                '눈간지럼': '',
					                '귀 통증': '',
					                '이명': '',
					                '난청': '',
					                '이 통증': '',
					                '이 시림': '',
					                '잇몸 출혈': '',
					                '코 막힘': ''
					            },
					            chest: {
					                '객혈': '',
					                '호흡곤란': '',
					                '흉통': '',
					                '가슴쓰림': '',
					                '기침': ''
					            },
					            // Add more custom button links here
					        };
					
					        function addNewButton(type, count) {
					            var buttonContainer = document.getElementById('buttonContainer');
					            buttonContainer.innerHTML = ''; // Clear previous buttons
					            
					            for (var i = 0; i < count; i++) {
					                var button = document.createElement('button');
					                button.setAttribute('class', 'link-button');
					                var buttonName = customButtonNames[type][i] || type + ' Button ' + (i + 1);
					                button.textContent = buttonName;
					                button.onclick = createCustomLinksHandler(type, buttonName);
					                buttonContainer.appendChild(button);
					            }
					        }
					
					        function createCustomLinksHandler(type, buttonName) {
					            return function() {
					            	var queryParams = '';
					            	
					            	if(buttonName === '통증'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('비뇨기') +
							                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('통증') +
							                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
							                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	} else if(buttonName === '혈뇨'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('비뇨기') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('혈뇨') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	} else if(buttonName === '어지럼증'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('머리') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('어지럼증') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	} else if(buttonName === '요실금'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('비뇨기') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('요실금') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	} else if(buttonName === '두통'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('머리') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('두통') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	} else if(buttonName === '편두통'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('머리') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('편두통') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	} else if(buttonName === '손 떨림'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('머리') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('손 떨림') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	}else if(buttonName === '구토'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('배') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('구역질/구토') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	} else if(buttonName === '복통'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('배') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('복통') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	} else if(buttonName === '설사'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('배') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('설사') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	} else if(buttonName === '변비'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('배') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('변비') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	} else if(buttonName === '속쓰림'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('배') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('속쓰림') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	} else if(buttonName === '눈 충혈'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('얼굴') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('눈충혈') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	} else if(buttonName === '저시력'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('얼굴') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('저시력') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	} else if(buttonName === '눈간지럼'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('얼굴') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('눈간지럼') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	} else if(buttonName === '귀 통증'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('얼굴') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('귀통증') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	} else if(buttonName === '이명'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('얼굴') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('이명') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	} else if(buttonName === '난청'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('얼굴') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('난청') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	} else if(buttonName === '이 통증'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('얼굴') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('이통증') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	} else if(buttonName === '이 시림'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('얼굴') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('이시림') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	} else if(buttonName === '잇몸 출혈'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('얼굴') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('잇몸출혈') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	} else if(buttonName === '코 막힘'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('얼굴') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('코막힘') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	} else if(buttonName === '객혈'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('가슴') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('객혈') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	} else if(buttonName === '호흡곤란'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('가슴') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('호흡곤란') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	} else if(buttonName === '흉통'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('가슴') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('흉통') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	} else if(buttonName === '기침'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('가슴') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('기침') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	} else if(buttonName === '가슴쓰림'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('가슴') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('가슴쓰림') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	} else if(buttonName === '손떨림'){
						            	queryParams = encodeURIComponent('W0') + '=' + encodeURIComponent('머리') +
						                '&' + encodeURIComponent('W1') + '=' + encodeURIComponent('손떨림') +
						                '&' + encodeURIComponent('Q0') + '=' + encodeURIComponent(sido) +
						                '&' + encodeURIComponent('Q1') + '=' + encodeURIComponent(gugun);
					            	}       
					        	
					                var link = hos1;
					                var buttonText = buttonName; // Default text
					                
					                //머리
					                if (buttonName === '두통') {
					                    buttonText = '내과';
					                } else if (buttonName === '어지럼증') {
					                    buttonText = '내과';
					                } else if (buttonName === '편두통') {
					                    buttonText = '내과';
					                } else if (buttonName === '손떨림') {
					                    buttonText = '내과';
					                } 
					                
					                //생식기
					                if (buttonName === '통증'){
					                	buttonText= '비뇨기과';
					                } else if (buttonName === '혈뇨'){
					                	buttonText = '비뇨기과';
					                } else if (buttonName === '요실금'){
					                	buttonText = '비뇨기과';
					                } 
					                
					                //복부
					                if (buttonName === '구토'){
					                	buttonText = '내과';
					                } else if (buttonName === '복통'){
					                	buttonText = '내과';
					                } else if (buttonName === '설사'){
					                	buttonText = '내과';
					                } else if (buttonName === '변비'){
					                	buttonText = '내과'
					                } else if (buttonName === '속쓰림'){
					                	buttonText = '내과';
					                }
					                
					                if (buttonName === '귀 통증'){
					                	buttonText = '이비인후과';
					                } else if (buttonName === '이명'){
					                	buttonText = '이비인후과';
					                } else if (buttonName === '난청'){
					                	buttonText = '이비인후과';
					                } else if (buttonName === '코 막힘'){
					                	buttonText = '이비인후과'
					                } else if (buttonName === '이 통증'){
					                	buttonText = '치과';
					                } else if (buttonName === '이 시림'){
					                	buttonText = '치과';
					                } else if (buttonName === '잇몸 출혈'){
					                	buttonText = '치과';
					                } else if (buttonName === '눈 충혈'){
					                	buttonText = '안과';
					                } else if (buttonName === '눈간지럼'){
					                	buttonText = '안과';
					                } else if (buttonName === '저시력'){
					                	buttonText = '안과';
					                } else if (buttonName === '얼굴 떨림'){
					                	buttonText = '내과';
					                }
					                
					                if (buttonName === '객혈'){
					                	buttonText = '흉부외과';
					                } else if (buttonName === '호흡곤란'){
					                	buttonText = '흉부외과';
					                } else if (buttonName === '흉통'){
					                	buttonText = '흉부외과';
					                } else if (buttonName === '기침'){
					                	buttonText = '내과';
					                } else if (buttonName === '가슴쓰림'){
					                	buttonText = '내과';
					                }
					                
					                if (link) {
					                    var buttonContainer = document.getElementById('buttonContainer');
					                    buttonContainer.innerHTML = '';
					                    addButtonWithLink(link +'?' + queryParams, buttonText);
					                }
					            };
					        }
					
					
					        function addButtonWithLink(link, buttonText) {
					            var buttonContainer = document.getElementById('buttonContainer');
					            var button = document.createElement('a');
					            button.setAttribute('href', link);
					            button.setAttribute('class', 'link-button');
					            button.textContent = buttonText;
					            buttonContainer.appendChild(button);
					        }
					    </script>
												
						<button class="ghost-button2"></button>
						<button class="ghost-button2"></button>
						<button class="ghost-button2"></button>
						<button class="ghost-button2"></button>
						<button class="ghost-button2"></button>																	
						<input type="button" class="ghost-button2" value="가슴" id = "chest" onclick="addNewButton('chest', 4)">

						
						<button class="ghost-button3"></button>
						<button class="ghost-button3"></button>
						<button class="ghost-button3"></button>																								
						<button class="ghost-button3"></button>
						<input type="button" class="ghost-button3" id="neck" value="목" onclick="addNewButton('neck', 1)">
						
						<button class="ghost-button4"></button>
						<button class="ghost-button4"></button>
						<button class="ghost-button4"></button>
						<button class="ghost-button4"></button>
						<button class="ghost-button4"></button>
						<button class="ghost-button4"></button>
						<input type="button" class="ghost-button4" id="abdomen" value="복부" onclick="addNewButton('abdomen', 5)">
						
						<button class="ghost-button5"></button>
						<button class="ghost-button5"></button>
						<button class="ghost-button5"></button>
						<button class="ghost-button5"></button>
						<button class="ghost-button5"></button>
						<button class="ghost-button5"></button>
						<button class="ghost-button5"></button>
						<input type="button" class="ghost-button5" id="urology" value="생식기" onclick="addNewButton('urology', 3)">
						
						<button class="ghost-button6"></button>
						<button class="ghost-button6"></button>
						<button class="ghost-button6"></button>
						<button class="ghost-button6"></button>
						<button class="ghost-button6"></button>
						<button class="ghost-button6"></button>
						<button class="ghost-button6"></button>
						<button class="ghost-button6"></button>
						<input type="button" class="ghost-button6" id="hand" value="손" onclick="addNewButton('hand', 1)">

						

						
						<button class="ghost-button7"></button>
						<button class="ghost-button7"></button>
						<button class="ghost-button7"></button>
						<button class="ghost-button7"></button>
						<button class="ghost-button7"></button>
						<button class="ghost-button7"></button>
						<button class="ghost-button7"></button>
						<button class="ghost-button7"></button>
						<button id="armHandButton" class="ghost-button7" onclick="loadNewButton()"></button>
						
						<button class="ghost-button8"></button>
						<button class="ghost-button8"></button>
						<button class="ghost-button8"></button>
						<button class="ghost-button8"></button>
						<button class="ghost-button8"></button>
						<button class="ghost-button8"></button>
						<button class="ghost-button8"></button>
						<button class="ghost-button8"></button>
						<input type="button" class="ghost-button8" id="hand" value="손" onclick="addNewButton('hand', 1)">
						
						<button class="ghost-button9"></button>
						<button class="ghost-button9"></button>
						<button class="ghost-button9"></button>
						<button class="ghost-button9"></button>
						<button class="ghost-button9"></button>
						<button class="ghost-button9"></button>
						<button class="ghost-button9"></button>
						<button class="ghost-button9"></button>
						<button id="armHandButton" class="ghost-button9" onclick="loadNewButton()"></button>
						
						<button class="ghost-button10"></button>
						<button class="ghost-button10"></button>
						<button class="ghost-button10"></button>
						<button class="ghost-button10"></button>
						<button class="ghost-button10"></button>
						<button class="ghost-button10"></button>
						<button class="ghost-button10"></button>
						<button class="ghost-button10"></button>
						<button class="ghost-button10"></button>
						<button class="ghost-button10"></button>
						
						<button class="ghost-button11"></button>
						<button class="ghost-button11"></button>
						<button class="ghost-button11"></button>
						<button class="ghost-button11"></button>
						<button class="ghost-button11"></button>
						<button class="ghost-button11"></button>
						<button class="ghost-button11"></button>
						<button class="ghost-button11"></button>
						<button class="ghost-button11"></button>
						<button class="ghost-button11"></button>
						
						<button class="ghost-button12"></button>
						<button class="ghost-button12"></button>
						<button class="ghost-button12"></button>
						<button class="ghost-button12"></button>
						<button class="ghost-button12"></button>
						<button class="ghost-button12"></button>
						<button class="ghost-button12"></button>
						<button class="ghost-button12"></button>
						<button class="ghost-button12"></button>
						<button class="ghost-button12"></button>

						<button class="ghost-button13"></button>
						<button class="ghost-button13"></button>
						<button class="ghost-button13"></button>
						<button class="ghost-button13"></button>
						<button class="ghost-button13"></button>
						<button class="ghost-button13"></button>
						<button class="ghost-button13"></button>
						<button class="ghost-button13"></button>
						<button class="ghost-button13"></button>
						<button class="ghost-button13"></button>
						
						<button class="ghost-button14"></button>
						<button class="ghost-button14"></button>
						<button class="ghost-button14"></button>
						<input type="button" class="ghost-button14" id="face" value="얼굴" onclick="addNewButton('face', 4)">

						<button class="ghost-button15"></button>
						<button class="ghost-button15"></button>
						<button class="ghost-button15"></button>
						<input type="button" class="ghost-button15" id="ear" value="귀" onclick="addNewButton('ear', 3)">

						<button class="ghost-button16"></button>
						<button class="ghost-button16"></button>
						<button class="ghost-button16"></button>
						<input type="button" class="ghost-button16" id="ear" value="귀" onclick="addNewButton('ear', 3)">
						
						<button class="ghost-button17"></button>
						<button class="ghost-button17"></button>
						<button class="ghost-button17"></button>
						<input type="button" class="ghost-button17" id="mouth" value="입" onclick="addNewButton('mouth', 3)">
						
												
			        	<form action="#" class="body-menu">
			        		<fieldset>
			        			<legend class="d-up-lg">증상을 보이는 신체부위를 선택하세요</legend>
			        			<ul class="body-list">
			        				<li>
			        					<label>
				        					<input class="body_type" type="radio" name="inputBody" checked value="on">
				        					<span class="label">전신</span>
			        					</label>
			        				</li>
			
			        				<li>
			        					<label>
				        					<input class="body_type" type="radio" name="inputBody" value ="head" > <!-- 외과 -->
				        					<span class="label">머리</span>
			        					</label>
			        				</li>
			        				
			        				<li>
			        					<label>
			        						<input class="body_type" type="radio" name="inputBody" value ="psyco"> <!-- 정신과 -->
			        						<span class="label">정신</span>
			        					</label>	
			        				</li>
			        				
			        				<li>
			        					<label>
				        					<input class="body_type" type="radio" name="inputBody" value ="face">
				        					<span class="label">얼굴</span>
			        					</label>
			        				</li>
			        				
			        				<li>
			        					<label>
				        					<input class="body_type" type="radio" name="inputBody" value = "neck"> <!-- 내과 -->
				        					<span class="label">목</span>
				        				</label>	
			        				</li> 
			        				
			        				<li>
			        					<label>
			        						<input class="body_type" type="radio" name="inputBody" value = "chest"> <!-- 내과  -->
			        						<span class="label">가슴/등</span>
			        					</label>	
			        				</li>
			        				
			        				<li>
			        					<label>
				        					<input class="body_type" type="radio" name="inputBody" value = "abdomen"> <!-- 내과 -->
				        					<span class="label">복부</span>
				        				</label>	
			        				</li>
			        				
			        				<li>
			        					<label>
			        						<input class="body_type" type="radio" name="inputBody" value ="urology"><!--비뇨기과 -->
			        						<span class="label">생식/비뇨기</span>
			        					</label>	
			        				</li>
			        				
			        				<li>
			        					<label>
			        						<input class="body_type" type="radio" name="inputBody" value = "arm">
			        						<span class="label">팔과 손</span>
			        					</label>	
			        				</li>
			        				
			        				<li>
			        					<label>
			        						<input class="body_type" type="radio" name="inputBody" value = "leg">
			        						<span class="label">다리와 발</span>
			        					</label>
			        				</li>
			        				
			        				<li>
			        					<label>
			        						<input class="body_type" type="radio" name="inputBody" value = "born">
			        						<span class="label">뼈/근육</span>
			        					</label>	
			        				</li>
			        				
			        				<li>
			        					<label>
			        						<input class="body_type" type="radio" name="inputBody" value ="skin"> <!-- 피부과  -->
			        						<span class="label">피부</span>
			        					</label>
			        				</li>			        				        				        				        				        				        				        				        				       				        				        				        				
			        			</ul>
			        			<div class="btn-area">
			        				<button class="btn_search btn btn-lg btn-round btn-primary" type="button">검색</button>
										<script>
										$(function() {
										  $(".btn_search").click(function() {
										    var selectedBody = $("input[name='inputBody']:checked").val();
										    var newButton = $("<button>");
										    newButton.addClass("custom-button");
										
										    if (selectedBody === "on") {
										      newButton.text("종합병원");
										      newButton.attr("data-link", "https://www.example.com/general_hospital");
										    } else if (selectedBody === "head") {
										      newButton.text("외과");
										      newButton.attr("data-link", "http://localhost:8080/hos/choo/hosapiresult?selectOption=D006&hosType=A&Q0=&Q1=&QD=D006&QZ=A");
										    } else if (selectedBody === "psyco") {
										      newButton.text("정신과");
										      newButton.attr("data-link", "http://localhost:8080/hos/choo/hosapiresult?selectOption=D004&hosType=A&Q0=&Q1=&QD=D004&QZ=A");
										    } else if (selectedBody === "face") {
											      newButton.text("내과");
											      newButton.attr("data-link", "http://localhost:8080/hos/choo/hosapiresult?selectOption=D001&hosType=%EB%B3%91%EC%9B%90%EB%B6%84%EB%A5%98&Q0=&Q1=&QD=D001&QZ=");
										    } else if (selectedBody === "neck") {
											      newButton.text("이비인후과");
											      newButton.attr("data-link", "http://localhost:8080/hos/choo/hosapiresult?selectOption=D013&hosType=%EB%B3%91%EC%9B%90%EB%B6%84%EB%A5%98&Q0=&Q1=&QD=D013&QZ=");
										    } else if (selectedBody === "chest") {
											      newButton.text("흉부외과");
											      newButton.attr("data-link", "https://www.example.com/psychiatry");
											} else if (selectedBody === "abdomen") {
											      newButton.text("내과");
											      newButton.attr("data-link", "http://localhost:8080/hos/choo/hosapiresult?selectOption=D001&hosType=%EB%B3%91%EC%9B%90%EB%B6%84%EB%A5%98&Q0=&Q1=&QD=D001&QZ=");
											} else if (selectedBody === "urology") {
											      newButton.text("비뇨기과");
											      newButton.attr("data-link", "https://www.example.com/psychiatry");
											} else if (selectedBody === "arm") {
											      newButton.text("외과");
											      newButton.attr("data-link", "http://localhost:8080/hos/choo/hosapiresult?selectOption=D006&hosType=%EB%B3%91%EC%9B%90%EB%B6%84%EB%A5%98&Q0=&Q1=&QD=D006&QZ=");
											} else if (selectedBody === "leg") {
											      newButton.text("외과");
											      newButton.attr("data-link", "http://localhost:8080/hos/choo/hosapiresult?selectOption=D006&hosType=%EB%B3%91%EC%9B%90%EB%B6%84%EB%A5%98&Q0=&Q1=&QD=D006&QZ=");
											} else if (selectedBody === "born") {
											      newButton.text("정형외과");
											      newButton.attr("data-link", "http://localhost:8080/hos/choo/hosapiresult?selectOption=D008&hosType=%EB%B3%91%EC%9B%90%EB%B6%84%EB%A5%98&Q0=&Q1=&QD=D008&QZ=");
											} else if (selectedBody === "skin") {
											      newButton.text("피부과");
											      newButton.attr("data-link", "http://localhost:8080/hos/choo/hosapiresult?selectOption=D005&hosType=%EB%B3%91%EC%9B%90%EB%B6%84%EB%A5%98&Q0=&Q1=&QD=D005&QZ=");
											}
										    
										    // Add more cases for other body parts...
										
										    newButton.click(function() {
										      var link = $(this).attr("data-link");
										      window.open(link, "_blank");
										    });
											
										    $("#buttonContainer").empty();

										    $("#buttonContainer").append(newButton);
										  });
										});
										</script>

			        			</div>			        			
			        		</fieldset>       	
        				</form> 
        				</div>
					</div>
				</div>            
		</article>
								<div id="buttonContainer" class="add-button">
						    <!-- 새로운 버튼이 여기에 추가됩니다. -->
						</div>
	</div>
   <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

    
    <!-- Custom styles for this template -->
    <link href="footers.css" rel="stylesheet">
  </head>
  <body>
    
<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
  <symbol id="bootstrap" viewBox="0 0 118 94">
    <title>main</title>
    <path fill-rule="evenodd" clip-rule="evenodd" d="M24.509 0c-6.733 0-11.715 5.893-11.492 12.284.214 6.14-.064 14.092-2.066 20.577C8.943 39.365 5.547 43.485 0 44.014v5.972c5.547.529 8.943 4.649 10.951 11.153 2.002 6.485 2.28 14.437 2.066 20.577C12.794 88.106 17.776 94 24.51 94H93.5c6.733 0 11.714-5.893 11.491-12.284-.214-6.14.064-14.092 2.066-20.577 2.009-6.504 5.396-10.624 10.943-11.153v-5.972c-5.547-.529-8.934-4.649-10.943-11.153-2.002-6.484-2.28-14.437-2.066-20.577C105.214 5.894 100.233 0 93.5 0H24.508zM80 57.863C80 66.663 73.436 72 62.543 72H44a2 2 0 01-2-2V24a2 2 0 012-2h18.437c9.083 0 15.044 4.92 15.044 12.474 0 5.302-4.01 10.049-9.119 10.88v.277C75.317 46.394 80 51.21 80 57.863zM60.521 28.34H49.948v14.934h8.905c6.884 0 10.68-2.772 10.68-7.727 0-4.643-3.264-7.207-9.012-7.207zM49.948 49.2v16.458H60.91c7.167 0 10.964-2.876 10.964-8.281 0-5.406-3.903-8.178-11.425-8.178H49.948z"></path>
  </symbol>
</svg>

<div class="container">
  <footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
    <p class="col-md-4 mb-0 text-muted">&copy; 2023 Company, Inc</p>

    <a href="/hos/kim/main" class="col-md-4 d-flex align-items-center justify-content-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
      <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"/></svg>
    </a>

    <ul class="nav col-md-4 justify-content-end">
      <li class="nav-item"><a href="/hos/kim/main" class="nav-link px-2 text-muted">Home</a></li>
      <li class="nav-item"><a href="/hos/choo/gesipanmain" class="nav-link px-2 text-muted">FAQs</a></li>
      <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">About</a></li>
    </ul>
  </footer>
</div>
</body>

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
</html>