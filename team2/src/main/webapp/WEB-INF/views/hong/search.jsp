<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.springframework.web.context.WebApplicationContext" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page import="javax.servlet.ServletContext" %>
<%@ page import="com.team2.controller.DataApiClient" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
        
<script>
  document.addEventListener("DOMContentLoaded", function () {
    var loginButton = document.querySelector(".loginButton");
    var loginModal = document.getElementById("loginModal");
    var modalOverlay = document.getElementById("modalOverlay");
    var closeLoginModalButton = document.getElementById("closeLoginModal");
    var closemyInfoFormButton = document.getElementById("closemyInfoForm");
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
    
    closemyInfoFormButton.addEventListener("click", function () {
    	console.log("assadsadfsafdsadfsadf");
        myInfoForm.style.display = "none";
        modalOverlay.style.display = "none";
    });

  
  function closemyInfoForm(){
	  var myInfoForm = document.getElementById("myInfoForm");
	  var loginModal = document.getElementById("loginModal");
	  myInfoForm.style.display = "none";
      modalOverlay.style.display = "none";
  }

    // 페이지 로딩 시 폼 전환 함수 호출
    toggleForms();
  });
  
	function toggleForms() {
	  var loginButton = document.querySelector(".loginButton");
	  var myInfoForm = document.getElementById("myInfoForm");
	  var sessionSid = "${sessionScope.sid}";
	  var sessionKnick = "${sessionScope.knick}";
	  var loginModal = document.getElementById("loginModal");
	  if (sessionSid || sessionKnick) {
		myInfoForm.style.display = "block"; // 세션이 있을 때 로그인 후 버튼 보이기
	  } else {
	    myInfoForm.style.display = "none"; // 세션이 없을 때 로그인 후 버튼 숨기기
	  }
	}

</script>

<style>
.btn {
    --bs-btn-padding-x: 0.75rem;
    --bs-btn-padding-y: 0.6rem;
    --bs-btn-font-family: ;
    --bs-btn-font-size: 1rem;
    --bs-btn-font-weight: 400;
    --bs-btn-line-height: 1.5;
    --bs-btn-color: var(--bs-body-color);
    --bs-btn-bg: transparent;
    --bs-btn-border-width: var(--bs-border-width);
    --bs-btn-border-color: transparent;
    --bs-btn-border-radius: var(--bs-border-radius);
    --bs-btn-hover-border-color: transparent;
    --bs-btn-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.15),0 1px 1px rgba(0, 0, 0, 0.075);
    --bs-btn-disabled-opacity: 0.65;
    --bs-btn-focus-box-shadow: 0 0 0 0.25rem rgba(var(--bs-btn-focus-shadow-rgb), .5);
    display: inline-block;
    padding: var(--bs-btn-padding-y) var(--bs-btn-padding-x);
    font-family: var(--bs-btn-font-family);
    font-size: var(--bs-btn-font-size);
    font-weight: var(--bs-btn-font-weight);
    line-height: var(--bs-btn-line-height);
    color: var(--bs-btn-color);
    text-align: center;
    text-decoration: none;
    vertical-align: middle;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    user-select: none;
    border: var(--bs-btn-border-width) solid var(--bs-btn-border-color);
    border-radius: var(--bs-btn-border-radius);
    background-color: var(--bs-btn-bg);
    transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}
.lead fw-normal text-white-50 mb-0{
	color: lead fw-normal text-white-50 mb-0;
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
    width: 350px;
    /* ... (other styles) ... */
  	}
  	.profilearea.login {
    display: flex;
    flex-direction: column;
    align-items: center;
    background-color: #f5f5f5;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
    width: 350px;
    margin: 0 auto;
	}

	.profilearea.login p.input_row.txt {
	    color: #1a1a1a;
	    text-align: center;
	    margin: 0;
	    font-size: 16px;
	}
	
	.profilearea.login .input_row {
	    margin-top: 10px;
	    width: 100%;
	}
	
	.profilearea.login .form-control {
	    width: 100%;
	    padding: 8px;
	    border: 1px solid #ccc;
	    border-radius: 4px;
	}
	
	.profilearea.login .mdc-button {
	    margin-top: 15px;
	    width: 100%;
	    text-align: center;
	    background-color: #007bff;
	    color: white;
	    border: none;
	    border-radius: 4px;
	    cursor: pointer;
	    padding: 10px;
	    font-size: 16px;
	}
	
	.profilearea.login #kakao-login-btn {
	    margin-top: 10px;
	    width: 100%;
	    text-align: center;
	    background-color: #f4f4f4;
	    color: #1a1a1a;
	    border: none;
	    border-radius: 4px;
	    cursor: pointer;
	    padding: 10px;
	    font-size: 16px;
	}
	
	.profilearea.login .signin_options {
	    width: 90%;
	    margin-top: 15px;
	    text-align: center;
	}
	
	.profilearea.login .signin_options a {
	    color: #1a1a1a;
	    text-decoration: none;
	    font-size: 12px;
	    margin: 0 10px;
	}
	
	.profilearea.login .signin_options .border-top-1px {
	    border-top: 1px solid #ccc;
	    margin-top: 10px;
	    padding-top: 10px;
	}
  	
  	#myInfoForm {
    background-color: #f5f5f5;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
    text-align: center;
    width: 350px;
    margin: 0 auto;
}

