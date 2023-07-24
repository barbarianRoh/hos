<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<meta charset="UTF-8">

<title>홈페이지</title>

<a href="/hos/roh/signupForm">회원가입</a>

<c:if test="${result eq 1}">
	로그인 성공~@#~#@~~@#@~#@#
</c:if>
<form action="/hos/roh/signinPro" method="post">
	<label for="id">아이디</label>
	<input type="text" id="id" name="id" placeholder="아이디" />
	<label for="pw">비밀번호</label>
	<input type="text" id="pw" name="pw" placeholder="비밀번호" />
	<input type="submit" value="로그인" />
</form>