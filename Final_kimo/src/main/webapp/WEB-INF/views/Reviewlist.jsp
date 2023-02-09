<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>



<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
<%@ include file="./header.jsp" %>

<!-- 
<header class="bg-primary bg-gradient text-white" style="background-color:#b51f38  !important">
            <div class="container mt-2 pt-1 text-center">
                <h1 class="fw-bolder">후기 게시판</h1>
                <p class="lead">오디션 후기</p>
            </div>
        </header> -->

	<div class="container col-6" style="background-color:  white">
	
	
	
	<table border="0" class="table table-hover">
		
		<colgroup>
		<col width="80px" />
		<col width="200px" />
		<col width="80px" />
		<col width="100px" />
		<col width="100px" />
		</colgroup>
		
		<tr>
			<th scope="col" >글 번호</th>
			<th scope="col" >글 제목</th>
			<th scope="col" >조회수</th>
			<th scope="col" >글 작성자</th>
			<th scope="col" >작성일</th>
		</tr>
		
		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<td colspan="5" style="width: 60%; text-align: center;" >-----작성된 글이 없습니다-----</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<tr>
						<td >${dto.review_no }</td>
						<td ><a href="/Reviewboard/detail?review_no=${dto.review_no }" style="text-decoration:none"  >${dto.review_title } <%--(${dto.commentcount}) --%></a></td>
						<td >${dto.review_readcount }</td>
						<td >${dto.member_id }</td>
						<td ><fmt:formatDate value="${dto.review_date}" pattern="yyyy-MM-dd(E)" /></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		
		<tr>
			<td colspan="5" align="right">
				<input type="button" value="글 작성"
				onclick="location.href='/Reviewboard/insertform'">
			</td>
		</tr>
			
	</table>
	
	<div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="/Reviewboard/list?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/Reviewboard/list?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/Reviewboard/list?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
	
	
	</div>
	<%@ include file="./footer.jsp" %>
</body>
</html>