<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/goodsModify.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<scriteriapt
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></scriteriapt>
 <scriteriapt src="https://cdn.ckeditor.com/ckeditor5/26.0.0/classic/ckeditor.js"></scriteriapt>
 <scriteriapt src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></scriteriapt>
<scriteriapt src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></scriteriapt>
</head>
</head>
<body>

				<%@include file="../includes/admin/header.jsp" %>
				
                <div class="admin_content_wrap">
                    <div class="admin_content_subject"><span>상품 등록</span></div>
                    <div class="admin_content_main">
                    	<form action="/admin/goodsModify" method="post" id="modifyForm">
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>이미지 제목</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="imageName" value="${goodsInfo.imageName}">
                    				<span class="ck_warn imageName_warn">이미지 이름을 입력해주세요.</span>
                    			</div>
                    		</div>
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>작가</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input id="authorName_input" readonly="readonly" value="${goodsInfo.authorName}">
                    				<input id="authorId_input" name="authorId" type="hidden" value="${goodsInfo.authorId}">
                    				<button class="authorId_btn">작가 선택</button>
                    				<span class="ck_warn authorId_warn">작가를 선택해주세요</span>
                    			</div>
                    		</div>            
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>출판일</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="publeYear" autocomplete="off" readonly="readonly">
                    				<span class="ck_warn publeYear_warn">출판일을 선택해주세요.</span>
                    			</div>
                    		</div>            
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>출판사</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="publisher" value="${goodsInfo.publisher}">
                    				<span class="ck_warn publisher_warn">출판사를 입력해주세요.</span>
                    			</div>
                    		</div>             
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>이미지 카테고리</label>
                    			</div>
                    			<div class="form_section_content">
                    				<div class="cat_wrap">
                    					<span>대분류</span>
                    					<select class="cat1">
                    						<option selected value="none">선택</option>
                    					</select>
                    				</div>
                    				<div class="cat_wrap">
                    					<span>중분류</span>
                    					<select class="cat2">
                    						<option selected value="none">선택</option>
                    					</select>
                    				</div>
                    				<div class="cat_wrap">
                    					<span>소분류</span>
                    					<select class="cat3" name="catCode">
                    						<option selected value="none">선택</option>
                    					</select>
                    				</div>  
                    				<span class="ck_warn catCode_warn">카테고리를 선택해주세요.</span>                  				                    				
                    			</div>
                    		</div>          
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 가격</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="imagePrice" value="${goodsInfo.imagePrice}">
                    				<span class="ck_warn imagePrice_warn">상품 가격을 입력해주세요.</span>
                    			</div>
                    		</div>               
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 재고</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="imageStock" value="${goodsInfo.imageStock}">
                    				<span class="ck_warn imageStock_warn">상품 재고를 입력해주세요.</span>
                    			</div>
                    		</div>          
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 할인율</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input id="discount_interface" maxlength="2" value="0">
                    				<input name="imageDiscount" type="hidden" value="${goodsInfo.imageDiscount}">
                    				<span class="step_val">할인 가격 : <span class="span_discount"></span></span>
                    				<span class="ck_warn imageDiscount_warn">1~99 숫자를 입력해주세요.</span>
                    			</div>
                    		</div>          		
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>이미지 소개</label>
                    			</div>
                    			<div class="form_section_content bit">
                    				<textarea name="imageIntro" id="imageIntro_textarea">${goodsInfo.imageIntro}</textarea>
                    				<span class="ck_warn imageIntro_warn">이미지 소개를 입력해주세요.</span>
                    			</div>
                    		</div>        		
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>이미지 목차</label>
                    			</div>
                    			<div class="form_section_content bct">
                    				<textarea name="imageContents" id="imageContents_textarea">${goodsInfo.imageContents}</textarea>
                    				<span class="ck_warn imageContents_warn">이미지 목차를 입력해주세요.</span>
                    			</div>
                    		</div>
                    		<input type="hidden" name='imageId' value="${goodsInfo.imageId}">
                   		</form>
                   			<div class="btn_section">
                   				<button id="cancelBtn" class="btn">취 소</button>
	                    		<button id="modifyBtn" class="btn modify_btn">수 정</button>
	                    	</div> 
                    </div>  
                	<form id="moveForm" action="/admin/goodsManage" method="get" >
 						<input type="hidden" name="pageNum" value="${criteria.pageNum}">
						<input type="hidden" name="amount" value="${criteria.amount}">
						<input type="hidden" name="keyword" value="${criteria.keyword}">
						<input type="hidden" name='imageId' value="${goodsInfo.imageId}">
                	</form>                     
                </div>
 
 				<%@include file="../includes/admin/footer.jsp" %>
</body>
</html>