<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<meta charset="UTF-8">

<title>회원탈퇴</title>

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

<h1>회원탈퇴</h1>
<form action="withdrawalPro" method="post">
	<label for="id">아이디</label>
	<input type="hidden" id="id" name="id" value="${sid}" />
	${sid}<br />
	<label for="pw">비밀번호</label>
	<input type="password" id="pw" name="pw" />
	<input type="submit" value="회원탈퇴" />
</form>

<a href="/hos/roh/">돌아가기</a>