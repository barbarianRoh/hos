<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>


<!DOCTYPE html>
<html>
<head>
  <style>
    /* Your existing styles can be retained here */
    body {
      font-family: 'Merriweather Sans', sans-serif;
      background-color: #f0f0f0;
      margin: 0;
      padding: 0;
    }

    .masthead {
      background-color: #343a40;
      color: white;
      text-align: center;
      padding: 0;
    }

    .masthead h1 {
      font-size: 2.5rem;
    }

    .masthead p {
      font-size: 1.25rem;
    }

    .btn-primary {
      background-color: #007bff;
      border-color: #007bff;
    }
  </style>
</head>
<body id="page-top">

  <!-- Masthead-->
  <header class="masthead">
    <div class="container px-4 px-lg-5 h-60">
      <div class="row gx-4 gx-lg-5 h-100 align-items-center justify-content-center text-center">
        <div class="col-lg-8 align-self-end">
          <h1 class="text-white font-weight-bold">조 이름 : 아파, 어디가?</h1>
          <hr class="divider" />
        </div>
        <div class="col-lg-8 align-self-baseline">
          <p class="text-white-75 mb-5">
            <br>
            주제 : 행정구역 의료기관 현황분석 및 시각화 서비스
            <br>
            조장 : 노진철 (조원 : 김현준, 홍도원, 추수민)
          </p>
          <input type="button" class="btn btn-secondary" value="들어가기" onclick="location.href='/hos/kim/main'">	
        </div>
      </div>
    </div>
  </header>
</body>
</html>