<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>



<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">

<script type="text/javascript">
	var w;
	function popupopen() {
		w = window.open('/PaidServiceboard/popup', 'window_name',
				'width=800,height=500,location=no,status=no,scrollbars=yes');
		
		
	}
		
		var w3;
		function popup3open() {
			w3 = window.open('/PaidServiceboard/popup3', 'window_name',
					'width=300,height=500,location=no,status=no,scrollbars=yes');


	}
</script>

</head>
<!-- <body style="background-color: #020204"> -->
<body>
	<%@ include file="./header.jsp"%>
	
	<header class="bg-primary bg-gradient text-white"
		style="background-color: #b51f38 !important">
		<div class="container mt-2 pt-1 text-center">
			<h1 class="fw-bolder">유료 서비스</h1>
			<p class="lead">결제 관련 안내</p>
		</div>
	</header>

	<div class="container"
		style="background-color: white; height: 500px;">
		
		<div class="row">
			<div class="col mt-5 text-center"
				style="background-color: #ffcfd7; width: 550px; height: 400px; float: left;">
	
				<h1 style="margin-top: 13%;">아티스트 계정</h1>
				<h5>오디션 합격자 정보 통계 자료 제공</h5>
				<h6>-합격자 키 정보</h6>
				<h6>-합격자 체형 정보</h6>
				<h6>-합격자 키워드 정보</h6>
			
				<button id="popup" onclick="popupopen();">무통장 입금 계좌 안내</button>
				<br>
				<br>
				<button id="popup3" onclick="popup3open();" style="border:0; background-color: #ffeb00;"><img  src="/resources/img/kakaopaylogo.png" width="80px"></button>
	
			</div>
	
			<div class="col mt-5 text-center"
				style="background-color: #ffcfd7; width: 550px; height: 400px; float: left;">
	
				<h1 style="margin-top: 25%;">컴퍼니 계정</h1>
				<h5>오디션 및 컴퍼니 상단 배너 광고</h5>
				<button
					onclick="window.open('/PaidServiceboard/popup2','window_name','width=700,height=500,location=no,status=no,scrollbars=yes');">광고
					문의 안내</button>
	
			</div>
		</div>

		<div class="col" style="color : white;">
			<label>환불 취소는 고객센터로
			문의 바랍니다.</label>
		</div>
		
		<h5 class="col-12 mt-5 text-center"
			style="background-color: white; margin-top: 25%;">환불 취소는 고객센터로
			문의 바랍니다.</h5>
		<h6 class="col-12 text-center" style="background-color: white;">010-1111-1111</h6>


	</div>




	<%@ include file="./footer.jsp"%>
</body>
</html>