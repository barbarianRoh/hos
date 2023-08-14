<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<meta charset="UTF-8">

<title>회원탈퇴</title>

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
        .withdrawal-form {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
            width: 250px;
        }
        h1 {
            text-align: center;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="password"] {
            width: 80%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-bottom: 10px;
        }
        input[type="submit"] {
            display: block;
            width: 100%;
            padding: 10px;
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
    </style>

<c:if test="${withdrawalSuccess == true}">
	<script>
		alert("탈퇴되었습니다");
		window.location.href='http://localhost:8080/hos/roh/';
	</script>
</c:if>

<c:if test="${withdrawalError == true}">
	<script>
		alert("관리자에게 문의해주세요");
	</script>
</c:if>

<c:if test="${pwError == true}">
    <script>
    	alert("비밀번호가 다릅니다");
    </script>
</c:if>

<form action="withdrawalPro" method="post">
	
	<label for="id">아이디</label>
	<input type="hidden" id="id" name="id" value="${sid}" />
	${sid}<br />
	<label for="pw">비밀번호</label>
	<input type="password" id="pw" name="pw" />
	<input type="submit" value="회원탈퇴" />
	<a href="/hos/roh/">돌아가기</a>
</form>
