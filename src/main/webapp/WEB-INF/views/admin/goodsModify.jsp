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
 <script src="https://cdn.ckeditor.com/ckeditor5/27.1.0/classic/ckeditor.js"></script>
 <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
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
                    				<input name="publeYear" autocomplete="off" readonly="readonly" >
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
 				
<script>

$(document).ready(function(){ /*  페이지가 렌더링 후 반드시 실행을 하는 document ready 메서드를 추가 */
	
	/* datepicker캘린더 */
	/* https://jqueryui.com/datepicker/ */

	/* 캘린더 위젯 적용 */
			/* 설정 */
	  let publeYear = '${goodsInfo.publeYear}';
	  $( "input[name='publeYear']" ).datepicker({
		  
		  dateFormat: "yy-mm-dd",	
			showOn : "button",
			buttonText:"날짜 선택",
		    prevText: '이전 달',
		    nextText: '다음 달',
		    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    dayNames: ['일','월','화','수','목','금','토'],
		    dayNamesShort: ['일','월','화','수','목','금','토'],
		    dayNamesMin: ['일','월','화','수','목','금','토'],
		    yearSuffix: '년',
	      changeMonth: true,
	      changeYear: true 						
		  
	  }); 		
	 
	  $( "input[name='publeYear']" ).datepicker('setDate', publeYear);
			
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
		
		/* 위지윅 적용 */
		 
		/* 책 소개 */
		ClassicEditor
			.create(document.querySelector('#imageIntro_textarea'))
			.catch(error=>{
				console.error(error);
			});
			
		/* 책 목차 */	
		ClassicEditor
		.create(document.querySelector('#imageContents_textarea'))
		.catch(error=>{
			console.error(error);
		});
		
		
		/* 할인율 인터페이스 출력 */
		let imagePriceInput = $("input[name='imagePrice']");
		let discountInput = $("input[name='imageDiscount']");
		
		let imagePrice = imagePriceInput.val();
		let rawDiscountRate = discountInput.val();
		let discountRate = rawDiscountRate * 100;
		
		
		let discountPrice = imagePrice * (1-rawDiscountRate);
		$(".span_discount").html(discountPrice);
		$("#discount_interface").val(discountRate);
	
});

</script> 

<script>
	/* 카테고리 배열 리셋*/
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
	
	
		/* 중분류 <option> 태그 */
	$(catSelect1).on("change",function(){
		
		let selectVal1 = $(this).find("option:selected").val();	
		
		catSelect2.children().remove();
		catSelect3.children().remove();
		
		catSelect2.append("<option value='none'>선택</option>");
		catSelect3.append("<option value='none'>선택</option>");
		
		for(let i = 0; i < cat2Array.length; i++){
			if(selectVal1 === cat2Array[i].catParent){
				catSelect2.append("<option value='"+cat2Array[i].catCode+"'>" + cat2Array[i].catName + "</option>");	
			}
		}// for
		
	});
	
		/* 소분류 <option>태그 */
	$(catSelect2).on("change",function(){
		
		let selectVal2 = $(this).find("option:selected").val();
		
		catSelect3.children().remove();
		
		catSelect3.append("<option value='none'>선택</option>");		
		
		for(let i = 0; i < cat3Array.length; i++){
			if(selectVal2 === cat3Array[i].catParent){
				catSelect3.append("<option value='"+cat3Array[i].catCode+"'>" + cat3Array[i].catName + "</option>");	
			}
		}// for		
	
});	
		
