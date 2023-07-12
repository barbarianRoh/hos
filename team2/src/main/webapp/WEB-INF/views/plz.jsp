<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.team2.controller.DataApiClient" %>
<%@ page import="org.w3c.dom.Document" %>
<%@ page import="org.w3c.dom.Element" %>
<%@ page import="org.w3c.dom.NodeList" %>
<%@ page import="javax.xml.parsers.DocumentBuilder" %>
<%@ page import="javax.xml.parsers.DocumentBuilderFactory" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.io.IOException" %>
<%@ page import="org.xml.sax.SAXException" %>
<%@ page import="javax.xml.parsers.ParserConfigurationException" %>

<html>
<head>
    <title>Search page</title>
</head>
<body>
    <h1>Search page - ${param.keyword}</h1>

    <%
    String keyword = request.getParameter("keyword");
    DataApiClient dataApiClient = new DataApiClient();
    String apiKey = "MMbncKBwZqOh19KQELbd%2FeILVFSsR6IbbxB7%2BNF3Oz1uxb5VmjB9p%2BQ1LFZyk2F8RZ6QWiTXrf%2BhNb6G%2BiDWVw%3D%3D";
    String encodedKeyword = java.net.URLEncoder.encode(keyword, "UTF-8");
    String url = "http://apis.data.go.kr/1471000/DrbEasyDrugInfoService/getDrbEasyDrugList?serviceKey=MMbncKBwZqOh19KQELbd%2FeILVFSsR6IbbxB7%2BNF3Oz1uxb5VmjB9p%2BQ1LFZyk2F8RZ6QWiTXrf%2BhNb6G%2BiDWVw%3D%3D"&trustEntpName=" + encodedKeyword + "(%EC%A3%BC)&pageNo=1&startPage=1&numOfRows=1";

    List<String> entpNames = new ArrayList<>();
    List<String> itemNames = new ArrayList<>();

    try {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        Document document = builder.parse(new URL(url).openStream());

        NodeList entpNameList = document.getElementsByTagName("entpName");
        NodeList itemNameList = document.getElementsByTagName("itemName");

        for (int i = 0; i < entpNameList.getLength(); i++) {
            Element entpNameElement = (Element) entpNameList.item(i);
            String entpName = entpNameElement != null ? entpNameElement.getTextContent() : "";
            entpNames.add(entpName);

            Element itemNameElement = (Element) itemNameList.item(i);
            String itemName = itemNameElement != null ? itemNameElement.getTextContent() : "";
            itemNames.add(itemName);
        }

    } catch (IOException | ParserConfigurationException | SAXException e) {
        e.printStackTrace();
    }
    %>

    <h2>API Information</h2>
    <ul>
        <% for (String entpName : entpNames) { %>
            <li>Entp Name: <%= entpName %></li>
        <% } %>
        <% for (String itemName : itemNames) { %>
            <li>Item Name: <%= itemName %></li>
        <% } %>
    </ul>
</body>
</html>