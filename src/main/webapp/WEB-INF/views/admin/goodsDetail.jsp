<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/goodsDetail.css">
 
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  <script src="https://cdn.ckeditor.com/ckeditor5/26.0.0/classic/ckeditor.js"></script>
</head>
<body>
		<%@include file="../includes/admin/header.jsp" %>
                <div class="admin_content_wrap">
                    <div class="admin_content_subject"><span>상품 상세</span></div>

                    <div class="admin_content_main">

                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>이미지 제목</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="imageName" value="<c:out value="${goodsInfo.imageName}"/>" disabled>
                    			</div>
                    		</div>
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>등록 날짜</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input value="<fmt:formatDate value='${goodsInfo.regDate}' pattern='yyyy-MM-dd'/>" disabled>
                    			</div>
                    		</div>
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>최근 수정 날짜</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input value="<fmt:formatDate value='${goodsInfo.updateDate}' pattern='yyyy-MM-dd'/>" disabled>
                    			</div>
                    		</div>                    		                    		
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>작가</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input id="authorName_input" readonly="readonly" value="${goodsInfo.authorName }" disabled>
                    				                    				
                    			</div>
                    		</div>            
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>출판일</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="publeYear" autocomplete="off" readonly="readonly" value="<c:out value="${goodsInfo.publeYear}"/>" disabled>                    				
                    			</div>
                    		</div>            
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>출판사</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="publisher" value="<c:out value="${goodsInfo.publisher}"/>" disabled>
                    			</div>
                    		</div>             
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>이미지 카테고리</label>
                    			</div>
                    			<div class="form_section_content">
                    				<div class="cat_wrap">
                    					<span>대분류</span>
                    					<select class="cat1" disabled>
                    						<option  value="none">선택</option>
                    					</select>
                    				</div>
                    				<div class="cat_wrap">
                    					<span>중분류</span>
                    					<select class="cat2" disabled>
                    						<option  value="none">선택</option>
                    					</select>
                    				</div>
                    				<div class="cat_wrap">
                    					<span>소분류</span>
                    					<select class="cat3" name="catCode" disabled>
                    						<option value="none">선택</option>
                    					</select>
                    				</div>                  				                    				
                    			</div>
                    		</div>          
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 가격</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="imagePrice" value="<c:out value="${goodsInfo.imagePrice}"/>" disabled>
                    			</div>
                    		</div>               
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 재고</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="imageStock" value="<c:out value="${goodsInfo.imageStock}"/>" disabled>
                    			</div>
                    		</div>          
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 할인율</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input id="discount_interface" maxlength="2" disabled>
                    			</div>
                    		</div>          		
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>이미지 소개</label>
                    			</div>
                    			<div class="form_section_content bit">
                    				<textarea name="imageIntro" id="imageIntro_textarea" disabled>${goodsInfo.imageIntro}</textarea>
                    			</div>
                    		</div>        		
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>이미지 목차</label>
                    			</div>
                    			<div class="form_section_content bct">
                    				<textarea name="imageContents" id="imageContents_textarea" disabled>${goodsInfo.imageContents}</textarea>
                    			</div>
                    		</div>
                   		
                   			<div class="btn_section">
                   				<button id="cancelBtn" class="btn">상품 목록</button>
	                    		<button id="modifyBtn" class="btn enroll_btn">수정 </button>
	                    	</div> 
                    </div>      

                	
                	<form id="moveForm" action="/admin/goodsManage" method="get" >
 						<input type="hidden" name="pageNum" value="${criteria.pageNum}">
						<input type="hidden" name="amount" value="${criteria.amount}">
						<input type="hidden" name="keyword" value="${criteria.keyword}">
                	</form>
                	
                </div>
 				<%@include file="../includes/admin/footer.jsp" %>
 				
<script>

