<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<!DOCTYPE html>
<html>
<head>

<script
	src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body style="background-color: #020204">
	<%@ include file="./header.jsp" %>


	<header class="bg-primary bg-gradient text-white"
		style="background-color: #b51f38 !important">
		<div class="container mt-5 pt-4 text-center">
			<h1 class="fw-bolder">통계</h1>
			<p class="lead">합격자 키워드 분석</p>
		</div>
	</header>

	<div class="container " style="display: flex;">

		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<td colspan="4" style="width: 60%">-----통계 데이터가 없습니다-----</td>
				</tr>
			</c:when>
			<c:otherwise>
				<div style="background-color: white; width: 100%;">
					<canvas id="FemaleTallChart"></canvas>
				</div>
				<div style="background-color: white; width: 100%;">
					<canvas id="MaleTallChart"></canvas>
				</div>

				<%-- <c:forEach items="${list }" var="dto">

					<p>${dto.member_tall},${dto.member_gender}</p>

				</c:forEach>  --%>
			</c:otherwise>
		</c:choose>



		<%-- 		<c:forEach items="${list }" var="dto">

			<p>${dto.member_tall},${dto.member_gender}</p>
			<c:choose>
				<c:when test="${dto.member_gender eq 'FEMALE' }">
					<c:choose>
						<c:when test="${fn:substring (dto.member_tall,0,2) eq '15'}">15</c:when>
						<c:when test="${fn:substring (dto.member_tall,0,2) eq '16'}"></c:when>
						<c:when test="${fn:substring (dto.member_tall,0,2) eq '17'}"></c:when>
						<c:otherwise>기타</c:otherwise>
					</c:choose>
				</c:when>
			</c:choose>

		</c:forEach> --%>


	</div>

	<div class="container " style="display: flex;">

		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<td colspan="4" style="width: 60%">-----통계 데이터가 없습니다-----</td>
				</tr>
			</c:when>
			<c:otherwise>
				<div style="background-color: white; width: 100%;">
					<canvas id="BodyChart"></canvas>
				</div>



			</c:otherwise>
		</c:choose>




	</div>

	<div style="width: 500px">
		<%--  <c:forEach items="${list }" var="dto">

					<p>${dto.member_tall},${dto.member_gender}</p>

				</c:forEach>
				<c:forEach items="${list2 }" var="dto">

					<p>${dto.member_body},${dto.member_gender}</p>

				</c:forEach> --%>
	</div>
	<%@ include file="./footer.jsp"%>
	
	<div  class="text-center" style="position: absolute; width: 100%; height: 100%;  background-color:white;  background-image:url(/resources/img/blur.jpg);  background-repeat: no-repeat; background-position: center; ">
	<div style="margin: 20%">
		<h1 class="fw-bolder">돈을 내라 닝겐</h1>
		<button onclick="location.href='/Reviewboard/list'">유료 서비스 안내 페이지로 이동</button>
	</div>
	</div> 
	
</body>



<script>
const ctx = document.getElementById('FemaleTallChart').getContext('2d');

let femaleTallData= {
		'150대':0, '160대':0, '170대':0, '그 외':0
}

/*  */
<c:forEach items="${list }" var="dto">


<c:choose>
	<c:when test="${dto.member_gender eq 'FEMALE' }">
		<c:choose>
			<c:when test="${fn:substring (dto.member_tall,0,2) eq '15'}">femaleTallData['150대']+=1</c:when>
			<c:when test="${fn:substring (dto.member_tall,0,2) eq '16'}">femaleTallData['160대']+=1</c:when>
			<c:when test="${fn:substring (dto.member_tall,0,2) eq '17'}">femaleTallData['170대']+=1</c:when>
			<c:otherwise>femaleTallData['그 외']+=1</c:otherwise>
		</c:choose>
	</c:when>
</c:choose>

</c:forEach>
/*  */


let pieChartData = {
	    labels: [ '150대', '160대', '170대', '그 외'],
	    datasets: [{
	        data: [femaleTallData['150대'], femaleTallData['160대'], femaleTallData['170대'], femaleTallData['그 외']],
	        backgroundColor: ['#b51f38', '#d9344f', '#ed6178', '#ff9dad', 'rgb(54, 162, 235)']
	    }] 
	};
