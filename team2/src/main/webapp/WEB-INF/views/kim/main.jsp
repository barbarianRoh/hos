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
        <title>Shop Homepage - Start Bootstrap Template</title>
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
                    <p class="lead fw-normal text-white-50 mb-0">조그맣게 쓸만한 말</p>
                    <%--
                    <a id="kakao-login-btn"></a>
                --%>
                </div>
            </div>
            <a class="btn btn-primary2" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" aria-controls="offcanvasExample"><i class="fa-solid fa-bars" style="color: #000000;"></i></a>
			<div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
			  <div class="offcanvas-header">
			    <h5 class="offcanvas-title" id="offcanvasExampleLabel">아파:어디가?</h5>
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
						    <p class="input_row txt" style="color: rgb(26, 26, 26);">환영합니다, ${knick}님!</p>
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
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                         
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">병원지도</h5>
                                    <!-- Product price-->
                                    쓸 말 정리해서 쓰기
                                </div>
                            </div>
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
                                    쓸 말 정리해서 쓰기
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
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through"></span>
                                    쓸 말 정리해서 쓰기
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
                                    <!-- Product price-->
                                    쓸 말 정리해서 쓰기
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
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
        </footer>
        <!— Bootstrap core JS—>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!— Core theme JS—>
        <script src="js/scripts.js"></script>
        
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