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
				<span class="final_id_ck">���̵� �Է����ּ���.</span>
			</div>			
			<div class="pw_wrap">
				<div class="pw_name">��й�ȣ</div>
				<div class="pw_input_box">
					<input class="pw_input" name="memberPw"><!--name�� memberVO�� �ִ� �����  -->
				</div>
				<span class="final_pw_ck">��й�ȣ�� �Է����ּ���.</span>
			</div>		
			<div class="pwck_wrap">
				<div class="pwck_name">��й�ȣ Ȯ��</div>
				<div class="pwck_input_box">
					<input class="pwck_input">
				</div>
				<span class="final_pwck_ck">��й�ȣ Ȯ���� �Է����ּ���.</span>
				<span class="pwck_input_re_1">��й�ȣ�� ��ġ�մϴ�.</span>
                <span class="pwck_input_re_2">��й�ȣ�� ��ġ���� �ʽ��ϴ�.</span>
			</div>			
			<div class="user_wrap">
				<div class="user_name">�̸�</div>
				<div class="user_input_box">
					<input class="user_input" name="memberName"><!--name�� memberVO�� �ִ� �����  -->
				</div>
				<span class="final_name_ck">�̸��� �Է����ּ���.</span>
			</div>			
			<div class="mail_wrap">
				<div class="mail_name">�̸���</div> 
				<div class="mail_input_box">
					<input class="mail_input" name="memberMail"><!--name�� memberVO�� �ִ� �����  -->
				</div>
				<span class="final_mail_ck">�̸����� �Է����ּ���.</span>
				<div class="mail_check_wrap">
					<div class="mail_check_input_box" id="mail_check_input_box_false">
						<input class="mail_check_input" disabled="disabled">
					</div>
					<div class="mail_check_btn">
						<span>������ȣ ����</span>
					</div>
					<div class="clearfix"></div>
					<span id="mail_check_input_box_warn"></span>
				</div>
			</div>
			<div class="address_wrap">
				<div class="address_name">�ּ�</div>
				<div class="address_input_1_wrap">
					<div class="address_input_1_box">
						<input class="address_input_1" name="memberAddr1" readonly="readonly"><!--name�� memberVO�� �ִ� �����  -->						
					</div>
					<div class="address_btn" onclick="show_daum_address()">
						<span>�ּ� ã��</span>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class ="address_input_2_wrap">
					<div class="address_input_2_box">
						<input class="address_input_2" name="memberAddr2" readonly="readonly"><!--name�� memberVO�� �ִ� �����  -->
					</div>
				</div>
				<div class ="address_input_3_wrap">
					<div class="address_input_3_box">
						<input class="address_input_3"  name="memberAddr3" readonly="readonly"><!--name�� memberVO�� �ִ� �����  -->
					</div>
				</div>
				<span class="final_addr_ck">�ּҸ� �Է����ּ���.</span>
			</div>
			<div class="join_btn_wrap">
				<input type="button" class="join_btn" value="�����ϱ�">
			</div>
		</div>
	</form>
</div>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
//��ȿ���˻� ������� ����
 var idCheck = false;            // ���̵�
 var idckCheck = false;            // ���̵� �ߺ� �˻�
 var pwCheck = false;            // ���
 var pwckCheck = false;            // ��� Ȯ��
 var pwckcorCheck = false;        // ��� Ȯ�� ��ġ Ȯ��
 var nameCheck = false;            // �̸�
 var mailCheck = false;            // �̸���
 var mailnumCheck = false;        // �̸��� ������ȣ Ȯ��
 var addressCheck = false         // �ּ�
 var code = ""; //�̸������� ������ȣ �������� �ڵ�

//ȸ������ ��ư(ȸ������ ��� �۵�)
$(document).ready(function(){
	
	$(".join_btn").click(function(){
		
		/* �Է°� ���� */
        var id = $('.id_input').val();                 // id �Է¶�
        var pw = $('.pw_input').val();                // ��й�ȣ �Է¶�
        var pwck = $('.pwck_input').val();            // ��й�ȣ Ȯ�� �Է¶�
        var name = $('.user_input').val();            // �̸� �Է¶�
        var mail = $('.mail_input').val();            // �̸��� �Է¶�
        var addr = $('.address_input_3').val();        // �ּ� �Է¶�
        
        /* ���̵� ��ȿ���˻� */
        if(id == ""){
            $('.final_id_ck').css('display','block');
            idCheck = false;
        }else{
            $('.final_id_ck').css('display', 'none');
            idCheck = true;
        }
        
        /* ��й�ȣ ��ȿ�� �˻� */
        if(pw == ""){
            $('.final_pw_ck').css('display','block');
            pwCheck = false;
        }else{
            $('.final_pw_ck').css('display', 'none');
            pwCheck = true;
        }
        
        /* ��й�ȣ Ȯ�� ��ȿ�� �˻� */
        if(pwck == ""){
            $('.final_pwck_ck').css('display','block');
            pwckCheck = false;
        }else{
            $('.final_pwck_ck').css('display', 'none');
            pwckCheck = true;
        }
        
        /* �̸� ��ȿ���˻� */
        if(name ==""){
        	$('.final_name_ck').css('display','block');
            nameCheck = false;
        }else{
            $('.final_name_ck').css('display', 'none');
            nameCheck = true;
        }
        
        /* �̸��� ��ȿ�� �˻� */
        if(mail == ""){
            $('.final_mail_ck').css('display','block');
            mailCheck = false;
        }else{
            $('.final_mail_ck').css('display', 'none');
            mailCheck = true;
        }
        
        /* �ּ� ��ȿ�� �˻� */
        if(addr == ""){
            $('.final_addr_ck').css('display','block');
            addressCheck = false;
        }else{
            $('.final_addr_ck').css('display', 'none');
            addressCheck = true;
        }
        
        /* ���� ��ȿ�� �˻� */
        if(idCheck&&idckCheck&&pwCheck&&pwckCheck&&pwckcorCheck&&nameCheck&&mailCheck&&mailnumCheck&&addressCheck ){
        	$("#join_form").attr("action", "/member/join");
    		$("#join_form").submit();
        } 
        
        return false;
		
		
	});
});

