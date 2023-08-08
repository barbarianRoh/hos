<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>글수정</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<br />

<h1 class="text-center">고객센터 글수정</h1>

<div class="d-flex justify-content-center">
<form method="post" name="gesipanupdate" action="/hos/choo/gesipanupdatePro?num=${dto.num}&pageNum=${pageNum}">
	<table width="1000" cellspacing="0" cellpadding="0">
		<tr height="30">
			<td>
				<div class="input-group mb-2">
					<span class="input-group-text" id="basic-addon1" style="width:80px;">글제목</span>
					<input type="text" class="form-control" name="title" value="${dto.title}">
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="input-group mb-2">
					<span class="input-group-text" id="basic-addon1" style="width:80px;">작성자</span>
						<input class="form-control" type="text" value="${dto.id}" name="id" readonly>
				</div>
			</td>
		</tr>
		<tr height="30">
			<td>
				<div class="input-group mb-2">
					<span class="input-group-text" style="width:80px;">글내용</span>
					<textarea class="form-control" row="20" cols="60" value="${dto.con}" name="con">${dto.con}</textarea>
				</div>
			</td>
		</tr>
		<tr height="30">
			<td>
				<div class="input-group mb-2">
 					<span class="input-group-text" id="basic-addon1" style="width:80px;">비밀번호</span>
  					<input type="text" class="form-control" placeholder="비밀번호를 입력해주세요" name="pw" aria-describedby="basic-addon1">
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="4" align="center">
				<input class="btn btn-primary" type="submit" value="글수정">
				<input class="btn btn-secondary" type="reset" value="다시작성">
				<input class="btn btn-danger" type="button" value="글목록" onclick="location.href='gesipanmain?pageNum=${pageNum}'"></td>
		</tr>
	</table>
</form>
</div>