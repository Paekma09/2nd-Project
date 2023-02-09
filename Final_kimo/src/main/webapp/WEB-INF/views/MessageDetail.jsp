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
    <title>MessageDetail</title>
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

<div class="col-5">
 	<div class="col">
          <label for="id" class="form-label">보낸 사람</label>
           <input type="text" class="form-control" name="audition_title" maxlength="20" disabled="disabled" value="${dto.message_send }" > 
     </div>
     <div class="col">
          <label for="id" class="form-label">제목</label>
           <input type="text" class="form-control" name="audition_title" maxlength="20" disabled="disabled" value="${dto.message_title }" > 
     </div>
     <div class="col">
          <label for="id" class="form-label">내용</label>
          <textarea class="form-control" rows="15" name="audition_detail" required disabled="disabled">${dto.message_content }</textarea>
     </div>
     <div class="col">
          <label for="id" class="form-label">발송일</label>
           <input type="text" class="form-control" name="audition_title" maxlength="20" disabled="disabled" value="${dto.message_date }" > 
     </div>
     <tr>
			<td colspand="2">
				<input type="button" value="답장" onclick="location.href='/message/sendform?member_id=${dto.message_send}'">
				<input type="button" value="삭제" onclick="location.href='/message/delete?message_no=${dto.message_no}'">
				<input type="button" value="목록" onclick="location.href='/message/box'">
			</td>
		</tr>
</div>

		<div class="col">
		</div>
	</div>
</div>


<%@ include file="./footer.jsp" %>
</body>






</html>