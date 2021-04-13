package com.lwj.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;


@Controller
public class ImageController {
	/* log4j ������̼����� �����(lombok ����) */
	private static final Logger logger = LoggerFactory.getLogger("ImageController.class");

	/* ���������� �̵� */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String mainPageGet() {
		System.out.println("main���Դ�");
		logger.info("����������");
		System.out.println("main������");
		
		return "main";
		
		
	}

}
/* �Ʒ��� ����� �ȵǼ� �������� ��  (org.springframework.web.servlet.pagenotfound - no mapping for get) */

//public class ImageController {
//	/* log4j ������̼����� �����(lombok ����) */
//	private static final Logger logger = LoggerFactory.getLogger("ImageController.class");
//
//	/* ���������� �̵� */
//	@RequestMapping(value = "/main", method = RequestMethod.GET)
//	public void mainPageGet() {
//		System.out.println("���Դ�");
//		logger.info("����������");
//		System.out.println("������");
//		/		
//		
//		
//	}
//
//}

