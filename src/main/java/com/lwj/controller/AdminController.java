package com.lwj.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	
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
		
	
}
