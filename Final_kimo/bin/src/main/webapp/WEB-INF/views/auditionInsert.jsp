<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="kor">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>auditionInsert</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
	<!-- 사진업로드 -->
	<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
	
    <style type="text/css">
    .upload_button {
  		margin-top: 30px;
  		background-color: #B51F38;
  		color: #fff;
  		text-align: center;
  		padding: 10px 0;
  		width: 30%;
  		border-radius: 6px;
  		cursor: pointer;
	}
	.photo_upload {
  		display: none;
	}
    </style>
  </head>
<body>
<%@ include file="./header.jsp" %>
<!-- 
사진첨부
접수시작 접수마감 등록일 촬영기간
키워드 / 체형 / 특기
진행상태
-->
<form action="/audition/insert" method="post" enctype = "multipart/form-data">

<div class="container-fluid">
	<input type="hidden" name="member_id" value=${dto.member_id }>
	<input type="hidden" name="audition_no" value=1>
	
<div class="row">

	<div class="col-2">
	<div class="dropdown">
		<br><br>
  		<select name="audition_employ">
 		 <option value="">오디션 타입을 선택해주세요</option>
 		 <option value="소속 오디션">소속 오디션</option>
 		 <option value="작품 오디션">작품 오디션</option>
		</select>
	</div>
	<br><br><br><br>
	<div class="dropdown">
		<select name="audition_job">
 		 <option value="">직업 타입을 선택해주세요</option>
 		 <option value="가수">가수</option>
 		 <option value="배우">배우</option>
 		 <option value="모델">모델</option>
 		 <option value="기타">기타</option>
		</select>
	</div>
	</div>
	
	<div class="col-5">
	 <div class="col">
          <label for="id" class="form-label">오디션 제목</label>
          <input type="text" class="form-control" name="audition_title" maxlength="20">
     </div>
     <div class="col">
          <label for="id" class="form-label">감독/소속사</label>
          <input type="text" class="form-control" name="audition_director" maxlength="20">
     </div>
     <div class="col">
          <label for="id" class="form-label">제작사</label>
          <input type="text" class="form-control" name="audition_company" maxlength="20">
     </div>
     <div class="col">
          <label for="id" class="form-label">제작 유형</label>
          <input type="text" class="form-control" name="audition_type" maxlength="20">
     </div>
     <div class="col">
          <label for="id" class="form-label">촬영 장소</label>
           <input type="text" class="form-control" name="audition_location" maxlength="20">
     </div>
     <div class="col">
          <label for="id" class="form-label">페이</label>
          <input type="text" class="form-control" name="audition_pay" maxlength="20">
     </div>
     <div class="col">
          <label for="id" class="form-label">상세설명</label>
          <textarea class="form-control" rows="10" name="audition_detail"
			placeholder="상세설명을 입력해주세요" required></textarea>
     </div>
     <div class="col">
          <label for="id" class="form-label">담당자 연락처</label>
          <input type="text" class="form-control" name="audition_phone" maxlength="20">
     </div>
     </div>
     
	 <div class="col-5">
	    <label for="id" class="form-label">촬영 기간</label>
         <input type="text" class="form-control" name="audition_date" maxlength="50" 
         placeholder="YYYY.MM.DD ~ YYYY.MM.DD 혹은 기간으로 입력">
      	<br>
	 	<label for="id" class="form-label">접수 시작 : </label>
		 <input type="date" name="audition_start"
      		 min="2018-01-01" max="2023-12-31">
	 	<label for="id" class="form-label">접수 마감 : </label>
		 <input type="date"  name="audition_end"
      		 min="2018-01-01" max="2023-12-31">
      	<br>
      	
      	<!-- 사진업로드 모달 버튼 -->
      	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
 		 사진 업로드
		</button>
      	
      	
      	
      
      	  <!-- 모달 선택지 -->
      	  <div class="text-center pb-4">
                            <div class="btn-group" role="group" aria-label="Basic outlined example"
                                style="background-color: #4F5B6A;">
                                <!-- Button trigger modal -->
                                <button type="button" class="btn btn-outline-light" data-bs-toggle="modal"
                                    data-bs-target="#keywordChk">
                                    키워드 선택
                                </button>
                                <!-- Button trigger modal -->
                                <button type="button" class="btn btn-outline-light" data-bs-toggle="modal"
                                    data-bs-target="#bodyChk">
                                    체형 선택
                                </button>
                                <!-- Button trigger modal -->
                                <button type="button" class="btn btn-outline-light" data-bs-toggle="modal"
                                    data-bs-target="#talentChk">
                                    특기 선택
                                </button>

                            </div>

                        </div>

                        <!-- 키워드 모달 -->
                        <div class="modal fade" id="keywordChk" data-bs-backdrop="static" data-bs-keyboard="false"
                            tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="staticBackdropLabel">키워드 선택</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row">
                                            <div class="btn-group btn-group-sm" role="group"
                                                aria-label="Basic checkbox toggle button group">
                                                <input type="checkbox" name="audition_keyword" class="btn-check" id="청순한"
                                                    value="청순한" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="청순한">청순한</label>

                                                <input type="checkbox" name="audition_keyword" class="btn-check" id="귀여운"
                                                    value="귀여운" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="귀여운">귀여운</label>

                                                <input type="checkbox" name="audition_keyword" class="btn-check" id="연약한"
                                                    value="연약한" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="연약한">연약한</label>

                                                <input type="checkbox" name="audition_keyword" class="btn-check" id="소심한"
                                                    value="소심한" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="소심한">소심한</label>

                                                <input type="checkbox" name="audition_keyword" class="btn-check" id="말괄량이"
                                                    value="말괄량이" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="말괄량이">말괄량이</label>

                                                <input type="checkbox" name="audition_keyword" class="btn-check" id="다정한"
                                                    value="다정한" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="다정한">다정한</label>

                                                <input type="checkbox" name="audition_keyword" class="btn-check" id="여성스러운"
                                                    value="여성스러운" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="여성스러운">여성스러운</label>

                                                <input type="checkbox" name="audition_keyword" class="btn-check" id="지적인"
                                                    value="지적인" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="지적인">지적인</label>
                                            </div>
                                            <div class="btn-group btn-group-sm" role="group"
                                                aria-label="Basic checkbox toggle button group">
                                                <input type="checkbox" name="audition_keyword" class="btn-check" id="단정한"
                                                    value="단정한" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="단정한">단정한</label>

                                                <input type="checkbox" name="audition_keyword" class="btn-check" id="헌신적인"
                                                    value="헌신적인" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="헌신적인">헌신적인</label>

                                                <input type="checkbox" name="audition_keyword" class="btn-check" id="섹시한"
                                                    value="섹시한" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="섹시한">섹시한</label>

                                                <input type="checkbox" name="audition_keyword" class="btn-check" id="여우같은"
                                                    value="여우같은" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="여우같은">여우같은</label>

                                                <input type="checkbox" name="audition_keyword" class="btn-check" id="세련된"
                                                    value="세련된" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="세련된">세련된</label>

                                                <input type="checkbox" name="audition_keyword" class="btn-check" id="도도한"
                                                    value="도도한" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="도도한">도도한</label>

                                                <input type="checkbox" name="audition_keyword" class="btn-check" id="똑부러지는"
                                                    value="똑부러지는" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="똑부러지는">똑부러지는</label>

                                                <input type="checkbox" name="audition_keyword" class="btn-check" id="털털한"
                                                    value="털털한" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="털털한">털털한</label>
                                            </div>
                                            <div class="btn-group btn-group-sm" role="group"
                                                aria-label="Basic checkbox toggle button group">
                                                <input type="checkbox" name="audition_keyword" class="btn-check" id="자유로운"
                                                    value="자유로운" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="자유로운">자유로운</label>

                                                <input type="checkbox" name="audition_keyword" class="btn-check" id="성숙한"
                                                    value="성숙한" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="성숙한">성숙한</label>

                                                <input type="checkbox" name="audition_keyword" class="btn-check" id="예민한"
                                                    value="예민한" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="예민한">예민한</label>

                                                <input type="checkbox" name="audition_keyword" class="btn-check" id="밝은"
                                                    value="밝은" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="밝은">밝은</label>

                                                <input type="checkbox" name="audition_keyword" class="btn-check" id="부드러운"
                                                    value="부드러운" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="부드러운">부드러운</label>

                                                <input type="checkbox" name="audition_keyword" class="btn-check" id="순수한"
                                                    value="순수한" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="순수한">순수한</label>

                                                <input type="checkbox" name="audition_keyword" class="btn-check" id="깔끔한"
                                                    value="깔끔한" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="깔끔한">깔끔한</label>

                                                <input type="checkbox" name="audition_keyword" class="btn-check" id="스마트한"
                                                    value="스마트한" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="스마트한">스마트한</label>
                                            </div>
                                            <div class="btn-group btn-group-sm" role="group"
                                                aria-label="Basic checkbox toggle button group">
                                                <input type="checkbox" name="audition_keyword" class="btn-check" id="까칠한"
                                                    value="까칠한" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="까칠한">까칠한</label>

                                                <input type="checkbox" name="audition_keyword" class="btn-check" id="위엄있는"
                                                    value="위엄있는" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="위엄있는">위엄있는</label>

                                                <input type="checkbox" name="audition_keyword" class="btn-check" id="능글맞은"
                                                    value="능글맞은" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="능글맞은">능글맞은</label>

                                                <input type="checkbox" name="audition_keyword" class="btn-check" id="장난끼있는"
                                                    value="장난끼있는" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="장난끼있는">장난끼있는</label>

                                                <input type="checkbox" name="audition_keyword" class="btn-check" id="반항적인"
                                                    value="반항적인" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="반항적인">반항적인</label>

                                                <input type="checkbox" name="audition_keyword" class="btn-check" id="터프한"
                                                    value="터프한" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="터프한">터프한</label>

                                                <input type="checkbox" name="audition_keyword" class="btn-check" id="과묵한"
                                                    value="과묵한" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="과묵한">과묵한</label>

                                                <input type="checkbox" name="audition_keyword" class="btn-check" id="거만한"
                                                    value="거만한" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="거만한">거만한</label>
                                            </div>
                                            <div class="btn-group btn-group-sm" role="group"
                                                aria-label="Basic checkbox toggle button group">
                                                <input type="checkbox" name="audition_keyword" class="btn-check" id="인자한"
                                                    value="인자한" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="인자한">인자한</label>

                                                <input type="checkbox" name="audition_keyword" class="btn-check" id="불쌍한"
                                                    value="불쌍한" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="불쌍한">불쌍한</label>

                                                <input type="checkbox" name="audition_keyword" class="btn-check" id="로맨틱한"
                                                    value="로맨틱한" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="로맨틱한">로맨틱한</label>

                                                <input type="checkbox" name="audition_keyword" class="btn-check" id="건강한"
                                                    value="건강한" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="건강한">건강한</label>

                                                <input type="checkbox" name="audition_keyword" class="btn-check" id="비열한"
                                                    value="비열한" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="비열한">비열한</label>

                                                <input type="checkbox" name="audition_keyword" class="btn-check" id="순박한"
                                                    value="순박한" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="순박한">순박한</label>

                                                <input type="checkbox" name="audition_keyword" class="btn-check" id="독특한"
                                                    value="독특한" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="독특한">독특한</label>

                                                <input type="checkbox" name="audition_keyword" class="btn-check" id="똑똑한"
                                                    value="똑똑한" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="똑똑한">똑똑한</label>

                                                <input type="checkbox" name="audition_keyword" class="btn-check" id="싸이코패스"
                                                    value="싸이코패스" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="싸이코패스">싸이코패스</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary"
                                            data-bs-dismiss="modal">취소</button>
                                        <button type="button" class="btn btn-primary">저장</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- 체형 모달 -->
                        <div class="modal fade" id="bodyChk" data-bs-backdrop="static" data-bs-keyboard="false"
                            tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="staticBackdropLabel">체형 선택</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row">
                                            <div class="btn-group btn-group-sm" role="group"
                                                aria-label="Basic checkbox toggle button group">
                                                <input type="checkbox" name="audition_body" class="btn-check" id="마른"
                                                    value="마른" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="마른">마른</label>

                                                <input type="checkbox" name="audition_body" class="btn-check" id="보통"
                                                    value="보통" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="보통">보통</label>

                                                <input type="checkbox" name="audition_body" class="btn-check" id="통통"
                                                    value="통통" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="통통">통통</label>

                                                <input type="checkbox" name="audition_body" class="btn-check" id="뚱뚱"
                                                    value="뚱뚱" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="뚱뚱">뚱뚱</label>

                                                <input type="checkbox" name="audition_body" class="btn-check" id="탄탄"
                                                    value="탄탄" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="탄탄">탄탄</label>

                                                <input type="checkbox" name="audition_body" class="btn-check" id="근육질"
                                                    value="근육질" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="근육질">근육질</label>

                                                <input type="checkbox" name="audition_body" class="btn-check" id="덩치"
                                                    value="덩치" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="덩치">덩치</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary"
                                            data-bs-dismiss="modal">취소</button>
                                        <button type="button" class="btn btn-primary">저장</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- 특기 모달 -->
                        <div class="modal fade" id="talentChk" data-bs-backdrop="static" data-bs-keyboard="false"
                            tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="staticBackdropLabel">특기 선택</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row">
                                            <label for="" class="mb-2" style="color: #020204;">음악</label>
                                            <div class="btn-group btn-group-sm mb-2" role="group"
                                                aria-label="Basic checkbox toggle button group">
                                                <input type="checkbox" name="atalent_music" class="btn-check" id="성악"
                                                    value="성악" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="성악">성악</label>

                                                <input type="checkbox" name="atalent_music" class="btn-check" id="알앤비"
                                                    value="알앤비" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="알앤비">알앤비</label>

                                                <input type="checkbox" name="atalent_music" class="btn-check" id="락"
                                                    value="락" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="락">락</label>

                                                <input type="checkbox" name="atalent_music" class="btn-check" id="발라드"
                                                    value="발라드" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="발라드">발라드</label>

                                                <input type="checkbox" name="atalent_music" class="btn-check" id="랩"
                                                    value="랩" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="랩">랩</label>

                                                <input type="checkbox" name="atalent_music" class="btn-check" id="뮤지컬"
                                                    value="뮤지컬" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="뮤지컬">뮤지컬</label>

                                                <input type="checkbox" name="atalent_music" class="btn-check" id="피아노"
                                                    value="피아노" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="피아노">피아노</label>

                                                <input type="checkbox" name="atalent_music" class="btn-check" id="바이올린"
                                                    value="바이올린" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="바이올린">바이올린</label>
                                            </div>
                                            <div class="btn-group btn-group-sm mb-2" role="group"
                                                aria-label="Basic checkbox toggle button group">
                                                <input type="checkbox" name="atalent_music" class="btn-check" id="플루트"
                                                    value="플루트" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="플루트">플루트</label>

                                                <input type="checkbox" name="atalent_music" class="btn-check" id="첼로"
                                                    value="첼로" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="첼로">첼로</label>

                                                <input type="checkbox" name="atalent_music" class="btn-check" id="우쿨렐레"
                                                    value="우쿨렐레" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="우쿨렐레">우쿨렐레</label>

                                                <input type="checkbox" name="atalent_music" class="btn-check" id="일렉기타"
                                                    value="일렉기타" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="일렉기타">일렉기타</label>

                                                <input type="checkbox" name="atalent_music" class="btn-check" id="베이스"
                                                    value="베이스" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="베이스">베이스</label>

                                                <input type="checkbox" name="atalent_music" class="btn-check" id="통기타"
                                                    value="통기타" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="통기타">통기타</label>

                                                <input type="checkbox" name="atalent_music" class="btn-check" id="트럼펫"
                                                    value="트럼펫" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="트럼펫">트럼펫</label>

                                            </div>
                                            <div class="btn-group btn-group-sm mb-4" role="group"
                                                aria-label="Basic checkbox toggle button group">
                                                <input type="checkbox" name="atalent_music" class="btn-check" id="트럼본"
                                                    value="트럼본" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="트럼본">트럼본</label>

                                                <input type="checkbox" name="atalent_music" class="btn-check" id="색소폰"
                                                    value="색소폰" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="색소폰">색소폰</label>

                                                <input type="checkbox" name="atalent_music" class="btn-check" id="튜바"
                                                    value="튜바" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="튜바">튜바</label>

                                                <input type="checkbox" name="atalent_music" class="btn-check" id="클라리넷"
                                                    value="클라리넷" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="클라리넷">클라리넷</label>

                                                <input type="checkbox" name="atalent_music" class="btn-check" id="하모니카"
                                                    value="하모니카" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="하모니카">하모니카</label>

                                                <input type="checkbox" name="atalent_music" class="btn-check" id="디제잉"
                                                    value="디제잉" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="디제잉">디제잉</label>

                                                <input type="checkbox" name="atalent_music" class="btn-check" id="아코디언"
                                                    value="아코디언" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="아코디언">아코디언</label>

                                            </div>
                                        </div>
                                        <div class="row">
                                            <label for="" class="mb-2" style="color: #020204;">춤</label>
                                            <div class="btn-group btn-group-sm mb-2" role="group"
                                                aria-label="Basic checkbox toggle button group">
                                                <input type="checkbox" name="atalent_dance" class="btn-check" id="에어로빅"
                                                    value="에어로빅" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="에어로빅">에어로빅</label>

                                                <input type="checkbox" name="atalent_dance" class="btn-check" id="리듬체조"
                                                    value="리듬체조" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="리듬체조">리듬체조</label>

                                                <input type="checkbox" name="atalent_dance" class="btn-check" id="요가"
                                                    value="요가" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="요가">요가</label>

                                                <input type="checkbox" name="atalent_dance" class="btn-check" id="밸리댄스"
                                                    value="밸리댄스" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="밸리댄스">밸리댄스</label>

                                                <input type="checkbox" name="atalent_dance" class="btn-check" id="플라멩고"
                                                    value="플라멩고" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="플라멩고">플라멩고</label>

                                                <input type="checkbox" name="atalent_dance" class="btn-check" id="폴카"
                                                    value="폴카" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="폴카">폴카</label>

                                                <input type="checkbox" name="atalent_dance" class="btn-check" id="발레"
                                                    value="발레" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="발레">발레</label>
                                            </div>
                                            <div class="btn-group btn-group-sm mb-4" role="group"
                                                aria-label="Basic checkbox toggle button group">
                                                <input type="checkbox" name="atalent_dance" class="btn-check" id="라틴댄스"
                                                    value="라틴댄스" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="라틴댄스">라틴댄스</label>

                                                <input type="checkbox" name="atalent_dance" class="btn-check" id="현대무용"
                                                    value="현대무용" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="현대무용">현대무용</label>

                                                <input type="checkbox" name="atalent_dance" class="btn-check" id="재즈댄스"
                                                    value="재즈댄스" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="재즈댄스">재즈댄스</label>

                                                <input type="checkbox" name="atalent_dance" class="btn-check" id="스트릿댄스"
                                                    value="스트릿댄스" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="스트릿댄스">스트릿댄스</label>

                                                <input type="checkbox" name="atalent_dance" class="btn-check" id="탭댄스"
                                                    value="탭댄스" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="탭댄스">탭댄스</label>

                                                <input type="checkbox" name="atalent_dance" class="btn-check" id="비보잉"
                                                    value="비보잉" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="비보잉">비보잉</label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label for="" class="mb-2" style="color: #020204;">운동</label>
                                            <div class="btn-group btn-group-sm mb-2" role="group"
                                                aria-label="Basic checkbox toggle button group">
                                                <input type="checkbox" name="atalent_sports" class="btn-check" id="축구"
                                                    value="축구" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="축구">축구</label>

                                                <input type="checkbox" name="atalent_sports" class="btn-check" id="탁구"
                                                    value="탁구" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="탁구">탁구</label>

                                                <input type="checkbox" name="atalent_sports" class="btn-check" id="당구"
                                                    value="당구" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="당구">당구</label>

                                                <input type="checkbox" name="atalent_sports" class="btn-check" id="볼링"
                                                    value="볼링" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="볼링">볼링</label>

                                                <input type="checkbox" name="atalent_sports" class="btn-check" id="테니스"
                                                    value="테니스" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="테니스">테니스</label>

                                                <input type="checkbox" name="atalent_sports" class="btn-check" id="배드민턴"
                                                    value="배드민턴" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="배드민턴">배드민턴</label>

                                                <input type="checkbox" name="atalent_sports" class="btn-check" id="골프"
                                                    value="골프" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="골프">골프</label>

                                                <input type="checkbox" name="atalent_sports" class="btn-check" id="스쿼시"
                                                    value="스쿼시" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="스쿼시">스쿼시</label>

                                                <input type="checkbox" name="atalent_sports" class="btn-check" id="야구"
                                                    value="야구" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="야구">야구</label>
                                            </div>
                                            <div class="btn-group btn-group-sm mb-2" role="group"
                                                aria-label="Basic checkbox toggle button group">
                                                <input type="checkbox" name="atalent_sports" class="btn-check" id="농구"
                                                    value="농구" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="농구">농구</label>

                                                <input type="checkbox" name="atalent_sports" class="btn-check" id="족구"
                                                    value="족구" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="족구">족구</label>

                                                <input type="checkbox" name="atalent_sports" class="btn-check" id="럭비"
                                                    value="럭비" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="럭비">럭비</label>

                                                <input type="checkbox" name="atalent_sports" class="btn-check" id="배구"
                                                    value="배구" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="배구">배구</label>

                                                <input type="checkbox" name="atalent_sports" class="btn-check" id="사격"
                                                    value="사격" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="사격">사격</label>

                                                <input type="checkbox" name="atalent_sports" class="btn-check" id="양궁"
                                                    value="양궁" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="양궁">양궁</label>

                                                <input type="checkbox" name="atalent_sports" class="btn-check" id="주짓수"
                                                    value="주짓수" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="주짓수">주짓수</label>

                                                <input type="checkbox" name="atalent_sports" class="btn-check" id="킥복싱"
                                                    value="킥복싱" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="킥복싱">킥복싱</label>

                                                <input type="checkbox" name="atalent_sports" class="btn-check" id="쿵푸"
                                                    value="쿵푸" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="쿵푸">쿵푸</label>
                                            </div>
                                            <div class="btn-group btn-group-sm mb-4" role="group"
                                                aria-label="Basic checkbox toggle button group">
                                                <input type="checkbox" name="atalent_sports" class="btn-check" id="합기도"
                                                    value="합기도" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="합기도">합기도</label>

                                                <input type="checkbox" name="atalent_sports" class="btn-check" id="태권도"
                                                    value="태권도" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="태권도">태권도</label>

                                                <input type="checkbox" name="atalent_sports" class="btn-check" id="특공무술"
                                                    value="특공무술" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="특공무술">특공무술</label>

                                                <input type="checkbox" name="atalent_sports" class="btn-check" id="권투"
                                                    value="권투" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="권투">권투</label>

                                                <input type="checkbox" name="atalent_sports" class="btn-check" id="검도"
                                                    value="검도" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="검도">검도</label>

                                                <input type="checkbox" name="atalent_sports" class="btn-check" id="레슬링"
                                                    value="레슬링" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="레슬링">레슬링</label>

                                                <input type="checkbox" name="atalent_sports" class="btn-check" id="유도"
                                                    value="유도" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="유도">유도</label>

                                                <input type="checkbox" name="atalent_sports" class="btn-check" id="이종격투기"
                                                    value="이종격투기" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="이종격투기">이종격투기</label>

                                                <input type="checkbox" name="atalent_sports" class="btn-check" id="승마"
                                                    value="승마" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="승마">승마</label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label for="" class="mb-2" style="color: #020204;">언어</label>
                                            <div class="btn-group btn-group-sm mb-2" role="group"
                                                aria-label="Basic checkbox toggle button group">
                                                <input type="checkbox" name="atalent_language" class="btn-check" id="경상도 사투리"
                                                    value="경상도 사투리" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="경상도 사투리">경상도 사투리</label>

                                                <input type="checkbox" name="atalent_language" class="btn-check" id="전라도 사투리"
                                                    value="전라도 사투리" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="전라도 사투리">전라도 사투리</label>

                                                <input type="checkbox" name="atalent_language" class="btn-check" id="충청도 사투리"
                                                    value="충청도 사투리" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="충청도 사투리">충청도 사투리</label>

                                                <input type="checkbox" name="atalent_language" class="btn-check" id="강원도 사투리"
                                                    value="강원도 사투리" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="강원도 사투리">강원도 사투리</label>

                                                <input type="checkbox" name="atalent_language" class="btn-check" id="제주도 사투리"
                                                    value="제주도 사투리" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="제주도 사투리">제주도 사투리</label>

                                                <input type="checkbox" name="atalent_language" class="btn-check" id="북한 사투리"
                                                    value="북한 사투리" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="북한 사투리">북한 사투리</label>

                                                <input type="checkbox" name="atalent_language" class="btn-check" id="연변 사투리"
                                                    value="연변 사투리" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="연변 사투리">연변 사투리</label>
                                            </div>
                                            <div class="btn-group btn-group-sm mb-2" role="group"
                                                aria-label="Basic checkbox toggle button group">
                                                <input type="checkbox" name="atalent_language" class="btn-check" id="영어"
                                                    value="영어" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="영어">영어</label>

                                                <input type="checkbox" name="atalent_language" class="btn-check" id="중국어"
                                                    value="중국어" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="중국어">중국어</label>

                                                <input type="checkbox" name="atalent_language" class="btn-check" id="일본어"
                                                    value="일본어" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="일본어">일본어</label>

                                                <input type="checkbox" name="atalent_language" class="btn-check" id="베트남어"
                                                    value="베트남어" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="베트남어">베트남어</label>

                                                <input type="checkbox" name="atalent_language" class="btn-check" id="러시아어"
                                                    value="러시아어" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="러시아어">러시아어</label>

                                                <input type="checkbox" name="atalent_language" class="btn-check" id="불어"
                                                    value="불어" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="불어">불어</label>

                                                <input type="checkbox" name="atalent_language" class="btn-check" id="스페인어"
                                                    value="스페인어" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="스페인어">스페인어</label>

                                                <input type="checkbox" name="atalent_language" class="btn-check" id="포르투갈어"
                                                    value="포르투갈어" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="포르투갈어">포르투갈어</label>
                                            </div>
                                            <div class="btn-group btn-group-sm mb-2" role="group"
                                                aria-label="Basic checkbox toggle button group">
                                                <input type="checkbox" name="atalent_language" class="btn-check" id="이탈리아어"
                                                    value="이탈리아어" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="이탈리아어">이탈리아어</label>

                                                <input type="checkbox" name="atalent_language" class="btn-check" id="아랍어"
                                                    value="아랍어" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="아랍어">아랍어</label>

                                                <input type="checkbox" name="atalent_language" class="btn-check" id="태국어"
                                                    value="태국어" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="태국어">태국어</label>

                                                <input type="checkbox" name="atalent_language" class="btn-check" id="루마니아어"
                                                    value="루마니아어" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="루마니아어">루마니아어</label>

                                                <input type="checkbox" name="atalent_language" class="btn-check" id="독일어"
                                                    value="독일어" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="독일어">독일어</label>

                                                <input type="checkbox" name="atalent_language" class="btn-check" id="네덜란드어"
                                                    value="네덜란드어" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="네덜란드어">네덜란드어</label>

                                                <input type="checkbox" name="atalent_language" class="btn-check" id="덴마크어"
                                                    value="덴마크어" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="덴마크어">덴마크어</label>

                                                <input type="checkbox" name="atalent_language" class="btn-check" id="스웨덴어"
                                                    value="스웨덴어" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="스웨덴어">스웨덴어</label>
                                            </div>
                                            <div class="btn-group btn-group-sm mb-4" role="group"
                                                aria-label="Basic checkbox toggle button group">
                                                <input type="checkbox" name="atalent_language" class="btn-check" id="노르웨이어"
                                                    value="노르웨이어" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="노르웨이어">노르웨이어</label>

                                                <input type="checkbox" name="atalent_language" class="btn-check" id="그리스어"
                                                    value="그리스어" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="그리스어">그리스어</label>

                                                <input type="checkbox" name="atalent_language" class="btn-check" id="페르시아어"
                                                    value="페르시아어" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="페르시아어">페르시아어</label>

                                                <input type="checkbox" name="atalent_language" class="btn-check" id="힌두어"
                                                    value="힌두어" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="힌두어">힌두어</label>

                                                <input type="checkbox" name="atalent_language" class="btn-check" id="몽골어"
                                                    value="몽골어" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="몽골어">몽골어</label>

                                                <input type="checkbox" name="atalent_language" class="btn-check" id="터키어"
                                                    value="터키어" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="터키어">터키어</label>

                                                <input type="checkbox" name="atalent_language" class="btn-check" id="헝가리어"
                                                    value="헝가리어" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="헝가리어">헝가리어</label>

                                                <input type="checkbox" name="atalent_language" class="btn-check" id="필란드어"
                                                    value="필란드어" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="필란드어">필란드어</label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label for="" class="mb-2" style="color: #020204;">기타</label>
                                            <div class="btn-group btn-group-sm mb-2" role="group"
                                                aria-label="Basic checkbox toggle button group">
                                                <input type="checkbox" name="atalent_etc" class="btn-check" id="요리"
                                                    value="요리" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="요리">요리</label>

                                                <input type="checkbox" name="atalent_etc" class="btn-check" id="바텐더"
                                                    value="바텐더" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="바텐더">바텐더</label>

                                                <input type="checkbox" name="atalent_etc" class="btn-check" id="마술"
                                                    value="마술" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="마술">마술</label>

                                                <input type="checkbox" name="atalent_etc" class="btn-check" id="수화"
                                                    value="수화" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="수화">수화</label>

                                                <input type="checkbox" name="atalent_etc" class="btn-check" id="마임"
                                                    value="마임" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="마임">마임</label>

                                                <input type="checkbox" name="atalent_etc" class="btn-check" id="오토바이면허"
                                                    value="오토바이면허" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="오토바이면허">오토바이면허</label>
                                            </div>
                                            <div class="btn-group btn-group-sm mb-4" role="group"
                                                aria-label="Basic checkbox toggle button group">
                                                <input type="checkbox" name="atalent_etc" class="btn-check" id="1종보통면허"
                                                    value="1종보통면허" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="1종보통면허">1종보통면허</label>

                                                <input type="checkbox" name="atalent_etc" class="btn-check" id="1종대형면허"
                                                    value="1종대형면허" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="1종대형면허">1종대형면허</label>

                                                <input type="checkbox" name="atalent_etc" class="btn-check" id="1종특수면허"
                                                    value="1종특수면허" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="1종특수면허">1종특수면허</label>

                                                <input type="checkbox" name="atalent_etc" class="btn-check" id="2종보통면허"
                                                    value="2종보통면허" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="2종보통면허">2종보통면허</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary"
                                            data-bs-dismiss="modal">취소</button>
                                        <button type="button" class="btn btn-primary">저장</button>
                                    </div>
                                </div>
                            </div>
                        </div>
      	  	
      	 
	 
