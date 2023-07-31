<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>Safe Medicine List</title>
</head>
<body>
    <h1>가정 내 안전 상비약</h1>
    
    <table>
        <tr>
            <th>Item Name</th>
        </tr>
        <!-- list로 된 컬렉션에 dto 변수를 넣음 -->
        <c:forEach items="${list}" var="dto">
            <tr>
            	<!-- 하이퍼링크로 dto변수에 할당된 num을 표시하고 itemname 값을 검색결과 페이지로 전달하는 링크를 생성 -->
                <td><a href="/hos/hong/safe?num=${dto.num}">${dto.itemname}</a></td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>