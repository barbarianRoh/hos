<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>



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

      .b-example-divider {
        width: 100%;
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }

      .btn-bd-primary {
        --bd-violet-bg: #712cf9;
        --bd-violet-rgb: 112.520718, 44.062154, 249.437846;

        --bs-btn-font-weight: 600;
        --bs-btn-color: var(--bs-white);
        --bs-btn-bg: var(--bd-violet-bg);
        --bs-btn-border-color: var(--bd-violet-bg);
        --bs-btn-hover-color: var(--bs-white);
        --bs-btn-hover-bg: #6528e0;
        --bs-btn-hover-border-color: #6528e0;
        --bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
        --bs-btn-active-color: var(--bs-btn-hover-color);
        --bs-btn-active-bg: #5a23c8;
        --bs-btn-active-border-color: #5a23c8;
      }
      .bd-mode-toggle {
        z-index: 1500;
      }
</style>


</head>
<body>
<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
  
  <symbol id="home" viewBox="0 0 16 16">
    <path d="M8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4.5a.5.5 0 0 0 .5-.5v-4h2v4a.5.5 0 0 0 .5.5H14a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146zM2.5 14V7.707l5.5-5.5 5.5 5.5V14H10v-4a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v4H2.5z"/>
  </symbol>
  
  <symbol id="hospital" viewBox="0 0 16 16">
   <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 640 512">
	<path d="M192 48c0-26.5 21.5-48 48-48H400c26.5 0 48 21.5 48 48V512H368V432c0-26.5-21.5-48-48-48s-48 21.5-48 48v80H192V48zM48 96H160V512H48c-26.5 0-48-21.5-48-48V320H80c8.8 0 16-7.2 16-16s-7.2-16-16-16H0V224H80c8.8 0 16-7.2 16-16s-7.2-16-16-16H0V144c0-26.5 21.5-48 48-48zm544 0c26.5 0 48 21.5 48 48v48H560c-8.8 0-16 7.2-16 16s7.2 16 16 16h80v64H560c-8.8 0-16 7.2-16 16s7.2 16 16 16h80V464c0 26.5-21.5 48-48 48H480V96H592zM312 64c-8.8 0-16 7.2-16 16v24H272c-8.8 0-16 7.2-16 16v16c0 8.8 7.2 16 16 16h24v24c0 8.8 7.2 16 16 16h16c8.8 0 16-7.2 16-16V152h24c8.8 0 16-7.2 16-16V120c0-8.8-7.2-16-16-16H344V80c0-8.8-7.2-16-16-16H312z"/>
	</svg>
</symbol>
  <symbol id="pharmacy" viewBox="0 0 16 16">
  <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512">
	<path d="M504.3 11.1C493.3-1.6 474.5-3.7 461 6.2L252.3 160H397.3L502.6 54.6c11.8-11.8 12.6-30.8 1.6-43.5zM32 192c-17.7 0-32 14.3-32 32s14.3 32 32 32c0 82.5 43.4 147.7 123.9 176.2c-11.1 13.9-19.4 30.3-23.9 48.1C127.6 497.4 142.3 512 160 512H352c17.7 0 32.4-14.6 28.1-31.7c-4.5-17.8-12.8-34.1-23.9-48.1C436.6 403.7 480 338.5 480 256c17.7 0 32-14.3 32-32s-14.3-32-32-32H32z"/>
  </svg>
  </symbol>
  <symbol id="medicine" viewBox="0 0 16 16">
  <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 640 512">
<path d="M614.3 247c16.3-25 25.7-54.9 25.7-87C640 71.6 568.4 0 480 0c-32.1 0-61.9 9.4-87 25.7c-7.9 5.2-8.5 16.2-1.8 22.9L591.4 248.8c6.7 6.7 17.8 6.2 22.9-1.8zM567 294.3c7.9-5.2 8.5-16.2 1.8-22.9L368.6 71.2c-6.7-6.7-17.8-6.2-22.9 1.8c-16.3 25-25.7 54.9-25.7 87c0 88.4 71.6 160 160 160c32.1 0 61.9-9.4 87-25.7zM301.5 368H18.5c-9.5 0-16.9 8.2-15 17.5C18.9 457.8 83.1 512 160 512s141.1-54.2 156.5-126.5c2-9.3-5.5-17.5-15-17.5zm0-32c9.5 0 16.9-8.2 15-17.5C301.1 246.2 236.9 192 160 192S18.9 246.2 3.5 318.5c-2 9.3 5.5 17.5 15 17.5H301.5z"/>
</svg>
  </symbol>
  <symbol id="chatbot" viewBox="0 0 16 16">
  <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512">
	<path d="M256 448c141.4 0 256-93.1 256-208S397.4 32 256 32S0 125.1 0 240c0 45.1 17.7 86.8 47.7 120.9c-1.9 24.5-11.4 46.3-21.4 62.9c-5.5 9.2-11.1 16.6-15.2 21.6c-2.1 2.5-3.7 4.4-4.9 5.7c-.6 .6-1 1.1-1.3 1.4l-.3 .3 0 0 0 0 0 0 0 0c-4.6 4.6-5.9 11.4-3.4 17.4c2.5 6 8.3 9.9 14.8 9.9c28.7 0 57.6-8.9 81.6-19.3c22.9-10 42.4-21.9 54.3-30.6c31.8 11.5 67 17.9 104.1 17.9zM224 160c0-8.8 7.2-16 16-16h32c8.8 0 16 7.2 16 16v48h48c8.8 0 16 7.2 16 16v32c0 8.8-7.2 16-16 16H288v48c0 8.8-7.2 16-16 16H240c-8.8 0-16-7.2-16-16V272H176c-8.8 0-16-7.2-16-16V224c0-8.8 7.2-16 16-16h48V160z"/></svg></symbol>
  
  <symbol id="people-circle" viewBox="0 0 16 16">
    <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
    <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
  </symbol>
  
