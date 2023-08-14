<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<meta charset="UTF-8">

<title>아이디 찾기</title>

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
        input[type="submit"] {
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
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

<c:if test="${pwError == true}">
    <script>
    	alert("비밀번호가 다릅니다");
    </script>
</c:if>

<form action="findMyIdPro" method="get">
	<h1>아이디 찾기</h1>
	<label for="name">이름</label>
	<input type="text" id="name" name="name" placeholder="이름" /><br />
	<label for="birth">생년월일</label>
	<input type="text" id="birth" name="birth" placeholder="생년월일"/><br />
	<input type="submit" value="아이디 찾기" />
	<a href="/hos/roh/">돌아가기</a>
</form>