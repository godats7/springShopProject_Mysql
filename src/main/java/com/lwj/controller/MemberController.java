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
	
	//회원가입을 위한 memberService
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private JavaMailSender mailSender;
	
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
		@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
		@ResponseBody
		public String mailCheckGet(String email) throws Exception{
			System.out.println("mail chk in");
			 /* 뷰(View)로부터 넘어온 데이터 확인 */
	        logger.info("이메일 데이터 전송 확인");
	        logger.info("인증번호 : " + email);
	        
	        Random random =new Random();
	        int checkNum = random.nextInt(888888) + 111111; //111111~999999의 숫자
	        logger.info("인증번호 : "+checkNum);
	        System.out.println("인증번호 : "+checkNum);
	        /* 이메일 보내기 */
	        String setFrom = "godats7@naver.com"; //root-context랑 동일하게
	        String toMail = email; //join.jsp에서 받은 email
	        String title = "회원가입 인증 이메일 입니다.";
	        String content = 
	                "wookdol`s imageshop을 방문해주셔서 감사합니다." +
	                "<br><br>" + 
	                "인증 번호는 " + checkNum + "입니다." + 
	                "<br>" + 
	                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
	        
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
		
		 /* 로그인 */
	    @RequestMapping(value="login", method=RequestMethod.POST)
	    public String loginPost(HttpServletRequest request, MemberVO member, RedirectAttributes rttr) throws Exception{
	        
	        System.out.println("login 메서드 진입");
	        System.out.println("전달된 데이터 : " + member);
	        
	        HttpSession session = request.getSession();
	        MemberVO loginVO = memberService.memberLogin(member);
	        
	        if(loginVO == null) {                                // 일치하지 않는 아이디, 비밀번호 입력 경우
	            
	            int result = 0;
	            rttr.addFlashAttribute("result", result);
	            return "redirect:/member/login";
	            
	        }
	        
	        session.setAttribute("member", loginVO);             // 일치하는 아이디, 비밀번호 경우 (로그인 성공)
	        
	        return "redirect:/";
	    }

}
