<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>끼모</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	<script src="https://accounts.google.com/gsi/client" async defer></script>
  <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script src="https://unpkg.com/jwt-decode/build/jwt-decode.js"></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <style type="text/css">
        header {
            background-color: #020204;
            color: white;
        }
        .btn-login {
            background-color: #B51F38;
            color: white;
            font-size: 0.9rem;
            letter-spacing: 0.05rem;
            padding: 0.75rem 1rem;
        }
        .btn-login:hover {
            background-color: #4f5b6a;
            color: white;
            font-size: 0.9rem;
            letter-spacing: 0.05rem;
            padding: 0.75rem 1rem;
        }
        .btn-google {
            color: white;
            background-color: #4285F4;
            padding-top: 0px;
            padding-left: 0px;
            padding-bottom: 0px;
            padding-right: 0px;
        }
        .btn-kakao {
            color: #000000 85%;
            background-color: #FEE500;
        }
        .btn-kakao:hover {
            color: #000000 85%;
            background-color: #e4ce00;
        }
        .btn-naver {
            color: white;
            background-color: #2DB400;
        }
        .btn-naver:hover {
            color: white;
            background-color: #28a200;
        }
        a:link {
          color : #4f5b6a;
        }
        a:visited {
          color : #020204;
        }
        a:hover {
          color : #B51F38;
        }
        a:active {
          color : #475D2e;
        }      
    </style>
  </head>
  <body>
    <header>
        <div class="container-fluid text-center">
            <div class="row">
                <div class="col-12" style="margin-top: 30px;">
                    <a href="#"><img src="/resources/img/logo_header.png" width="8%"></a>
                </div>
            </div>
        </div>
    </header>
    	
        <div class="container-fluid">
            <div class="row">
                <div class="col-12 mx-auto" style="padding-top: 30px; background-color: #020204;">
                    <div class="position-relative"><img src="/resources/img/back.jpg" width="100%" style="opacity: 0.3;"></div>                    
                      <div class="col-md-3 m-auto position-absolute top-50 start-50 translate-middle">
                        <div class="card card-body border-0 shadow-lg rounded-3 my-5">
                          <h1 class="text-center mb-3 fw-bolder" style="color: #4f5b6a;"><i class="fas fa-sign-in-alt"></i>LOGIN</h1>
                          <form action="/member/login" method="post">
                          	<c:if test="${param.error != null }">
                              <div class="alert alert-danger">
                              	사용자 ID 또는 비밀번호를 확인해 주세요.
                              </div>
                            </c:if>
                            <div class="form-group">
                              <label for="id" class="fw-bolder" style="color: #4f5b6a;">ID</label>
                              <input type="text" id="id" name="memberId" class="form-control">
                            </div>
                            <br>
                            <div class="form-group">
                              <label for="password" class="fw-bolder" style="color: #4f5b6a;">Password</label>
                              <input type="password" id="password" name="memberPassword" class="form-control">
                            </div>
                            <br>
                            <div class="d-grid gap-2 col-6 mx-auto">
                              <button class="btn btn-block btn-login" type="submit">로그인</button>
                              <div id="naverIdLogin">
                                <a id="naverIdLogin_loginButton" href="javascript:void(0)"><img src="https://static.nid.naver.com/oauth/big_g.PNG?version=js-2.0.0" width="100%" height="auto" style="max-width:400px;max-height:60px"/></a>
                              </div>
                              <!-- <button class="btn btn-naver" type="button" ><span style="font-size: 120%; font-weight: bolder;" id="naverLogin">N</span>&emsp;네이버 로그인</button> -->
                              <a id="custom-login-btn" href="javascript:loginWithKakao()"><img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" width="222" /></a>
                              <!-- <button class="btn btn-kakao" type="submit"><img src="/resources/img/kakao symbol.png" width="14%"/>&emsp;카카오 로그인</button> -->
                              <a href="javascript:onSignIn()"><img src="/resources/img/btn_google.png" style="object-fit: contain;" width="222px"/></a>
                              <!-- <button class="btn btn-google" type="button"  ><img src="/resources/img/btn_google.png" style="object-fit: contain;" width="100%" onclick="onSignIn()" /></button> -->
                            </div>
                          </form>
                          <p class="text-center mt-3"><a href="" onclick="" style="text-decoration: none;">【ID 찾기】</a> · <a href="" onclick="" style="text-decoration: none;">【Password 찾기】</a></p>
                          <div class="d-grid gap-2 col-6 mx-auto">
                            <button class="btn btn-block btn-login" type="button" onclick="location.href='/member/join'">회원가입</button>
                          </div>
                      </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid">
          <div class="row">
            <div class="col-12 mx-auto" style="background-color: #020204;">
              <hr style="color: white;">
            </div>
          </div>
        </div>
        <div class="container-fluid" style="background-color: #020204;">
          <div class="container">
            <div class="row justify-content-center" style="color: white;">
              <div class="col-6" style="background-color: #020204;">
                <br><br><br><br>
                <h2>끼있는 사람들~ 모여라!!!</h2>
                <p>
                  연예인이 되고 싶다, 배우가 되고 싶다, 가수가 되고 싶다,<br>
                  끼있는 사람이라면 누구라도 참가해보세요~<br>
                  나만의 프로필 관리는 물론 여러 오디션 정보를 한눈에~~
                </p>
              </div>
              <div class="col-6" style="background-color: #020204;">
                <img src="/resources/img/img-1.jpg" class="w-75 rounded-3">
              </div>
            </div>
          </div>
        </div>
        <div class="container-fluid">
          <div class="row">
            <div class="col-12 mx-auto" style="background-color: #020204;">
              <hr style="color: white;">
            </div>
          </div>
        </div>
        <div class="container-fluid" style="background-color: #020204;">
          <div class="container">
            <div class="row justify-content-center" style="color: white;">
              <div class="col-6" style="background-color: #020204;">
                <img src="/resources/img/img-2.jpg" class="w-75 rounded-3">
              </div>
              <div class="col-6" style="background-color: #020204;">
                <br><br><br><br>
                <h2>끼있는 사람들~ 모여라!!!</h2>
                <p>
                  연예인이 되고 싶다, 배우가 되고 싶다, 가수가 되고 싶다,<br>
                  끼있는 사람이라면 누구라도 참가해보세요~<br>
                  나만의 프로필 관리는 물론 여러 오디션 정보를 한눈에~~
                </p>
              </div>
            </div>
          </div>
        </div>
        <div class="container-fluid">
          <div class="row">
            <div class="col-12 mx-auto" style="background-color: #020204;">
              <hr style="color: white;">
            </div>
          </div>
        </div>
        <div class="container-fluid" style="background-color: #020204;">
          <div class="container">
            <div class="row">
              <div class="col-md-6 mx-auto">
                <h1 style="text-align: center; color: white; margin-top: 50px; margin-bottom: 30px;"><b>자주묻는 질문</b></h1>
                <div class="accordion" id="accordionPanelsStayOpenExample">
                  <div class="accordion-item" style="background-color: #020204; color: white;">
                    <h2 class="accordion-header" id="panelsStayOpen-headingOne">
                      <button class="accordion-button" style="background-color: #020204; color: white;" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
                        Accordion Item #1
                      </button>
                    </h2>
                    <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
                      <div class="accordion-body">
                        <strong>This is the first item's accordion body.</strong> It is shown by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
                      </div>
                    </div>
                  </div>
                  <div class="accordion-item" style="background-color: #020204; color: white;">
                    <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
                      <button class="accordion-button collapsed" style="background-color: #020204; color: white;" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
                        Accordion Item #2
                      </button>
                    </h2>
                    <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
                      <div class="accordion-body">
                        <strong>This is the second item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
                      </div>
                    </div>
                  </div>
                  <div class="accordion-item" style="background-color: #020204; color: white;">
                    <h2 class="accordion-header" id="panelsStayOpen-headingThree">
                      <button class="accordion-button collapsed" style="background-color: #020204; color: white;" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
                        Accordion Item #3
                      </button>
                    </h2>
                    <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree">
                      <div class="accordion-body">
                        <strong>This is the third item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
                      </div>
                    </div>
                  </div>
                  <div class="accordion-item" style="background-color: #020204; color: white;">
                    <h2 class="accordion-header" id="panelsStayOpen-headingFour">
                      <button class="accordion-button collapsed" style="background-color: #020204; color: white;" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseFour" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
                        Accordion Item #4
                      </button>
                    </h2>
                    <div id="panelsStayOpen-collapseFour" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingFour">
                      <div class="accordion-body">
                        <strong>This is the third item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
                      </div>
                    </div>
                  </div>
                  <div class="accordion-item" style="background-color: #020204; color: white;">
                    <h2 class="accordion-header" id="panelsStayOpen-headingFive">
                      <button class="accordion-button collapsed" style="background-color: #020204; color: white;" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseFive" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
                        Accordion Item #5
                      </button>
                    </h2>
                    <div id="panelsStayOpen-collapseFive" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingFive">
                      <div class="accordion-body">
                        <strong>This is the third item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
                      </div>
                    </div>
                  </div>
                </div>
                <br><br><br><br><br>
              </div>
            </div>
          </div>
        </div>
        <footer class="pb-5" style="background-color: #020204;">
          <div class="container px-4 px-lg-5">
              <p class="m-0 text-center text-white">Copyright © Your Website 2022</p>
          </div>
        </footer>
      
    
    </body>
    <script type="text/javascript">
      function onSignIn() {
    		google.accounts.id.initialize({
    	        client_id: "723207102135-hch7aafbfc2566n58hpeim9l70v3mel9.apps.googleusercontent.com",
    	        callback: handleCredentialResponse
    	    });
    	    google.accounts.id.prompt();  
    	}
    	
    	function handleCredentialResponse(response) {
        var profile = jwt_decode(response.credential);
        member_id = profile.sub;
    		member_name = profile.name;
    		member_img = profile.picture;
    		member_email = profile.email;
    		
    		console.log(member_id);
    		console.log(member_name);
    		console.log(member_email);
    		
    		$.ajax({
                type: "POST",
                url: "/member/checkid",
                contentType: "text/plain",
                data: member_id,
                success: function (response) {
                    if (response == "이미 사용중인 아이디입니다.") {
                    	post_to_url("/audition/list", {'member_id':member_id,'member_name':member_name,'member_email':member_email,'member_img':member_img})
                    } else {
                    	alert("끼모 사이트에 가입되어 있지 않습니다.")
                      post_to_url("/member/signupform", {'member_id':member_id,'member_name':member_name,'member_email':member_email,'member_img':member_img})
                    }
                }
            });
    	}
    	
    	function post_to_url(url, params){
    		var form = document.createElement('form');
    		form.setAttribute('method', 'post');
    		form.setAttribute('action', url);
    		document.charset = "utf-8";
    		for(var key in params){
    				var hiddenField = document.createElement('input');
    				hiddenField.setAttribute('type', 'hidden');
    				hiddenField.setAttribute('name', key);
    				hiddenField.setAttribute('value', params[key]);
    				form.appendChild(hiddenField);
    		}
    		document.body.appendChild(form);
    		form.submit();
    	}

       var naverLogin = new naver.LoginWithNaverId({
        clientId: "O4I9Cy4WZ65PITCoIl8Q",
        callbackUrl: "http://localhost:8787/callback",
        isPopup: true,
      });

      naverLogin.init();

      Kakao.init('39330f3023501d9a8a3b7caf85ca98e2');
        console.log( Kakao.isInitialized() );

        function loginWithKakao() {
            Kakao.Auth.login({
                success: function (authObj) {
                    console.log(authObj);
                    Kakao.Auth.setAccessToken(authObj.access_token);

                    getInfo();
                },
                fail: function (err) {
                    console.log(err);
                }
            });
        }

        function getInfo() {
            Kakao.API.request({
                url: '/v2/user/me',
                success: function (res) {
                    console.log(res);
                    var member_email = res.kakao_account.email;
                    var member_name = res.kakao_account.profile.nickname;
                    var member_id = res.kakao_account.profile.nickname;
                    console.log(member_email, member_name);
                    $.ajax({
                    type: "POST",
                    url: "/member/checkemail",
                    contentType: "text/plain",
                    data: member_email,
                    success: function (response) {
                        if (response == "이미 사용중인 이메일입니다.") {
                          post_to_url("/audition/list", {'member_name':member_name,'member_email':member_email,'member_id':member_id})
                        } else {
                          alert("끼모 사이트에 가입되어 있지 않습니다.")
                          post_to_url("/member/signupform", {'member_name':member_name,'member_email':member_email,'member_id':member_id})
                        }
                    }
                });
                },
                fail: function (error) {
                    alert('카카오 로그인에 실패했습니다. 관리자에게 문의하세요.' + JSON.stringify(error));
                    post_to_url("/", {'member_name':member_name,'member_email':member_email,'member_id':member_id})
                }
            });
        }

      
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	  <script src="https://accounts.google.com/gsi/client" async defer></script>
  </body>
</html>