#myInfoForm p.input_row.txt {
    color: #1a1a1a;
    font-size: 18px;
    margin: 10px 0;
}

#myInfoForm a {
    color: #007bff;
    text-decoration: none;
    margin: 10px 0;
    font-size: 14px;
    transition: color 0.3s;
}

#myInfoForm a:hover {
    color: #0056b3;
}

/* Style for buttons */
#logoutButton, #kakao-login-btn {
    display: inline-block;
    margin-top: 10px;
    padding: 10px 16px;
    border: none;
    border-radius: 4px;
    font-size: 14px;
    cursor: pointer;
    transition: color 0.3s;
}

#kakao-login-btn {
    background-color: #FFEB00;
    color: #000000;
}

#kakao-login-btn:hover {
    background-color: #ffffff;
}

/* Align the buttons horizontally */
#myInfoForm a:last-child {
    margin-left: 10px;
}

/* Adjustments for smaller screens */
@media (max-width: 768px) {
    #myInfoForm {
        width: 90%;
    }
    
    #closemyInfoForm{
    position: absolute;
    top: 0px;
    right: 10px;
    font-size: 20px;
    background: none;
    border: none;
    cursor: pointer;
  	}
  	
    </style>


 <c:if test="${loginFailed}">
	<script>
		alert("아이디 혹은 비밀번호를 확인하세요");
		window.location.href = '/hos/kim/main';
	</script>
</c:if> 
<!-- 헤더 -->
<header class="bg-dark py-3">
	<div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">약품 검색</h1>
                    <p class="lead fw-normal text-white-50 mb-0">...</p>
                    <%--
                    <a id="kakao-login-btn"></a>
                --%>
                </div>	
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
                            <a class="forgotid" href="/hos/roh/findMyIdForm" id = "bbbb" style="color: rgb(26, 26, 26); font-size: 12px;">아이디 찾기</a>
                            <a class="forgotpassword" href="/hos/roh/findMyPwForm" id = "cccc" style="color: rgb(26, 26, 26); font-size: 12px;">비밀번호 찾기</a>
                            <a class="join" href="/hos/roh/signupForm" id = "aaaa" style="font-size: 12px;">회원 가입</a>
                          </div>
                        <script>
                            document.getElementById('aaaa').addEventListener('click', function(event) {
                                event.preventDefault();
                                const width = screen.availWidth;
                                const height = screen.availHeight;   
                                window.open(this.href, '_blank', `width=400,height=500,noopener,noreferrer`);
                            });
                        </script>
                        <script>
                            document.getElementById('bbbb').addEventListener('click', function(event) {
                                event.preventDefault();
                                const width = screen.availWidth;
                                const height = screen.availHeight;   
                                window.open(this.href, '_blank', `width=400,height=300,noopener,noreferrer`);
                            });
                        </script>   
                        <script>
                            document.getElementById('cccc').addEventListener('click', function(event) {
                                event.preventDefault();
                                const width = screen.availWidth;
                                const height = screen.availHeight;   
                                window.open(this.href, '_blank', `width=400,height=400,noopener,noreferrer`);
                            });
                        </script>   
				              <div class="input_row mobile padding-10px border-top-1px">
				              </div>
				            </div>
				          </div>
				        </form>
				      </c:if>
						<div id="myInfoForm" class="profilearea">
							<button id="closemyInfoForm" class="close-button">×</button>
						    <p class="input_row txt" style="color: rgb(26, 26, 26);">
						    	<c:if test="${sessionScope.sid != null}">환영합니다! ${sid}님</c:if>
								<c:if test="${sessionScope.knick != null}">환영합니다! ${knick}님</c:if>	
						    </p>
						    <a href="/hos/roh/myProfileForm">프로필</a>
						    <a id="logoutButton" href="/hos/roh/signout">로그아웃</a>
						    <a href="/hos/roh/withdrawalForm">회원탈퇴</a>
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