$(document).ready(function(){
	
	/* 할인율 값 삽입 */
	let imageDiscount = '<c:out value="${goodsInfo.imageDiscount}"/>' * 100;
	$("#discount_interface").attr("value", imageDiscount);
	
	/* 책 소개 */
	ClassicEditor
		.create(document.querySelector('#imageIntro_textarea'))
		.then(editor => {
			console.log(editor);
			editor.isReadOnly = true;
		})
		.catch(error=>{
			console.error(error);
		});
		
	/* 책 목차 */	
	ClassicEditor
	.create(document.querySelector('#imageContents_textarea'))
	.then(editor => {
		console.log(editor);
		editor.isReadOnly = true;
	})
	.catch(error=>{
		console.error(error);
	});
	
	/* 카테고리 */
	let catList = JSON.parse('${catList}');

	let cat1Array = new Array();
	let cat2Array = new Array();
	let cat3Array = new Array();
	let cat1Obj = new Object();
	let cat2Obj = new Object();
	let cat3Obj = new Object();
	
	let catSelect1 = $(".cat1");		
	let catSelect2 = $(".cat2");
	let catSelect3 = $(".cat3");
	
	/* 카테고리 배열 초기화 메서드 */
	function makeCatArray(obj,array,catList, tier){
		for(let i = 0; i < catList.length; i++){
			if(catList[i].tier === tier){
				obj = new Object();
				
				obj.catName = catList[i].catName;
				obj.catCode = catList[i].catCode;
				obj.catParent = catList[i].catParent;
				
				array.push(obj);				
				
			}
		}
	}	
	
	/* 배열 초기화 */
	makeCatArray(cat1Obj,cat1Array,catList,1);
	makeCatArray(cat2Obj,cat2Array,catList,2);
	makeCatArray(cat3Obj,cat3Array,catList,3);
	
	let targetCat2 = '';
	let targetCat3 = '${goodsInfo.catCode}';
	
	/* 소분류 */
	for(let i = 0; i < cat3Array.length; i++){
		if(targetCat3 === cat3Array[i].catCode){
			targetCat3 = cat3Array[i];
		}
	}// for	
	
	for(let i = 0; i < cat3Array.length; i++){
		if(targetCat3.catParent === cat3Array[i].catParent){
			catSelect3.append("<option value='"+cat3Array[i].catCode+"'>" + cat3Array[i].catName + "</option>");
		}
	}
	
	$(".cat3 option").each(function(i,obj){
		if(targetCat3.catCode === obj.value){
			$(obj).attr("selected", "selected");
		}
	});
	
	/* console.log('targetCat3 : ' + targetCat3)
	console.log('targetCat3name : ' + targetCat3.catName)
	console.log('targetCat3code : ' + targetCat3.catCode)
	console.log('targetCat3parent : ' + targetCat3.catParent) */
	
	
	
	/* 중분류 */
	for(let i = 0; i < cat2Array.length; i++){
		if(targetCat3.catParent === cat2Array[i].catCode){
			targetCat2 = cat2Array[i];	
		}
	}// for	
	
	for(let i = 0; i < cat2Array.length; i++){
		if(targetCat2.catParent === cat2Array[i].catParent){
			catSelect2.append("<option value='"+cat2Array[i].catCode+"'>" + cat2Array[i].catName + "</option>");
		}
	}		
	
	$(".cat2 option").each(function(i,obj){
		if(targetCat2.catCode === obj.value){
			$(obj).attr("selected", "selected");
		}
	});
	
	/* 대분류 */
	for(let i = 0; i < cat1Array.length; i++){
		catSelect1.append("<option value='"+cat1Array[i].catCode+"'>" + cat1Array[i].catName + "</option>");
	}
	
	$(".cat1 option").each(function(i,obj){
		if(targetCat2.catParent === obj.value){
			$(obj).attr("selected", "selected");
		}
	});
	
	/* 목록 이동 버튼 */
	$("#cancelBtn").on("click", function(e){
		e.preventDefault();
		$("#moveForm").submit();	
	});	
	
	/* 수정 페이지 이동 */
	$("#modifyBtn").on("click", function(e){
		e.preventDefault();
		let addInput = '<input type="hidden" name="imageId" value="${goodsInfo.imageId}">';
		$("#moveForm").append(addInput);
		$("#moveForm").attr("action", "/admin/goodsModify");
		$("#moveForm").submit();
	});
	
	
});

</script>
</body>
</html>