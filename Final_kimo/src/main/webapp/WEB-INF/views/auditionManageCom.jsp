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
    <title>auditionManageCom</title>
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
		
<div class ="col">
<ul class="nav nav-tabs" id="myTab" role="tablist">
  <li class="nav-item" role="presentation" title="전체">
    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">전체 오디션</button>
  </li>
  <li class="nav-item" role="presentation" title="진행">
    <button class="nav-link" id="profile-tab"data-bs-toggle="tab" data-bs-target="#contact-tab-pane" type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="false">진행 중 오디션</button>
  </li>
  <li class="nav-item" role="presentation" title="마감">
    <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact-tab-pane" type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="false">마감 오디션</button>
  </li>
</ul>
</div>

		<div class="col">
		</div>
	</div>
</div>

<div class="container-fluid text-center">
	<div class="row">
		<div class="col">
		</div>

<div class="col-9" id="ListAjax">
		<table class="table" id="auditionContent">
		<thead>
			<tr>
				<th>오디션제목</th>
				<th>마감일</th>
				<th>관리</th> 
				<th></th>
			</tr>
		</thead>
	
		<tbody>
<div>
	<c:choose>
		<c:when test="${empty list}">
			<tr>
				<td colspan="3">----작성된 글이 없습니다----</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${list}" var="dto">
				<tr>
					<td><a href="/audition/detail?audition_no=${dto.audition_no}">${dto.audition_title }</td>
					<td>${dto.audition_end }</td>
					<td><input type="button" value="관리" onClick="location.href='/audition/comManagementform2?audition_no=${dto.audition_no}'"></td>
					<td><input type="button" value="화상면접" class="btn btn-light" style="background-color: #B51F38; color: white;" onclick="location.href='/main'"></td>
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
	$("li").click(function(){
		let type = this.title;
		if(type == "진행" || type == "마감" || type == "전체"){
			$.ajax({
				type : "POST",
				url : "/audition/listSitCom",
				data : {type : type},
				success : function(list){
					let tbodyEle = document.getElementsByTagName("tbody")[0];
					tbodyEle.innerHTML = '';
					
					if(list.length == 0){
						tbodyEle.innerHTML += '----해당하는 오디션이 없습니다----';
					}else{
						for(let i=0; i<list.length; i++){
							tbodyEle.innerHTML +=
								'<tr>' +
									'<td><a href="/audition/detail?audition_no='+list[i].audition_no+'">'+list[i].audition_title+'</td>'+
									'<td>'+list[i].audition_end+'</td>'+
									'<td><input type="button" value="관리" onClick="location.href="/audition/comManagementform2?audition_no=' +list[i].audition_no+ '"></td>' +
											
											
								'</tr>';
						}
					}
				},
				error : function(xhr,status,error){
					alert("Ajax 불러오기 에러");
				}
				
			});
		}
	});
	
});



</script>


</html>