<script>
    function searchItemName() {
        var keyword = document.getElementById('keyword').value;
        if (!keyword.trim()) {
            alert('제품명을 다시 입력하세요.');
            return false;
        }else{
        	return true;	
     	}
    }

    function searchEntpName() {
        var businessName = document.getElementById('businessName').value;
        if (!businessName.trim()) {
            alert('업체명을 입력하세요.');
            return false;
        }else{
 	       return true;    	
        }
    }

    function searchOtherItemName() {
        var keyword2 = document.getElementById('keyword2').value;
        if (!keyword2.trim()) {
            alert('의약외품명을 입력하세요.');
            return false;
        }else{
        	return true;
        }
    }
</script>

</head>
<!-- 배경사진 넣을곳 <div class="bg-image h-100" style="background-image: url(https://mdbootstrap.com/img/Photos/new-templates/search-box/img4.jpg);">  -->
  <div class="container">
  <p class="h3 mb-3 text-black">의약품 검색</p>
  <div class="card">
    <div class="card-body p-3">
      <div class="row">
        <div class="col-12 mb-10">
          <div class="input-group">
            <div class="form-outline flex-fill">
              <form class="d-flex" method="get" action="result" onsubmit="return searchItemName()">
                <input type="text" id="keyword" name="keyword" class="form-control form-control-lg" placeholder="제품명을 입력하세요" />
           		<input type="submit" class="btn btn-outline-success" value="Search">
              </form>
              <label class="form-label" for="keyword">병을 치료하거나 증상을 억제하는 혹은 일시적으로 통증을 줄여 주는 데 쓰이는 약품</label>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<br><br>
<div class="container">
 <p class="h3 mb-3 text-black">의약품 업체 이름 검색</p>
  <div class="card">
    <div class="card-body p-3">
      <div class="row">
        <div class="col-12 mb-10">
          <div class="input-group">
            <div class="form-outline flex-fill">
              <form class="d-flex" method="get" action="resultByBusiness" onsubmit="return searchEntpName()">
                <input type="text" id="businessName" name="businessName" class="form-control form-control-lg" placeholder="업체명을 입력하세요" />
            	<input type="submit" class="btn btn-outline-success" value="Search">
              </form>
              <label class="form-label" for="businessName">해당 약품의 업체명을 검색</label>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<br><br>
<div class="container">
<p class="h3 mb-3 text-black">의약외품 이름 검색</p>
  <div class="card">
    <div class="card-body p-3">
      <div class="row">
        <div class="col-12 mb-10">
          <div class="input-group">
            <div class="form-outline flex-fill">
              <form class="d-flex" method="get" action="otherresult" onsubmit="return searchOtherItemName()">
                <input type="text" id="keyword2" name="keyword2" class="form-control form-control-lg" placeholder="제품명을 입력 하세요" />
            	<input type="submit" class="btn btn-outline-success" value="Search">
              </form>
              <label class="form-label" for="keyword2">위생처리 제품, 환부의 보존, 보호, 처치등의 목적, 인체에 대한 작용이 약하거나 작용하지 않는 제품</label>
              <I>ex)마스크, 붕대, 파스, 구강청결제 등</I>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<br><br>
    <body>
	   	<form method="GET" action="data" align="center" >
			<input type="button" class="btn btn-secondary" value="안전상비약" onclick="location.href='data'">
			<input type="button" class="btn btn-secondary" value="의약품 전체" onclick="location.href='total'">
			<input type="button" class="btn btn-secondary" value="의약외품 전체" onclick="location.href='othertotal'">
		</form>
	</body>
	
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
<div class="container">
  <footer class="d-flex flex-wrap justify-content-between align-items-center py-5 my-5 border-top" style="border-top-width: 10px;">
    <p class="col-md-4 mb-0 text-muted">&copy; 2023 Company, Inc</p>
    <ul class="nav col-md-4 justify-content-end">
      <li class="nav-item"><a href="/hos/kim/main" class="nav-link px-2 text-muted">Home</a></li>
      <li class="nav-item"><a href="/hos/choo/gesipanmain" class="nav-link px-2 text-muted">FAQs</a></li>
      <li class="nav-item"><a href="/hos/hong/index" class="nav-link px-2 text-muted">About</a></li>
    </ul>
  </footer>
  
  		<script>
		$('button[id=closemyInfoForm]').on('click',function(){
			console.log('????')
			$('#loginModal').hide(100)
			})
		</script>
</div>