const config = {
  type: 'pie',
  data: pieChartData,
  options: {
    responsive: true,
    plugins: {
      legend: {
        position: 'top',
      },
      title: {
        display: true,
        text: '여자 키'
      }
    }
  },
};
const FemaleTallChart = new Chart(ctx, config
);
</script>
<script>
const ctx2 = document.getElementById('MaleTallChart').getContext('2d');

let maleTallData= {
		'160대':0, '170대':0, '180대':0, '그 외':0
}

/*  */
<c:forEach items="${list }" var="dto">


<c:choose>
	<c:when test="${dto.member_gender eq 'MALE' }">
		<c:choose>
			<c:when test="${fn:substring (dto.member_tall,0,2) eq '16'}">maleTallData['160대']+=1</c:when>
			<c:when test="${fn:substring (dto.member_tall,0,2) eq '17'}">maleTallData['170대']+=1</c:when>
			<c:when test="${fn:substring (dto.member_tall,0,2) eq '18'}">maleTallData['180대']+=1</c:when>
			<c:otherwise>maleTallData['그 외']+=1</c:otherwise>
		</c:choose>
	</c:when>
</c:choose>

</c:forEach>
/*  */


let pieChartData2 = {
	    labels: [ '160대', '170대', '180대', '그 외'],
	    datasets: [{
	        data: [maleTallData['160대'], maleTallData['170대'], maleTallData['180대'], maleTallData['그 외']],
	        backgroundColor: ['#4f5b6a', '#536a85', '#6e8cb0', '#9bb8dd', 'rgb(54, 162, 235)']
	    }] 
	};
const config2 = {
  type: 'pie',
  data: pieChartData2,
  options: {
    responsive: true,
    plugins: {
      legend: {
        position: 'top',
      },
      title: {
        display: true,
        text: '남자 키'
      }
    }
  },
};
const MaleTallChart = new Chart(ctx2, config2
);
</script>


<script>



let femaleBodyData= {
		'마른':0 , '보통':0 , '통통':0 , '뚱뚱':0 ,'탄탄':0 ,'근육질':0 ,'덩치':0 
}
let maleBodyData= {
		'마른':0 , '보통':0 , '통통':0 , '뚱뚱':0 ,'탄탄':0 ,'근육질':0 ,'덩치':0 
}

<c:forEach items="${list2 }" var="dto">
		<c:choose>
		<c:when test="${dto.member_gender eq 'FEMALE' }">
		var str = '${dto.member_body}';
		var words = str.split(','); // ['af','xx']
		/* console.log(words) */
		for(var i=0;i<words.length;i++){
			femaleBodyData[words[i]]+=1;
            }
		</c:when>
		<c:when test="${dto.member_gender eq 'MALE' }">
		var str2 = '${dto.member_body}';
		var words2 = str2.split(','); // ['af','xx']
		/* console.log(words) */
		for(var i=0;i<words2.length;i++){
			maleBodyData[words2[i]]+=1;
		}
		
		</c:when>
		</c:choose>
</c:forEach>

		
		
		
var barChartData = {  
		
		
        labels: ['마른','보통','통통','뚱뚱','탄탄','근육질','덩치'],
        datasets: [{
            label: '여자 회원',
            backgroundColor: "#b51f38",
            data: [
            	femaleBodyData['마른'], 
            		femaleBodyData['보통'], 
            		femaleBodyData['통통'], 
            		femaleBodyData['뚱뚱'],
            		femaleBodyData['탄탄'],
            		femaleBodyData['근육질'],
            		femaleBodyData['덩치']
            		
           ]
        }, {
        	
            label: '남자 회원',
            backgroundColor: "#4f5b6a",
            data: [
            	maleBodyData['마른'], 
        		maleBodyData['보통'], 
        		maleBodyData['통통'], 
        		maleBodyData['뚱뚱'],
        		maleBodyData['탄탄'],
        		maleBodyData['근육질'],
        		maleBodyData['덩치']
            ]
        }]
    };
 window.onload = function() {
    var ctx = $('#BodyChart').get(0).getContext("2d"); 
    window.theChart = new Chart(ctx, {
         type: 'bar',
         data: barChartData,
         options: {
        	    responsive: true,
        	    plugins: {
        	      legend: {
        	        position: 'top',
        	      },
        	      title: {
        	        display: true,
        	        text: '회원 체형 키워드 분석'
        	      }
        	    }
        	  }
 });
}

</script>

































</html>