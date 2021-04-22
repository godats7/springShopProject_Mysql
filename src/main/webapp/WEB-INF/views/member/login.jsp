<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous" ></script>
<link rel="stylesheet" href="/resources/css/member/login.css">
</head>
<body>
	<div class="wrapper">
			<div class="wrap">
			<form id="login_form" method="post">
				<div class="logo_wrap">
				<span>Image Mall</span>
				</div>
				<div class="login_wrap">
					<div class="id_wrap">
						<div class="id_input_box">
							<input class="id_input" name="memberId">
						</div>
					</div>
					<div class="pw_wrap">
						<div class="pw_input_box">
							<input class="pw_input" name="memberPw">
						</div>
					</div>
					<c:if test="${result == 0 }">
					<div class="login_warn">아이디 혹은 비밀번호를 잘못입력하셨습니다.</div>
					</c:if>
					<div class="login_btn_wrap">
						<input type="button" class="login_btn" value="로그인">					
					</div>
				</div>
			</form>
			</div>
		</div>
	 
<script>
 
    /* 로그인 버튼 클릭 메서드 */
    $(".login_btn").click(function(){
        
        /* alert("로그인 버튼 작동"); */
        
        /* 로그인 메서드 서버 요청 */
        $("#login_form").attr("action", "/member/login");
        $("#login_form").submit();
        
    });
 
</script>
</body>
</html>