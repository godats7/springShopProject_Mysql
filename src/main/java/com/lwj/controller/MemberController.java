package com.lwj.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lwj.model.MemberVO;
import com.lwj.service.MemberService;

@Controller
@RequestMapping(value = "/member")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger("MemberController.class");
	
	//ȸ�������� ���� memberService
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private JavaMailSender mailSender;
	
		//ȸ������ ������ �̵�
		@RequestMapping(value = "join", method = RequestMethod.GET)
		public void joinGet() {
			System.out.println("join in");
			logger.info("ȸ������ ������ ����");
			System.out.println("join out");		
		}
		
		//ȸ������
		@RequestMapping(value = "/join", method = RequestMethod.POST)
		public String joinPost(MemberVO member) throws Exception{
			logger.info("join ����");
			
			//ȸ������ ���� ����
			memberService.memberJoin(member);
			logger.info("join service ����");
			
			return "redirect:/";
		}
		
		//�α��� ������ �̵�
		@RequestMapping(value = "login", method = RequestMethod.GET)
		public void loginGet() {
			System.out.println("login in");
			logger.info("�α��� ������ ����");
			System.out.println("login out");
		}
		
		//���̵� �ߺ� �˻�
		@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
		@ResponseBody
		public String memberIdChkPost(String memberId) throws Exception{
			System.out.println("memberIdChk in");
			logger.info("memberIdChk ����");
									
			int result = memberService.idCheck(memberId);
			
			logger.info("����� = " + result);
			
			
			System.out.println("memberIdChk out");	
			
			if(result != 0) {
				
				return "fail";	// �ߺ� ���̵� ����
				
			} else {
				
				return "success";	// �ߺ� ���̵� x
				
			}
			
			
		}
		
		/* �̸��� ���� ���*/
		@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
		@ResponseBody
		public String mailCheckGet(String email) throws Exception{
			System.out.println("mail chk in");
			 /* ��(View)�κ��� �Ѿ�� ������ Ȯ�� */
	        logger.info("�̸��� ������ ���� Ȯ��");
	        logger.info("������ȣ : " + email);
	        
	        Random random =new Random();
	        int checkNum = random.nextInt(888888) + 111111; //111111~999999�� ����
	        logger.info("������ȣ : "+checkNum);
	        System.out.println("������ȣ : "+checkNum);
	        /* �̸��� ������ */
	        String setFrom = "godats7@naver.com"; //root-context�� �����ϰ�
	        String toMail = email; //join.jsp���� ���� email
	        String title = "ȸ������ ���� �̸��� �Դϴ�.";
	        String content = 
	                "wookdol`s imageshop�� �湮���ּż� �����մϴ�." +
	                "<br><br>" + 
	                "���� ��ȣ�� " + checkNum + "�Դϴ�." + 
	                "<br>" + 
	                "�ش� ������ȣ�� ������ȣ Ȯ�ζ��� �����Ͽ� �ּ���.";
	        
	        try {
	            
	            MimeMessage message = mailSender.createMimeMessage();
	            System.out.println("1****");
	            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
	            System.out.println("2****");
	            helper.setFrom(setFrom);
	            System.out.println("3****"+helper.toString());
	            helper.setTo(toMail);
	            System.out.println("4****"+helper.toString());
	            helper.setSubject(title);
	            System.out.println("5****"+helper.toString());
	            helper.setText(content,true);
	            System.out.println("6****"+helper.toString());
	            mailSender.send(message);
	            System.out.println("7****"+helper.toString());
	            
	            System.out.println("�־ʵ� : "+message.toString());
	            
	        }catch(Exception e) {
	            e.printStackTrace();
	        }
	        
	        System.out.println("mail chk out");
	        
	        String num = Integer.toString(checkNum);
	        
	        return num;
		}

}
