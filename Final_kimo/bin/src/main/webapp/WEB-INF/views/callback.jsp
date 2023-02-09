<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<% request.setCharacterEncoding("UTF-8"); 
String member_id = request.getParameter("member_id");
String member_name = request.getParameter("member_name");
String member_email = request.getParameter("member_email");
%>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
var naverLogin = new naver.LoginWithNaverId({
    clientId: "O4I9Cy4WZ65PITCoIl8Q",
    callbackUrl: "http://localhost:8787/callback",
    isPopup: true,
  });

naverLogin.init();

window.addEventListener('load', function () {    
    naverLogin.getLoginStatus(function (status) {
        if (status) {
          console.log(naverLogin.accessToken.accessToken)
          var member_email = naverLogin.user.getEmail();
          var member_name = naverLogin.user.getName();
          var member_id = naverLogin.user.getId();
          console.log(member_email)
          
            $.ajax({
            type: "POST",
            url: "/member/checkid",
            contentType: "text/plain",
            data: member_id,
            success: function (response) {
                if (response == "이미 사용중인 아이디입니다.") {
                  post_to_url("/audition/list", {'member_id':member_id,'member_name':member_name,'member_email':member_email})
                } else {
                  alert("끼모 사이트에 가입되어 있지 않습니다.")
                  post_to_url("/member/signupform", {'member_id':member_id,'member_name':member_name,'member_email':member_email})
                }
              }
            });
          
        } else {
          console.log("callback 처리에 실패하였습니다.");
        }
      });
    });
    
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
</script>
</body>
</html>