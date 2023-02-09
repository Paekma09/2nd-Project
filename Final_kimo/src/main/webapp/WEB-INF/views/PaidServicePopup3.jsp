<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>



<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
	
	<script type="text/javascript">
	 window.addEventListener('beforeunload', function() {
		        console.log("결제 성공");    
		        document.getElementById('popup3').submit();
		    });
	 function yap3(){
		 document.getElementById('popup3').submit();
	 }
	</script>
	
</head>
<body>
	<div margin-top: 18%;" class="text-center">
		<img alt="qr" src="/resources/img/qr.png" width="300px">
	</div>
	</br>

<button type="button" onclick="yap3()" style="position : relative; left:35%;">결제 완료</button>
<form method="post" action="/PaidServiceboard/paymentkakao" id="popup3">


</form>

</body>
</html>