package com.lwj.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
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
			
//			//ȸ������ ���� ����(��й�ȣ ��ȣȭ�� ���� �ּ�ó��)
//			memberService.memberJoin(member);
//			logger.info("join service ����");
			
			 String rawPw = ""; // ���ڵ��� ��й�ȣ
			 String encodedPw = ""; // ���ڵ� �� ��й�ȣ
			 
			 rawPw = member.getMemberPw(); //��й�ȣ ������get
			 encodedPw = pwEncoder.encode(rawPw); //��й�ȣ ������ ���ڵ�
			 member.setMemberPw(encodedPw); //���ڵ��� ������set, member��ü�� �ٽ�����
					 
			 /* ȸ������ ���� ���� */
		    memberService.memberJoin(member);
			
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
	            
	            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
	            
	            helper.setFrom(setFrom);
	            
	            helper.setTo(toMail);
	            
	            helper.setSubject(title);
	            
	            helper.setText(content,true);
	            
	            mailSender.send(message);
	          
	            
	        }catch(Exception e) {
	            e.printStackTrace();
	        }
	        
	        System.out.println("mail chk out");
	        
	        String num = Integer.toString(checkNum);
	        
	        return num;
		}
		
		 /* �α��� */
	    @RequestMapping(value="login", method=RequestMethod.POST)
	    public String loginPost(HttpServletRequest request, MemberVO member, RedirectAttributes rttr) throws Exception{
	        
	        System.out.println("login �޼��� ����");
	        System.out.println("���޵� ������ : " + member);
	        
	      //ȸ������ ���� ����(��й�ȣ ��ȣȭ�� ���� �ּ�ó��) 
//	        HttpSession session = request.getSession();
//	        MemberVO loginVO = memberService.memberLogin(member);
//	        
//	        if(loginVO == null) {                                // ��ġ���� �ʴ� ���̵�, ��й�ȣ �Է� ���
//	            
//	            int result = 0;
//	            rttr.addFlashAttribute("result", result);
//	            return "redirect:/member/login";
//	            
//	        }
//	        
//	        session.setAttribute("member", loginVO);             // ��ġ�ϴ� ���̵�, ��й�ȣ ��� (�α��� ����)
	        
	        HttpSession session =  request.getSession();
	        
	        String rawPw = "";
	        String encodedPw = "";
	        
	        MemberVO loginVO = memberService.memberLogin(member);
	        
	        if(loginVO != null) {            // ��ġ�ϴ� ���̵� �����
	        	
	        	 rawPw = member.getMemberPw();        // ����ڰ� ������ ��й�ȣ
	             encodedPw = loginVO.getMemberPw();        // �����ͺ��̽��� ������ ���ڵ��� ��й�ȣ
	             
	             if(true == pwEncoder.matches(rawPw, encodedPw)) {        // ��й�ȣ ��ġ���� �Ǵ�
	            	 
	            	 loginVO.setMemberPw("");                    // ���ڵ��� ��й�ȣ ���� ����
	                 session.setAttribute("member", loginVO);     // session�� ������� ���� ����
	                 return "redirect:/";        // ���������� �̵�
	                 
	             } else {
	            	 
	            	 rttr.addFlashAttribute("result", 0); //parameter �����
			         return "redirect:/member/login";
			            	                 
	             }
	        	
	            
	        } else {                    // ��ġ�ϴ� ���̵� �������� ���� �� (�α��� ����)
	            
	        	 rttr.addFlashAttribute("result", 0); //parameter �����
		         return "redirect:/member/login";           
      	
	        }
	        
	       
	    }
	    /* ���������� �α׾ƿ� */
	    @RequestMapping(value = "logout.do", method = RequestMethod.GET)
	    public String logoutMainGet(HttpServletRequest request) throws Exception{
	    	
	    	logger.info("logoutMainGet ����");
	    	
	    	HttpSession session = request.getSession();
	    	
	    	 session.invalidate(); //������ü ��ȿȭ
	    	 System.out.println("���� ��ȿȭ �Ϸ�"); 	 
	         
	         return "redirect:/";
	         
	         
	    }

}
