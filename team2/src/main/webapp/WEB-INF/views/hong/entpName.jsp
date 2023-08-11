<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- Bootstrap css -->
<html lang="en" class="chrome mel-js s12 s1 mobile">
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
        <c:forEach items="${medicines}" var="medicine">   <!-- medicine이라는 컬렉션을 반복해서 medicine이라는 변수에 각 요소를 할당시킴 -->
            <tr>
                <th>업체명</th>
                <td>${medicine.entpName}</td> <!-- 변수에 할당된 이름을 표시 -->
            </tr>
            <tr>
              <!-- 하이퍼링크로 medicine변수에 할당된 itemname을 표시하고 이 값을 검색결과 페이지로 전달하는 링크를 생성 -->
                <th>제품명</th>
                <td><a href="/hos/hong/result?keyword=${medicine.itemName}">${medicine.itemName}</a></td>
            </tr>
        </c:forEach>
    </table>
    
    <!-- Pagination controls -->
    <div>
        <c:if test="${currentPage > 1}">
            <a href="${pageUrl}?page=${currentPage - 1}" class="pagination-button">이전</a>
        </c:if>
        <c:if test="${currentPage < totalPages}">
            <a href="${pageUrl}?page=${currentPage + 1}" class="pagination-button">다음</a>
        </c:if>
    </div>
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