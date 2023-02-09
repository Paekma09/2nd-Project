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
    <title>auditionManageCom2</title>
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

<div class="col" id="ListAjax">
		<table class="table" id="auditionContent">
		<thead>
			<tr>
				<th>지원자이름</th>
				<th>포트폴리오 확인</th> 
				<th>상태</th>
				<th>쪽지</th>
			</tr>
		</thead>
	
		<tbody>
<div>
	<c:choose>
		<c:when test="${empty list}">
			<tr>
				<td colspan="4">----지원자가 없습니다----</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach var="dto" items="${list}" varStatus="status" >
				<tr>
					
					<td>${list2[status.index].member_name}</td>
					
					<td><input type="button" value="포트폴리오" class="sitchange" name = "${dto.port_title }" title = "프로필 확인"  id="${dto.applicant_no }"></td>
					
					<td>
						<div class="btn-group">
						  	<button  class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" class="btn btn-light" style="background-color: #B51F38; color: white;">
						    ${dto.audition_situation}
						  	</button>
						  		<ul class="dropdown-menu">
								    <li class="sitchange" title="포트폴리오 합격" id="${dto.applicant_no }" ><a class="dropdown-item" >포트폴리오 합격</a></li>
								    <li class="sitchange" title="화상 인터뷰" id="${dto.applicant_no }" ><a class="dropdown-item" >화상 인터뷰</a></li>
								    <li class="sitchange" title="오프라인 인터뷰" id="${dto.applicant_no }" ><a class="dropdown-item" >오프라인 인터뷰</a></li>
								    <li class="sitchange" title="최종합격" id="${dto.applicant_no }" ><a class="dropdown-item" >최종합격</a></li>
								    <li class="sitchange" title="최종불합격" id="${dto.applicant_no }" ><a class="dropdown-item" >최종불합격</a></li>
								</ul>
						</div>
					</td>
					
					<td><input type="button" value="쪽지" onClick="location.href='/message/sendform?member_id=${dto.member_id}'"></td>
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

<script type="text/javascript">

$(function(){
	$('.sitchange').click(function(){
		let type = this.title;
		let applicant_no = this.id;
		let port = this.name;
		

			window.location.href="/audition/sitChange?audition_situation="+type+"&&applicant_no="+applicant_no;
			alert("변경완료");
			location.reload();



		
	});
});






</script>

</html>