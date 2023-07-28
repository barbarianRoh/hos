<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- view.jsp -->  
<body> 
	<table>
        <c:forEach items="${ITEM_NAME_VALUES}" var="itemName" varStatus="status">
            <tr>
                <th>업체명</th>
                <td>${ENTP_NAME_VALUES[status.index]}</td>
            </tr>
            <tr> 
                <th>제품명</th>
                <td>${ITEM_NAME_VALUES[status.index]}</td>
            </tr>
            <tr>
                <th>효능 효과</th>
                <td>${EE_DOC_DATA_VALUES[status.index]}</td>
            </tr>
            <tr>
                <th>주의사항</th>
                <td>${UD_DOC_DATA_VALUES[status.index]}</td>
            </tr>
            <tr>
                <th>주의할 약 또는 음식</th>
                <td>${NB_DOC_DATA_VALUES[status.index]}</td>
            </tr>
        </c:forEach>
    </table>
</body>