<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.springframework.web.context.WebApplicationContext" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page import="javax.servlet.ServletContext" %>
<%@ page import="com.team2.controller.DataApiClient" %>

<html>
<head>
    <title>검색 페이지</title>
</head>
<body>
    <h1>검색 페이지</h1>

    <form method="GET" action="search">
        <input type="text" name="keyword" placeholder="검색어를 입력하세요" />
        <input type="submit" value="검색" />
    </form>
</body>
</html>