<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
	<meta charset="UTF-8">
	<title>병원평점작성</title>
</head>

<form method="post" name="gradeWrite" action="/hos/choo/gradeWritePro?pageNum=${pageNum}">
	<table width="1000" border="1" cellspacing="0" cellpadding="0">
		<tr height="30">
			<td align="center" width="100">글제목</td>
			<td width="100"><input type="text" size="100" maxlength="50" name="title"></td>
		</tr>
		<tr height="30">
			<td align="center" width="100">작성자</td>
			<td width="100"><input type="text" size="100" maxlength="30" name="id"></td>
		</tr>
		<tr height="30">
			<td align="center" width="100">병원명</td>
			<td width="100">${name}<input type="hidden" value="${name}" name="name" /></td>
			
		</tr>
		<tr height="30">
			<td align="center" width="100">주 소</td>
			<td width="100">${addr}<input type="hidden" value="${addr}" name="addr" /></td>
			
		</tr>
		<tr height="30">
			<td align="center" width="300">글내용</td>
			<td width="300"><textarea name="con" rows="44" cols="127"></textarea></td>
		</tr>
		<tr hieght="30">
			<td align="center" width="100">비밀번호</td>
			<td width="100"><input type="text" size="100" maxlength="30" name="pw"></td>
		</tr>
		<tr>
			<td colspan="4" align="center">
				<input type="submit" value="글작성">
				<input type="reset" value="다시작성">
				<input type="button" value="작성취소" onclick="location='hosgrade'">
			</td>
		</tr>
	</table>
</form>