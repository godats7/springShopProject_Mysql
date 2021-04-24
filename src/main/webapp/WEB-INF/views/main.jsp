<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>:: Welcome to Wookdol`s ImageShop ::</title>
<link rel="stylesheet" href="resources/css/main.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>
	<div class="wrapper">
		<div class="top_gnb_area">
			 <ul class="list">
			 <c:if test="${member == null }">
                <li >
                    <a href="/member/login">로그인</a>
                </li>
                <li>
                    <a href="/member/join">회원가입</a>
                </li>
                <li>
                    고객센터
                </li>
            </c:if>
             <c:if test="${member != null }">             
             		<c:if test="${member.adminCk == 1 }">
                        <li><a href="/admin/main">관리자 페이지</a></li>
                    </c:if>   
                              
                    <li>
                     	<a id="gnb_logout_btn">로그아웃</a>   
                    </li>
                    <li>
                        마이룸
                    </li>
                    <li>
                        장바구니
                    </li>
                </c:if>              
            </ul>  		
		</div>
		<div class="top_area">
			<div class="logo_area">
				<a href="/"><img src="resources/img/mLogo.png"></a>
			</div>
			<div class="search_area">
				<h1>search_area</h1>
			</div>
			<div class="login_area">
			
			<!-- 비 로그인 상태 -->
			<c:if test="${member == null }"> 
				<div class="login_btn"><a href="/member/login">login</a></div>
				<span><a href="/member/join">join</a></span>
			</c:if>
			
			 <!-- 로그인한 상태 -->
                <c:if test="${ member != null }">
             	    <div class="login_success_area">
                        <span>회원 : ${member.memberName}</span>
                        <span>충전금액 : 
       					  <fmt:formatNumber value="${member.money }" pattern="\#,###.##"/></span>
                        <span>포인트 :
                          <fmt:formatNumber value="${member.point }" pattern="#,###" /></span>
                        <a id="logout_btn"  href="/member/logout.do">로그아웃</a><!-- -->
                    </div>            
                </c:if>
			</div>
			<div class="clearfix"></div>			
		</div>
		<div class="navi_bar_area">
			<h1>navi_bar_area</h1>
		</div>
		<div class="content_area">
			<h1>content_area</h1>
		</div><!-- class wrap -->
		
		<!-- Footer 영역 -->
        <div class="footer_nav">
            <div class="footer_nav_container">
                <ul>
                    <li>회사소개</li>
                    <span class="line">|</span>
                    <li>이용약관</li>
                    <span class="line">|</span>
                    <li>고객센터</li>
                    <span class="line">|</span>
                    <li>광고문의</li>
                    <span class="line">|</span>
                    <li>채용정보</li>
                    <span class="line">|</span>
                </ul>
            </div>
        </div> <!-- class="footer_nav" -->
        
        <div class="footer">
            <div class="footer_container">
                
                <div class="footer_left">
                    <img src="resources/img/Logo.png">
                </div>
                <div class="footer_right">
                    (주) wookdolman    owner : Lee wookjong
                    <br>
                    business number : 123-456-7890
                    <br>
                    Tel. : 02-1234-5678(발신자 부담전화)
                    <br>
                    <br>
                    COPYRIGHT(C) <strong>wookdolman co.</strong>    ALL RIGHTS RESERVED.
                </div>
                <div class="clearfix"></div>
            </div>
        </div> <!-- class="footer" -->  
	
	</div> <!-- class wrapper -->
<script>
	$("#gnb_logout_btn").click(function() {
		//alert("로그아웃 완료");
		$.ajax({
			type:"POST",
			url:"/member/logout.do",
			success:function(data){
				alert("로그아웃 완료");
				document.location.reload();	
			}
			
		});//ajax
		console.log("로그아웃완료");
		
	});
</script>
</body>
</html>