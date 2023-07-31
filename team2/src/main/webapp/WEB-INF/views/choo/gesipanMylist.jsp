<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>내가쓴글</title>

<c:if test="${dto.size() == 0}">
	<table align="center" width="700" border="1" cellspacing="0" cellpadding="0">
		<tr>
			<td align="center">작성한 글이 존재하지 않습니다</td>
			<td align="right" colspan="4"><a href="gesipanmain?pageNum=${pageNum}">돌아가기</a></td>
	</table>
</c:if>

<c:if test="${dto.size() != 0}">
	<table align="center" width="950" border="1" cellspacing="0" cellpadding="0">
		<tr height="30">
			<td align="center" width="50">글번호</td>
			<td align="center" width="500">글제목</td>
			<td align="center" width="150">작성자</td>
			<td align="center" width="250">작성날짜</td>
		</tr>
		<c:forEach var="dto" items="${dto}">
		<tr height="30">
			<td align="center" width="50">${dto.num}</td>
			<td align="center" width="500"><a href="gesipancon?num=${dto.num}">${dto.title}</a></td>
			<td align="center" width="150">${dto.id}</td>
			<td align="center" width="250">${dto.reg}</td>
		</tr>
		</c:forEach>
			<td align="right" colspan="4"><a href="gesipanmain?pageNum=${pageNum}">돌아가기</a></td>
	</table>
</c:if>