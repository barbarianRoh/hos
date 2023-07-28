<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>챗봇 폼</title>
  <script src="/hos/resources/js/jquery.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
  <script src="/hos/resources/js/chatForm2.js"></script>
  <link rel="stylesheet" type="text/css" href="/hos/resources/css/chatbot.css">
</head>
<body>
  <div id="wrap">
    <!-- 헤더 -->
    <div id="chatHeader" style="margin-right:125px">
      <span>챗봇</span>
      <button id="btnClose">X</button>
    </div>
    <h3>챗봇 서비스</h3>

    <!-- 응답 메시지 표시 -->
    <div id="chatBox"></div><br>

    <!-- 질문 메시지 입력 폼 -->
    <form id="chatForm">
      <input type="text" id="message" name="message" size="30" placeholder="질문을 입력하세요">
      <input type="submit" value="제출">
    </form>
  </div>
</body>
</html>
