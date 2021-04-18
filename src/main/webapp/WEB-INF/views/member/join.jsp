<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/member/join.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>

<div class="wrapper">
	<form id="join_form" method="post">
	<div class="wrap">
			<div class="subjecet">
				<span>회원가입</span>
			</div>
			<div class="id_wrap">
				<div class="id_name">아이디</div>
				<div class="id_input_box">
					<input class="id_input" name="memberId"><!--name은 memberVO에 있는 선언명  -->
				</div>
				<span class="id_input_re_1">사용 가능한 아이디입니다.</span>
				<span class="id_input_re_2">동일한 아이디가 존재합니다.</span>
			</div>
			<div class="pw_wrap">
				<div class="pw_name">비밀번호</div>
				<div class="pw_input_box">
					<input class="pw_input" name="memberPw"><!--name은 memberVO에 있는 선언명  -->
				</div>
			</div>
			<div class="pwck_wrap">
				<div class="pwck_name">비밀번호 확인</div>
				<div class="pwck_input_box">
					<input class="pwck_input">
				</div>
			</div>
			<div class="user_wrap">
				<div class="user_name">이름</div>
				<div class="user_input_box">
					<input class="user_input" name="memberName"><!--name은 memberVO에 있는 선언명  -->
				</div>
			</div>
			<div class="mail_wrap">
				<div class="mail_name">이메일</div> 
				<div class="mail_input_box">
					<input class="mail_input" name="memberMail"><!--name은 memberVO에 있는 선언명  -->
				</div>
				<div class="mail_check_wrap">
					<div class="mail_check_input_box" id="mail_check_input_box_false">
						<input class="mail_check_input" disabled="disabled">
					</div>
					<div class="mail_check_btn">
						<span>인증번호 전송</span>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="address_wrap">
				<div class="address_name">주소</div>
				<div class="address_input_1_wrap">
					<div class="address_input_1_box">
						<input class="address_input_1" name="memberAddr1"><!--name은 memberVO에 있는 선언명  -->
					</div>
					<div class="address_btn">
						<span>주소 찾기</span>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class ="address_input_2_wrap">
					<div class="address_input_2_box">
						<input class="address_input_2" name="memberAddr2"><!--name은 memberVO에 있는 선언명  -->
					</div>
				</div>
				<div class ="address_input_3_wrap">
					<div class="address_input_3_box">
						<input class="address_input_3"  name="memberAddr3"><!--name은 memberVO에 있는 선언명  -->
					</div>
				</div>
			</div>
			<div class="join_btn_wrap">
				<input type="button" class="join_btn" value="가입하기">
			</div>
		</div>
	</form>
</div>
<script>
$(document).ready(function(){
	//회원가입 버튼(회원가입 기능 작동)
	$(".join_btn").click(function(){
		$("#join_form").attr("action", "/member/join");
		$("#join_form").submit();
	});
});

$('.id_input').on("propertychange - change keyup paste input", function () {
	
	/* console.log("keyup test has no problem"); */
	
	var memberId = $('.id_input').val(); // .id_input에 입력되는 값
	var data = {memberId : memberId}  // '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
	
	$.ajax({
		type : "post",
		url : "/member/memberIdChk",
		data : data,
		success : function(result){
			 console.log("성공 여부" + result);
			 if(result != 'fail'){
					$('.id_input_re_1').css("display","inline-block");
					$('.id_input_re_2').css("display", "none");				
				} else {
					$('.id_input_re_2').css("display","inline-block");
					$('.id_input_re_1').css("display", "none");				
				}
			
		}// success 종료
	}); // end of ajax	
});

/* 인증번호 이메일 전송 */
$(".mail_check_btn").click(function(){
	var email = $(".mail_input").val();   // 입력한 이메일
	    console.log("입력받은 이메일 : " + email)
	    $.ajax({
	        
	        type:"get",
	        url:"mailCheck?email=" + email,
	        success:function(data){
	        	console.log("data : " + data);
	        }
	                
	    });
    
});

</script>
	

</body>
</html>