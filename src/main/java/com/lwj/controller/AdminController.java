package com.lwj.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lwj.model.AuthorVO;
import com.lwj.service.AuthorService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private AuthorService authorService;
	
	/* 메인페이지 이동 */
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public void adminMainGet() throws Exception{
		
		logger.info("메인 페이지 이동");
	}

	/* 상품 관리 이동 */
	@RequestMapping(value = "goodsManage", method = RequestMethod.GET)
	public void goodsManageGet() throws Exception{
		 logger.info("상품관리 이동");
	}
	
	/* 상품 등록 이동 */
	@RequestMapping(value = "goodsEnroll", method = RequestMethod.GET)
	public void goodsEnrollGet() throws Exception{
		  logger.info("상품 등록 이동");
	}
	
	/* 작가 관리 이동*/
	@RequestMapping(value = "authorManage", method = RequestMethod.GET)
	public void authorManageGet() throws Exception{
		logger.info("작가관리 이동");
	}
	
	/* 작가 등록 이동 */
	@RequestMapping(value = "authorEnroll", method = RequestMethod.GET)
	public void authorEnrollGet() throws Exception{
		logger.info("작가 등록 이동 ");
	}
	
	@RequestMapping(value = "authorEnroll.do", method = RequestMethod.POST)
	public String authorEnrollPost(AuthorVO author, RedirectAttributes rttr) throws Exception{
		
		logger.info("authorEnroll in : " + author);
		authorService.authorEnroll(author);      // 작가 등록 쿼리 수행
		rttr.addFlashAttribute("enroll_result : ", author.getAuthorName());
        
        return "redirect:/admin/authorManage";
		
	}
	
	
}
