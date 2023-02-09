<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); 
String member_id = request.getParameter("member_id");
String member_name = request.getParameter("member_name");
String member_email = request.getParameter("member_email");
%>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Sign Up</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">

    // 아이디 중복확인 및 유효성 검사
    var confirmId = false;
    function checkId(event) {
        const input = event.target;
        const errorMessage = document.getElementById('id_check');
        errorMessage.style.color = "#FA3E3E";

        if (!input.validity.valid) {
            errorMessage.textContent = '6~15자의 영문 소문자, 숫자만 사용 가능합니다';
        } else {
            const username = input.value;
            if (username) {
                $.ajax({
                    type: "POST",
                    url: "/member/checkid",
                    contentType: "text/plain",
                    data: username,
                    success: function (response) {
                        if (response == "이미 사용중인 아이디입니다.") {
                            $("#id_check").html(response).css("color", "#FA3E3E");
                            confirmId = false;
                        } else {
                            $("#id_check").html(response).css("color", "green");
                            confirmId = true;
                        }
                    }
                });
            } else {
                $("#id_check").html("ID를 입력해 주세요").css("color", "#FA3E3E");
            }
        }
    }

    // 비밀번호 유효성 검사
    function checkPw(event) {
        const input = event.target;
        let pass1 = $("#pw1").val();

        if (pass1 == "") {
            $("#pw_check").html("비밀번호를 입력하세요").css("color", "#FA3E3E");
        } else {
            if (!input.validity.valid) {
                $("#pw_check").html("8~20자의 영문, 숫자, 특수문자 각 1개 이상 사용해 주세요").css("color", "#FA3E3E");
            } else {
                $("#pw_check").html("비밀번호 사용가능합니다").css("color", "green");
            }
        }
    }


    // 비밀번호 재확인
    function confirmPw() {
        let pass1 = $("#pw1").val();
        let pass2 = $("#pw2").val();

        if (pass1 != "" && pass2 != "") {
            if (pass1 == pass2) {
                $("#confirm_pw").html('비밀번호 일치합니다');
                $("#confirm_pw").css('color', 'green');
            } else {
                $("#confirm_pw").html('비밀번호가 일치하지 않습니다');
                $("#confirm_pw").css('color', '#FA3E3E');
            }
        } else {
            $("#confirm_pw").html('');
        }

        $("#pw1").change(confirmPw);
        $("#pw2").change(confirmPw);

    }

    // 이름 유효성 검사
    function checkName(event) {
        const input = event.target;
        let name = $("#name").val();

        if (name == "") {
            $("#name_check").html("이름을 입력하세요").css("color", "#FA3E3E");
        }else{
            if(!input.validity.valid){
                $("#name_check").html("한글만 사용 가능합니다").css("color", "#FA3E3E");
            }else{
                $("#name_check").html("");
            }
        }
    }

    // 주소 찾기
    window.onload = function () {
        document.getElementById("addr").addEventListener("click", function () {
            new daum.Postcode({
                oncomplete: function (data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if (data.userSelectedType === 'R') {
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if (data.buildingName !== '' && data.apartment === 'Y') {
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }

                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById("addr").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("addr_detail").focus();
                }
            }).open();

        });

    }

    // 상세주소 유효성 검사
    function checkAddr(event){
        const input = event.target;
        let addr_detail = $("#addr_detail").val();

        if(addr_detail == ""){
            $("#addr_check").html("상세주소를 입력하세요").css("color", "#FA3E3E");
        }else{
            if(!input.validity.valid){
                $("#addr_check").html("한글, 숫자만 사용 가능합니다").css("color", "#FA3E3E");
            }else{
                $("#addr_check").html("");
            }
        }
    }

    // 휴대전화 유효성 검사 및 중복체크
    var confirmPhone = false;
    function checkPhone(event){
        const input = event.target;
        let phone = input.value.replace(/[^0-9]/g, '');
        input.value = phone.replace(/(\d{3})(\d{4})(\d{4})/, `$1-$2-$3`);
        let phoneCheck = document.getElementById("phone_check");
        phoneCheck.style.color = "#FA3E3E";

        if(!input.validity.valid){
            phoneCheck.innerHTML = "010XXXXOOOO 형식으로 입력하세요";
        } else{
            const userphone = input.value;
            if(userphone){
                $.ajax({
                    type : "POST",
                    url : "/member/checkphone",
                    contentType: "text/plain",
                    data : userphone,
                    success : function(response){
                        if(response == "이미 사용중인 번호입니다."){
                            $("#phone_check").html(response).css("color", "#FA3E3E");
                            confirmPhone = false;
                        }else{
                            $("#phone_check").html(response).css("color", "#green");
                            confirmPhone = true;
                        }
                    }
                });
            }else{
                $("#phone_check").html("휴대전화를 입력하세요").css("color", "#FA3E3E");
            }
        }
    }

    // 이메일 중복체크
    var duplicationEmail = false;
    function emailCheck(event) {
        const input = event.target;
        const errorMessage = document.getElementById('email_check');
        errorMessage.style.color = "#FA3E3E";

        if(input == ""){
            errorMessage.textContent = '이메일을 입력하세요';
        }else{
            const useremail = input.value;
            if (useremail) {
                $.ajax({
                    type: "POST",
                    url: "/member/checkemail",
                    contentType: "text/plain",
                    data: useremail,
                    success: function (response) {
                        if (response == "이미 사용중인 이메일입니다.") {
                            $("#email_check").html(response).css("color", "#FA3E3E");
                            duplicationEmail = false;
                        } else {
                            $("#email_check").html(response).css("color", "green");
                            duplicationEmail = true;
                        }
                    }
                });
            }

        }
        
    }

    // 이메일 인증번호
    var confirmChk = false; // 이게 인증번호 일치, 불일치 판단을 해서 return false면 불일치여서 회원가입 불가능하게 해주는 역할!!!
    $(function(){
        var $email = $("#email");
        var $checkEmail = $("#checkEmail");
        var $confirmEmail = $("#confirmEmail");
        $checkEmail.click(function () {
            $.ajax({
                type: "POST",
                url: "/member/confirmMail",
                data: {
                    "email": $email.val()
                },
                success: function (data) {
                    alert("해당 이메일로 인증번호 발송이 완료되었습니다. \n확인부탁드립니다.")
                    // console.log("data : " + data);
                    chkEmailConfirm(data, $confirmEmail);
                }
            })
        })
    });

    // 이메일 인증번호 체크
    function chkEmailConfirm(data, $confirmEmail) {
        $confirmEmail.on("keyup", function () {
            if (data != $confirmEmail.val()) {
                $("#confirm_email").html("인증번호가 일치하지 않습니다.").css("color", "#FA3E3E");
                confirmChk = false;
            } else {
                $("#confirm_email").html("인증번호가 확인되었습니다").css("color", "green");
                confirmChk = true;
            }
        })
    }

    // 생년월일 유효성 검사
    function checkYear(event){
        const input = event.target;
        let year = $("#year").val();

        if(year == ""){
            $("#year_check").html("태어난 년도를 입력하세요").css("color", "#FA3E3E");
        }else{
            if(!input.validity.valid){
                $("#year_check").html("태어난 년도 4자리를 정확하게 입력하세요").css("color", "#FA3E3E");
            }else{
                $("#year_check").html("");
            }
        }
    }

    function checkDate(event){
        const input = event.target;
        let date = $("#date").val();

        if(date == ""){
            $("#date_check").html("태어난 일자를 입력하세요").css("color", "#FA3E3E");
        }else{
            if(!input.validity.valid){
                $("#date_check").html("태어난 일자 2자리를 정확하게 입력하세요").css("color", "#FA3E3E");
            }else{
                $("#date_check").html("");
            }
        }
    }

    // 컴퍼니,아티스트 선택시
    $(function () {
        $('#artist').click(function () {
            if ($("#noneDiv").css("display") == "none") {
                $('#noneDiv').show();
            }
        });
    });
    $(function () {
        $('#company').click(function () {
            if ($("#nonDiv").css("display") != "none") {
                $('#noneDiv').hide();
            }
        });
    });

    // 조건 만족 못할 시 회원가입 불가
    // joinform_check 함수로 유효성 검사
    function joinform_check() {
        var id = document.getElementById("id");
        var pw1 = document.getElementById("pw1");
        var pw2 = document.getElementById("pw2");
        var name = document.getElementById("name");
        var addr = document.getElementById("addr");
        var addr_detail = document.getElementById("addr_detail");
        var phone = document.getElementById("phone");
        var email = document.getElementById("email");
        var confirmEmail = document.getElementById("confirmEmail");
        var year = document.getElementById("year");
        var month = document.getElementById("month");
        var date = document.getElementById("date");

        // console.log("email : " + email);
        // console.log("confirmEmail: " + confirmEmail);
        // console.log("confirmChk : " + confirmChk);

        if (id.value == "") { //해당 입력값이 없을 경우 같은말: if(!id.value)
            alert("아이디를 입력하세요.");
            id.focus(); 
            return false; 
        };

        // 아이디 중복시 회원가입 불가
        if (!confirmId) {
            alert("이미 사용중인 아이디입니다.");
            id.focus();
            return false;
        }

        if (pw1.value == "") {
            alert("비밀번호를 입력하세요.");
            pw1.focus();
            return false;
        };

        if (pw2.value !== pw1.value) {
            alert("비밀번호가 일치하지 않습니다.");
            pw2.focus();
            return false;
        };

        if (name.value == "") {
            alert("이름을 입력하세요.");
            name.focus();
            return false;
        };

        if (addr.value == "") {
            alert("주소를 입력하세요.");
            addr.focus();
            return false;
        }

        if (addr_detail.value == "") {
            alert("상세주소를 입력하세요.");
            addr_detail.focus();
            return false;
        }

        if (phone.value == "") {
            alert("전화번호를 입력하세요.");
            phone.focus();
            return false;
        }
        
        // 전화번호 중복시 회원가입 불가
        if (!confirmPhone) {
            alert("이미 사용중인 전화번호입니다.");
            phone.focus();
            return false;
        }

        if (email.value == "") {
            alert("이메일 주소를 입력하세요.");
            email.focus();
            return false;
        }

        // 이메일 중복시 회원가입 불가
        if (!duplicationEmail) {
            alert("이미 사용중인 이메일입니다.");
            email.focus();
            return false;
        }

        if (confirmEmail.value == "") {
            alert("인증번호를 입력하세요.");
            confirmEmail.focus();
            return false;
        }
        
        if (!confirmChk){
            alert("인증번호가 틀렸습니다.");
            confirmEmail.focus();
            return false;
        }

        if (year.value == "") {
            alert("생년월일을 입력하세요.");
            year.focus();
            return false;
        }

        if (month.value == "월") {
            alert("생년월일을 입력하세요.");
            month.focus();
            return false;
        }

        if (date.value == "") {
            alert("생년월일을 입력하세요.");
            date.focus();
            return false;
        }
        
        alert("회원가입 완료");

    }


</script>
<style>
    body {
        background-color: #020204;
    }

    label {
        color: white;
    }
</style>

<body>
    <div class="text-center pt-5">
        <a href="#"><img src="/resources/img/logo_header.png" width="100px"></a>
    </div>

    <!-- <form action="/member/signup" method="post" autocomplete="off" name="join_form"> -->
    <form action="/member/signup" method="post" autocomplete="off" onsubmit="return joinform_check()">
        <div class="container py-5">
            <div class="row">
                <div class="col-4">
                </div>
                <div class="col-4" style="background-color: rgb(36, 36, 36); border-radius: 15px;">
                    <div class="col">
                        <label for="id" class="form-label pt-3">아이디</label>
                        <input type="text" class="form-control" name="member_id" id="id" 
                        pattern="^[a-z0-9]{6,15}$" oninput="checkId(event)" minlength="6" maxlength="15" value="<%=member_id %>" />
                        <div id="id_check"></div>
                    </div>
                    <br>
                    <div class="col">
                        <label for="pw1" class="form-label">비밀번호</label>
                        <input type="password" class="form-control" id="pw1" 
                        pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$" 
                        oninput="checkPw(event)" minlength="8" maxlength="20">
                        <div id="pw_check"></div>
                    </div>
                    <br>
                    <div class="col">
                        <label for="pw2" class="form-label">비밀번호 재확인</label>
                        <input type="password" class="form-control" name="member_password" id="pw2" 
                        oninput="confirmPw()" minlength="6" maxlength="20">
                        <div id="confirm_pw"></div>
                    </div>

                    <br>
                    <div class="col">
                        <label for="name">이름</label>
                        <input type="text" class="form-control" name="member_name" id="name" 
                        pattern="^[가-힣]+$"
                        oninput="checkName(event)" maxlength="20" value="<%=member_name %>" />
                        <div id="name_check"></div>
                    </div>
                    <br>
                    <!-- 카카오 주소 api 사용 -->
                    <div class="col">
                        <label for="addr">주소</label>
                        <input type="text" class="form-control" name="member_addr" id="addr"><br>
                        <label for="addr_detail">상세 주소</label>
                        <input type="text" class="form-control" name="member_addr" id="addr_detail" 
                        pattern="^[가-힣|0-9|]+$" oninput="checkAddr(event)">
                        <div id="addr_check"></div>
                    </div>
                    <br>
                    <div class="col">
                        <label for="phone">휴대전화</label>
                        <input type="tel" class="form-control" name="member_phone" id="phone" placeholder="숫자만 입력하세요"
                        pattern="^010-\d{4}-\d{4}$" oninput="checkPhone(event)" maxlength="13">
                        <div id="phone_check"></div>
                    </div>
                    <br>
                    <div class="row g-0 pb-3">
                        <div class="col-9">
                            <label for="email">이메일</label>
                            <input type="email" class="form-control" name="member_email" id="email" oninput="emailCheck(event)" value="<%=member_email %>" />
                            <div id="email_check"></div>
                        </div>
                        <div class="col-3 pt-4 text-end">
                            <div class="btn-group" role="group" style="background-color: #4F5B6A;">
                                <button type="button" class="btn btn-outline-light btn-md" id="checkEmail">인증번호</button>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <label for="confirmEmail" id="confirmEmailTxt">인증번호</label>
                        <input type="text" class="form-control" id="confirmEmail">
                        <div id="confirm_email"></div>
                    </div>
                    <br>

                    <div class="row g-2">
                        <label for="birthday">생년월일</label>
                        <div class="col-4">
                            <input type="text" class="form-control" name="member_birth" id="year" placeholder="년(4자)"
                                pattern="^(19[0-9][0-9]|20\d{2})$" oninput="checkYear(event)" maxlength="4">
                            </div>
                            <div class="col-4">
                                <select name="member_birth" class="form-control" id="month" aria-label="월">
                                    <option value="월">월</option>
                                    <option value="01">1</option>
                                    <option value="02">2</option>
                                    <option value="03">3</option>
                                    <option value="04">4</option>
                                    <option value="05">5</option>
                                    <option value="06">6</option>
                                    <option value="07">7</option>
                                    <option value="08">8</option>
                                    <option value="09">9</option>
                                    <option value="10">10</option>
                                    <option value="11">11</option>
                                    <option value="12">12</option>
                                </select>
                            </div>
                            <div class="col-4">
                                <input type="text" class="form-control" name="member_birth" id="date" placeholder="일" 
                                pattern="^(0[1-9]|[1-2][0-9]|3[0-1])$" oninput="checkDate(event)" maxlength="2">
                            </div>
                        </div>
                        <div id="year_check"></div>
                        <div id="date_check"></div>
                    <br>

                    <label for="">포지션 선택</label>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="member_type" id="company" value="company" checked>
                        <label class="form-check-label" for="company">
                            컴퍼니
                        </label>
                    </div>
                    <div class="form-check pb-3">
                        <input class="form-check-input" type="radio" name="member_type" id="artist" value="artist">
                        <label class="form-check-label" for="artist">
                            아티스트
                        </label>
                    </div>

                    <div id="noneDiv" style="display: none;">
                        <div class="row pb-3">
                            <div class="col pb-1">
                                <label for="gender" class="pb-1">성별</label>
                                <select class="form-control" name="member_gender" id="gender">
                                    <option value="남성">남성</option>
                                    <option value="여성">여성</option>
                                </select>
                            </div>
                            <div class="col pb-1">
                                <label for="height" class="pb-1">키</label>
                                <input type="text" class="form-control" name="member_tall" id="height" 
                                oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="3">
                            </div>
                        </div>

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

                        <!-- Modal -->
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
                                                <input type="checkbox" name="member_keyword" class="btn-check" id="청순한"
                                                    value="청순한" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="청순한">청순한</label>

                                                <input type="checkbox" name="member_keyword" class="btn-check" id="귀여운"
                                                    value="귀여운" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="귀여운">귀여운</label>

                                                <input type="checkbox" name="member_keyword" class="btn-check" id="연약한"
                                                    value="연약한" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="연약한">연약한</label>

                                                <input type="checkbox" name="member_keyword" class="btn-check" id="소심한"
                                                    value="소심한" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="소심한">소심한</label>

                                                <input type="checkbox" name="member_keyword" class="btn-check" id="말괄량이"
                                                    value="말괄량이" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="말괄량이">말괄량이</label>

                                                <input type="checkbox" name="member_keyword" class="btn-check" id="다정한"
                                                    value="다정한" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="다정한">다정한</label>

                                                <input type="checkbox" name="member_keyword" class="btn-check" id="여성스러운"
                                                    value="여성스러운" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="여성스러운">여성스러운</label>

                                                <input type="checkbox" name="member_keyword" class="btn-check" id="지적인"
                                                    value="지적인" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="지적인">지적인</label>
                                            </div>
                                            <div class="btn-group btn-group-sm" role="group"
                                                aria-label="Basic checkbox toggle button group">
                                                <input type="checkbox" name="member_keyword" class="btn-check" id="단정한"
                                                    value="단정한" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="단정한">단정한</label>

                                                <input type="checkbox" name="member_keyword" class="btn-check" id="헌신적인"
                                                    value="헌신적인" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="헌신적인">헌신적인</label>

                                                <input type="checkbox" name="member_keyword" class="btn-check" id="섹시한"
                                                    value="섹시한" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="섹시한">섹시한</label>

                                                <input type="checkbox" name="member_keyword" class="btn-check" id="여우같은"
                                                    value="여우같은" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="여우같은">여우같은</label>

                                                <input type="checkbox" name="member_keyword" class="btn-check" id="세련된"
                                                    value="세련된" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="세련된">세련된</label>

                                                <input type="checkbox" name="member_keyword" class="btn-check" id="도도한"
                                                    value="도도한" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="도도한">도도한</label>

                                                <input type="checkbox" name="member_keyword" class="btn-check" id="똑부러지는"
                                                    value="똑부러지는" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="똑부러지는">똑부러지는</label>

                                                <input type="checkbox" name="member_keyword" class="btn-check" id="털털한"
                                                    value="털털한" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="털털한">털털한</label>
                                            </div>
                                            <div class="btn-group btn-group-sm" role="group"
                                                aria-label="Basic checkbox toggle button group">
                                                <input type="checkbox" name="member_keyword" class="btn-check" id="자유로운"
                                                    value="자유로운" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="자유로운">자유로운</label>

                                                <input type="checkbox" name="member_keyword" class="btn-check" id="성숙한"
                                                    value="성숙한" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="성숙한">성숙한</label>

                                                <input type="checkbox" name="member_keyword" class="btn-check" id="예민한"
                                                    value="예민한" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="예민한">예민한</label>

                                                <input type="checkbox" name="member_keyword" class="btn-check" id="밝은"
                                                    value="밝은" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="밝은">밝은</label>

                                                <input type="checkbox" name="member_keyword" class="btn-check" id="부드러운"
                                                    value="부드러운" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="부드러운">부드러운</label>

                                                <input type="checkbox" name="member_keyword" class="btn-check" id="순수한"
                                                    value="순수한" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="순수한">순수한</label>

                                                <input type="checkbox" name="member_keyword" class="btn-check" id="깔끔한"
                                                    value="깔끔한" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="깔끔한">깔끔한</label>

                                                <input type="checkbox" name="member_keyword" class="btn-check" id="스마트한"
                                                    value="스마트한" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="스마트한">스마트한</label>
                                            </div>
                                            <div class="btn-group btn-group-sm" role="group"
                                                aria-label="Basic checkbox toggle button group">
                                                <input type="checkbox" name="member_keyword" class="btn-check" id="까칠한"
                                                    value="까칠한" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="까칠한">까칠한</label>

                                                <input type="checkbox" name="member_keyword" class="btn-check" id="위엄있는"
                                                    value="위엄있는" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="위엄있는">위엄있는</label>

                                                <input type="checkbox" name="member_keyword" class="btn-check" id="능글맞은"
                                                    value="능글맞은" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="능글맞은">능글맞은</label>

                                                <input type="checkbox" name="member_keyword" class="btn-check" id="장난끼있는"
                                                    value="장난끼있는" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="장난끼있는">장난끼있는</label>

                                                <input type="checkbox" name="member_keyword" class="btn-check" id="반항적인"
                                                    value="반항적인" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="반항적인">반항적인</label>

                                                <input type="checkbox" name="member_keyword" class="btn-check" id="터프한"
                                                    value="터프한" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="터프한">터프한</label>

                                                <input type="checkbox" name="member_keyword" class="btn-check" id="과묵한"
                                                    value="과묵한" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="과묵한">과묵한</label>

                                                <input type="checkbox" name="member_keyword" class="btn-check" id="거만한"
                                                    value="거만한" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="거만한">거만한</label>
                                            </div>
                                            <div class="btn-group btn-group-sm" role="group"
                                                aria-label="Basic checkbox toggle button group">
                                                <input type="checkbox" name="member_keyword" class="btn-check" id="인자한"
                                                    value="인자한" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="인자한">인자한</label>

                                                <input type="checkbox" name="member_keyword" class="btn-check" id="불쌍한"
                                                    value="불쌍한" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="불쌍한">불쌍한</label>

                                                <input type="checkbox" name="member_keyword" class="btn-check" id="로맨틱한"
                                                    value="로맨틱한" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="로맨틱한">로맨틱한</label>

                                                <input type="checkbox" name="member_keyword" class="btn-check" id="건강한"
                                                    value="건강한" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="건강한">건강한</label>

                                                <input type="checkbox" name="member_keyword" class="btn-check" id="비열한"
                                                    value="비열한" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="비열한">비열한</label>

                                                <input type="checkbox" name="member_keyword" class="btn-check" id="순박한"
                                                    value="순박한" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="순박한">순박한</label>

                                                <input type="checkbox" name="member_keyword" class="btn-check" id="독특한"
                                                    value="독특한" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="독특한">독특한</label>

                                                <input type="checkbox" name="member_keyword" class="btn-check" id="똑똑한"
                                                    value="똑똑한" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="똑똑한">똑똑한</label>

                                                <input type="checkbox" name="member_keyword" class="btn-check" id="싸이코패스"
                                                    value="싸이코패스" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="싸이코패스">싸이코패스</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <!-- <button type="button" class="btn btn-secondary"
                                            data-bs-dismiss="modal">취소</button> -->
                                        <button type="button" class="btn btn-primary"
                                            data-bs-dismiss="modal">저장</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Modal -->
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
                                                <input type="checkbox" name="member_body" class="btn-check" id="마른"
                                                    value="마른" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="마른">마른</label>

                                                <input type="checkbox" name="member_body" class="btn-check" id="보통"
                                                    value="보통" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="보통">보통</label>

                                                <input type="checkbox" name="member_body" class="btn-check" id="통통"
                                                    value="통통" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="통통">통통</label>

                                                <input type="checkbox" name="member_body" class="btn-check" id="뚱뚱"
                                                    value="뚱뚱" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="뚱뚱">뚱뚱</label>

                                                <input type="checkbox" name="member_body" class="btn-check" id="탄탄"
                                                    value="탄탄" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="탄탄">탄탄</label>

                                                <input type="checkbox" name="member_body" class="btn-check" id="근육질"
                                                    value="근육질" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="근육질">근육질</label>

                                                <input type="checkbox" name="member_body" class="btn-check" id="덩치"
                                                    value="덩치" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="덩치">덩치</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <!-- <button type="button" class="btn btn-secondary"
                                            data-bs-dismiss="modal">취소</button> -->
                                        <button type="button" class="btn btn-primary"
                                            data-bs-dismiss="modal">저장</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Modal -->
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
                                            <div class="btn-group btn-group-sm" role="group"
                                                aria-label="Basic checkbox toggle button group">
                                                <input type="checkbox" name="talent_music" class="btn-check" id="성악"
                                                    value="성악" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="성악">성악</label>

                                                <input type="checkbox" name="talent_music" class="btn-check" id="알앤비"
                                                    value="알앤비" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="알앤비">알앤비</label>

                                                <input type="checkbox" name="talent_music" class="btn-check" id="락"
                                                    value="락" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="락">락</label>

                                                <input type="checkbox" name="talent_music" class="btn-check" id="발라드"
                                                    value="발라드" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="발라드">발라드</label>

                                                <input type="checkbox" name="talent_music" class="btn-check" id="랩"
                                                    value="랩" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="랩">랩</label>

                                                <input type="checkbox" name="talent_music" class="btn-check" id="뮤지컬"
                                                    value="뮤지컬" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="뮤지컬">뮤지컬</label>

                                                <input type="checkbox" name="talent_music" class="btn-check" id="피아노"
                                                    value="피아노" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="피아노">피아노</label>

                                                <input type="checkbox" name="talent_music" class="btn-check" id="바이올린"
                                                    value="바이올린" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="바이올린">바이올린</label>
                                            </div>
                                            <div class="btn-group btn-group-sm" role="group"
                                                aria-label="Basic checkbox toggle button group">
                                                <input type="checkbox" name="talent_music" class="btn-check" id="플루트"
                                                    value="플루트" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="플루트">플루트</label>

                                                <input type="checkbox" name="talent_music" class="btn-check" id="첼로"
                                                    value="첼로" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="첼로">첼로</label>

                                                <input type="checkbox" name="talent_music" class="btn-check" id="우쿨렐레"
                                                    value="우쿨렐레" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="우쿨렐레">우쿨렐레</label>

                                                <input type="checkbox" name="talent_music" class="btn-check" id="일렉기타"
                                                    value="일렉기타" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="일렉기타">일렉기타</label>

                                                <input type="checkbox" name="talent_music" class="btn-check" id="베이스"
                                                    value="베이스" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="베이스">베이스</label>

                                                <input type="checkbox" name="talent_music" class="btn-check" id="통기타"
                                                    value="통기타" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="통기타">통기타</label>

                                                <input type="checkbox" name="talent_music" class="btn-check" id="트럼펫"
                                                    value="트럼펫" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="트럼펫">트럼펫</label>

                                            </div>
                                            <div class="btn-group btn-group-sm mb-4" role="group"
                                                aria-label="Basic checkbox toggle button group">
                                                <input type="checkbox" name="talent_music" class="btn-check" id="트럼본"
                                                    value="트럼본" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="트럼본">트럼본</label>

                                                <input type="checkbox" name="talent_music" class="btn-check" id="색소폰"
                                                    value="색소폰" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="색소폰">색소폰</label>

                                                <input type="checkbox" name="talent_music" class="btn-check" id="튜바"
                                                    value="튜바" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="튜바">튜바</label>

                                                <input type="checkbox" name="talent_music" class="btn-check" id="클라리넷"
                                                    value="클라리넷" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="클라리넷">클라리넷</label>

                                                <input type="checkbox" name="talent_music" class="btn-check" id="하모니카"
                                                    value="하모니카" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="하모니카">하모니카</label>

                                                <input type="checkbox" name="talent_music" class="btn-check" id="디제잉"
                                                    value="디제잉" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="디제잉">디제잉</label>

                                                <input type="checkbox" name="talent_music" class="btn-check" id="아코디언"
                                                    value="아코디언" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="아코디언">아코디언</label>

                                            </div>
                                        </div>
                                        <div class="row">
                                            <label for="" class="mb-2" style="color: #020204;">춤</label>
                                            <div class="btn-group btn-group-sm" role="group"
                                                aria-label="Basic checkbox toggle button group">
                                                <input type="checkbox" name="talent_dance" class="btn-check" id="에어로빅"
                                                    value="에어로빅" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="에어로빅">에어로빅</label>

                                                <input type="checkbox" name="talent_dance" class="btn-check" id="리듬체조"
                                                    value="리듬체조" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="리듬체조">리듬체조</label>

                                                <input type="checkbox" name="talent_dance" class="btn-check" id="요가"
                                                    value="요가" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="요가">요가</label>

                                                <input type="checkbox" name="talent_dance" class="btn-check" id="밸리댄스"
                                                    value="밸리댄스" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="밸리댄스">밸리댄스</label>

                                                <input type="checkbox" name="talent_dance" class="btn-check" id="플라멩고"
                                                    value="플라멩고" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="플라멩고">플라멩고</label>

                                                <input type="checkbox" name="talent_dance" class="btn-check" id="폴카"
                                                    value="폴카" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="폴카">폴카</label>

                                                <input type="checkbox" name="talent_dance" class="btn-check" id="발레"
                                                    value="발레" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="발레">발레</label>
                                            </div>
                                            <div class="btn-group btn-group-sm mb-4" role="group"
                                                aria-label="Basic checkbox toggle button group">
                                                <input type="checkbox" name="talent_dance" class="btn-check" id="라틴댄스"
                                                    value="라틴댄스" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="라틴댄스">라틴댄스</label>

                                                <input type="checkbox" name="talent_dance" class="btn-check" id="현대무용"
                                                    value="현대무용" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="현대무용">현대무용</label>

                                                <input type="checkbox" name="talent_dance" class="btn-check" id="재즈댄스"
                                                    value="재즈댄스" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="재즈댄스">재즈댄스</label>

                                                <input type="checkbox" name="talent_dance" class="btn-check" id="스트릿댄스"
                                                    value="스트릿댄스" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="스트릿댄스">스트릿댄스</label>

                                                <input type="checkbox" name="talent_dance" class="btn-check" id="탭댄스"
                                                    value="탭댄스" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="탭댄스">탭댄스</label>

                                                <input type="checkbox" name="talent_dance" class="btn-check" id="비보잉"
                                                    value="비보잉" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="비보잉">비보잉</label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label for="" class="mb-2" style="color: #020204;">운동</label>
                                            <div class="btn-group btn-group-sm" role="group"
                                                aria-label="Basic checkbox toggle button group">
                                                <input type="checkbox" name="talent_sports" class="btn-check" id="축구"
                                                    value="축구" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="축구">축구</label>

                                                <input type="checkbox" name="talent_sports" class="btn-check" id="탁구"
                                                    value="탁구" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="탁구">탁구</label>

                                                <input type="checkbox" name="talent_sports" class="btn-check" id="당구"
                                                    value="당구" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="당구">당구</label>

                                                <input type="checkbox" name="talent_sports" class="btn-check" id="볼링"
                                                    value="볼링" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="볼링">볼링</label>

                                                <input type="checkbox" name="talent_sports" class="btn-check" id="테니스"
                                                    value="테니스" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="테니스">테니스</label>

                                                <input type="checkbox" name="talent_sports" class="btn-check" id="배드민턴"
                                                    value="배드민턴" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="배드민턴">배드민턴</label>

                                                <input type="checkbox" name="talent_sports" class="btn-check" id="골프"
                                                    value="골프" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="골프">골프</label>

                                                <input type="checkbox" name="talent_sports" class="btn-check" id="스쿼시"
                                                    value="스쿼시" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="스쿼시">스쿼시</label>

                                                <input type="checkbox" name="talent_sports" class="btn-check" id="야구"
                                                    value="야구" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="야구">야구</label>
                                            </div>
                                            <div class="btn-group btn-group-sm" role="group"
                                                aria-label="Basic checkbox toggle button group">
                                                <input type="checkbox" name="talent_sports" class="btn-check" id="농구"
                                                    value="농구" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="농구">농구</label>

                                                <input type="checkbox" name="talent_sports" class="btn-check" id="족구"
                                                    value="족구" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="족구">족구</label>

                                                <input type="checkbox" name="talent_sports" class="btn-check" id="럭비"
                                                    value="럭비" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="럭비">럭비</label>

                                                <input type="checkbox" name="talent_sports" class="btn-check" id="배구"
                                                    value="배구" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="배구">배구</label>

                                                <input type="checkbox" name="talent_sports" class="btn-check" id="사격"
                                                    value="사격" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="사격">사격</label>

                                                <input type="checkbox" name="talent_sports" class="btn-check" id="양궁"
                                                    value="양궁" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="양궁">양궁</label>

                                                <input type="checkbox" name="talent_sports" class="btn-check" id="주짓수"
                                                    value="주짓수" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="주짓수">주짓수</label>

                                                <input type="checkbox" name="talent_sports" class="btn-check" id="킥복싱"
                                                    value="킥복싱" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="킥복싱">킥복싱</label>

                                                <input type="checkbox" name="talent_sports" class="btn-check" id="쿵푸"
                                                    value="쿵푸" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="쿵푸">쿵푸</label>
                                            </div>
                                            <div class="btn-group btn-group-sm mb-4" role="group"
                                                aria-label="Basic checkbox toggle button group">
                                                <input type="checkbox" name="talent_sports" class="btn-check" id="합기도"
                                                    value="합기도" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="합기도">합기도</label>

                                                <input type="checkbox" name="talent_sports" class="btn-check" id="태권도"
                                                    value="태권도" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="태권도">태권도</label>

                                                <input type="checkbox" name="talent_sports" class="btn-check" id="특공무술"
                                                    value="특공무술" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="특공무술">특공무술</label>

                                                <input type="checkbox" name="talent_sports" class="btn-check" id="권투"
                                                    value="권투" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="권투">권투</label>

                                                <input type="checkbox" name="talent_sports" class="btn-check" id="검도"
                                                    value="검도" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="검도">검도</label>

                                                <input type="checkbox" name="talent_sports" class="btn-check" id="레슬링"
                                                    value="레슬링" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="레슬링">레슬링</label>

                                                <input type="checkbox" name="talent_sports" class="btn-check" id="유도"
                                                    value="유도" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="유도">유도</label>

                                                <input type="checkbox" name="talent_sports" class="btn-check" id="이종격투기"
                                                    value="이종격투기" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="이종격투기">이종격투기</label>

                                                <input type="checkbox" name="talent_sports" class="btn-check" id="승마"
                                                    value="승마" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="승마">승마</label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label for="" class="mb-2" style="color: #020204;">언어</label>
                                            <div class="btn-group btn-group-sm" role="group"
                                                aria-label="Basic checkbox toggle button group">
                                                <input type="checkbox" name="talent_language" class="btn-check" id="경상도 사투리"
                                                    value="경상도 사투리" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="경상도 사투리">경상도 사투리</label>

                                                <input type="checkbox" name="talent_language" class="btn-check" id="전라도 사투리"
                                                    value="전라도 사투리" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="전라도 사투리">전라도 사투리</label>

                                                <input type="checkbox" name="talent_language" class="btn-check" id="충청도 사투리"
                                                    value="충청도 사투리" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="충청도 사투리">충청도 사투리</label>

                                                <input type="checkbox" name="talent_language" class="btn-check" id="강원도 사투리"
                                                    value="강원도 사투리" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="강원도 사투리">강원도 사투리</label>

                                                <input type="checkbox" name="talent_language" class="btn-check" id="제주도 사투리"
                                                    value="제주도 사투리" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="제주도 사투리">제주도 사투리</label>

                                                <input type="checkbox" name="talent_language" class="btn-check" id="북한 사투리"
                                                    value="북한 사투리" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="북한 사투리">북한 사투리</label>

                                                <input type="checkbox" name="talent_language" class="btn-check" id="연변 사투리"
                                                    value="연변 사투리" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="연변 사투리">연변 사투리</label>
                                            </div>
                                            <div class="btn-group btn-group-sm" role="group"
                                                aria-label="Basic checkbox toggle button group">
                                                <input type="checkbox" name="talent_language" class="btn-check" id="영어"
                                                    value="영어" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="영어">영어</label>

                                                <input type="checkbox" name="talent_language" class="btn-check" id="중국어"
                                                    value="중국어" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="중국어">중국어</label>

                                                <input type="checkbox" name="talent_language" class="btn-check" id="일본어"
                                                    value="일본어" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="일본어">일본어</label>

                                                <input type="checkbox" name="talent_language" class="btn-check" id="베트남어"
                                                    value="베트남어" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="베트남어">베트남어</label>

                                                <input type="checkbox" name="talent_language" class="btn-check" id="러시아어"
                                                    value="러시아어" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="러시아어">러시아어</label>

                                                <input type="checkbox" name="talent_language" class="btn-check" id="불어"
                                                    value="불어" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="불어">불어</label>

                                                <input type="checkbox" name="talent_language" class="btn-check" id="스페인어"
                                                    value="스페인어" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="스페인어">스페인어</label>

                                                <input type="checkbox" name="talent_language" class="btn-check" id="포르투갈어"
                                                    value="포르투갈어" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="포르투갈어">포르투갈어</label>
                                            </div>
                                            <div class="btn-group btn-group-sm" role="group"
                                                aria-label="Basic checkbox toggle button group">
                                                <input type="checkbox" name="talent_language" class="btn-check" id="이탈리아어"
                                                    value="이탈리아어" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="이탈리아어">이탈리아어</label>

                                                <input type="checkbox" name="talent_language" class="btn-check" id="아랍어"
                                                    value="아랍어" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="아랍어">아랍어</label>

                                                <input type="checkbox" name="talent_language" class="btn-check" id="태국어"
                                                    value="태국어" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="태국어">태국어</label>

                                                <input type="checkbox" name="talent_language" class="btn-check" id="루마니아어"
                                                    value="루마니아어" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="루마니아어">루마니아어</label>

                                                <input type="checkbox" name="talent_language" class="btn-check" id="독일어"
                                                    value="독일어" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="독일어">독일어</label>

                                                <input type="checkbox" name="talent_language" class="btn-check" id="네덜란드어"
                                                    value="네덜란드어" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="네덜란드어">네덜란드어</label>

                                                <input type="checkbox" name="talent_language" class="btn-check" id="덴마크어"
                                                    value="덴마크어" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="덴마크어">덴마크어</label>

                                                <input type="checkbox" name="talent_language" class="btn-check" id="스웨덴어"
                                                    value="스웨덴어" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="스웨덴어">스웨덴어</label>
                                            </div>
                                            <div class="btn-group btn-group-sm mb-4" role="group"
                                                aria-label="Basic checkbox toggle button group">
                                                <input type="checkbox" name="talent_language" class="btn-check" id="노르웨이어"
                                                    value="노르웨이어" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="노르웨이어">노르웨이어</label>

                                                <input type="checkbox" name="talent_language" class="btn-check" id="그리스어"
                                                    value="그리스어" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="그리스어">그리스어</label>

                                                <input type="checkbox" name="talent_language" class="btn-check" id="페르시아어"
                                                    value="페르시아어" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="페르시아어">페르시아어</label>

                                                <input type="checkbox" name="talent_language" class="btn-check" id="힌두어"
                                                    value="힌두어" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="힌두어">힌두어</label>

                                                <input type="checkbox" name="talent_language" class="btn-check" id="몽골어"
                                                    value="몽골어" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="몽골어">몽골어</label>

                                                <input type="checkbox" name="talent_language" class="btn-check" id="터키어"
                                                    value="터키어" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="터키어">터키어</label>

                                                <input type="checkbox" name="talent_language" class="btn-check" id="헝가리어"
                                                    value="헝가리어" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="헝가리어">헝가리어</label>

                                                <input type="checkbox" name="talent_language" class="btn-check" id="필란드어"
                                                    value="필란드어" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="필란드어">필란드어</label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label for="" class="mb-2" style="color: #020204;">기타</label>
                                            <div class="btn-group btn-group-sm" role="group"
                                                aria-label="Basic checkbox toggle button group">
                                                <input type="checkbox" name="talent_etc" class="btn-check" id="요리"
                                                    value="요리" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="요리">요리</label>

                                                <input type="checkbox" name="talent_etc" class="btn-check" id="바텐더"
                                                    value="바텐더" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="바텐더">바텐더</label>

                                                <input type="checkbox" name="talent_etc" class="btn-check" id="마술"
                                                    value="마술" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="마술">마술</label>

                                                <input type="checkbox" name="talent_etc" class="btn-check" id="수화"
                                                    value="수화" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="수화">수화</label>

                                                <input type="checkbox" name="talent_etc" class="btn-check" id="마임"
                                                    value="마임" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="마임">마임</label>

                                                <input type="checkbox" name="talent_etc" class="btn-check" id="오토바이면허"
                                                    value="오토바이면허" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="오토바이면허">오토바이면허</label>
                                            </div>
                                            <div class="btn-group btn-group-sm mb-4" role="group"
                                                aria-label="Basic checkbox toggle button group">
                                                <input type="checkbox" name="talent_etc" class="btn-check" id="1종보통면허"
                                                    value="1종보통면허" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="1종보통면허">1종보통면허</label>

                                                <input type="checkbox" name="talent_etc" class="btn-check" id="1종대형면허"
                                                    value="1종대형면허" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="1종대형면허">1종대형면허</label>

                                                <input type="checkbox" name="talent_etc" class="btn-check" id="1종특수면허"
                                                    value="1종특수면허" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="1종특수면허">1종특수면허</label>

                                                <input type="checkbox" name="talent_etc" class="btn-check" id="2종보통면허"
                                                    value="2종보통면허" autocomplete="off">
                                                <label class="btn btn-outline-primary" for="2종보통면허">2종보통면허</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <!-- <button type="button" class="btn btn-secondary"
                                            data-bs-dismiss="modal">취소</button> -->
                                        <button type="button" class="btn btn-primary"
                                            data-bs-dismiss="modal">저장</button>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>

                    <div class="text-center pb-4">
                        <div class="btn-group" role="group" aria-label="Basic outlined example"
                            style="background-color: #4F5B6A;">
                            <button type="submit" class="btn btn-outline-light btn-lg">가입하기</button>
                        </div>
                    </div>

                </div>
                <div class="col-4">
                </div>
            </div>
        </div>
    </form>

    <footer class="pb-5" style="background-color: #020204;">
        <div class="container px-4 px-lg-5">
            <p class="m-0 text-center text-white">Copyright © Your Website 2022</p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>

</body>

</html>