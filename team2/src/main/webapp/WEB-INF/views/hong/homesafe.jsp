<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Safe Medicine List</title>
</head>
	<body>
	    <h1>안전 상비약</h1>
	    <h1>${realPath}</h1>
		<table align="center" width="900" border="1" cellspacing="0">
			<tr height="30">
				<td align="center" colspan="3">안전상비약</td>
			</tr>
			<tr>
				<img src="/hos/resources/assets/hongimg/${dto.imgfile}" alt="Image" width="500" height="400">
			</tr>
			<tr>
				<td align="center" width="300">업체명 : ${dto.entpname}</td>
			</tr>
			<tr>	
				<td align="center" width="300">제품명 : ${dto.itemname}</td>
			</tr>
			<tr>
				<td align="center" width="300">효능효과 : ${dto.efcyqesitm}</td>
			</tr>
			<tr>	
				<td align="center" width="300">사용법 : ${dto.usemethodquesitm}</td>
			</tr>	
			<tr>
				<td align="center" width="300">알아야할 내용 : ${dto.atpnwarnqesitm}</td>
			</tr>
			<tr>	
				<td align="center" width="300">주의사항 : ${dto.atpnqesitm}</td>
			</tr>
			<tr>
				<td align="center" width="300">주의할 약또는 음식 : ${dto.intrcqesitm}</td>
			</tr>
			<tr>
				<td align="center" width="300">이상반응 : ${dto.seqesitm}</td>
			</tr>
			<tr>
				<td align="center" width="300">보관법 : ${dto.depositmethodqesitm}</td>
			</tr>		
		</table>
	</body>
</html>