<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<meta charset="UTF-8">

<title>아이디 찾기</title>

<c:if test="${pwError == true}">
    <script>
    	alert("비밀번호가 다릅니다");
    </script>
</c:if>

<h1>아이디 찾기</h1>
<form action="findMyIdPro" method="get">
	<label for="name">이름 : </label>
	<input type="text" id="name" name="name" placeholder="이름" /><br />
	<label for="birth">생년월일 : </label>
	<input type="text" id="birth" name="birth" placeholder="생년월일"/><br />
	<input type="submit" value="아이디 찾기" />
</form>

${findMyId}<br />
<a href="/hos/roh/">돌아가기</a>