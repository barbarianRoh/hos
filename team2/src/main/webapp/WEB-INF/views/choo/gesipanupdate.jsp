<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>글수정</title>

<form method="post" name="gesipanupdate" action="/hos/choo/gesipanupdatePro?num=${dto.num}&pageNum=${pageNum}">
	<table align="center" width="1000" border="1" cellspacing="0" cellpadding="0">
		<tr height="30">
			<td align="center" width="70">글제목</td>
			<td align="center" width="250"><input type="text" size="125" maxlength="50" name="title" value="${dto.title}"></td>
		</tr>
		<tr>
			<td align="center" width="70">작성자</td>
			<td align="left" width="250">${dto.id}</td>
		</tr>
		<tr height="30">
			<td align="center" width="70">글내용</td>
			<td colspan="3" align="center" width="550">
				<textarea name="con" rows="44" cols="127">${dto.con}</textarea></td>
		</tr>
		<tr height="30">
			<td align="center" width="70">비밀번호</td>
			<td width="100"><input type="text" size="25" maxlength="30" name="pw"></td>
		</tr>
		<tr>
			<td colspan="4" align="right">
				<input type="submit" value="글수정">
				<input type="reset" value="다시작성">
				<input type="button" value="글목록" onclick="location.href='gesipan?pageNum=${pageNum}'"></td>
		</tr>
	</table>
</form>