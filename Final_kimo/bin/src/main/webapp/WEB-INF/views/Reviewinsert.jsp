<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- CSS only -->

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
	
</head>
<body style="background-color: #020204">
<%@ include file="./header.jsp" %>

	<header class="bg-primary bg-gradient text-white"
		style="background-color: #b51f38 !important">
		<div class="container mt-5 pt-5 text-center">
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