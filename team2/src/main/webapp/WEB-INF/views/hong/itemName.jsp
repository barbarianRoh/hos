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
    <!-- itemNameValues라는 컬렉션을 반복해서 itemname 이라는 변수에 각 요소를 할당하고 varStatus라는 상태용변수를 사용해서 반복 인덱스에 접근하도록-->
        <c:forEach items="${itemNameValues}" var="itemName" varStatus="status"> 
            <tr>
               <td>
               <!-- 현재 반복 인덱스인 status.index에 해당하는 이미지 경로를 가져옴 -->
                  <img src="${itemImageValues[status.index]}" alt="Image" width="500" height="400">
               </td>
            </tr> 
            <tr>
                <th>업체명</th>
                <td>${entpNameValues[status.index]}</td>
            </tr>
   			<tr>
                <th>제품명</th>
                <td>${itemNameValues[status.index]}</td>
            </tr>
   			<tr>
                <th>품목기준코드</th>
                <td>${itemSeqValues[status.index]}</td>
            </tr>          
            <tr>
                <th>효능효과</th>
                <td>${efcyQesitmValues[status.index]}</td>
            </tr>
   			<tr>
                <th>사용법</th>
                <td>${useMethodQesitmValues[status.index]}</td>
            </tr>          
            <tr>
                <th>알아야 할 내용</th>
                <td>${atpnWarnQesitmValues[status.index]}</td>
            </tr>
   			<tr>
                <th>주의사항</th>
                <td>${atpnQesitmValues[status.index]}</td>
            </tr>
             <tr>
                <th>주의할 약또는 음식</th>
                <td>${intrcQesitmValues[status.index]}</td>
            </tr>
            <tr>
                <th>이상반응</th>
                <td>${seQesitmValues[status.index]}</td>
            </tr>
            <tr>
                <th>보관법</th>
                <td>${depositMethodQesitmValues[status.index]}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>