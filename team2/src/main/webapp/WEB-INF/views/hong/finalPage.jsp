<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Final Page</title>
</head>
<body>
    <h1>Final Page</h1>
    
    <!-- Display the medicines for the final page -->
    <table>
        <c:forEach items="${medicines}" var="medicine">
            <tr>
                <th>제품명</th>
                <td><a href="/hos/hong/search?keyword=${medicine.itemName}">${medicine.itemName}</a></td>
            </tr>
        </c:forEach>
    </table>
    
    <!-- Add pagination controls if needed -->
    <div class="pagination">
        <a href="${pageUrl}?page=${currentPage - 1}">이전</a>
    </div>
</body>
</html>