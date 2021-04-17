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
				<span>ȸ������</span>
			</div>
			<div class="id_wrap">
				<div class="id_name">���̵�</div>
				<div class="id_input_box">
					<input class="id_input" name="memberId"><!--name�� memberVO�� �ִ� �����  -->
				</div>
				<span class="id_input_re_1">��� ������ ���̵��Դϴ�.</span>
				<span class="id_input_re_2">������ ���̵� �����մϴ�.</span>
			</div>
			<div class="pw_wrap">
				<div class="pw_name">��й�ȣ</div>
				<div class="pw_input_box">
					<input class="pw_input" name="memberPw"><!--name�� memberVO�� �ִ� �����  -->
				</div>
			</div>
			<div class="pwck_wrap">
				<div class="pwck_name">��й�ȣ Ȯ��</div>
				<div class="pwck_input_box">
					<input class="pwck_input">
				</div>
			</div>
			<div class="user_wrap">
				<div class="user_name">�̸�</div>
				<div class="user_input_box">
					<input class="user_input" name="memberName"><!--name�� memberVO�� �ִ� �����  -->
				</div>
			</div>
			<div class="mail_wrap">
				<div class="mail_name">�̸���</div> 
				<div class="mail_input_box">
					<input class="mail_input" name="memberMail"><!--name�� memberVO�� �ִ� �����  -->
				</div>
				<div class="mail_check_wrap">
					<div class="mail_check_input_box">
						<input class="mail_check_input">
					</div>
					<div class="mail_check_button">
						<span>������ȣ ����</span>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="address_wrap">
				<div class="address_name">�ּ�</div>
				<div class="address_input_1_wrap">
					<div class="address_input_1_box">
						<input class="address_input_1" name="memberAddr1"><!--name�� memberVO�� �ִ� �����  -->
					</div>
					<div class="address_btn">
						<span>�ּ� ã��</span>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class ="address_input_2_wrap">
					<div class="address_input_2_box">
						<input class="address_input_2" name="memberAddr2"><!--name�� memberVO�� �ִ� �����  -->
					</div>
				</div>
				<div class ="address_input_3_wrap">
					<div class="address_input_3_box">
						<input class="address_input_3"  name="memberAddr3"><!--name�� memberVO�� �ִ� �����  -->
					</div>
				</div>
			</div>
			<div class="join_btn_wrap">
				<input type="button" class="join_btn" value="�����ϱ�">
			</div>
		</div>
	</form>
</div>
<script>
$(document).ready(function(){
	//ȸ������ ��ư(ȸ������ ��� �۵�)
	$(".join_btn").click(function(){
		$("#join_form").attr("action", "/member/join");
		$("#join_form").submit();
	});
});

</script>
	

</body>
</html>