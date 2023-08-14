<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="//code.jquery.com/jquery-3.7.0.min.js"></script>
<!DOCTYPE html>
<meta charset="UTF-8">

<title>내정보</title>
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
            width: 160px;
            font-weight: bold;
            margin-top: 10px;
        }
        
        input[type="text"],
        input[type="password"] {
            padding: 8px;
            margin-bottom: 10px;
            width: 100%;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        
        input[type="submit"] {
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
            margin-top: 10px;
            display: inline-block;
        }
        
        a:hover {
            text-decoration: underline;
        }
        
        #updatebtn[disabled] {
            background-color: #aaaaaa;
            cursor: not-allowed;
        }
        
        #updatebtn {
            background-color: #b0f6ac;
        }
    </style>
<h1>내정보</h1>

<c:if test="${sessionScope.sid != null}">	
	<script>
	//8~16자 영문, 숫자 반드시 포함 특문 사용가능
	function regPw(pw) {
		var regExp = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z!@#$%^&*()_\-+=\[\]{}|;:,.<>?]{8,16}$/;
		return regExp.test(pw);
	}
	
	var pwCheck = false;
	var pw2Check = false;
	var pw3Check = false;
	
	function checkPw1() {
		var pw = $.trim($("#pw").val());
		pwCheck = regPw(pw);
		$("#pw").css("background-color", pwCheck ? "#b0f6ac" : "#ffcece");
		activateUpdatebtn();
	}
	function checkPw2() {
		var pw2 = $.trim($("#pw2").val());
		pw2Check = regPw(pw2);
		$("#pw2").css("background-color", pw2Check ? "#b0f6ac" : "#ffcece");
		activateUpdatebtn();
	}
	function checkPw3() {
		var pw2 = $.trim($("#pw2").val());
		var pw3 = $.trim($("#pw3").val());
		pw3Check = pw2 === pw3;
		$("#pw3").css("background-color", pw3Check ? "#b0f6ac" : "#ffcece");
		activateUpdatebtn();
	}
	
	function activateUpdatebtn() {
		if(pwCheck == 1 && pw2Check == 1 && pw3Check == 1) {
			$("#updatebtn").prop("disabled", false);
			$("#updatebtn").css("background-color", "#b0f6ac");
		} else {
			$("#updatebtn").css("background-color", "#aaaaaa");
			$("#updatebtn").prop("disabled", true);
		}
	}
	
	$(function() {
		$("#pw").on("input", function() {
			checkPw1();
		});
		
		$("#pw2, #pw3").on("input", function() {
			checkPw2();
			checkPw3();
		});
		
		$("#updatebtn").click(function() {
			var pw = $.trim($("#pw").val());
			var pw2 = $.trim($("#pw2").val());
			var pw3 = $.trim($("#pw3").val());
			
			if(pw === "" || pw2 === "" || pw3 === "") {
				alert("입력사항을 전부 입력해주세요");
				return false;
			}
			
			if(!regPw(pw)) {
				alert("비밀번호 경고");
				$("#pw").focus();
				return false;
			}
		});
	});
	</script>
	
	<c:if test="${pwError}">
		<script>
			alert("기존 비밀번호를 확인해주세요");
			window.location.href='http://localhost:8080/hos/roh/myProfileForm';
		</script>
	</c:if>
	
	<c:if test="${pwError2}">
		<script>
			alert("바꿀 비밀번호를 확인해주세요");
			window.location.href='http://localhost:8080/hos/roh/myProfileForm';
		</script>
	</c:if>
	
	<c:if test="${nullError}">
		<script>
			alert("바꿀 비밀번호를 확인해주세요");
			window.location.href='http://localhost:8080/hos/roh/myProfileForm';
		</script>
	</c:if>
	
	<c:if test="${infoUpdate}">
		<script>
			alert("비밀번호가 변경되었습니다");
			window.location.href='http://localhost:8080/hos/roh/';
		</script>
	</c:if>
	
	<form action="/hos/roh/myProfilePro" id="frm" method="post">
		<input type="hidden" id="id" name="id" value="${sessionScope.sid}" />
		<label for="id">아이디 : </label>
		${sessionScope.sid}<br />
		
		<label for="pw">기존 비밀번호 : </label>
		<input type="password" id="pw" name="pw" placeholder="기존 비밀번호" oninput="checkPw1()" /><br />
		
		<label for="pw2">변경할 비밀번호 : </label>
		<input type="password" id="pw2" name="pw2" oninput="checkPw2(), checkPw3()" placeholder="바꿀 비밀번호"/><br />
		
		<label for="pw3">변경할 비밀번호 확인 : </label>
		<input type="password" id="pw3" name="pw3" oninput="checkPw3()" placeholder="비밀번호 확인" /><br />
		
		<label for="name">이름 : </label>
		${sessionScope.sname}<br />
		
		<label for="name">생년월일 : </label>
		${sessionScope.sbirth}<br />
		
		<input type="submit" value="수정" id="updatebtn" />
	</form>
</c:if>

<c:if test="${sessionScope.kid != null}">
	고유번호 : ${sessionScope.kid}<br />
	
	이름 : ${sessionScope.knick}<br />
	
	<c:if test="${not empty sessionScope.kage}">
		나이 : ${sessionScope.kage}<br />
	</c:if>
	
	<c:if test="${empty sessionScope.kage}">
		나이 : 비공개<br />
	</c:if>
	
	<c:if test="${not empty sessionScope.kgender}">
		성별 : ${sessionScope.kgender}<br />
	</c:if>
	
	<c:if test="${empty sessionScope.kgender}">
		성별 : 비공개<br />
	</c:if>
</c:if>

