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
        <c:forEach items="${medicines}" var="medicine">   <!-- medicine이라는 컬렉션을 반복해서 medicine이라는 변수에 각 요소를 할당시킴 -->
            <tr>
                <th>업체명</th>
                <td>${medicine.entpName}</td> <!-- 변수에 할당된 이름을 표시 -->
            </tr>
            <tr>
              <!-- 하이퍼링크로 medicine변수에 할당된 itemname을 표시하고 이 값을 검색결과 페이지로 전달하는 링크를 생성 -->
                <th>제품명</th>
                <td><a href="/hos/hong/result?keyword=${medicine.itemName}">${medicine.itemName}</a></td>
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