<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="UTF-8">

<title>회원가입</title>

<script src="//code.jquery.com/jquery-3.7.0.min.js"></script>

<script>
// 정규표현식
// 영문자, 숫자로 5~15자
function regId(id) {
	var regExp = /^[A-Za-z0-9]{5,15}$/;
	return regExp.test(id);
}
// 8~16자 영문, 숫자 반드시 포함 특문 사용가능
function regPw(pw) {
	var regExp = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z!@#$%^&*()_\-+=\[\]{}|;:,.<>?]{8,16}$/;
	return regExp.test(pw);
}
function regName(name) {
	var regExp = /^([가-힣]{2,30}|[a-zA-Z]{2,30})$/;
	return regExp.test(name);
}

// 입력값 체크하는 메서드들 시작부분
var idCheck = 0;
var pwCheck = 0;
var pw2Check = 0;
var nameCheck = 0;
// var authCheck = 0;

function checkId() {
	var inputed = $('#id').val();
	$.ajax({
		success: function() {
			// 정규표현식 해당x, 15자리가 넘을때
			if(regId(inputed) == false || inputed.length > 15) {
				// 회원가입 버튼 비활성화
				$(".signupbtn").prop("disabled", true);
				// 회원가입 버튼 배경 회색으로
				$(".signupbtn").css("background-color", "#aaaaaa");
				// input 배경 붉은색으로
				$("#id").css("background-color", "#ffcece");
				idCheck = 0;
			// 정규표현식에 해당될 때 
			} else if(regId(inputed) == true) {
				// input 배경 초록색으로
				$("#id").css("background-color", "#b0f6ac");
				idCheck = 1;
			}
		}
	})
}

function checkPw() {
	var inputed = $('#pw').val();
	$.ajax({
		success: function() {
			if(regPw(inputed) == false || inputed.length > 16) {
				$(".signupbtn").prop("disabled", true);
				$(".signupbtn").css("backgrond-color", "#aaaaaa");
				$("#pw").css("background-color", "#ffcece");
				pwCheck = 0;
			} else if(regPw(inputed) == true) {
				$("#pw").css("background-color", "#b0f6ac");
				pwCheck = 1;
			}
		}
	})
}

function checkPw2() {
	var inputed = $('#pw2').val();
	var inputed2 = $('#pw').val();
	
	$.ajax({
		success: function() {
			if(inputed != inputed2) {
				$(".signupbtn").prop("disabled", true);
				$(".signupbtn").css("backgrond-color", "#aaaaaa");
				$("#pw2").css("background-color", "#ffcece");
				pwCheck = 0;
			} else if(inputed == inputed2) {
				$("#pw2").css("background-color", "#b0f6ac");
				pwCheck = 1;
			}
		}
	})
}

function checkName() {
	var inputed = $('#name').val();
	$.ajax({
		success: function() {
			if(regName(inputed) == false || inputed.length > 30) {
				$(".signupbtn").prop("disabled", true);
				$(".signupbtn").css("backgrond-color", "#aaaaaa");
				$("#name").css("background-color", "#ffcece");
				nameCheck = 0;
			} else if(regName(inputed) == true) {
				$("#name").css("background-color", "#b0f6ac");
				nameCheck = 1;
			}
		}
	})
}

function activateSignupbtn() {
	if(idCheck == 1 && pwCheck == 1 && pw2Check == 1 && nameCheck == 1) {
		$(".signupbtn").prop("disabled", false);
		$("signupbtn").css("background-color", "#b0f6ac");
	} else {
		$(".signupbtn").css("vackground-color", "#aaaaaa");
		$(".signupbtn").prop("disabled", true);
	}
}



$(function(){
	$("#signupbtn").click(function(){
		
		var id = $("#id").val();
		var pw = $("#pw").val();
		var name = $("#name").val();
		
		id = $.trim(id);
		pw = $.trim(pw);
		name = $.trim(name);
		
		if(id == ""){
			alert("아이디를 입력해 주세요.");
			$("#id").focus();
			return false;
		}
		if(pw == ""){
			alert("비밀번호를 입력해 주세요.");
			$("#pw").focus();
			return false;
		}
		if(name == ""){
			alert("이름을 입력해 주세요.");
			$("#name").focus();
			return false;
		}
		
		$("#id").val(id);
		$("#pw").val(pw);
		$("#name").val(name);
		
		// serialize는 폼 안의 데이터를 한 번에 전송가능한 데이터로 만들어줌
		var formData = $("#frm").serialize();
		
		$.ajax({
			// 전송전 세팅
			type:"POST",
			data:formData,
			url:"signupPro",
			dataType:"text", // 리턴타입, 성공여부를 text로 추출해줌
			
			// 전송후 세팅
			success: function(result) { // controller에서 리턴받은 message부분임
				console.log(result);
				if(result == "ok"){
					alert("가입되었습니다");
					location="/hos/roh/"; // 저장이 완료된 이후 이동
				} else {
					alert("이미 존재하는 아이디입니다");
				}
			},
		    error: function() { // 시스템 에러
		    	alert("이미 존재하는 아이디입니다");
			}
		});
	});
});
</script>

<form action="/hos/roh/signupPro" id="frm" method="post">
	<input type="text" id="id" name="id" placeholder="아이디" oninput="checkId(), activeSignupbtn()" autocomplete='off' />
	<font color="red" id = "fail" style="display : none">5~15자의 영문자 혹은 숫자로 작성해주세요</font>
	<font color="red" id = "fail2" style="display : none">이미 존재하는 아이디입니다</font><br />
	
	<input type="text" id="pw" name="pw" placeholder="비밀번호" oninput="checkPw(), checkPw2(), activeSignupbtn()" autocomplete='off' /> <br />
	<input type="text" id="pw2" name="pw2" placeholder="비밀번호 확인" oninput="checkPw2(), activeSignupbtn()" autocomplete='off' /> <br />
	<input type="text" id="name" name="name" placeholder="이름" oninput="checkName(), activeSignupbtn()" autocomplete='off' /> <br />
	<input type="hidden" id="memberType" name="memberType" value="1" />
	<input type="hidden" id="ip" name="ip" value="ip" />
	<input type="hidden" id="enabled" name="enabled" value="1" />
	<input type="hidden" id="etc1" name="etc1" value="etc1" />
	<input type="hidden" id="etc2" name="etc2" value="etc2" />
	<input type="button" id="signupbtn" value="회원가입" />
</form>