<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>답글작성</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<form method="get" name="reconWrite" action="/hos/choo/reconWritePro">
	<input type="hidden" name="num" value="${num}" />
	<input type="hidden" name="pageNum" value="${pageNum}" />
	<table width="1000" cellspacing="0" cellpadding="0">
		<tr height="30">
			<td>
				<div class="input-group mb-2">
					<span class="input-group-text" id="basic-addon1" style="width:80px;">작성자</span>
						<input class="form-control" type="text" value="${memId}" name="id" readonly>
				</div>
			</td>
		</tr>
		<tr height="30">
			<td>
				<div class="input-group mb-2">
					<span class="input-group-text">답변내용</span>
					<textarea name="con" rows="20" cols="60" class="form-control" aria-label="With textarea" placeholder="답변내용을 입력해주세요"></textarea>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="4" align="center">
				<input class="btn btn-primary" type="submit" value="작 성">
				<input class="btn btn-secondary" type="reset" value="다시작성">
				<input class="btn btn-danger" type="button" value="돌아가기" onclick="location='gesipancon?num=${num}&pageNum=${pageNum}'">
			</td>
		</tr>
	</table>
</form>