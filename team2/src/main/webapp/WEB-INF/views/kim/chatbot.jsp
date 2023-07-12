<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
      <title>chatbotForm</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script src="resources/js/chatForm2.js"></script>
    <link rel="stylesheet" type="text/css" href="resources/css/chatbot.css">
  </head>
  <body>
    <div id="wrap">
      <!-- Header -->
      <div id="chatHeader">
        <span>챗봇</span>
        <button id="btnClose">X</button>
      </div>
    <h3>챗봇 서비스</h3>

    <!-- 응답 메시지 출력  -->
    <div id="chatBox"></div><br>

    <!-- 질문 메시지 입력 폼 -->
    <form id="chatForm">
      <input type="text" id="message" name="message" size="30" placeholder="질문을 입력하세요">
      <input type="submit" value="전송">
    </form>

    <br><br>
    </div>
  </body>
</html>