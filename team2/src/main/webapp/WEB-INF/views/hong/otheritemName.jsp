<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>otherMedicine Information</title>
</head>
<body>    
    <table>
        <c:forEach items="${itemNameValues}" var="itemName" varStatus="status">
            <tr>
                <th>업체명</th>
                <td>${entpNameValues[status.index]}</td>
            </tr>
   			<tr>
                <th>제품명</th>
                <td>${itemName}</td>
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
                <th>복용방법</th>
                <td>${atpnWarnQesitmValues[status.index]}</td>
            </tr>
   			<tr>
                <th>주의사항</th>
                <td>${atpnQesitmValues[status.index]}</td>
            </tr>
             <tr>
                <th>품목코드</th>
                <td>${intrcQesitmValues[status.index]}</td>
            </tr>
            <tr>
                <th>품목코드명</th>
                <td>${seQesitmValues[status.index]}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>