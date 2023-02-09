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
    <title>MessageSendForm</title>
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

<div class="container-fluid">
	<div class="row">
		<div class="col">
		</div>

<form action="/message/send">
<input type="hidden" name="message_no" value="${dto.message_no}">

<div class="col">
          <label for="id" class="form-label">제목</label>
          <input type="text" class="form-control" name="message_title" maxlength="20">
</div>

<div class="col">
          <label for="id" class="form-label">상세설명</label>
          <textarea class="form-control" rows="15" name="message_content"
			placeholder="메세지 내용을 입력해주세요" required></textarea>
</div>

<button type="submit" class="btn btn-primary" >발송</button>
<button type="button" class="btn btn-primary" onclick="location.href='/audition/list'">목록</button>

</form>

		<div class="col">
		</div>
	</div>
</div>

		<div class="col">
		</div>
	</div>
</div>


<%@ include file="./footer.jsp" %>
</body>






</html>