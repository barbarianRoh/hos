<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>답글작성</title>

<form method="post" name="reconWrite" action="/hos/choo/reconWritePro?num=${num}">
	<table width="1000" border="1" cellspacing="0" cellpadding="0">
		<tr height="30">
			<td align="center" width="100">작성자</td>
				<td width="100">${memId}<input type="hidden" value="${memId}" name="id"></td>
		</tr>
		<tr height="30">
			<td align="center" width="300">답변내용</td>
			<td width="300"><textarea name="con" rows="44" cols="127"></textarea></td>
		</tr>
		<tr>
			<td colspan="4" align="center">
				<input type="submit" value="작 성">
				<input type="reset" value="다시작성">
				<input type="button" value="돌아가기" onclick="location='gesipancon?num=${num}'">
			</td>
		</tr>
	</table>
</form>