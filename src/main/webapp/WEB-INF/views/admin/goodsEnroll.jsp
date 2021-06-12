<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/goodsEnroll.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" /> <!-- datepicker -->
 
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/27.1.0/classic/ckeditor.js"></script> <!-- ck editor for WISYWIG -->
 <!-- datepicker -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
</head>
</head>
<body>
 
  <%@include file="../includes/admin/header.jsp" %>
  
                <div class="admin_content_wrap">
                    <div class="admin_content_subject"><span>상품 등록</span></div>
                    
                    <div class="admin_content_main">
                    	<form action="/admin/imageEnroll" method="post" id="enrollForm">
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>이미지 제목</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="imageName">
                    				<span class="ck_warn imageName_warn">이미지 이름을 입력해주세요.</span>
                    			</div>
                    		</div>
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>작가</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input id="authorName_input" readonly="readonly">
									<input id="authorId_input" name="authorId" type="hidden">
									<button class="authorId_btn">작가 선택</button>
									<span class="ck_warn authorId_warn">작가를 선택해주세요</span>
                    			</div>
                    		</div>            
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>출판일</label>
                    			</div>
                    			<div class="form_section_content">
                    				<!-- <input name="publeYear" placeholder="yyyy-mm-dd의 형식으로 입력해주세요(예 : 2020-12-12)"> -->
                    				<input name="publeYear" autocomplete="off" readonly="readonly" placeholder="우측의 날짜선택 버튼을 눌러주세요">
                    				<span class="ck_warn publeYear_warn">출판일을 선택해주세요.</span>
                    			</div>
                    		</div>            
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>출판사</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="publisher">
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
                    				<input name="imagePrice" value="0">
                    				<span class="ck_warn imagePrice_warn">상품 가격을 입력해주세요.</span>
                    			</div>
                    		</div>               
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 재고</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="imageStock" value="0">
                    				<span class="ck_warn imageStock_warn">상품 재고를 입력해주세요.</span>
                    			</div>
                    		</div>          
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 할인율</label>
                    			</div>
                    			<div class="form_section_content">
                    				<!-- <input name="imageDiscount" placeholder="소숫점의 형식으로 입력해주세요(예 :0.1)"> -->
                    				<input id="discount_interface" maxlength="2" value="0">
									<input name="imageDiscount" type="hidden" value="0">
									<span class="step_val">할인 가격 : <span class="span_discount"></span></span>
                    				<!-- <span class="ck_warn imageDiscount_warn">상품 할인율을 입력해주세요.</span> -->
                    				<span class="ck_warn imageDiscount_warn">1~99 숫자를 입력해주세요.</span>
                    			</div>
                    		</div>          		
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>이미지 소개</label>
                    			</div>
                    			<div class="form_section_content">
                    				<!-- <input name="imageIntro"> -->
                    				<textarea name="imageIntro" id="imageIntro_textarea"></textarea>
                    				<span class="ck_warn imageIntro_warn">이미지 소개를 입력해주세요.</span>
                    			</div>
                    		</div>        		
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>이미지 목차</label>
                    			</div>
                    			<div class="form_section_content">
                    				<!-- <input name="imageContents"> -->
                    				<textarea name="imageContents" id="imageContents_textarea"></textarea>
                    				<span class="ck_warn imageContents_warn">이미지 목차를 입력해주세요.</span>
                    			</div>
                    		</div>
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>이미지</label>
                    			</div>
                    			<div class="form_section_content">
									<input type="file" multiple id ="fileItem" name='uploadFile' style="height: 30px;">
									<div id="uploadResult">
									<!-- 	<div id="result_card">
											<div class="imgDeleteBtn">x</div>
											<img src="/resources/img/Logo.png">
										</div> -->
									</div>
                    			</div>
                    		</div> 
                   		</form>
                   			<div class="btn_section">
                   				<button id="cancelBtn" class="btn">취 소</button>
	                    		<button id="enrollBtn" class="btn enroll_btn">등 록</button>
	                    	</div> 
                    </div> 
                    
                </div>
                
               <%--  <!-- 페이지 이동 인터페이스 영역 -->
                    <div class="pageMaker_wrap" >
                    
	                    <ul class="pageMaker">
	                    
	                    	<!-- 이전 버튼 -->
	                    	<c:if test="${pageMaker.prev}">
	                    		<li class="pageMaker_btn prev">
	                    			<a href="${pageMaker.pageStart - 1}">이전</a>
	                    		</li>
	                    	</c:if>
	                    	
	                    	<!-- 페이지 번호 -->
	                    	<c:forEach begin="${pageMaker.pageStart}" end="${pageMaker.pageEnd}" var="num">
	                    		<li class="pageMaker_btn ${pageMaker.criteria.pageNum == num ? "active":""}">
	                    			<a href="${num}">${num}</a>
	                    		</li>
	                    	</c:forEach>
	                    	
	                    	<!-- 다음 버튼 -->
	                    	<c:if test="${pageMaker.next}">
	                    		<li class="pageMaker_btn next">
	                    			<a href="${pageMaker.pageEnd + 1 }">다음</a>
	                    		</li>
	                    	</c:if>	                    	
	                    </ul>	                    
                    </div> --%> 
                    <form id="moveForm" action="/admin/authorManage" method="get">
						<input type="hidden" name="pageNum" value="${pageMaker.criteria.pageNum}">
						<input type="hidden" name="amount" value="${pageMaker.criteria.amount}">
						<input type="hidden" name="keyword" value="${pageMaker.criteria.keyword}">
					</form>       
        
         <%@include file="../includes/admin/footer.jsp" %>
 
