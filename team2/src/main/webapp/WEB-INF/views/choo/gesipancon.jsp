<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<center><b>글내용보기</b></center>
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
		<c:if test="${dto.id != null && memId != null || nick != null}">
			<c:if test="${dto.id == memId || dto.id == nick}">
				<input type="button" value="글수정" onclick="location.href='gesipanupdate?num=${dto.num}&pageNum=${pageNum}'">
				<input type="button" value="글삭제" onclick="location.href='gesipandelect?num=${dto.num}&pageNum=${pageNum}'">
				<c:if test="${dto1.memberType == 2}">
				<input type="button" value="답 글" onclick="location.href='reconWrite?num=${dto.num}'">
				</c:if>
			</c:if>
		</c:if>
				<input type="button" value="돌아가기" onclick="location.href='gesipanmain?pageNum=${pageNum}'">
	</table>
	
	<hr>
	
	
	<%-- 작성된 댓글이 있는지 없는지 확인 --%>
	<c:if test="${list.size() == 0}">
	<table class="table" align="center" width="1000" border="1" cellspacing="0" cellpadding="0">
		<tr height="30">
			<td align="center">작성된 댓글이 존재하지 않습니다</td>
		</tr>
	</table>
	</c:if>
	
	<c:if test="${list.size() != 0}">
	<%-- 댓글 보여주는 창 --%>
	<table align="center" width="1000" border="1" cellspacing="0" cellpadding="0">
		<tr height="30">
			<td align="center" colspan="5" width="50">답 변</td>
		</tr>
		<tr height="30">
			<td align="center" width="50">답변번호</td>
			<td align="center" width="80">작성자</td>
			<td align="center" width="400">답변내용</td>
			<td align="center" width="150">작성날짜</td>
		</tr>
		<c:forEach var="re" items="${list}">
		<tr height="30">
			<td align="center" width="50">${re.renum}</td>
			<td align="center" width="80">${re.id}</td>
			<td align="center" width="425">${re.con}</td>
			<td align="center" width="125">${re.reg}</td> 
		</tr>
		</c:forEach>
	</table>
	</c:if>
</form>