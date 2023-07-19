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
    <h1>Search page</h1>

    <h2>다른 제품 이름 검색</h2>
    <form method="GET" action="othersearch">
        <input type="text" name="keyword" placeholder="제품명을 입력 하세요" />
        <input type="submit" value="Search" />
    </form>

    <h2>다른 업체 이름 검색</h2>
    <form method="GET" action="othersearchByBusiness">
        <input type="text" name="businessName" placeholder="업체명을 입력하세요" />
        <input type="submit" value="Search" />
    </form>
</body>
</html>