/* 할인율 Input 설정 */
	
	$("#discount_interface").on("propertychange change keyup paste input", function(){
		
		let userInput = $("#discount_interface");
		let discountInput = $("input[name='imageDiscount']");
		
		let discountRate = userInput.val();					// 사용자가 입력한 할인값
		let sendDiscountRate = discountRate / 100;			// 서버에 전송할 할인값
		let goodsPrice = $("input[name='imagePrice']").val();			// 원가
		let discountPrice = goodsPrice * (1 - sendDiscountRate);		// 할인가격
		
		if(!isNaN(discountRate)){
			$(".span_discount").html(discountPrice);		
			discountInput.val(sendDiscountRate);				
		}

		
	});	
	
	$("input[name='imagePrice']").on("change", function(){
		
		let userInput = $("#discount_interface");
		let discountInput = $("input[name='imageDiscount']");
		
		let discountRate = userInput.val();					// 사용자가 입력한 할인값
		let sendDiscountRate = discountRate / 100;			// 서버에 전송할 할인값
		let goodsPrice = $("input[name='imagePrice']").val();			// 원가
		let discountPrice = goodsPrice * (1 - sendDiscountRate);		// 할인가격
		
		if(!isNaN(discountRate)){
			$(".span_discount").html(discountPrice);	
		}
		
		
	});	
	
	/* 취소 버튼 */
	$("#cancelBtn").on("click", function(e){
		e.preventDefault();
		$("#moveForm").submit();
	});
	
	/* 수정 버튼 */
	$("#modifyBtn").on("click", function(e){
		e.preventDefault();
		$("#modifyForm").submit();
	});
	
	/* 수정 버튼 */
	$("#modifyBtn").on("click",function(e){
		
		e.preventDefault();
		
		/* 체크 변수 */
		let imageNameCk = false;
		let authorIdCk = false;
		let publeYearCk = false;
		let publisherCk = false;
		let catCodeCk = false;
		let priceCk = false;
		let stockCk = false;
		let discountCk = false;
		let introCk = false;
		let contentsCk = false;	
		
		/* 체크 대상 변수 */
		let imageName = $("input[name='imageName']").val();
		let authorId = $("input[name='authorId']").val();
		let publeYear = $("input[name='publeYear']").val();
		let publisher = $("input[name='publisher']").val();
		let catCode = $("select[name='catCode']").val();
		let imagePrice = $("input[name='imagePrice']").val();
		let imageStock = $("input[name='imageStock']").val();
		let imageDiscount = $("#discount_interface").val();
		let imageIntro = $(".bit p").html();
		let imageContents = $(".bct p").html();	
		
		/* 공란 체크 */
		if(imageName){
			$(".imageName_warn").css('display','none');
			imageNameCk = true;
		} else {
			$(".imageName_warn").css('display','block');
			imageNameCk = false;
		}
		
		if(authorId){
			$(".authorId_warn").css('display','none');
			authorIdCk = true;
		} else {
			$(".authorId_warn").css('display','block');
			authorIdCk = false;
		}
		
		if(publeYear){
			$(".publeYear_warn").css('display','none');
			publeYearCk = true;
		} else {
			$(".publeYear_warn").css('display','block');
			publeYearCk = false;
		}	
		
		if(publisher){
			$(".publisher_warn").css('display','none');
			publisherCk = true;
		} else {
			$(".publisher_warn").css('display','block');
			publisherCk = false;
		}
		
		if(catCode != 'none'){
			$(".catCode_warn").css('display','none');
			catCodeCk = true;
		} else {
			$(".catCode_warn").css('display','block');
			catCodeCk = false;
		}	
		
		if(imagePrice != 0){
			$(".imagePrice_warn").css('display','none');
			priceCk = true;
		} else {
			$(".imagePrice_warn").css('display','block');
			priceCk = false;
		}	
		
		if(imageStock != 0){
			$(".imageStock_warn").css('display','none');
			stockCk = true;
		} else {
			$(".imageStock_warn").css('display','block');
			stockCk = false;
		}		
		
		if(!isNaN(imageDiscount)){
			$(".imageDiscount_warn").css('display','none');
			discountCk = true;
		} else {
			$(".imageDiscount_warn").css('display','block');
			discountCk = false;
		}	
		
		if(imageIntro != '<br data-cke-filler="true">'){
			$(".imageIntro_warn").css('display','none');
			introCk = true;
		} else {
			$(".imageIntro_warn").css('display','block');
			introCk = false;
		}	
		
		if(imageContents != '<br data-cke-filler="true">'){
			$(".imageContents_warn").css('display','none');
			contentsCk = true;
		} else {
			$(".imageContents_warn").css('display','block');
			contentsCk = false;
		}		
		
		/* 최종 확인 */
		if(imageNameCk && authorIdCk && publeYearCk && publisherCk && catCodeCk && priceCk && stockCk && discountCk && introCk && contentsCk ){
			//alert('통과');
			$("#modifyForm").submit();
		} else {
			return false;
		}
		
	});
	
	/* 작가 선택 버튼 */
	$('.authorId_btn').on("click",function(e){
		
		e.preventDefault();
		
		let popUrl = "/admin/authorPop";
		let popOption = "width = 650px, height=550px, top=300px, left=300px, scrollbars=yes";
		
		window.open(popUrl,"작가 찾기",popOption);
		
	});

	

</script>
</body>
</html>