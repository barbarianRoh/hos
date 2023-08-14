<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<meta charset="utf-8">

    <title>주소로 병원검색</title>

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
</style>

<c:if test="${loginFailed}">
	<script>
		alert("아이디 혹은 비밀번호를 확인하세요");
		window.location.href = '/hos/kim/main';
	</script>
</c:if>

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
	            	<li>
	            		<select name="sido" id="sido"></select>
	            	</li>
	            	<li>
	            		<select name="gugun" id="gugun"></select>
	            	</li>
	            	<li>
	            		<select name="selectOption" id="selectOption" onchange="assignValue()">
	            			<option selected>진료과선택</option>
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
	            	</li>
	            	<li>
	            		<select name="hosType" id="hosType" onchange="TypeValue()">
	            			<option selected>병원분류</option>
							<option value="A">상급/종합병원</option>
							<option value="B">병원</option>
							<option value="C">의원</option>
							<option value="M">치과병원</option>
							<option value="N">치과의원</option>
	            		</select>
	            	</li>
      					<form method="get" name="hosselect" action="/hos/choo/hosapiresult">
       					<input type="hidden" id="Q0" name="Q0" value="">
        				<input type="hidden" id="Q1" name="Q1" value="">
        				<input type="hidden" id="selectedjinryo" name="QD" value="">
        				<input type="hidden" id="selecthos" name="QZ" value="">
        				&nbsp;&nbsp;<input class="btn btn-primary" type="submit" value="검 색">&nbsp;&nbsp;
      					</form>
	           
	            		<button class="btn btn-info" onclick="panTo()">내 위치로 이동</button>
	            </ul>
        	</div>
        </div>

	

<!-- 여기부터 토클폼까지가 위에 해더부분에 공간을 만든것 같음 -->
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



<!-- Jquery를 이용한 지역선택기능 -->

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
		
		// 시도시 선택시 자동으로 구/군도 들어가는 곳
 		var sidoValue = $(this).val();
		$("input[name=Q0]").val(sidoValue);
		
		$("select[name=gugun]").val("");
		var gugunValue = $("select[name=gugun]").val();
		$("input[name=Q1]").val(gugunValue);
	});
		 
		//구/군 변경시 동작하는 곳
		$("select[name=gugun]").change(function() {
		var gugunValue = $(this).val();
		$("input[name=Q1]").val(gugunValue);
		});
});


</script>

<%-- 2100589fb32df980773796dffa657449 --%>

<!-- 카카오맵API와 서비스, 클러스터기능 라이브러리 불러옴 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2100589fb32df980773796dffa657449&libraries=services,clusterer"></script>

<!-- 지도를 표시할 div 입니다 -->
<div id="map" style="width:1918px;height:788px;"></div>

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
	
<script>
	//위에 select의 option값을 선택했을 때 QD에 자동으로 들어가게 하는 곳
	function assignValue(){
	var selectElement = document.getElementById("selectOption");
	var selectedValue = selectElement.value;
	var selectOption = document.getElementById("selectOption");
	var selectedDepartment = selectOption.options[selectOption.selectedIndex];
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
		var hosType = document.getElementById("hosType");
		var selectedHospitalType = hosType.options[hosType.selectedIndex].text;
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


<%-- <c:forEach var="dto" items="${hos}">
	${dto.wgs84Lat}
</c:forEach>--%>