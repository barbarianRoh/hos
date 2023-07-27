<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<meta charset="UTF-8">

<title>홈페이지</title>

<h1>홈페이지</h1>

<c:if test="${loginFailed}">
	<script>
		alert("아이디 혹은 비밀번호를 확인하세요");
	</script>
</c:if>

<c:if test="${logout}">
	<script>
		alert("로그아웃 되었습니다")
	</script>
</c:if>

<c:if test="${not empty sid}">
	${sid}님
	<a href="/hos/roh/myProfileForm">내정보</a>
	<a href="/hos/roh/signout">로그아웃</a><br />
	<a href="/hos/roh/withdrawalForm">회원탈퇴</a><br />
</c:if>

<c:if test="${empty sid}">
	<form action="/hos/roh/signinPro" method="post">
		<label for="id">아이디 : </label>
		<input type="text" id="id" name="id" placeholder="아이디" /><br />
		<label for="pw">비밀번호 : </label>
		<input type="password" id="pw" name="pw" placeholder="비밀번호" /><br />
		<input type="submit" value="로그인" />
	</form>
	
	<a href="/hos/roh/signupForm">회원가입</a>
</c:if>
