<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Safe Medicine List</title>
</head>
<body>
    <h1>안전 상비약</h1>
    <table>
    	<c:forEach var="item" items="${medicine}">
	        <tr>
	        	<th>제품명</th>
	            <td>${item.itemname}</td>
	        </tr>
	        <tr>
	        	<th>업체명</th>
	            <td>${item.entpname}</td>
	        </tr>
	        <tr>
	        	<th>효능 효과</th>
	            <td>${item.efcyqesitm}</td>
	        </tr>
	        <tr>
	     		<th>사용법</th>
	            <td>${item.usemethodquesitm}</td>
	   		</tr>
	   		<tr>
	        	<th>약 사용전 알아야할 내용</th>
	            <td>${item.atpnwarnqesitm}</td>
	        </tr>
	        <tr>
	        	<th>주의사항</th>
	            <td>${item.atpnqesitm}</td>
	        </tr>
	        <tr>
	        	<th>주의할 약 또는 음식</th>
	            <td>${item.intrcqesitm}</td>
	        </tr>
	        <tr>
	        	<th>이상반응</th>
	            <td>${item.seqesitm}</td>
	        </tr>
	        <tr>
	        	<th>보관법</th>
	            <td>${item.depositmethodqesitm}</td>
	        </tr>      
    </c:forEach>
    </table>
</body>
</html>