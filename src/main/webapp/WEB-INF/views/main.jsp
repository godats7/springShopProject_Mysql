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
                    <a href="/member/login">�α���</a>
                </li>
                <li>
                    <a href="/member/join">ȸ������</a>
                </li>
                <li>
                    ������
                </li>
            </c:if>
             <c:if test="${member != null }">             
             		<c:if test="${member.adminCk == 1 }">
                        <li><a href="/admin/main">������ ������</a></li>
                    </c:if>   
                              
                    <li>
                     	<a id="gnb_logout_btn">�α׾ƿ�</a>   
                    </li>
                    <li>
                        ���̷�
                    </li>
                    <li>
                        ��ٱ���
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
			
			<!-- �� �α��� ���� -->
			<c:if test="${member == null }"> 
				<div class="login_btn"><a href="/member/login">login</a></div>
				<span><a href="/member/join">join</a></span>
			</c:if>
			
			 <!-- �α����� ���� -->
                <c:if test="${ member != null }">
             	    <div class="login_success_area">
                        <span>ȸ�� : ${member.memberName}</span>
                        <span>�����ݾ� : 
       					  <fmt:formatNumber value="${member.money }" pattern="\#,###.##"/></span>
                        <span>����Ʈ :
                          <fmt:formatNumber value="${member.point }" pattern="#,###" /></span>
                        <a id="logout_btn"  href="/member/logout.do">�α׾ƿ�</a><!-- -->
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
		
		<!-- Footer ���� -->
        <div class="footer_nav">
            <div class="footer_nav_container">
                <ul>
                    <li>ȸ��Ұ�</li>
                    <span class="line">|</span>
                    <li>�̿���</li>
                    <span class="line">|</span>
                    <li>������</li>
                    <span class="line">|</span>
                    <li>������</li>
                    <span class="line">|</span>
                    <li>ä������</li>
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
                    (��) wookdolman    owner : Lee wookjong
                    <br>
                    business number : 123-456-7890
                    <br>
                    Tel. : 02-1234-5678(�߽��� �δ���ȭ)
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
		//alert("�α׾ƿ� �Ϸ�");
		$.ajax({
			type:"POST",
			url:"/member/logout.do",
			success:function(data){
				alert("�α׾ƿ� �Ϸ�");
				document.location.reload();	
			}
			
		});//ajax
		console.log("�α׾ƿ��Ϸ�");
		
	});
</script>
</body>
</html>