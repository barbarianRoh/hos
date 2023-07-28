<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.springframework.web.context.WebApplicationContext" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page import="javax.servlet.ServletContext" %>
<%@ page import="com.team2.controller.DataApiClient" %>

<html>
<head>
    <title>Search page</title>
</head>
<body>
    <h2>의약품 이름 검색</h2>
    <form method="GET" action="result">
        <input type="text" name="keyword" placeholder="제품명을 입력 하세요" />
        <input type="submit" value="Search" />
    </form>

    <h2>의약품 업체 이름 검색</h2>
    <form method="GET" action="resultByBusiness">
        <input type="text" name="businessName" placeholder="업체명을 입력하세요" />
        <input type="submit" value="Search" />
    </form>
    
    <br>
    
    <h2>의약외품 이름 검색</h2>
    <form method="GET" action="otherresult">
        <input type="text" name="keyword" placeholder="제품명을 입력 하세요" />
        <input type="submit" value="Search" />
    </form>

</body>
</html>