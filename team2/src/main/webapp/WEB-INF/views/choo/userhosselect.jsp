<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>최근찾은병원</title>

<c:if test="${hos == null}">
	<table align="center" width="700" border="1" cellspacing="0" cellpadding="0">
		<tr>
			<td align="center">최근에 검색하신 병원이 없습니다</td>
			<td align="right" colspan="4"><a href="">돌아가기</a></td>
		</tr>
	</table>
</c:if>

<c:if test="${hos != null}">
	<c:if test="${id != null}">
		${hos.id}님이 최근에 검색하신 병원입니다.
	</c:if>
	<c:if test="${id1 != null}">
		${hos.nick}님이 최근에 검색하신 병원입니다.
	</c:if>
	<table align="center" width="900" border="1" cellspacing="0" cellpadding="0">
		<tr height="30">
			<td align="center" width="300">병원이름</td>
			<td align="center" width="300">병원주소</td>
			<td align="center" width="300">검색날짜</td>
		</tr>
		<c:forEach var="dto" items="${hos}">
		<tr height="30">
			<td align="center" width="300"><a href="hosinfo?QN=${dto.hosname}">${dto.hosname}</a></td>
			<td align="center" width="300">${dto.hosaddr}</td>
			<td align="center" width="300">${dto.reg}</td>
		</tr>
		</c:forEach>
			<td align="right" colspan="4">
				<a href="">돌아가기</a>
			</td>
	</table>
</c:if>