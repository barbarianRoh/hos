<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- view.jsp -->
<html>
<head>
    <title>Medicine Information</title>
</head>
<body>    
    <table>
        <c:forEach items="${itemNameValues}" var="itemName" varStatus="status">
            <tr>
            	<td>
            		<img src="${itemImageValues[status.index]}" alt="Image">
            	</td>
            </tr> 
            <tr>
                <th>업체명</th>
                <td>${entpNameValues[status.index]}</td>
            </tr>
   			<tr>
                <th>제품명</th>
                <td>${itemNameValues[status.index]}</td>
            </tr>
   			<tr>
                <th>품목기준코드</th>
                <td>${itemSeqValues[status.index]}</td>
            </tr>          
            <tr>
                <th>효능무엇</th>
                <td>${efcyQesitmValues[status.index]}</td>
            </tr>
   			<tr>
                <th>사용법</th>
                <td>${useMethodQesitmValues[status.index]}</td>
            </tr>          
            <tr>
                <th>알아야함!</th>
                <td>${atpnWarnQesitmValues[status.index]}</td>
            </tr>
   			<tr>
                <th>주의사항</th>
                <td>${atpnQesitmValues[status.index]}</td>
            </tr>
             <tr>
                <th>주의할 약또는 음식</th>
                <td>${intrcQesitmValues[status.index]}</td>
            </tr>
            <tr>
                <th>이상반응</th>
                <td>${seQesitmValues[status.index]}</td>
            </tr>
            <tr>
                <th>보관법</th>
                <td>${depositMethodQesitmValues[status.index]}</td>
            </tr>
            <tr>
                <th>수정일자</th>
                <td>${updateDeValues[status.index]}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>