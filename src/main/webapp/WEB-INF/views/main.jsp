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
</head>
<body>
	<div class="wrapper">
		<div class="top_ad_area">
			<h1>ad_area</h1>		
		</div>
		<div class="top_area">
			<div class="logo_area">
				<h1>logo_area</h1>
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
		</div>
	
	</div>

</body>
</html>