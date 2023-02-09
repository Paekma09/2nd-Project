<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="kor">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>auditionApply</title>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  </head>
<body>

<%@ include file="./header.jsp" %>

<div class="container-fluid text-center">
	<div class="row">
		<div class="col">
		</div>
		
<div class="col" >

<form action='/audition/apply' method="post">
<input type="hidden" name="member_id" value="아티스트1">
<input type="hidden" name="audition_no" value="${dto.audition_no }">

	<div class="dropdown">
			<br><br>
	  			<select name='port_title'>
	  						<option value="">포트폴리오를 선택해주세요!</option>
			  		<c:forEach items="${pdto }" var="pdto">		
			 		 		<option value="${pdto.port_title }">${pdto.port_title }</option>
			 		 </c:forEach>
				</select>
	</div>
<br>
<input type='submit' value="지원">
</form>

</div>

		<div class="col">
		</div>
	</div>
</div>




<%@ include file="./footer.jsp" %>

</body>
</html>