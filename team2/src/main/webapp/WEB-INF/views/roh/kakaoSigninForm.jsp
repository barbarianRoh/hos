<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

<a id="kakao-login-btn"></a>
<button class="api-btn" onclick="unlinkApp()">로그아웃</button>
<div id="result"></div>

<c:if test="${sessionScope.kid != null}">
	<h1>${sessionScope.kid}</h1>
</c:if>

<script type="text/javascript">
//로그인
Kakao.init('f4352b5c75fa4dee61f430ab3f1ff6f4'); // javascript키
console.log(Kakao.isInitialized()); // 카카오디벨로퍼 활성화시 true
Kakao.Auth.createLoginButton({
	container: '#kakao-login-btn',
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
				resultdiv += '	<h4>id: ' + id + '<h4>';
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
					url : '/hos/roh/kakaoSigninPro',
					data : {
						id : id,
						nick : nick,
						gender : gender ? gender : 'null',
                        age_range : age_range ? age_range : 'null'
						// 필요한경우 추가작성
					},
					success : function(response) {
						// 서버로부터 응답 처리
						console.log(response);
						location.reload();
						// 원하는 작업 수행
					},
					error : function(error) {
						// 오류처리
						console.log(error);
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
 
// 로그아웃
function unlinkApp() {
	Kakao.API.request({
		url: '/v1/user/unlink',
		success: function(res) {
			alert('success: ' + JSON.stringify(res))
		},
		fail: function(err) {
			alert('fail: ' + JSON.stringify(err))
		},
	})
}
</script>