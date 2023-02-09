<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html lang="kor">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>auditionDetail</title>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  </head>
<body>

<%@ include file="./header.jsp" %>


<div class="container-fluid">
	<input type="hidden" name="member_id" value=${dto.member_id }>
	
<div class="row">

	<div class="col-2">
	<div class="dropdown" >
		<br><br>
  		<select name="audition_employ">
 		 <option value="">${dto.audition_employ }</option>
		</select>
	</div>
	<br><br><br><br>
	<div class="dropdown">
		<select name="audition_job">
 		 <option value="">${dto.audition_job }</option>
		</select>
	</div>
	</div>
	
	<div class="col-5">
	 <div class="col">
          <label for="id" class="form-label">오디션 제목</label>
           <input type="text" class="form-control" name="audition_title" maxlength="20" disabled="disabled" value="${dto.audition_title }" > 
     </div>
     <div class="col">
          <label for="id" class="form-label">감독/소속사</label>
          <input type="text" class="form-control" name="audition_director" maxlength="20" disabled="disabled" value="${dto.audition_director }">
     </div>
     <div class="col">
          <label for="id" class="form-label">제작사</label>
          <input type="text" class="form-control" name="audition_company" maxlength="20" disabled="disabled" value="${dto.audition_company }">
     </div>
     <div class="col">
          <label for="id" class="form-label">제작 유형</label>
          <input type="text" class="form-control" name="audition_type" maxlength="20"  disabled="disabled" value="${dto.audition_type }">
     </div>
     <div class="col">
          <label for="id" class="form-label">촬영 장소</label>
           <input type="text" class="form-control" name="audition_location" maxlength="20"disabled="disabled" value="${dto.audition_location }">
     </div>
     <div class="col">
          <label for="id" class="form-label">페이</label>
          <input type="text" class="form-control" name="audition_pay" maxlength="20" disabled="disabled" value="${dto.audition_pay }">
     </div>
     <div class="col">
          <label for="id" class="form-label">상세설명</label>
          <textarea class="form-control" rows="10" name="audition_detail" required disabled="disabled">${dto.audition_detail }</textarea>
     </div>
     <div class="col">
          <label for="id" class="form-label">담당자 연락처</label>
          <input type="text" class="form-control" name="audition_phone" maxlength="20" disabled="disabled" value="${dto.audition_phone }" >
     </div>
     </div>
     
	 <div class="col-5">
	    <label for="id" class="form-label">촬영 기간</label>
         <input type="text" class="form-control" name="audition_date" maxlength="20" disabled="disabled" value="${dto.audition_date }">
      	<br>
	 	<label for="id" class="form-label">접수 시작 : </label>
		 <input type="date" name="audition_start"
      		 min="2018-01-01" max="2023-12-31" disabled="disabled" value="${dto.audition_start }">
	 	<label for="id" class="form-label">접수 마감 : </label>
		 <input type="date"  name="audition_end"
      		 min="2018-01-01" max="2023-12-31" disabled="disabled" value="${dto.audition_end }">
      	<br><br>
      	<img id="preview_photo" width="300">
      	  	<script>
      	  		const fileInput = document.getElementById("photo_upload");

      	 		 const handleFiles = (e) => {
      	  			const selectedFile = [...fileInput.files];
      	  			const fileReader = new FileReader();

      	  			fileReader.readAsDataURL(selectedFile[0]);

      	  			fileReader.onload = function () {
      	    			document.getElementById("preview_photo").src = fileReader.result;
      	  			};
      	 		 };

      	 		 fileInput.addEventListener("change", handleFiles);      	  	
      	  	
      	  	</script>
	 
<button type="submit" class="btn btn-primary">찜하기♡</button>
<button type="submit" class="btn btn-primary" onclick="location.href='/audition/updateform?audition_no=${dto.audition_no}'">수정</button>
<button type="submit" class="btn btn-primary" onclick="location.href='/audition/delete?audition_no=${dto.audition_no}'">삭제</button>
<button type="button" class="btn btn-primary" onclick="location.href='/audition/list'">목록</button>
</div>

</div>

</div>

<%@ include file="./footer.jsp" %>

</body>
</html>