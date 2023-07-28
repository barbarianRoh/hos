<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>고객센터 메인페이지</title>

<c:if test="${list.size() == 0}">
	<table align="center" width="700" border="1" cellspacing="0" cellpadding="0">
		<tr>
			<td align="center">작성된 글이 존재하지 않습니다</td>
			<td align="right" colspan="4"><a href="gesipanWrite?pageNum=${pageNum}">글작성</a></td>
		</tr>
	</table>
</c:if>

<c:if test="${list.size() != 0}">
	<table align="center" width="950" border="1" cellspacing="0" cellpadding="0">
		<tr height="30">
			<td align="center" width="50">글번호</td>
			<td align="center" width="500">글제목</td>
			<td align="center" width="150">작성자</td>
			<td align="center" width="250">작성날짜</td>
		</tr>
		<c:forEach var="dto" items="${list}">
		<tr height="30">
			<td align="center" width="50">${dto.num}</td>
			<td align="center" width="500"><a href="gesipancon?num=${dto.num}&pageNum=${pageNum}">${dto.title}</a></td>
			<td align="center" width="150">${dto.id}</td>
			<td align="center" width="250">${dto.reg}</td>
		</tr>
		</c:forEach>
			<td align="right" colspan="4">
				<a href="gesipanWrite?pageNum=${pageNum}">글작성</a>
				<a href="gesipanMylist?num=${dto.num}&pageNum=${pageNum}">내가쓴글</a>
			</td>
	</table>
</c:if>

<form align="center">	
	<c:if test="${startPage > 10}">
		<a href="gesipanmain?pageNum=${startPage - 10}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<a href="gesipanmain?pageNum=${i}">[${i}]</a>
	</c:forEach>
	<c:if test="${endPage < pageCount}">
		<a href="gesipanmain?pageNum=${startPage + 10}">[다음]</a>
	</c:if>
</form>