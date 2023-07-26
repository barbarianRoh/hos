<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
	<meta charset="UTF-8">
	<title>병원평점 게시판</title>
</head>

<c:if test="${list.size() == 0}">
	<table align="center" width="700" border="1" cellspacing="0" cellpadding="0">
		<tr>
			<td align="center">작성된 글이 존재하지 않습니다.</td>
			<td align="right" colspan="4"><a href="gradeWrite?name=${name}&addr=${addr}&pageNum=${pageNum}">글작성</a></td></tr>
	</table>
</c:if>

<c:if test="${list.size() > 0}">
	<table align="center" width="950" border="1" cellspacing="0" cellpadding="0">
		<tr height="30">
			<td align="center" width="50">글번호</td>
			<td align="center" width="500">글제목</td>
			<td align="center" width="150">작성자</td>
			<td align="center" width="250">작성날짜</td>
		</tr>
		<c:forEach var="info" items="${list}">
		<tr height="30">
			<td align="center" width="50">${info.num}</td>
			<td align="center" width="500"><a href="gradecon?num=${info.num}&name=${name}&addr=${addr}&pageNum=${pageNum}">${info.title}</a></td>
			<td align="center" width="100">${info.id}</td>
			<td align="center" width="150">${info.reg}</td>
		</tr>
		</c:forEach>
			<td align="right" colspan="4"><a href="gradeWrite?name=${name}&addr=${addr}&pageNum=${pageNum}">글작성</a></td>	
	</table>
</c:if>
<form align="center">	
	<c:if test="${startPage > 10}">
		<a href="hosgrade?pageNum=${startPage - 10}&name=${name}&addr=${addr}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<a href="hosgrade?pageNum=${i}&name=${name}&addr=${addr}">[${i}]</a>
	</c:forEach>
	<c:if test="${endPage < pageCount}">
		<a href="hosgrade?pageNum=${startPage + 10}&name=${name}&addr=${addr}">[다음]</a>
	</c:if>
</form>