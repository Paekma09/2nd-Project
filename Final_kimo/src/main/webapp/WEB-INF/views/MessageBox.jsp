<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kor">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>MessageBox</title>
   <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
  </head>
<body>

<%@ include file="./header.jsp" %>

<div class="container-fluid text-center">
	<div class="row">
		<div class="col">
		</div>


<div class="col-9" id="ListAjax">
		<table class="table" id="auditionContent">
		<thead>
			<tr>
				<th>상태</th>
				<th>보낸 사람</th>
				<th>쪽지 제목</th>
				<th>보낸 날짜</th> 
			</tr>
		</thead>
	
		<tbody>
<div>
	<c:choose>
		<c:when test="${empty list}">
			<tr>
				<td colspan="4">----받은 쪽지가 없습니다----</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${list}" var="dto">
				<tr>
					<td>임시</td>
					<td>${dto.message_send }</td>
					<td><a href="/message/detail?message_no=${dto.message_no}">${dto.message_title }</td>
					<td>${dto.message_date }</td>
					
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>	
</div>	
		</tbody>
		
	</table>
	
</div>
	
		<div class="col">
		</div>
	</div>
</div>


<%@ include file="./footer.jsp" %>
</body>



</html>