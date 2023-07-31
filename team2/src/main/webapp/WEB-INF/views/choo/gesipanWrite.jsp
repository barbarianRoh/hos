<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>의견글 작성</title>

<form method="post" name="gesipanWrite" action="/hos/choo/gesipanWritePro?pageNum=${pageNum}">
	<table width="1000" border="1" cellspacing="0" cellpadding="0">
		<tr height="30">
			<td align="center" width="100">글제목</td>
			<td width="100"><input type="text" size="100" maxlength="50" name="title"></td>
		</tr>
		<tr height="30">
			<td align="center" width="100">작성자</td>
			<c:if test="${memId == null}">
				<td width="100"><input type="text" size="100" maxlength="50" name="id"></td>
			</c:if>
			
			<c:if test="${memId != null}">
				<td width="100">${memId}<input type="hidden" value="${memId}" name="id"></td>
			</c:if>
		</tr>
		<tr height="30">
			<td align="center" width="300">글내용</td>
			<td width="300"><textarea name="con" rows="44" cols="127"></textarea></td>
		</tr>
		<tr height="30">
			<td align="center" width="100">비밀번호</td>
			<td width="100"><input type="text" size="100" maxlength="30" name="pw"></td>
		</tr>
		<tr>
			<td colspan="4" align="center">
				<input type="submit" value="글작성">
				<input type="reset" value="다시작성">
				<input type="button" value="작성취소" onclick="location='gesipanmain?pageNum=${pageNum}'">
			</td>
		</tr>
	</table>
</form>