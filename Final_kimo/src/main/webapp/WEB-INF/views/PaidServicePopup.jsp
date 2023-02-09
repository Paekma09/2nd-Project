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
	
	
	
</head>
<body>
	<div margin-top: 18%;" class="text-center">
		저희 (주)KKIMO끼모는 무통장 입금을 통한 결제방법을 제공하고 있습니다. </br> </br> 무통장 입금 결제 시 상품의 구매 대금은
		인터넷 뱅킹, </br> 텔레뱅킹 혹은 가까운 은행에서 직접 입금하시면 됩니다. </br> </br> =무통장 입금 가능 은행= </br> -국민은행 /
		1234-56-7-8912-345 KKIMO끼모(주) </br> (무통장 입금시의 송금자 이름은 주문 시 입력하신 입금자의 이름과
		일치해야 합니다.) </br>
	</div>
</br>
<button type="button" onclick="yap()" style="position : relative; left:44%;">결제 완료</button>
 <form method="post" action="/PaidServiceboard/payment" id="popup">


</form> 
<script type="text/javascript">
	
	
	 function yap(){
		 
		 document.getElementById('popup').submit();
		
		 
		
	 }
	</script>
</body>
</html>