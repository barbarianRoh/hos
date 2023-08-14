<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<meta charset="UTF-8">

<title>회원 상태변경 페이지</title>

 <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ccc;
        }

        th {
            background-color: #f2f2f2;
        }

        a {
            color: #007bff;
            text-decoration: none;
            transition: color 0.3s;
        }

        a:hover {
            color: #0056b3;
        }

        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .pagination a, .pagination .current-page {
            padding: 5px 10px;
            margin: 0 5px;
            color: #333;
            text-decoration: none;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        .pagination .current-page {
            background-color: #007bff;
            color: #fff;
            border-color: #007bff;
        }

    </style>

<h1>회원 상태변경 페이지</h1>

<script>
	function getPageNumFromUrl() {
		const urlParams = new URLSearchParams(window.location.search);
		const pageNum = urlParams.get("pageNum");
		return pageNum ? parseInt(pageNum) : 1;
	}
</script>

<table align="center" border="1" cellspacing="0" cellpadding="0">
	<tr align="center" height="30">
		<td>고유번호</td>
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
			<td colspan="9">회원정보가 없습니다</td>
		</tr>
	</c:if>
	<c:if test="${not empty list}">
		<c:forEach var="dto" items="${list}">
			<tr align="center" height="30">
				<td>${dto.num}</td>
				<td>${dto.id}</td>
				<td>${dto.name}</td>
				<td>${dto.birth}</td>
				<td>${dto.memberType}</td>
				<td>${dto.ip}</td>
				<td><fmt:formatDate value="${dto.reg}" pattern="yyyy-MM-dd"/></td>
				<td>${dto.enabled}</td>
				<td>
					<a class="btn btn-outline-dark mt-auto" href="/hos/roh/memberEnabled?id=${dto.getId()}&pageNum=${pageNum}">활성화</a>
					<a class="btn btn-outline-dark mt-auto" href="/hos/roh/memberDisabled?id=${dto.getId()}&pageNum=${pageNum}">비활성화</a>
				</td>
			</tr>
		</c:forEach>
	</c:if>
</table>

<form class="pagination" align="center">
	<c:if test="${startPage > 10}">
		<a href="/hos/roh/adminForm?pageNum=${startPage - 10}">이전</a>
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<a href="/hos/roh/adminForm?pageNum=${i}">${i}</a>
	</c:forEach>
	<c:if test="${endPage > 9}">
		<a href="/hos/roh/adminForm?pageNum=${startPage + 10}">다음</a>
	</c:if>
</form>

<br>

<form align="center">
	<a href="/hos/roh/">메인으로</a>
</form>
