<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>글삭제</title>

<center><b>글삭제</b></center>
<br>
	<form method="post" name="gradedelect" action="gradedelectPro?pageNum=${pageNum}">
		<table width="360" border="1" align="center" cellspacing="0" cellpadding="0">
			<tr height="30">
				<td align="center" width="70">비밀번호</td>
				<td width="100"><input type="text" size="25" maxlength="30" name="pw"></td>
			</tr>
			<tr height="30">	
				<td align="center" colspan="2">
					<input type="submit" value="글삭제">
					<input type="button" value="글목록" onclick="location.href='hosgrade?name=${name}&addr=${addr}&pageNum=${pageNum}'">
				</td>
			</tr>
		</table>
				<input type="hidden" name="num" value="${num}">
				<input type="hidden" name="name" value="${name}">
				<input type="hidden" name="addr" value="${addr}">
	</form>