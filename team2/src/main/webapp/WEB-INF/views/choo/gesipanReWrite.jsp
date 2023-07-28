<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>답변글 작성폼</title>

<form method="post" name="gesipanReWrite" action="/hos/choo/gesipanReWritePro?">
	<table width="1000" border="1" cellspacing="0" cellpadding="0">
		<tr height="30">
			<td align="center" width="100">글제목</td>
			<td width="100"><input type="text" size="100" maxlength="50" name="title"></td>
		</tr>
		<tr height="30">
			<td align="center" width="100">작성자</td>
			<td width="100"><input type="text" size="100" maxlength="30" name="id"></td>
		</tr>
		
	</table>
</form>