<script>

	let enrollForm = $("#enrollForm")
	
/* 취소 버튼 */
$("#cancelBtn").click(function(){
	
	location.href="/admin/goodsManage"
	
});

/* 상품 등록 버튼 */
$("#enrollBtn").on("click",function(e){
	
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
	/* let imageDiscount = $("input[name='imageDiscount']").val(); */
	let imageDiscount = $("#discount_interface").val();
	let imageIntro = $(".imgInt p").html();
	let imageContents = $(".imgCon p").html();

	/* 상품등록 공란체크 */
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
			enrollForm.submit();
		} else {
			return false;
		}
		
	
	
	enrollForm.submit();
	
});



/* //위지윅  ck editor 적용법
ClassicEditor
.create(document.querySelector('적용대상 선택자'))
.catch(error=>{
	console.error(error);
}); */

/* 위지윅 적용 */
 /* https://ckeditor.com/docs/ckeditor5/latest/features/toolbar/toolbar.html*/

/* 책 소개 */
ClassicEditor
.create( document.querySelector( '#imageIntro_textarea' ), {
    toolbar: [ 'bold', 'italic', 'link', 'undo', 'redo', 'numberedList', 'bulletedList' ]
} ).catch( error => {
    console.log( error );
} );
	
/* 책 목차 */	
ClassicEditor
.create( document.querySelector( '#imageContents_textarea' ), {
    toolbar: [ 'bold', 'italic', 'link', 'undo', 'redo', 'numberedList', 'bulletedList' ]
} ).catch( error => {
    console.log( error );
} );

/* datepicker캘린더 */
/* https://jqueryui.com/datepicker/ */

