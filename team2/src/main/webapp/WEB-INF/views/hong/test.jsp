<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" class="chrome mel-js s12 s1 mobile">
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" /> 
<style>
      .offcanvas{
       --bs-offcanvas-zindex: 1045;
       --bs-offcanvas-width: 220px;
       --bs-offcanvas-height: 30vh;
       --bs-offcanvas-padding-x: 1rem;
       --bs-offcanvas-padding-y: 1rem;
       --bs-offcanvas-color: var(--bs-body-color);
       --bs-offcanvas-bg: var(--bs-body-bg);
       --bs-offcanvas-border-width: var(--bs-border-width);
       --bs-offcanvas-border-color: var(--bs-border-color-translucent);
       --bs-offcanvas-box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0...
       
             .MuiAvatar-img{
         width: 35px; /* 필요한 크기에 맞게 조정해주세요 */
          height: 35px;
          border-radius: 50%;
          overflow: hidden; /* 이 속성으로 넘치는 내용을 가리게 됩니다 */
          position: absolute;
          top: 20px;
          right: 20px;
      }
</style>
            <a class="btn btn-primary2" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" aria-controls="offcanvasExample"><i class="fa-solid fa-bars" style="color: #000000;"></i></a>
         <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
           <div class="offcanvas-header">
             <h5 class="offcanvas-title" id="offcanvasExampleLabel">아파:어디가?</h5>
             <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
           </div>
           <div>
              <hr style="margin-top: 10px; margin-bottom: 10px; border-color: black;">
           </div>
           <div class="offcanvas2-body">
             <div class="dropdown mt-3">
               <ul class="nav flex-column">
                 <li class="nav-item">
                   <a class="nav-link active" aria-current="page" href="/hos/choo/selectHos">병원지도</a>
                 </li>
                 <li class="nav-item">
                   <a class="nav-link" href="/hos/roh/pharmacyMap">약국지도</a>
                 </li>
                 <li class="nav-item">
                   <a class="nav-link" href="/hos/kim/symptom">부위별 증상 찾기</a>
                 </li>
                 <li class="nav-item">
                   <a class="nav-link" href="/hos/hong/search">약품정보</a>
                 </li>                  
               </ul>
               <div>
                  <hr style="margin-top: 10px; margin-bottom: 10px; border-color: black;">
               </div>
               <ul class = "nav flex-column">
                  <li>
                     <a class = "nav-link active" aria-current="page" href="/hos/choo/addressselect">병원찾기</a>                  
                  </li>
               </ul>
               <div>
                  <hr style="margin-top: 10px; margin-bottom: 10px; border-color: black;">
               </div>
               <ul class = "nav flex-column">
                  <li>
                     <a class = "nav-link active" aria-current="page" href="/hos/choo/gesipanmain">고객센터</a>                  
                  </li>
               </ul>                              
             </div>
           </div>
         </div>
            <a class="loginButton" href="#">
              <img alt="Cindy Baker2" src="//image.medigate.net/static/mobile/ver_3/images/icon_profilethumb.gif" class="MuiAvatar-img">
            </a>
            
            <div id="loginModal" class="modal">
              <div class="modal-dialog">
                <div class="contwrap modal-content">
                  <c:if test="${sessionScope.sid == null && sessionScope.knick == null}">
                    <button id="closeLoginModal" class="close-button">×</button>
                    <form action="/hos/roh/signinPro">
                      <div class="profilearea login">
                        <p class="input_row txt" style="color: rgb(26, 26, 26);">아파, 어디가?</p>
                        <div class="input_row">
                          <input type="text" id="id" name="id" placeholder="아이디" class="form-control" value="">
                        </div>
                        <div class="input_row">
                          <input type="password" id="pw" name="pw" placeholder="비밀번호" class="form-control" value="">
                        </div>
                        <button type="submit" class="mdc-button mdc-button--raised select left">로그인</button>
                        <button type="button" id="kakao-login-btn">카카오 로그인</button>
                        <div class="gridcontainer signin_options">
                          <div class="input_row padding-10px">
                          </div>
                          <div class="input_row pc padding-10px border-top-1px">
                            <a class="forgotid" href="/hos/roh/findMyIdForm" target="_blank" style="color: rgb(26, 26, 26); font-size: 12px;">아이디 찾기</a>
                            <a class="forgotpassword" href="/hos/roh/findMyPwForm" style="color: rgb(26, 26, 26); font-size: 12px;">비밀번호 찾기</a>
                            <a class="join" href="/hos/roh/signupForm" style="font-size: 12px;">회원 가입</a>
                          </div>
                          <div class="input_row mobile padding-10px border-top-1px">
                          </div>
                        </div>
                      </div>
                    </form>
                  </c:if>
                  <div id="myInfoForm" class="profilearea">
                      <p class="input_row txt" style="color: rgb(26, 26, 26);">환영합니다, ${knick}님!</p>
                      <a href="/hos/roh/myProfileForm">내 프로필</a>
                      <a href="/hos/kim/main">로그아웃</a>
                  </div>
                  <c:if test="${logout}">
                     <script>
                        alert("로그아웃 되었습니다");
                        // 새로고침 할 때 마다 또 로그아웃 되는것을 방지
                        window.location.href = '/hos/roh/';
                     </script>
                  </c:if>
                </div>
              </div>
            </div>
         <div id="modalOverlay" class = "overlay"></div>
         
         <script>
  document.addEventListener("DOMContentLoaded", function () {
    var loginButton = document.querySelector(".loginButton");
    var loginModal = document.getElementById("loginModal");
    var modalOverlay = document.getElementById("modalOverlay");
    var closeLoginModalButton = document.getElementById("closeLoginModal");
    var myInfoForm = document.getElementById("myInfoForm");
   
    loginButton.addEventListener("click", function (event) {
      event.preventDefault();
      loginModal.style.display = "block";
      modalOverlay.style.display = "block";
      toggleForms(); // 폼 전환 함수 호출
    });

    modalOverlay.addEventListener("click", function () {
      loginModal.style.display = "none";
      modalOverlay.style.display = "none";
    });

    closeLoginModalButton.addEventListener("click", function () {
      loginModal.style.display = "none";
      modalOverlay.style.display = "none";
    });

    // 페이지 로딩 시 폼 전환 함수 호출
    toggleForms();
  });

  function toggleForms() {
     var loginButton = document.querySelector(".loginButton");
     var myInfoForm = document.getElementById("myInfoForm");
     var sessionSid = "${sessionScope.sid}";
     var sessionKnick = "${sessionScope.knick}";

     if (sessionSid || sessionKnick) {
       loginButton.style.display = "none"; // 세션이 있을 때 로그인 버튼 숨기기
       myInfoForm.style.display = "block"; // 세션이 있을 때 로그인 후 버튼 보이기
     } else {
       loginButton.style.display = "block"; // 세션이 없을 때 로그인 버튼 보이기
       myInfoForm.style.display = "none"; // 세션이 없을 때 로그인 후 버튼 숨기기
     }
   }

</script>
         