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
    <!-- medicine이라는 컬렉션을 반복해서 medicine이라는 변수에 각 요소를 할당시킴 -->
        <c:forEach items="${medicines}" var="medicine">
        <!-- medicine의 entpname, itemname 값을 보여줌 -->
            <tr>
                <th>업체명</th>
                <td>${medicine.entpName}</td>
            </tr>
            <tr>
                <th>제품명</th>
                <td>${medicine.itemName}</td>
            </tr>
        </c:forEach>
    </table>
    
    <!-- Pagination controls -->
    <div>
        <c:if test="${currentPage > 1}">
            <a href="${pageUrl}?page=${currentPage - 1}" class="pagination-button">이전</a>
        </c:if>
        <c:if test="${currentPage < totalPages}">
            <a href="${pageUrl}?page=${currentPage + 1}" class="pagination-button">다음</a>
        </c:if>
    </div>
</body>
</html>