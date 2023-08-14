<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 찾기</title>
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
            width: 120px;
            font-weight: bold;
        }
        
        input[type="text"] {
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
        }
        
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<c:if test="${pwError == true}">
    <script>
    	alert("비밀번호가 다릅니다");
    </script>
</c:if>

<h1>비밀번호 찾기</h1>
<form action="findMyPwPro" method="get">
	<label for="id">아이디 : </label>
	<input type="text" id="id" name="id" placeholder="아이디" /><br />
	<label for="name">이름 : </label>
	<input type="text" id="name" name="name" placeholder="이름" /><br />
	<label for="birth">생년월일 : </label>
	<input type="text" id="birth" name="birth" placeholder="생년월일" /><br />
	<input type="submit" value="비밀번호 찾기" />
</form>

${findMyPw}<br />
<button onclick="closeWindow()">닫기</button>
<script>
function closeWindow() {
    window.close();
}
</script>