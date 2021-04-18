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
	
	//회원가입을 위한 memberService
	@Autowired
	private MemberService memberService;
	
		//회원가입 페이지 이동
		@RequestMapping(value = "join", method = RequestMethod.GET)
		public void joinGet() {
			System.out.println("join in");
			logger.info("회원가입 페이지 진입");
			System.out.println("join out");		
		}
		
		//회원가입
		@RequestMapping(value = "/join", method = RequestMethod.POST)
		public String joinPost(MemberVO member) throws Exception{
			logger.info("join 진입");
			
			//회원가입 서비스 실행
			memberService.memberJoin(member);
			logger.info("join service 성공");
			
			return "redirect:/";
		}
		
		//로그인 페이지 이동
		@RequestMapping(value = "login", method = RequestMethod.GET)
		public void loginGet() {
			System.out.println("login in");
			logger.info("로그인 페이지 진입");
			System.out.println("login out");
		}
		
		//아이디 중복 검사
		@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
		@ResponseBody
		public String memberIdChkPost(String memberId) throws Exception{
			System.out.println("memberIdChk in");
			logger.info("memberIdChk 진입");
									
			int result = memberService.idCheck(memberId);
			
			logger.info("결과값 = " + result);
			
			
			System.out.println("memberIdChk out");	
			
			if(result != 0) {
				
				return "fail";	// 중복 아이디가 존재
				
			} else {
				
				return "success";	// 중복 아이디 x
				
			}
			
			
		}
		
		/* 이메일 인증 기능*/
		@RequestMapping(value = "/mailCheck", method =RequestMethod.GET)
		@ResponseBody
		public void mailCheckGet(String email) throws Exception{
			
			 /* 뷰(View)로부터 넘어온 데이터 확인 */
	        logger.info("이메일 데이터 전송 확인");
	        logger.info("인증번호 : " + email);
			
		}

}
