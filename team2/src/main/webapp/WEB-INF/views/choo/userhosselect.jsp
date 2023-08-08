<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- align="center" width="1500" border="1" cellspacing="0" cellpadding="0"
class="btn btn-primary"
 --%>

<title>최근찾은병원</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<c:if test="${hos.size() == 0}">
	<table align="center" width="700" border="1" cellspacing="0" cellpadding="0">
		<tr>
			<td align="center">최근에 검색하신 병원이 없습니다</td>
			<td align="right" colspan="4"><a href="/hos/roh/">메인으로</a></td>
		</tr>
	</table>
</c:if>

<c:if test="${hos.size() != 0}">
	<c:if test="${sid != null}">
		<h1>${sid}님이 최근에 검색하신 병원입니다.</h1>
		<div class="d-flex justify-content-end mb-2">
		<button class="btn btn-primary" onclick="location='/hos/roh/'">메인으로</button>
		</div>
	</c:if>
	<c:if test="${kid1 != null}">
		<h1>${hos.nick}님이 최근에 검색하신 병원입니다.</h1>
	</c:if>
	<table class="table" >
		<thead class="table-dark">
			<tr>
				<th scope="col">병원이름</th>
				<td scope="col">병원주소</td>
				<td scope="col">검색날짜</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="dto" items="${hos}">
				<tr>
					<th><a href="hosinfo?QN=${dto.hosname}">${dto.hosname}</a></th>
					<td>${dto.hosaddr}</td>
					<td>${dto.reg}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</c:if>