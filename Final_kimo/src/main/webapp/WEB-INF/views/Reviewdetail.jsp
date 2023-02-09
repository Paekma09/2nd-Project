<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function deleteReview(review_no){
		if(confirm ("삭제하시겠습니까?")){
			location.href='/Reviewboard/delete?review_no=' + review_no
		}
	};
	
	function deletecomment(comment_no, review_no){
		if(confirm ("삭제하시겠습니까?")){
			location.href='/Reviewboard/deletecomment?comment_no=' + comment_no+"&review_no="+review_no;
		}
	};
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
</head>
<body>
<%@ include file="./header.jsp" %>

<header class="bg-primary bg-gradient text-white" style="background-color:#b51f38  !important">
            <div class="container mt-2 pt-1 text-center">
                <h1 class="fw-bolder">후기 게시판</h1>
                <p class="lead">글 상세페이지</p>
            </div>
        </header>



	<div class="container col-6 mt-2" style="background-color: white">

		<table border="1" class="table">
			<tr class="table-active">
				<th style="text-align: center;">${dto.review_title }</th>
			</tr>
			<tr>
				<th colspan="2"  style="text-align: center;">참고 영상</th>
			</tr>
			<tr>
				<td colspan="2" align="center"><iframe width="560" height="315" src="${dto.review_path }"
						title="YouTube video player" frameborder="0"
						allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
						allowfullscreen></iframe>
				</td>
			</tr>
			<tr>
				<th colspan="2"  style="text-align: center;">내용</th>
			</tr>
			<tr >
				<td style="text-align: center;"><textarea readonly rows="10" style="width:90%; border:0; " >${dto.review_content }</textarea></td>
			</tr>
			
			<tr>
				<td colspan="2"><input type="button" value="수정" 	onclick="location.href='/Reviewboard/updateform?review_no=${dto.review_no}'">
					<input type="button" value="삭제" 	onclick="deleteReview(${dto.review_no})"> 
					<input type="button" value="목록" 	onclick="location.href='/Reviewboard/list'">
				</td>
			</tr>


		</table>
		<hr>


		<table border="1" >
			<c:forEach items="${coList }" var="coDto">
				<tr class="table-active">
					<td style="width:20%">${coDto.member_name }</td>
					<td>${coDto.comment_detail }</td>
					<td><fmt:formatDate value="${coDto.comment_date}"	pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td colspan="2">
					<c:if test="${login.id eq coDto.member_id }">
						<input type="button" value="삭제"	onclick="deletecomment(${coDto.comment_no}, ${dto.review_no });">
					</c:if>
					</td>
				</tr>
			</c:forEach>

			<tr>
				<td colspan="3">
					<div>
						<form method="post" action="/Reviewboard/insertcomment">
							<input type="hidden" value="${dto.review_no} " name="review_no" />
							
							<p>
								<label>댓글 작성자: </label> <input type="text" readonly="readonly" value="${member.name }" >
								<input type="hidden" name="member_id" value="${member.id }">
							</p>
							<p>
								<textarea rows="4" cols="80" name="comment_detail"></textarea>
							</p>
							<p>
								<button type="submit">댓글 작성</button>
							</p>
							
						</form>

					</div>
				</td>
			</tr>
		</table>

	</div>


<%@ include file="./footer.jsp" %>
</body>

</html>