<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>고객센터 메인페이지</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<h1 class="text-center">고객센터</h1>

<c:if test="${list.size() == 0}">
	<table class="table" align="center" >
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
		<td class="text-center" colspan="4">
			작성된 글이 존재하지 않습니다
		</td>
		</tr>
		<tr>
		<td align="right" colspan="4"><a href="gesipanWrite?pageNum=${pageNum}">글작성</a></td>
		</tr>
		</tbody>
	</table>
</c:if>

<c:if test="${list.size() != 0}">
	<table class="table" align="center">
	<thead class="table-dark">
		<tr height="30">
			<td align="center" width="50">글번호</td>
			<td align="center" width="500">글제목</td>
			<td align="center" width="150">작성자</td>
			<td align="center" width="250">작성날짜</td>
		</tr>
		</thead>
		<c:forEach var="dto" items="${list}">
		<tbody>
		<tr height="30">
			<td align="center" width="50">${dto.num}</td>
			<td align="center" width="500"><a href="gesipancon?num=${dto.num}&pageNum=${pageNum}">${dto.title}</a></td>
			<td align="center" width="150"><strong>${dto.id}</strong></td>
			<td align="center" width="250">${dto.reg}</td>
		</tr>
		<tbody>
		</c:forEach>
		<tr>
			<td align="right" colspan="4">
				<a class="btn btn-primary" href="gesipanWrite?pageNum=${pageNum}">글작성</a>
				<a class="btn btn-primary" href="gesipanMylist?num=${dto.num}&pageNum=${pageNum}">내가쓴글</a>
				<a class="btn btn-primary" href="/hos/roh/">메인페이지로</a>
			</td>
			</tr>
	</table>
</c:if>

<nav aria-label="Page navigation example">
	<ul class="pagination justify-content-center">
		<c:if test="${startPage > 10}">
			<li class="page-item">
				<a class="page-link" href="gesipanmain?pageNum=${startPage - 10}" aria-label="Previous">
					<span aria-hidden="true">&laquo;</span>
				</a>
			</li>
		</c:if>
		
	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<li class="page-item"><a class="page-link" href="gesipanmain?pageNum=${i}">${i}</a></li>
	</c:forEach>
	
		<c:if test="${endPage < pageCount}">
			<li class="page-item">
				<a class="page-link" href="gesipanmain?pageNum=${startPage + 10}" aria-label="Next">
					<span aria-hidden="true">&raquo;</span>
				</a>
			</li>
		</c:if>
	</ul>
</nav>