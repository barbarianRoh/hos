<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Bootstrap css -->
<html lang="en" class="chrome mel-js s12 s1 mobile">
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        
    <title>가정내 안전 상비약</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            margin: 20px 0;
            color: #333;
        }

        table {
            width: 900px;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ccc;
        }

        th {
            background-color: #f2f2f2;
        }

        img {
            max-width: 100%;
            height: auto;
            display: block;
            margin: 0 auto;
        }

        td[colspan] {
            font-weight: bold;
            text-align: center;
            background-color: #333;
            color: #fff;
        }
    </style>
</head>
<body>
    <h1>안전 상비약</h1>
    <table>
        <tr height="30">
            <td colspan="3" align="center">Precautions</td>
        </tr>
        <tr>
            <td colspan="3" align="center"><img src="/hos/resources/assets/hongimg/${dto.imgfile}" alt="Image" width="500" height="400"></td>
        </tr>
        <tr>
            <td align="center">Company name:</td>
            <td colspan="2">${dto.entpname}</td>
        </tr>
        <tr>
            <td align="center">Product Name:</td>
            <td colspan="2">${dto.itemname}</td>
        </tr>
        <tr>
            <td align="center">효능 효과:</td>
            <td colspan="2">${dto.efcyqesitm}</td>
        </tr>
        <tr>
        	<td align="center">사용법:</td>
        	<td colspan="2">${dto.usemethodquesitm}</td>
        </tr>
        <tr>
        	<td align="center">알아야할 내용:</td>
        	<td colspan="2">${dto.atpnwarnqesitm}</td>
        </tr>
        <tr>
        	<td align="center">주의사항 :</td>
        	<td colspan="2">${dto.atpnqesitm}</td>
        </tr>
        <tr>
        	<td align="center">주의할 약또는 음식 :</td>
        	<td colspan="2">${dto.intrcqesitm}</td>
        </tr>
        <tr>
        	<td align="center">이상반응 :</td>
        	<td colspan="2">${dto.seqesitm}</td>
        </tr>
        <tr>
        	<td align="center">보관법 :</td>
        	<td colspan="2">${dto.depositmethodqesitm}</td>
        </tr>
        <!-- Add more rows for other details -->
    </table>
	</body>
	
	<style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

    
    <!-- Custom styles for this template -->
    <link href="footers.css" rel="stylesheet">
  </head>
  <body>
<div class="container">
  <footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
    <p class="col-md-4 mb-0 text-muted">&copy; 2023 Company, Inc</p>
    <ul class="nav col-md-4 justify-content-end">
      <li class="nav-item"><a href="/hos/kim/main" class="nav-link px-2 text-muted">Home</a></li>
      <li class="nav-item"><a href="/hos/choo/gesipanmain" class="nav-link px-2 text-muted">FAQs</a></li>
      <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">About</a></li>
    </ul>
  </footer>
</div>