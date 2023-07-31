<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Final Page</title>
</head>
<body>
 <table>
     <!-- ITEM_NAME_VALUES이라는 컬렉션을 반복해서 medicine이라는 변수에 각 요소를 할당시킴 -->
        <c:forEach items="${ITEM_NAME_VALUES}" var="medicine">
            <tr>
                <th>제품명</th>
                <!-- 하이퍼링크로 medicine변수에 할당된 medicine을 표시하고 이 값을 검색결과 페이지로 전달하는 링크를 생성 -->
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