//���̵� �ߺ�üũ
$('.id_input').on("propertychange - change keyup paste input", function () {
	
	/* console.log("keyup test has no problem"); */
	
	var memberId = $('.id_input').val(); // .id_input�� �ԷµǴ� ��
	var data = {memberId : memberId}  // '��Ʈ�ѿ� �ѱ� ������ �̸�' : '������(.id_input�� �ԷµǴ� ��)'
	
	$.ajax({
		type : "post",
		url : "/member/memberIdChk",
		data : data,
		success : function(result){
			 console.log("���� ����" + result);
			 if(result != 'fail'){
					$('.id_input_re_1').css("display","inline-block");
					$('.id_input_re_2').css("display", "none");		
					idckCheck = true;
				} else {
					$('.id_input_re_2').css("display","inline-block");
					$('.id_input_re_1').css("display", "none");	
					idckCheck = false;
				}
			
		}// success ����
	}); // end of ajax	
});

/* ������ȣ �̸��� ���� */
$(".mail_check_btn").click(function(){
    
    var email = $(".mail_input").val();            // �Է��� �̸���
    var cehckBox = $(".mail_check_input");        // ������ȣ �Է¶�
    var boxWrap = $(".mail_check_input_box");    // ������ȣ �Է¶� �ڽ�
    
    $.ajax({
        
        type:"GET",
        url:"mailCheck?email=" + email,
        success:function(data){
            
            //console.log("data : " + data);
            cehckBox.attr("disabled",false);
            boxWrap.attr("id", "mail_check_input_box_true");
            code = data;
            
        }
                
    });
    
});


/* ������ȣ �� */
$(".mail_check_input").blur(function(){
    
    var inputCode = $(".mail_check_input").val();        // �Է��ڵ�    
    var checkResult = $("#mail_check_input_box_warn");    // �� ���     
    
    if(inputCode == code){                            // ��ġ�� ���
        checkResult.html("������ȣ�� ��ġ�մϴ�.");
        checkResult.attr("class", "correct");   
        mailnumCheck = true;
    } else {                                            // ��ġ���� ���� ���
        checkResult.html("������ȣ�� �ٽ� Ȯ�����ּ���.");
        checkResult.attr("class", "incorrect");
        mailnumCheck = false;
    };    
    
});


/* ���� �ּ� ���� */
function show_daum_address(){
	//�� ���������� ���θ� �ּ� ǥ�� ��Ŀ� ���� ���ɿ� ����, �������� �����͸� �����Ͽ� �ùٸ� �ּҸ� �����ϴ� ����� �����մϴ�.
	console.log("���� �ּ� ����")
           new daum.Postcode({
            oncomplete: function(data) {
            	// �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                var addr = ''; // �ּ� ����
                var extraAddr = ''; // �����׸� ����
 
                //����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
                if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
                    addr = data.roadAddress;
                } else { // ����ڰ� ���� �ּҸ� �������� ���(J)
                    addr = data.jibunAddress;
                }
 
                // ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����׸��� �����Ѵ�.
                if(data.userSelectedType === 'R'){
                    // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
                    // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
                    if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // ǥ���� �����׸��� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // �ּҺ��� ���ڿ��� �����׸� ���ڿ� ��ġ��
                    addr += extraAddr;
                
                } else {
                	addr += ' ';
                }
 
                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
                //$(".address_input_1").val(data.zonecode);
        	    $("[name=memberAddr1]").val(data.zonecode);    // ��ü����
        	    //$(".address_input_2").val(addr);
          		$("[name=memberAddr2]").val(addr);            // ��ü����
                // Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
       		    // ���ּ� �Է¶� disabled �Ӽ� ���� �� Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
                $(".address_input_3").attr("readonly",false);
                $(".address_input_3").focus();
            }
        }).open();
    
}

/* ��й�ȣ Ȯ�� ��ġ ��ȿ�� �˻� */

$('.pwck_input').on("propertychange change keyup paste input", function(){
	
	 var pw = $('.pw_input').val();
	    var pwck = $('.pwck_input').val();
	    $('.final_pwck_ck').css('display', 'none');
	        
	    if(pw == pwck){
	        $('.pwck_input_re_1').css('display','block');
	        $('.pwck_input_re_2').css('display','none');
	        pwckcorCheck = true;
	    }else{
	        $('.pwck_input_re_1').css('display','none');
	        $('.pwck_input_re_2').css('display','block');
	        pwckcorCheck = false;
	    } 
    
}); 

</script>
	

</body>
</html>