<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Medical Information</title>
</head>
<body>
<table>
    <!-- ITEM_NAME_VALUES 라는 컬렉션을 반복해서 medicine 이라는 변수에 각 요소를 할당 -->
        <c:forEach items="${ITEM_NAME_VALUES}" var="medicine">
            <tr>
            <!-- 하이퍼링크로 medicine변수에 할당된 medicine을 표시하고 이 값을 검색결과 페이지로 전달하는 링크를 생성 -->
                <th>제품명</th>
                <td><a href="/hos/hong/otherresult?keyword=${medicine}">${medicine}</a></td>
            </tr>
        </c:forEach>
    </table>
    
    <br>

<div class="pagination">
    <c:if test="${currentPage > 1}">
        <a href="${pageUrl}?page=1">처음</a>
        <a href="${pageUrl}?page=${currentPage - 1}">이전</a>
    </c:if>
    
    <c:set var="startPage" value="${(currentPage - 1) / 10 * 10 + 1}" />
    <c:set var="endPage" value="${startPage + 9}" />
    <c:if test="${endPage > totalPages}">
        <c:set var="endPage" value="${totalPages}" />
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
        <a href="${pageUrl}?page=${totalPages}">끝</a>
    </c:if>
</div>
</body>
</html>