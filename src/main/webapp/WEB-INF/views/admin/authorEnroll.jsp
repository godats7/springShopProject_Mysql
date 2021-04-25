<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/authorEnroll.css">
 
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
</head>
<body>
 
    <div class="wrapper">
        <div class="wrap">
            <!-- gnv_area -->    
            <div class="top_gnb_area">
                <ul class="list">    
                    <li><a href="/">메인 페이지</a></li>
                    <li><a href="/member/logout.do">로그아웃</a></li>
                    <li>고객센터</li>            
                </ul>
            </div>
            <!-- top_subject_area -->
            <div class="admin_top_wrap">
                <span>관리자 페이지</span>
                
            </div>
            <!-- contents-area -->
            <div class="admin_wrap">
                <!-- 네비영역 -->
                <div class="admin_navi_wrap">
                  <ul>
                        <li >
                            <a class="admin_list_01" href="/admin/goodsEnroll">상품 등록</a>
                        </li>
                        <li>
                            <a class="admin_list_02" href="/admin/goodsManage">상품 목록</a>
                        </li>
                        <lI>
                            <a class="admin_list_03" href="/admin/authorEnroll">작가 등록</a>                            
                        </lI>
                        <lI>
                            <a class="admin_list_04" href="/admin/authorManage">작가 관리</a>                            
                        </lI>
                        <lI>
                            <a class="admin_list_05" href="">장르 관리</a>                            
                        </lI>
                        <lI>
                            <a class="admin_list_06">회원 관리</a>                            
                        </lI>                                                                                             
                    </ul>
                </div>
                <div class="admin_content_wrap">
                    <div class="admin_content_subject"><span>작가 등록</span></div>
                    <!-- 작가 등록  -->
                    <div class="admin_content_main">
                    	<form action="/admin/authorEnroll.do" method="post" id="enrollForm">
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>작가 이름</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="authorName">
                    				<span id="warn_authorName">작가 이름을 입력 해주세요.</span>
                    			</div>
                    		</div>
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>이미지 장르</label>
                    			</div>
                    			<div class="form_section_content">
                    				<select name="genreId">
                    					<option value="none" selected>=== 선택 ===</option>
                    					<option value="01">귀여운</option>
                    					<option value="02">신비로운</option>
                    					<option value="03">웅장한</option>
                    					<option value="04">무서운</option>
                    					<option value="05">자연의</option>
                    					<option value="06">우주의</option>
                    				</select>
                    				<span id="warn_genreId">장르를 선택해주세요.</span>
                    			</div>
                    		</div>
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>작가소개</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="authorIntro" type="text">
                    				<span id="warn_authorIntro">작가 소개를 입력 해주세요.</span>
                    			</div>
                    		</div>
                   		</form>
                   			<div class="btn_section">
                   				<button id="cancelBtn" class="btn">취 소</button>
	                    		<button id="enrollBtn" class="btn enroll_btn">등 록</button>
	                    	</div> 
                    </div><!-- 작가등록  -->
                    
                </div>
                <div class="clearfix"></div>
            </div>
        
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
                    <img src="../resources/img/Logo.png">
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
        
    </div>    <!-- class="wrap" -->
</div>    <!-- class="wrapper" -->
<script>
 
/* 등록 버튼 */
$("#enrollBtn").click(function(){   
	 /* 검사 통과 유무 변수 */
    let nameCheck = false;            // 작가 이름
    let genreCheck = false;        // 이미지 장르
    let introCheck = false;            // 작가 소개
    
    /* 입력값 변수 */
    let authorName = $('input[name=authorName]').val();        // 작가 이름
    let genreId = $('select[name=genreId]').val();        // 이미지 장르
    let authorIntro = $('input[name=authorIntro]').val();    // 작가 소개
    /* 공란 경고 span태그 */
    let wAuthorName = $('#warn_authorName');
    let wGenreId = $('#warn_genreId');
    let wAuthorIntro = $('#warn_authorIntro');  
    
    /* 작기 이름 공란 체크 */
    if(authorName ===''){
        wAuthorName.css('display', 'block');
        nameCheck = false;
    } else{
        wAuthorName.css('display', 'none');
        nameCheck = true;
    }
    
    /* 소속 국가 공란 체크 */
    if(genreId ==='none'){
        wGenreId.css('display', 'block');
        genreCheck = false;
    } else{
        wGenreId.css('display', 'none');
        genreCheck = true;
    }    
    
    /* 작가 소개 공란 체크 */
    if(authorIntro ===''){
        wAuthorIntro.css('display', 'block');
        introCheck = false;
    } else{
        wAuthorIntro.css('display', 'none');
        introCheck = true;
    }  
    
    /* 최종 검사 */
    if(nameCheck && genreCheck && introCheck){
        $("#enrollForm").submit();    
    } else{
        return;
    }
});
 
/* 취소 버튼 */
$("#cancelBtn").click(function(){
    location.href="/admin/authorManage"
});

/* 작가등록 성공 */
$(document).ready(function(){
    
	let result = '<c:out value="${enroll_result}"/>';
    
    checkResult(result);
    
    function checkResult(result){
        
        if(result === ''){
            return;
        }
        
        alert("작가'${enroll_result}' 을 등록하였습니다.");
        
    }
 
});
 
</script> 
 
 
</body>
</html>
