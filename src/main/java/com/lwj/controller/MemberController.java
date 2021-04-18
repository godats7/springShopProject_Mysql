package com.lwj.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
		@RequestMapping(value = "/mailCheck", method =RequestMethod.GET)
		@ResponseBody
		public void mailCheckGet(String email) throws Exception{
			
			 /* ��(View)�κ��� �Ѿ�� ������ Ȯ�� */
	        logger.info("�̸��� ������ ���� Ȯ��");
	        logger.info("������ȣ : " + email);
			
		}

}
