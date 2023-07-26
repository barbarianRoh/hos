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
        <c:forEach items="${ITEM_NAME_VALUES}" var="medicine">
            <tr>
                <th>제품명</th>
                <td><a href="/hos/hong/otherresult?keyword=${medicine}">${medicine}</a></td>
            </tr>
        </c:forEach>
    </table>
    
    <!-- Add pagination controls if needed -->
    <div class="pagination">
        <c:if test="${currentPage > 1}">
            <a href="${pageUrl}?page=${currentPage - 1}">이전</a>
        </c:if>
    </div>
</body>
</html>