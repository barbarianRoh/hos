<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<!DOCTYPE html>
<meta charset="UTF-8">

<title>홈페이지</title>

<h1>홈페이지</h1>

<c:if test="${loginFailed}">
	<script>
		alert("아이디 혹은 비밀번호를 확인하세요");
		window.location.href = '/hos/roh/';
	</script>
</c:if>

<c:if test="${logout}">
	<script>
		alert("로그아웃 되었습니다");
		// 새로고침 할 때 마다 또 로그아웃 되는것을 방지
		window.location.href = '/hos/roh/';
	</script>
</c:if>

<c:if test="${enabledFailed}">
	<script>
		alert("비활성화된 아이디입니다");
		window.location.href = '/hos/roh/';
	</script>
</c:if>

<c:if test="${sessionScope.knick != null}">
	${knick}님
	<a href="/hos/roh/myProfileForm">내정보</a>
	<a href="/hos/roh/signout">로그아웃</a>
</c:if>

<c:if test="${sessionScope.sid != null}">
	${sid}님
	<a href="/hos/roh/myProfileForm">내정보</a>
	<a href="/hos/roh/signout">로그아웃</a><br />
	<a href="/hos/roh/withdrawalForm">회원탈퇴</a><br />
</c:if>

<c:if test="${sessionScope.smembertype eq '2' }">
	<a href="/hos/roh/adminForm">회원 리스트</a>
</c:if>

<c:if test="${sessionScope.sid == null && sessionScope.knick == null}">
	<form action="/hos/roh/signinPro" method="post">
		<label for="id">아이디 : </label>
		<input type="text" id="id" name="id" placeholder="아이디" /><br />
		<label for="pw">비밀번호 : </label>
		<input type="password" id="pw" name="pw" placeholder="비밀번호" /><br />
		<input type="submit" value="로그인" />
	</form>
	
	<a href="/hos/roh/findMyIdForm">ID찾기</a><a href="/hos/roh/findMyPwForm">PW찾기</a><a href="/hos/roh/signupForm">회원가입</a><br />
	<a id="kakao-login-btn"></a>
	<!-- 확인용 <div id="result"></div> -->

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

</c:if>