</svg>

<%-- 여기 위에는 사이드바 쪽 마크 --%>


<%-- "nav-link active" 각각의 페이지 --%>
<main class="d-flex flex-nowrap">

  
  
  <div class="flex-shrink-0 p-3" style="width: 280px;">
  <a href="/hos/roh" class="d-flex align-items-center pb-3 mb-3 link-body-emphasis text-decoration-none border-bottom">
      <svg class="bi pe-none me-2" width="30" height="24"><use xlink:href="#home"/></svg>
      <span class="fs-5 fw-semibold">아파!어디가?</span>
    </a>
  <ul class="list-unstyled ps-0">
		 <li class="mb-1">
        	<button class="btn btn-toggle d-inline-flex align-center rounder border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#hospital-collapse" aria-expanded="true">			<%-- 여기에 이동할 페이지 경로를 걸어두면 됨 --%>
        	<svg class="bi pe-none me-2" width="30" height="24"><use xlink:href="#hospital"/></svg>
        		<span class="fs-5 fw-semibold">병원검색</span>
        	</button>
        		<div class="collapse show" id="#hospital-collapse">
        			<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
        				<li><a href="/hos/hosselect" class="link-body-emphasis d-inline-flex text-decoration-none rounded">병원이름으로 검색</a>
        				<li><a href="/hos/addressselect" class="link-body-emphasis d-inline-flex text-decoration-none rounded">시도구와진료과로 검색</a>
        				<li><a href="/hos/GPSselect" class="link-body-emphasis d-inline-flex text-decoration-none rounded">본인기준 주변진료과 검색</a>
        				<li><a href="/hos/selectHos" class="link-body-emphasis d-inline-flex text-decoration-none rounded">증상으로 병원검색</a>
        			</ul>
        		</div>
      	</li>
      	<li class="mb-1">
        	<button class="btn btn-toggle d-inline-flex align-center rounder border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#pharmacy-collapse" aria-expanded="false">			<%-- 여기에 이동할 페이지 경로를 걸어두면 됨 --%>
        	<svg class="bi pe-none me-2" width="30" height="24"><use xlink:href="#pharmacy"/></svg>
        		<span class="fs-5 fw-semibold">약국검색</span>
        	</button>
        		<div class="collapse show" id="#pharmacy-collapse">
        			<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
        				<li><a href="/hos/hosselect" class="link-body-emphasis d-inline-flex text-decoration-none rounded">병원이름으로 검색</a>
        				<li><a href="/hos/addressselect" class="link-body-emphasis d-inline-flex text-decoration-none rounded">시도구와진료과로 검색</a>
        				<li><a href="/hos/GPSselect" class="link-body-emphasis d-inline-flex text-decoration-none rounded">본인기준 주변진료과 검색</a>
        				<li><a href="/hos/selectHos" class="link-body-emphasis d-inline-flex text-decoration-none rounded">증상으로 병원검색</a>
        			</ul>
        		</div>
      	</li>
      	<li class="mb-1">
        	<button class="btn btn-toggle d-inline-flex align-center rounder border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#medicine-collapse" aria-expanded="false">			<%-- 여기에 이동할 페이지 경로를 걸어두면 됨 --%>
        	<svg class="bi pe-none me-2" width="30" height="24"><use xlink:href="#medicine"/></svg>
        		<span class="fs-5 fw-semibold">약정보검색</span>
        	</button>
        		<div class="collapse show" id="#pharmacy-collapse">
        			<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
        				<li><a href="/hos/hosselect" class="link-body-emphasis d-inline-flex text-decoration-none rounded">병원이름으로 검색</a>
        				<li><a href="/hos/addressselect" class="link-body-emphasis d-inline-flex text-decoration-none rounded">시도구와진료과로 검색</a>
        				<li><a href="/hos/GPSselect" class="link-body-emphasis d-inline-flex text-decoration-none rounded">본인기준 주변진료과 검색</a>
        				<li><a href="/hos/selectHos" class="link-body-emphasis d-inline-flex text-decoration-none rounded">증상으로 병원검색</a>
        			</ul>
        		</div>
      	</li>
      	<li class="mb-1">
        	<button class="btn btn-toggle d-inline-flex align-center rounder border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#chatbot-collapse" aria-expanded="false">			<%-- 여기에 이동할 페이지 경로를 걸어두면 됨 --%>
        	<svg class="bi pe-none me-2" width="30" height="24"><use xlink:href="#chatbot"/></svg>
        		<span class="fs-5 fw-semibold">챗봇에게묻기</span>
        	</button>
        		<div class="collapse show" id="#pharmacy-collapse">
        			<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
        				<li><a href="/hos/hosselect" class="link-body-emphasis d-inline-flex text-decoration-none rounded">병원이름으로 검색</a>
        				<li><a href="/hos/addressselect" class="link-body-emphasis d-inline-flex text-decoration-none rounded">시도구와진료과로 검색</a>
        				<li><a href="/hos/GPSselect" class="link-body-emphasis d-inline-flex text-decoration-none rounded">본인기준 주변진료과 검색</a>
        				<li><a href="/hos/selectHos" class="link-body-emphasis d-inline-flex text-decoration-none rounded">증상으로 병원검색</a>
        			</ul>
        		</div>
      	</li>
     </ul>
  </div>  
</main>