<br><br><br>
<button type="submit" class="btn btn-primary" >등록</button>
<button type="button" class="btn btn-primary" onclick="location.href='/audition/list'">목록</button>
</div>
</div>
</div>


</form>

<!-- 사진업로드 모달 -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">사진업로드</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      			<!-- 사진업로드 -->
      	  			<label class="upload_button" for="photo_upload" >사진 선택</label>
      	  			<form id="ajaxform" enctype = "multipart/form-data">
      	  				<input type="file" class="photo_upload" id="photo_upload" accept="image/*" required multiple>
      	  				<output id="list"></output>
			      	    <img id="preview_photo" width="400">
			      	 
      	  	
      	  	<!-- 업로드파읾 미리보기 -->
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
      	  	<!-- 파일업로드 -->
      	  	
			<script type="text/javascript">
				$("#files_send").click(function(){
					var formData = new FormData();
					var temp = $("#photo_upload")[0].files[0];
		console.log(temp);
		
		  for(var i=0; i<$('#photo_upload')[0].files.length; i++){
			  formData.append('uploadFile', $('#photo_upload')[0].files[i]);
		  }
		  for (var key of formData.keys()) {
			  console.log(key);

			}
		  
			$.ajax({
				type : "POST",
				url : "/audition/uploadImage",
		        processData: false,
		        contentType: false,
				data : formData,
				success : function(data) {
					alert('업로드 성공')

				},
				error : function(xhr, status, error) {
					alert(error);
				}
			});
		
	});
			</script>
			<button type="submit" class="btn btn-primary" id="files_send">사진 저장</button>
			<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
			</form>
      	  </div>
      	  <div class="modal-footer">
      </div>
    </div>
  </div>
</div>


<%@ include file="./footer.jsp" %>

</body>
</html>