<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>otherMedicine Information</title>
</head>
<body>
    <table>
        <c:forEach items="${medicines}" var="medicine">
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
    		<br>

    <!-- Pagination controls -->
    <div class="pagination">
        <c:set var="startPage" value="${(currentPage - 1) / 10 * 10 + 1}" />
        <c:set var="endPage" value="${startPage + 9}" />
        <c:if test="${endPage > totalPages}">
            <c:set var="endPage" value="${totalPages}" />
        </c:if>

        <c:if test="${startPage > 1}">
            <a href="${pageUrl}?page=1">처음</a>
        </c:if>
        
        <c:if test="${currentPage > 1}">
            <a href="${pageUrl}?page=${currentPage - 1}">이전</a>
        </c:if>

        <c:forEach begin="${startPage}" end="${endPage}" var="pageNumber">
            <c:choose>
                <c:when test="${pageNumber == currentPage}">
                    <span class="current-page">${pageNumber}</span>
                </c:when>
                <c:otherwise>
                    <a href="${pageUrl}?page=${pageNumber}">${pageNumber}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <c:if test="${currentPage < totalPages}">
            <a href="${pageUrl}?page=${currentPage + 1}">다음</a>
        </c:if>
        
        <c:if test="${endPage < totalPages}">
            <a href="${pageUrl}?page=${totalPages}">끝</a>
        </c:if>

    </div>
</body>
</html>