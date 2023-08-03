<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- CSS only -->
<!DOCTYPE html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content = "IE=edge">
	<title>오프캔버스</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">    
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>    
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="/hos/resources/js/chatForm2.js"></script>
	<link rel="stylesheet" type="text/css" href="/hos/resources/css/chatbot.css">
</head>
<body>

<button id = "offcanvas-Button" class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">Toggle right offcanvas</button>

<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
  <div class="offcanvas-header">
    <h3 id="offcanvasRightLabel">챗봇 서비스</h3>
    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body">
    <body>
	  <div id="wrap">
	
	    <!-- 응답 메시지 표시 -->
	    <div id="chatBox"></div><br>
	
	    <!-- 질문 메시지 입력 폼 -->
	    <form id="chatForm">
	      <input type="text" id="message" name="message" size="30" placeholder="질문을 입력하세요">
	      <input type="submit" value="제출">
	    </form>
	  </div>
	</body>
  </div>
</div>
</body>