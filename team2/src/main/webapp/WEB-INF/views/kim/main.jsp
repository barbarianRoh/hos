<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
    	<script src="https://kit.fontawesome.com/f507061817.js" crossorigin="anonymous"></script>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <meta http-equiv="X-UA-Compatible" content = "IE=edge">
        <title>아파, 어디가?</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script src="/hos/resources/js/chatForm2.js"></script>
		<script src="/hos/resources/js/chatForm.js"></script>
		<link rel="stylesheet" type="text/css" href="/hos/resources/css/chatbot.css">        
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="/hos/resources/css/font.css">
        <link rel="stylesheet" type="text/css" href="/hos/resources/css/main.css">
        <link rel="stylesheet" type="text/css" href="/hos/resources/css/main2.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
		<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
        
    </head>
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

    <body>
        <!-- Navigation-->
  
        <!-- Header-->
        <header class="bg-dark py-3">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">아파, 어디가?</h1>
                    <p class="lead fw-normal text-white-50 mb-0">증상, 아픈 부위로 병원을 찾아보세요!</p>
                    <%--
                    <a id="kakao-login-btn"></a>
                --%>
                </div>
            </div>
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
						<li>
							<a class = "nav-link active" aria-current="page" href="/hos/choo/addressselect">병원찾기</a>						
						</li>
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
						<li>
							<a class = "nav-link active" aria-current="page" href="/hos/choo/gesipanmain">고객센터</a>						
						</li>
					</ul>										
			    </div>
			  </div>
			</div>
				<a class="loginButton" href="#">
				  <img alt="Cindy Baker2" src="//image.medigate.net/static/mobile/ver_3/images/icon_profilethumb.gif" class="MuiAvatar-img">
				</a>
				
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
				              <div class="input_row padding-10px">
				              </div>
				              <div class="input_row pc padding-10px border-top-1px">
				                <a class="forgotid" href="/hos/roh/findMyIdForm" target="_blank" style="color: rgb(26, 26, 26); font-size: 12px;">아이디 찾기</a>
				                <a class="forgotpassword" href="/hos/roh/findMyPwForm" style="color: rgb(26, 26, 26); font-size: 12px;">비밀번호 찾기</a>
				                <a class="join" href="/hos/roh/signupForm" style="font-size: 12px;">회원 가입</a>
				              </div>
				              <div class="input_row mobile padding-10px border-top-1px">
				              </div>
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
						    <a id="logoutButton" href="/hos/roh/signout">로그아웃</a>
						</div>
						<c:if test="${logout}">
							<script>
								window.location.href = '/hos/kim/main';
							</script>
						</c:if>
				    </div>
				  </div>
				</div>
			<div id="modalOverlay" class = "overlay"></div>
        </header>
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                                <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">병원지도</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                    </div>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through"></span>
                                    내 주위 병원을 찾아보세요!<br/><br/>
                                    <div>
                                	    <i class="fa-solid fa-hospital fa-10x"></i>
                                	</div>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="/hos/choo/selectHos">서비스 이용하기</a></div>
                            </div>
                        </div>
                    </div>                    
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                                <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">약국지도</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                    </div>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through"></span>
                                    내 주위 약국을 찾아보세요!<br/><br>
                                    <div>
                                    	<i class="fa-solid fa-prescription-bottle-medical fa-10x"></i>
                                	</div>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="/hos/roh/pharmacyMap">서비스 이용하기</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">부위별 병원 찾기</h5>
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                    </div>                                    
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through"></span>
                                    아픈 곳을 클릭해보세요!<br/><br/>
                                    <div>
                                    	<i class="fa-solid fa-person fa-10x"></i>
                                	</div>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="/hos/kim/symptom">서비스 이용하기</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">약품정보</h5>
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                    </div>                                    
                                    <!-- Product price-->
                                    약의 정보를 찾아보세요!<br/><br/>
                                    <div>
                                    	<i class="fa-solid fa-capsules fa-10x"></i>
                                	</div>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="/hos/hong/search">서비스 이용하기</a></div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </section>
        <!— Footer—>
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
    <button id = "offcanvas-Button" class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">챗봇</button>
        <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
		  <div class="offcanvas-header">
		    <h3 id="offcanvasRightLabel">챗봇 서비스</h3>
		    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
		  </div>
		  <div class="offcanvas-body">
			  <div id="wrap">
			
			    <!-- 응답 메시지 표시 -->
			    <div id="chatBox"></div><br>
			
			    <!-- 질문 메시지 입력 폼 -->
			    <form id="chatForm">
			      <input type="text" id="message" name="message" size="30" placeholder="질문을 입력하세요">
			      <input type="submit" value="제출">
			    </form>
			  </div>
		  </div>
		</div>
</html>