<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<center><b>글내용</b></center>
<br>
<form>
	<table align="center" width="1000" border="1" cellspacing="0" cellpadding="0">
		<tr height="30">
			<td align="center" width="50">글번호</td>
			<td align="center" width="50" colspan="3">${dto.num}</td>
		</tr>
		<tr height="30">
			<td align="center" width="50">작성자</td>
			<td align="center" width="80">${dto.id}</td>

			<td align="center" width="50">글제목</td>
			<td align="center" width="250">${dto.title}</td>
		</tr>
		<tr height="30">
			<td align="center" width="50">글내용</td>
			<td colspan="3" align="center" width="550">${dto.con}</td>
		</tr>
		<tr>
			<td colspan="4" align="right">
				<c:if test="${memId == dto.id}">
					<input type="button" value="글수정" onclick="location.href='updategrade?num=${dto.num}&name=${name}&addr=${addr}&pageNum=${pageNum}'">
					<input type="button" value="글삭제" onclick="location.href='gradedelect?num=${dto.num}&name=${name}&addr=${addr}&pageNum=${pageNum}'">
				</c:if>
					<input type="button" value="돌아가기" onclick="location.href='hosgrade?name=${name}&addr=${addr}&pageNum=${pageNum}'"></td>
		</tr>
	</table>
</form>

<!--  
<form method="post">
	<table align = "right" width = "500" height = "60" border = "1" cellspacing =  "0" cellpadding = "0">
		<tr>
			<td align = "right" colspan = "0">
				<input type = "button" name = "good" value = "추천해요" onclick = "location.href='hosgood?num=${dto.num}&name=${name}&addr=${addr}&id=${dto.id}'">		
				<input type = "button" name = "bad" value = "별로에요" onclick = "location.href='hosbad?num=${dto.num}&name=${name}&addr=${addr}&id=${dto.id}'">
			</td>
		</tr>
	</table>
</form>

<table align="center" width="300" border="1" cellspancing="0" cellpadding="0">
	<tr>
		<td align="center" colspan="0" width="2" height="10">
			<td align="center" width="10" height="10">추전해요</td>
			<td align="center" width="10" height="10">별로에요</td>
	</tr>
	<tr>
		<td align="center">
			<td align="center">${dto.good}</td>
			<td align="center">${dto.bad}</td>
	</tr>
</table>
-->