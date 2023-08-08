<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>내가쓴글</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<h1 class="text-center">내가 작성한 글</h1>

<c:if test="${dto.size() == 0}">
	<table class="table" align="center" width="700" border="1" cellspacing="0" cellpadding="0">
		<thead class="table-dark">
		<tr height="30">
			<td align="center" width="50">글번호</td>
			<td align="center" width="500">글제목</td>
			<td align="center" width="150">작성자</td>
			<td align="center" width="250">작성날짜</td>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td colspan="4" align="center">작성한 글이 존재하지 않습니다</td>
			</tr>
			<tr>
			<td align="right" colspan="4"><a href="gesipanmain?pageNum=${pageNum}">돌아가기</a></td>
			</tr>
		</tbody>	
	</table>
</c:if>

<c:if test="${dto.size() != 0}">
	<table class="table" align="center" width="950" border="1" cellspacing="0" cellpadding="0">
		<thead class="table-dark">
		<tr height="30">
			<td align="center" width="50">글번호</td>
			<td align="center" width="500">글제목</td>
			<td align="center" width="150">작성자</td>
			<td align="center" width="250">작성날짜</td>
		</tr>
		</thead>
		<c:forEach var="dto" items="${dto}">
		<tbody>
		<tr height="30">
			<td align="center" width="50">${dto.num}</td>
			<td align="center" width="500"><a href="gesipancon?num=${dto.num}">${dto.title}</a></td>
			<td align="center" width="150">${dto.id}</td>
			<td align="center" width="250">${dto.reg}</td>
		</tr></tbody>
		</c:forEach>
		<tr>
			<td align="right" colspan="4"><a class="btn btn-primary" href="gesipanmain?pageNum=${pageNum}">돌아가기</a></td>
			</tr>
	</table>
</c:if>