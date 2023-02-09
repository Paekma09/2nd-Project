<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
<%@ include file="./header.jsp" %>
	<form action="/Reviewboard/update" method="post">
		<input type="hidden" name="review_no" value="${dto.review_no }">
		<table border="1">
			<tr>
				<th>제 목</th>
				<td><input type="text" name="review_title" value="${dto.review_title }"></td>
			</tr>
			<tr>
				<th>유튜브 URL</th>
				<td><textarea rows="10" cols="40" name="review_path">${dto.review_path }</textarea></td>
			</tr>
			<tr>
				<th>내 용</th>
				<td><textarea rows="10" cols="40" name="review_content">${dto.review_content }</textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정">
					<input type="button" value="목록" onclick="location.href='/Reviewboard/list'">
				</td>
			</tr>
		</table>
	</form>
	
<%-- <%@ include file="./footer.jsp" %>--%>	

</body>
</html>