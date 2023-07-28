<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<meta charset="UTF-8">

<title>내정보</title>

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
		alert("바꿀 비밀번호를 확인해세요");
		window.location.href='http://localhost:8080/hos/roh/myProfileForm';
	</script>
</c:if>

<c:if test="${infoUpdate}">
	<script>
		alert("비밀번호가 변경되었습니다");
		window.location.href='http://localhost:8080/hos/roh/';
	</script>
</c:if>

<h1>내정보</h1>
<form action="/hos/roh/myProfilePro" id="frm" method="post">
	<input type="hidden" id="id" name="id" value="${dto.getId()}" />
	<label for="id">아이디 : </label>
	${dto.getId()}<br />
	<label for="pw">기존 비밀번호 : </label>
	<input type="password" id="pw" name="pw" /><br />
	
	<label for="pw2">바꿀 비밀번호 : </label>
	<input type="password" id="pw2" name="pw2" /><br />
	
	<label for="pw3">바꿀 비밀번호 확인 : </label>
	<input type="password" id="pw3" name="pw3" /><br />
	
	<label for="name">이름 : </label>
	${dto.getName()}<br />
	
	<label for="name">생년월일 : </label>
	${dto.getBirth()}<br />
	
	<input type="submit" value="수정" />
</form>
<a href="/hos/roh/">메인으로</a>