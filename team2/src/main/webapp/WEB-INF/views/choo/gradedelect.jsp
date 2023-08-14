<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>글삭제</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<br />

<center><b>글삭제</b></center>
<c:if test="${dto.memberType == 2}">
	<center><b>글삭제</b></center>
		<div class="d-flex justify-content-center">
			<form method="post" name="gradedelect" action="gradedelectPro?num=${num}&pageNum=${pageNum}&name=${name}&addr=${addr}">
				<table width="360" cellspacing="0" cellpadding="0">
					<tr>
						<td align="center">
							<input class="btn btn-primary" type="submit" value="글삭제">
							<input class="btn btn-danger" type="button" value="글목록" onclick="location.href='hosgrade?name=${name}&addr=${addr}&pageNum=${pageNum}'">
						</td>
					</tr>
				</table>
			</form>
		</div>
</c:if>


<c:if test="${dto.memberType == 1}">
<center><b>글삭제</b></center>
<div class="d-flex justify-content-center">
	<form method="post" name="gradedelect" action="gradedelectPro?num=${num}&pageNum=${pageNum}&name=${name}&addr=${addr}">
		<table width="360" cellspacing="0" cellpadding="0">
			<tr height="30">
				<td>
					<div class="input-group mb-2">
 						<span class="input-group-text" id="basic-addon1" style="width:80px;">비밀번호</span>
  						<input type="text" class="form-control" placeholder="비밀번호를 입력해주세요" name="pw" aria-describedby="basic-addon1">
					</div>
				</td>
			</tr>
			<tr height="30">	
				<td align="center" colspan="2">
					<input class="btn btn-primary" type="submit" value="글삭제">
					<input class="btn btn-danger" type="button" value="글목록" onclick="location.href='hosgrade?name=${name}&addr=${addr}&pageNum=${pageNum}'">
				</td>
			</tr>
		</table>
				<input type="hidden" name="num" value="${num}">
				<input type="hidden" name="name" value="${name}">
				<input type="hidden" name="addr" value="${addr}">
	</form>
</div>
</c:if>