<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<center><b>글내용보기</b></center>
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
		<c:if test="${dto.id != null && dto1.id != null}">
			<c:if test="${dto.id == dto1.id}">
				<input type="button" value="글수정" onclick="location.href='gesipanupdate?num=${dto.num}&pageNum=${pageNum}'">
				<input type="button" value="글삭제" onclick="location.href='gesipandelect?num=${dto.num}&pageNum=${pageNum}'">
			</c:if>
		</c:if>
				<input type="button" value="돌아가기" onclick="location.href='gesipanmain?pageNum=${pageNum}'">
	</table>
	
	<hr>
	<hr>
	
	<%-- 작성된 댓글이 있는지 없는지 확인 --%>
	<c:if test="${list.size() == 0}">
	<table align="center" width="1000" border="1" cellspacing="0" cellpadding="0">
		<tr height="30">
			<td align="center">작성된 댓글이 존재하지 않습니다</td>
		</tr>
	</table>
	</c:if>
	
	<c:if test="${list.size() != 0}">
	<%-- 댓글 보여주는 창 --%>
	<table align="center" width="1000" border="1" cellspacing="0" cellpadding="0">
		<tr height="30">
			<td align="center" colspan="5" width="50">댓글</td>
		</tr>
		<c:forEach var="re" items="${list}">
		<tr height="30">
			<td align="center" width="50">작성자</td>
			<td align="center" width="80">${re.id}</td>
			
			<td align="center" width="300">${re.con}</td>
			<td align="center" width="250">${re.reg}</td> 
		</tr>
		</c:forEach>
	</table>
	</c:if>
	
	<c:if test="${dto1.id != null}">
		<c:if test="${dto1.membertype == 2}">
		<%-- 댓글 작성하는 창 --%>
		<table align="center" width="1000" border="1" cellspacing="0" cellpadding="0">
			<tr height="30">
				<td align="center" width="100">작성자</td>
				<td width="100">${memId}<input type="hidden" value="${memId}" name="id"></td>
			
				<td width="300"><textarea name="con" rows="44" cols="127"></textarea></td>
				<td align="center">
					<input type="button" value="작 성" onclick="location.href='reconWrite?num=${dto.num}'"></td>
			</tr>
		</table>
		</c:if>
	</c:if>
</form>