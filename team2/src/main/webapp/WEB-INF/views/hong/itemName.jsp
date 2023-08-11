<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- view.jsp -->
<html lang="en" class="chrome mel-js s12 s1 mobile">
	<head>
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        
    <title>Medicine Information</title>
        <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        table {
            width: 80%;
            margin: 20px auto;
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

        a {
            color: #007bff;
            text-decoration: none;
            transition: color 0.3s;
        }

        a:hover {
            color: #0056b3;
        }

        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .pagination a, .pagination .current-page {
            padding: 5px 10px;
            margin: 0 5px;
            color: #333;
            text-decoration: none;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        .pagination .current-page {
            background-color: #007bff;
            color: #fff;
            border-color: #007bff;
        }

    </style>
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