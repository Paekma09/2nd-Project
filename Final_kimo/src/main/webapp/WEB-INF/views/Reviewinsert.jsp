<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- CSS only -->

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
	
</head>
<body>
<%@ include file="./header.jsp" %>

	<header class="bg-primary bg-gradient text-white"
		style="background-color: #b51f38 !important">
		<div class="container mt-5 pt-4 text-center">
			<p class="lead">글 쓰기 상세 페이지</p>
		</div>
	</header>

	<form action="/Reviewboard/insert" method="post">
		<table border="1" class="container col-7 mt-2"
			style="background-color: white" class="table">
			
			<colgroup>
		<col width="200px" />
		<col width="500px" />
		</colgroup>
			
			<tr>
				<th style="text-align: center;">제 목</th>
				<td><input style="width:60%" type="text" name="review_title"></td>
			</tr>
			<tr>
				<th style="text-align: center;">참 고 영 상 U R L</th>
				<td><textarea rows="5" style="width:60%" name="review_path"></textarea></td>
			</tr>
			<tr>
				<th style="text-align: center;">내 용</th>
				<td><textarea rows="30" style="width:60%" name="review_content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input type="submit" value="작성">
					<input type="button" value="목록"
					onclick="location.href='/Reviewboard/list'">
		</table>

	</form>

<%-- <%@ include file="./footer.jsp" %>--%>	
</body>
</html>