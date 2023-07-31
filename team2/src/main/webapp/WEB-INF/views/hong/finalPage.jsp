<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Final Page</title>
</head>
<body>
    <table>
    <!-- medicine이라는 컬렉션을 반복, medicine이라는 변수에 각 요소를 할당 -->
       <c:forEach items="${medicines}" var="medicine">
            <tr>
             <!-- 하이퍼링크로 medicine변수에 할당된 itemname을 표시하고 이 값을 검색결과 페이지로 전달하는 링크를 생성 -->
                <th>제품명</th>
                <td><a href="/hos/hong/result?keyword=${medicine.itemName}">${medicine.itemName}</a></td>
            </tr>
        </c:forEach>
    </table>
    
    <!-- Add pagination controls if needed -->
    <div class="pagination">
        <a href="${pageUrl}?page=${currentPage - 1}">이전</a>
    </div>
</body>
</html>