<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
	<meta charset="UTF-8">
	<title>병원평점 게시판</title>
	
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

<br />
<br />
<br />
<h1 class="text-center">병원평가게시판</h1>

<c:if test="${list.size() == 0}">
	<table class="table" align="center">
		<thead class="table-dark">
			<tr height="30">
				<td align="center" width="50">글번호</td>
				<td align="center" width="500">글제목</td>
				<td align="center" width="150">작성자</td>
				<td align="center" width="250">작성날짜</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="text-center" colspan="4">
					작성된 글이 존재하지 않습니다.
				</td>
			</tr>
			<tr>
				<td align="right" colspan="4">
					<a class="btn btn-primary" href="gradeWrite?name=${name}&addr=${addr}&pageNum=${pageNum}">글작성</a>
				</td>
			</tr>
		</tbody>
	</table>
</c:if>

<c:if test="${list.size() > 0}">
	<table class="table" align="center">
		<thead class="table-dark">
			<tr height="30">
				<td align="center" width="50">글번호</td>
				<td align="center" width="500">글제목</td>
				<td align="center" width="150">작성자</td>
				<td align="center" width="250">작성날짜</td>
			</tr>
		</thead>
		<c:forEach var="info" items="${list}">
			<tbody>
				<tr height="30">
					<td align="center" width="50">${info.num}</td>
					<td align="center" width="500"><a href="gradecon?num=${info.num}&name=${name}&addr=${addr}&pageNum=${pageNum}">${info.title}</a></td>
					<td align="center" width="100"><strong>${info.id}</strong></td>
					<td align="center" width="150">${info.reg}</td>
				</tr>
			</tbody>
		</c:forEach>
			<tr>
			<td align="right" colspan="4">
				<a class="btn btn-primary" href="gradeWrite?name=${name}&addr=${addr}&pageNum=${pageNum}">글작성</a>
			</td>	
	</table>
</c:if>

<nav aria-label="Page navigation example">
	<ul class="pagination justify-content-center">
		<c:if test="${startPage > 10}">
			<li class="page-item">
				<a class="page-link" href="hosgrade?pageNum=${startPage - 10}&name=${name}&addr=${addr}" aria-label="Previous">
					<span aria-hidden="true">&laquo;</span>
				</a>
		</c:if>
		
	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<li class="page-item"><a class="page-link" href="hosgrade?pageNum=${i}&name=${name}&addr=${addr}">${i}</a></li>
	</c:forEach>
	
		<c:if test="${endPage < pageCount}">
			<li class="page-item">
				<a class="page-link" href="hosgrade?pageNum=${startPage + 10}&name=${name}&addr=${addr}" aria-label="Next">
					<span aria-hidden="true">&raquo;</span>
				</a>
			</li>
		</c:if>
	</ul>
</nav>