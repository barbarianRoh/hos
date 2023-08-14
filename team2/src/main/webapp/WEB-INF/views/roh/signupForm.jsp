<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<head>
    <meta charset="UTF-8">
    <title>Sign up</title>
    <style>
        body {
            background-color: #e9ecef;
            color: #212529;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        
        h1 {
            color: #212529;
        }
        
        form {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        
        label {
            display: inline-block;
            width: 150px;
            font-weight: bold;
        }
        
        input[type="text"],
        input[type="password"] {
            padding: 8px;
            margin-bottom: 10px;
            width: 100%;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        
        input[type="button"] {
            padding: 10px 20px;
            background-color: #212529;
            color: #ffffff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        
        a {
            color: #212529;
            text-decoration: none;
        }
        
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<title>회원가입</title>

<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .profile-container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
            width: 400px;
        }
        h1 {
            text-align: center;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="password"], input[type="text"], input[type="submit"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-bottom: 10px;
        }
        input[type="button"] {
        	width: 110%;
        	height: 40%;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="button"]:hover {
            background-color: #0056b3;
        }
        a {
            display: block;
            text-align: center;
            margin-top: 10px;
            text-decoration: none;
            color: #007bff;
        }
        .error-msg {
            color: red;
            font-size: 14px;
            margin-top: 5px;
        }
    </style>

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

// 영문 혹은 한글 2~30자
function regName(name) {
	var regExp = /^([가-힣]{2,30}|[a-zA-Z]{2,30})$/;
	return regExp.test(name);
}

function regBirth(birth) {
	var regExp = /^\d{8}$/;
	return regExp.test(birth);
}

var idCheck = false;
var pwCheck = false;
var pw2Check = false;
var nameCheck = false;
var birthCheck = false;
	
// 입력한 값이 정규식에 부합하면 true
function checkId() {
	var id = $.trim($("#id").val());
	idCheck = regId(id);
	$("#id").css("background-color", idCheck ? "#b0f6ac" : "#ffcece");
	activateSignupbtn();
}
function checkPw() {
	var pw = $.trim($("#pw").val());
	pwCheck = regPw(pw);
	$("#pw").css("background-color", pwCheck ? "#b0f6ac" : "#ffcece");
	activateSignupbtn();
}
function checkPw2() {
	var pw = $.trim($("#pw").val());
	var pw2 = $.trim($("#pw2").val());
	pw2Check = pw === pw2;
	$("#pw2").css("background-color", pw2Check ? "#b0f6ac" : "#ffcece");
	activateSignupbtn();
}
function checkName() {
	var name = $.trim($("#name").val());
	nameCheck = regName(name);
	$("#name").css("background-color", nameCheck ? "#b0f6ac" : "#ffcece");
	activateSignupbtn();
}
function checkBirth() {
	var birth = $.trim($("#birth").val());
	birthCheck = regBirth(birth);
	$("#birth").css("background-color", birthCheck ? "#b0f6ac" : "#ffcece");
	activateSignupbtn();
}
// 4개 체크가 통과되면 가입하기 버튼이 활성화됨
function activateSignupbtn() {
	if(idCheck == 1 && pwCheck == 1 && pw2Check == 1 && nameCheck == 1 && birthCheck == 1) {
		$("#signupbtn").prop("disabled", false);
		$("#signupbtn").css("background-color", "#b0f6ac");
	} else {
		$("#signupbtn").css("background-color", "#aaaaaa");
		$("#signupbtn").prop("disabled", true);
	}
}

$(function() {
	$("#id").on("input", function() {
		checkId();
	});
	$("#pw, #pw2").on("input", function() {
		checkPw();
		checkPw2();
	});
	$("#name").on("input", function() {
		checkName();
	});
	$("#Birth").on("input", function() {
		checkBirth();
	});
		
	$("#signupbtn").click(function() {
		var id = $.trim($("#id").val());
        var pw = $.trim($("#pw").val());
        var pw2 = $.trim($("#pw2").val());
        var name = $.trim($("#name").val());
        var birth = $.trim($("#birth").val());
		
		if (id === "" || pw === "" || pw2 === "" || name === "" || birth === "") {
			alert("입력사항을 전부 입력해주세요");
			return false;
		}
	
		if(!regId(id)) {
			alert("아이디 경고");
			$("#id").focus();
			return false;
		}
		
		if(!regPw(pw)) {
			alert("비밀번호 경고");
			$("#pw").focus();
			return false;
		}
		
		if(pw !== pw2) {
			alert("비밀번호 확인 경고");
			$("#pw2").focus();
			return false;
		}
		
		if (!regName(name)) {
			alert("이름 경고")
			$("#name").focus();
			return false;
		}
		
		if (!regBirth(birth)) {
			alert("생년월일 경고")
		}
		
		$("#id").val(id);
		$("#pw").val(pw);
		$("#name").val(name);
		$("#birth").val(birth);
	
		// serialize는 폼 안의 데이터를 한 번에 전송가능한 데이터로 만들어줌
		var formData = $("#frm").serialize();
		$.ajax({
			// 전송전 세팅
			type : "POST",
			data : formData,
			url : "signupPro",
			dataType : "text", // 리턴타입, 성공여부를 text로 추출해줌
			
			// 전송후 세팅
			success: function(result) { // controller에서 리턴받은 message부분임
				console.log(result);
				if(result == "ok") {
					alert("가입되었습니다");
					window.close(); // 저장이 완료된 이후 이동
				} else {
					alert("이미 존재하는 아이디입니다");
				}
			},
			error: function() { // 시스템 에러
		    	alert("시스템 에러");
			},
		});
	});
});
		
</script>

<form action="/hos/roh/signupPro" id="frm" method="post">
	<h1>회원가입</h1>
	<input type="hidden" id="memberType" name="memberType" value="1" />
	<input type="hidden" id="ip" name="ip" value="ip" />
	<input type="hidden" id="enabled" name="enabled" value="1" />
	
	<label for="id">아이디</label>
	<input type="text" id="id" name="id" placeholder="아이디" oninput="checkId()" /><br />
	
	<label for="pw">비밀번호</label>
	<input type="password" id="pw" name="pw" placeholder="비밀번호" oninput="checkPw(), checkPw2()" /><br />
	
	<label for="pw2">비밀번호 확인</label>
	<input type="password" id="pw2" name="pw2" placeholder="비밀번호 확인" oninput="checkPw2()" /><br />
	
	<label for="name">이름</label>
	<input type="text" id="name" name="name" placeholder="이름" oninput="checkName()" /><br />
	
	<label for="birth">생년월일</label>
	<input type="text" id="birth" name="birth" placeholder="ex)19960331" oninput="checkBirth()" /><br />
	
	<input type="button" id="signupbtn" name="signupbtn" value="회원가입" />
	<a href="/hos/roh/">돌아가기</a>
</form>