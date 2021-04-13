package com.lwj.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;


@Controller
public class ImageController {
	/* log4j 어노테이션으로 사용사능(lombok 사용시) */
	private static final Logger logger = LoggerFactory.getLogger("ImageController.class");

	/* 메인페이지 이동 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String mainPageGet() {
		System.out.println("main들어왔다");
		logger.info("메인페이지");
		System.out.println("main나간다");
		
		return "main";
		
		
	}

}
/* 아래의 방법이 안되서 리턴으로 함  (org.springframework.web.servlet.pagenotfound - no mapping for get) */

//public class ImageController {
//	/* log4j 어노테이션으로 사용사능(lombok 사용시) */
//	private static final Logger logger = LoggerFactory.getLogger("ImageController.class");
//
//	/* 메인페이지 이동 */
//	@RequestMapping(value = "/main", method = RequestMethod.GET)
//	public void mainPageGet() {
//		System.out.println("들어왔다");
//		logger.info("메인페이지");
//		System.out.println("나간다");
//		/		
//		
//		
//	}
//
//}