/* 캘린더 */
 $(function() {
	  $( "input[name='publeYear']" ).datepicker({
		  /* 설정 */
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
	});  

 /* 작가 선택 버튼 */
	$('.authorId_btn').on("click",function(e){
		
		e.preventDefault();
		
		let popUrl = "/admin/authorPop";
		let popOption = "width = 650px, height=550px, top=300px, left=300px, scrollbars=yes";
		
		window.open(popUrl,"작가 찾기",popOption);
		
	});

	$(document).ready(function(){
		console.log('${catList}');
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
	
	/* tier 1 배열 */
	function makecatArray(obj,array,catList, tier){
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
	makecatArray(cat1Obj,cat1Array,catList,1);
	makecatArray(cat2Obj,cat2Array,catList,2);
	makecatArray(cat3Obj,cat3Array,catList,3);
	
	$(document).ready(function(){
		console.log(cat1Array);
		console.log(cat2Array);
		console.log(cat3Array);
	});
	
	/* for(let i = 0; i < catList.length; i++){
		if(catList[i].tier === 1){
			cat1Obj = new Object();
			
			cat1Obj.catName = catList[i].catName;
			cat1Obj.catCode = catList[i].catCode;
			cat1Obj.catParent = catList[i].catParent;
			
			cat1Array.push(cat1Obj);				
			
		}
	} */	

	/* $(document).ready(function(){
		console.log(cat1Array);
	}); */
	
	 /* 대분류 옵션 */
	for(let i = 0; i < cat1Array.length; i++){
		catSelect1.append("<option value='"+cat1Array[i].catCode+"'>" + cat1Array[i].catName + "</option>");
	}
	
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
		
		let discountRate = userInput.val();					// 사용자가 입력할 할인값
		let sendDiscountRate = discountRate / 100;					// 서버에 전송할 할인값
		
		let goodsPrice = $("input[name='imagePrice']").val();			// 원가
		let discountPrice = goodsPrice * (1 - sendDiscountRate);		// 할인가격
		
		if(!isNaN(discountRate)){
			$(".span_discount").html(discountPrice);		
			discountInput.val(sendDiscountRate);	
		}
		
	});
	  /* 상품가격-> 상품할인 입력후 다시 상품 가격 입력할때 오류방지 */
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
	  
	/* 이미지 업로드 */
	$("input[type='file']").on("change", function(e){
		alert("동작");
		
		/* 이미지 존재시 삭제 */
		if($(".imgDeleteBtn").length > 0){
			deleteFile();
		}
		
		let formData = new FormData();
		let fileInput = $('input[name="uploadFile"]');
		let fileList = fileInput[0].files;
		let fileObj = fileList[0];
		
		
		/* console.log("fileList : " + fileList);
		console.log("fileObj : " + fileObj);
		console.log("fileName : " + fileObj.name);
		console.log("fileSize : " + fileObj.size);
		console.log("fileType(MimeType) : " + fileObj.type); */
		
		if(!fileCheck(fileObj.name, fileObj.size)){
			return false;
		}
		
		/* 파일 한개만 */
		/* formData.append("uploadFile",fileObj); */
		
		/* 파일 여러개 */
		for(let i = 0; i < fileList.length; i++){
			formData.append("uploadFile", fileList[i]);
		}
		
		 /* url : 서버로 요청을 보낼 url

		 processData : 서버로 전송할 데이터를 queryStirng 형태로 변환할지 여부

		 contentType : 서버로 전송되는 데이터의 content-type

		 data : 서버로 전송할 데이터

		 type : 서보 요청 타입(GET, POST)

		 dataType : 서버로부터 반환받을 데이터 타입 */
		
		/* $.ajax({
			url: '/admin/uploadAjaxAction',
	    	processData : false,
	    	contentType : false,
	    	data : formData,
	    	type : 'POST',
	    	dataType : 'json'
		}); */
		
		$.ajax({
			url: '/admin/uploadAjaxAction',
	    	processData : false,
	    	contentType : false,
	    	data : formData,
	    	type : 'POST',
	    	dataType : 'json',
	    	success : function(result){
	    		console.log(result);
	    		showUploadImage(result);
	    	},
	    	error : function(result){
	    		alert("이미지 파일이 아닙니다.");
	    	}
		});
	});
	
	/* var, method related with attachFile */
	let regex = new RegExp("(.*?)\.(jpg|png)$");
	let maxSize = 1048576; //1MB	
	
	function fileCheck(fileName, fileSize){
		
		if(!regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}

		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
			  
		
		
		return true;		
		
	}
	
	/* 이미지 출력 */
	function showUploadImage(uploadResultArr){
		
		/* 전달받은 데이터 검증 */
		if(!uploadResultArr || uploadResultArr.length == 0){return}
		
		let uploadResult = $("#uploadResult");
		
		let obj = uploadResultArr[0];
		
		let str = "";
		
		let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.fileName);
		
		str += "<div id='result_card'>";
		str += "<img src='/display?fileName=" + fileCallPath +"'>";
		str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
		str += "</div>";		
		
   		uploadResult.append(str); 
		
	}
	
	/* 이미지 삭제 버튼 동작 */
	$("#uploadResult").on("click", ".imgDeleteBtn", function(e){
		
		deleteFile();
		
	});
	
	/* 파일 삭제 메서드 */
	function deleteFile(){
		
		let targetFile = $(".imgDeleteBtn").data("file");
		
		let targetDiv = $("#result_card");
		
		$.ajax({
			url: '/admin/deleteFile',
			data : {fileName : targetFile},
			dataType : 'text',
			type : 'POST',
			success : function(result){
				console.log(result);
				
				targetDiv.remove();
				$("input[type='file']").val("");
				
			},
			error : function(result){
				console.log(result);
				
				alert("파일을 삭제하지 못하였습니다.")
			}
		});
	}

</script>  
 
</body>
</html>
