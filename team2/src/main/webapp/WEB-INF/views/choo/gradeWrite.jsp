<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<meta charset="UTF-8">
	<title>병원평점작성</title>
</head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<br />
<h1 class="text-center">병원평가 글작성</h1>

<div class="d-flex justify-content-center">
<form method="post" name="gradeWrite" action="/hos/choo/gradeWritePro?pageNum=${pageNum}">
	<table width="1000" cellspacing="0" cellpadding="0">
		<tr height="30">
			<td>
				<div class="input-group mb-2">
 					<span class="input-group-text" id="basic-addon1" style="width:80px;">글제목</span>
  					<input type="text" class="form-control" placeholder="제목을 입력해주세요" name="title" aria-describedby="basic-addon1">
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="input-group mb-2">
  					<span class="input-group-text" id="basic-addon1" style="width:80px;">작성자</span>
  						<c:if test="${guest.equals(guest)}">
							<input class="form-control" type="text" size="100" maxlength="50" name="id">
						</c:if>
			
						<c:if test="${memId != null}">
							<input class="form-control" type="text" value="${memId}" name="id" readonly>
						</c:if>
			
						<c:if test="${nick != null}">
							<input class="form-control" type="text" value="${nick}" name="id" readonly>
						</c:if>
					</div>
			</td>	
		</tr>
		<tr height="30">
			<td>
				<div class="input-group mb-2">
  					<span class="input-group-text" id="basic-addon1" style="width:80px;">병원이름</span>
  						<input class="form-control" type="text" value="${name}" name="name" readonly>
  				</div>
			</td>
		</tr>
		<tr height="30">
			<td>
				<div class="input-group mb-2">
  					<span class="input-group-text" id="basic-addon1" style="width:80px;">병원주소</span>
  						<input class="form-control" type="text" value="${addr}" name="addr" readonly>
  				</div>
			</td>		
		</tr>
		<tr height="30">
			<td>
				<div class="input-group mb-2">
					<span class="input-group-text">글내용</span>
					<textarea name="con" rows="20" cols="60" class="form-control" aria-label="With textarea" placeholder="내용을 입력해주세요"></textarea>	
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
				<input class="btn btn-primary" type="submit" value="글작성">
				<input class="btn btn-secondary" type="reset" value="다시작성">
				<input class="btn btn-danger" type="button" value="작성취소" onclick="location='hosgrade'">
			</td>
		</tr>
	</table>
</form>
</div>