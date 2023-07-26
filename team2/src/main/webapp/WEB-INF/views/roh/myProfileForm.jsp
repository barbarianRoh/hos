<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="UTF-8">

<title>내정보</title>

<h1>내정보</h1>
<form action="myProfilePro" id="frm" method="get">
	<label for="id">아이디 : </label>
	${dto.getId()}<br />
	<label for="pw">기존 비밀번호 : </label>
	<input type="text" id="pw" name="pw" /><br />
	<label for="pw2">바꿀 비밀번호 : </label>
	<input type="text" id="pw2" name="pw2" /><br />
	<label for="pw3">바꿀 비밀번호 확인 : </label>
	<input type="text" id="pw3" name="pw3" /><br />
	<label for="name">이름 : </label>
	${dto.getName()}<br />
	<input type="submit" value="수정" />
</form>
<a href="/hos/roh/">메인으로</a>