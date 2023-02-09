<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
   
<!doctype html>
<html lang="kor">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <style type="text/css">
       body{
           background-color: white;
           padding-top:70px
       }
     </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  </head>
  
  

  <body >
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background-color: #020204;" >
        <div class="container-fluid collapse navbar-collapse" id="navbarNav">
            <div class="mx-auto justify-content-center">
             
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
                <ul class="navbar-nav">
                    <a class="navbar-brand" href="/audition/list"><img src="/resources/img/logo_header.png" width="50px"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                  <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/audition/list">오디션&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/Statisticsboard/list">통계(유료)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link active"aria-current="page" href="/Reviewboard/list">후기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/PaidServiceboard/list">유료서비스안내</a>
                  </li>
                </ul>
            </div>
                <div class="dropdown ">
                    <button class="btn dropdown-toggle" style="background-color: #020204;" type="button" data-bs-toggle="dropdown" aria-expanded="false"><img src="/resources/img/mypage.png" width="30px">
                    </button>
                    <ul class="dropdown-menu dropdown-menu-lg-end">
                      <li><button class="dropdown-item" type="button" onclick="location.href='/port/list'">포트폴리오</button></li>
                      <li><button class="dropdown-item" type="button" onclick="location.href='/audition/artManagementform';">오디션 관리</button></li>
                      <li><button class="dropdown-item" type="button" onclick="location.href='/audition/comManagementform';">오디션 관리</button></li>
                      <li><button class="dropdown-item" type="button" onclick="location.href='/message/box';">쪽지</button></li>
                      <li><button class="dropdown-item" type="button" onclick="location.href='/Statisticsboard/list'">유료서비스</button></li>
                      <li><button class="dropdown-item" type="button">고객센터</button></li>
                    </ul>
                </div>
        </div>
        </nav>
        
        

       

    
  </body>
</html>