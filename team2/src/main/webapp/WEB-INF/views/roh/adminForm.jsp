<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<meta charset="UTF-8">

<title>회원 상태변경 페이지</title>

<h1>회원 상태변경 페이지</h1>

<a href="/hos/roh/">메인으로</a>

<table align="center" border="1" cellspacing="0" cellpadding="0">
	<tr align="center" height="30">
		<td>아이디</td>
		<td>이름</td>
		<td>생일</td>
		<td>멤버타입</td>
		<td>아이피</td>
		<td>가입일</td>
		<td>활성상태</td>
		<td>상태변경</td>
	</tr>
	<c:if test="${empty list}">
		<tr align="center" height="30">
			<td colspan="6">회원정보가 없습니다</td>
		</tr>
	</c:if>
	<c:if test="${not empty list}">
		<c:forEach var="dto" items="${list}">
			<tr align="center" height="30">
				<td>${dto.id}</td>
				<td>${dto.name}</td>
				<td>${dto.birth}</td>
				<td>${dto.memberType}</td>
				<td>${dto.ip}</td>
				<td><fmt:formatDate value="${dto.reg}" pattern="yyyy-MM-dd"/></td>
				<td>${dto.enabled}</td>
				<td></td>
			</tr>
		</c:forEach>
	</c:if>
</table>

<form align="center">
	<c:if test="${startPage > 10}">
		<a href="/hos/roh/adminForm?pageNum=${startPage - 10}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<a href="/hos/roh/adminForm?pageNum=${i}">[${i}]</a>
	</c:forEach>
	<c:if test="${endPage > 10}">
		<a href="/hos/roh/adminForm?pageNum=${startPage + 10}">[다음]</a>
	</c:if>
</form>