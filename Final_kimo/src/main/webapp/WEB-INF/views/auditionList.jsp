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
    <title>auditionList</title>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
  </head>
  
<body>

<%@ include file="./header.jsp" %>

<!-- 광고 -->
<div class="container">
<div class="row">
<div class="col-1"></div>
<div class="col-10">
<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner justify-content-center">
    <div class="carousel-item active">
      <img src="/resources/img/banner1.png" class="d-block w-100 " >
      <div class="carousel-caption d-none d-md-block">
      </div>
    </div>
    <div class="carousel-item justify-content-center">
      <img src="/resources/img/banner2.png" class="d-block w-100" >
      <div class="carousel-caption d-none d-md-block">
      </div>
    </div>
    <div class="carousel-item justify-content-center">
      <img src="/resources/img/banner3.png" class="d-block w-100" >
      <div class="carousel-caption d-none d-md-block">
      </div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
  <div class="col-1"></div>
</div>
</div>
</div>
</div>



<br><br><br><br>


<div class="container-fluid">
<div class="row">
	<div class="col-1">
	</div>
	<div class="col-1">
	<div class="dropdown">
  		<button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" class="btn btn-light" style="background-color: #B51F38; color: white;">
    		고용 타입
  		</button>
  		<ul class="dropdown-menu">
   		 <li title="소속 오디션"><a class="dropdown-item">소속 오디션</a></li>
    	 <li title="작품 오디션"><a class="dropdown-item">작품 오디션</a></li>
    	 <li title="전체"><a class="dropdown-item">전체</a></li>
  		</ul>
	</div>
	<br><br><br><br>
	<div class="dropdown">
  		<button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false"
  		class="btn btn-light" style="background-color: #B51F38; color: white;">
    		직업타입
  		</button>
  		<ul class="dropdown-menu">
   		 <li title="가수"><a class="dropdown-item">가수</a></li>
    	 <li title="배우"><a class="dropdown-item">배우</a></li>
    	 <li title="모델"><a class="dropdown-item">모델</a></li>
    	 <li title="기타"><a class="dropdown-item">기타</a></li>
    	 <li title="전체"><a class="dropdown-item">전체</a></li>
  		</ul>
	</div>
	</div>
	
	
	<div class="col-9" >
		<table class="table" >
		<thead>
			<tr>
				<th>오디션타입</th>
				<th>직업타입</th>
				<th>오디션제목</th>
				<th>회사</th>
				<th>마감일</th>
			</tr>
		</thead>
	
		<tbody>
<div>
	<c:choose>
		<c:when test="${empty list}">
			<tr>
				<td colspan="4">----작성된 글이 없습니다----</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${list}" var="dto">
				<tr>
					<td>${dto.audition_employ }</td>
					<td>${dto.audition_job }</td>
					<td><a href="/audition/detail?audition_no=${dto.audition_no}">${dto.audition_title }</td>
					<td>${dto.audition_company }</td>
					<td>${dto.audition_end }</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>	
</div>	
		</tbody>
		
	</table>
	
	</div>
</div>
</div>

<div class="container">
	<div class="row">
	 <div class="col-11"></div>
	 <div class="col-1">
		<tr>
			<td>
				<input type="button" value="오디션등록" class="btn btn-light" style="background-color: #B51F38; color: white;"
				onclick="location.href='/audition/insertform'">
			</td>
		</tr>
	</div>
	</div>
	</div>


<!-- 컴퍼니만  등록버튼보이게 
	< %
		if(id !=null && id.equals("company")){
			%>
	<div class="container">
	<div class="row">
	 <div class="col-11"></div>
	 <div class="col-1">
		<tr>
			<td>
				<input type="button" value="오디션등록" class="btn btn-light" style="background-color: #B51F38; color: white;"
				onclick="location.href='/audition/insertform'">
				<button type="button" onclick="getAuditionContent()">일단</button>  
			</td>
		</tr>
	</div>
	</div>
	</div>
			< %
		}
	%>
-->


<br>
<%@ include file="./footer.jsp" %>
</body>


<script type="text/javascript">
 $(function(){
	 $("li").click(function(){
		 let type = this.title;
		 console.log(type);
		 
		 if(type == '소속 오디션' || type=='작품 오디션' || type=='전체'){
				$.ajax({
					type : "POST",
					url : "/audition/listEmp",
					data : { type : type},
					success : function(list) {
						let tbodyEle = document.getElementsByTagName("tbody")[0]; 
						tbodyEle.innerHTML = '';
						
						if(list.length == 0){
							tbodyEle.innerHTML += '----작성된 글이 없습니다----';
						}else{
							for( let i=0; i<list.length; i++ ){
							tbodyEle.innerHTML +=
								'<tr>'+
									'<td>'+list[i].audition_employ+'</td>'+
									'<td>'+list[i].audition_job+'</td>'+
									'<td><a href="/audition/detail?audition_no='+list[i].audition_no+'">'+list[i].audition_title+'</td>'+
									'<td>'+list[i].audition_company+'</td>'+
									'<td>'+list[i].audition_end+'</td>'+
								'</tr>';
							}		
						}
					},
					error : function(xhr, status, error) {
						alert("error");
					}
				});
				
				
		 }else{
			 $.ajax({
					type : "POST",
					url : "/audition/listJob",
					data : {type : type},
					success : function(list) {
						let tbodyEle = document.getElementsByTagName("tbody")[0]; 
						tbodyEle.innerHTML = '';
						
						if(list.length == 0){
							tbodyEle.innerHTML += '----작성된 글이 없습니다----';
						}else{
							for( let i=0; i<list.length; i++ ){
							tbodyEle.innerHTML +=
								'<tr>'+
									'<td>'+list[i].audition_employ+'</td>'+
									'<td>'+list[i].audition_job+'</td>'+
									'<td><a href="/audition/detail?audition_no='+list[i].audition_no+'">'+list[i].audition_title+'</td>'+
									'<td>'+list[i].audition_company+'</td>'+
									'<td>'+list[i].audition_end+'</td>'+
								'</tr>';
							}
						}
					},
					
					error : function(xhr, status, error) {
						alert("error");
					}
				});
		 }
	 });
 });
</script>






</html>