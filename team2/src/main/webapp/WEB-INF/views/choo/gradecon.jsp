<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<center><b>글내용</b></center>
<br>

<form>
	<table class="table" align="center" width="1000" border="1" cellspacing="0" cellpadding="0">
		<tr height="30">
			<td align="center" width="50" class="table-primary">글번호</td>
			<td align="center" width="50" colspan="3">${dto.num}</td>
		</tr>
		<tr height="30">
			<td align="center" width="50" class="table-primary">작성자</td>
			<td align="center" width="80">${dto.id}</td>

			<td align="center" width="50" class="table-primary">글제목</td>
			<td align="center" width="250">${dto.title}</td>
		</tr>
		<tr height="30">
			<td align="center" width="50" class="table-primary">글내용</td>
			<td colspan="3" align="center" width="550">${dto.con}</td>
		</tr>
		<tr>
			<td colspan="4" align="right">
			<c:if test="${memId != null || nick != null}">
				<c:if test="${memId == dto.id || nick == dto.id}">
					<input class="btn btn-primary" type="button" value="글수정" onclick="location.href='updategrade?num=${dto.num}&name=${name}&addr=${addr}&pageNum=${pageNum}'">
					<input class="btn btn-primary" type="button" value="글삭제" onclick="location.href='gradedelect?num=${dto.num}&name=${name}&addr=${addr}&pageNum=${pageNum}'">
				</c:if>
			</c:if>
					<input class="btn btn-primary" type="button" value="돌아가기" onclick="location.href='hosgrade?name=${name}&addr=${addr}&pageNum=${pageNum}'"></td>
		</tr>
	</table>
</form>
