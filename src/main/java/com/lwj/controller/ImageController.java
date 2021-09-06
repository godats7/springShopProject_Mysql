package com.lwj.controller;



import java.io.File;
import java.io.IOException;

import java.nio.file.Files;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lwj.mapper.AttachMapper;
import com.lwj.model.AttachImageVO;


@Controller
public class ImageController {
	/* log4j 어노테이션으로 사용사능(lombok 사용시) */
	private static final Logger logger = LoggerFactory.getLogger("ImageController.class");
	
	@Autowired
	private AttachMapper attachMapper;
	

	/* 메인페이지 이동 */
	@RequestMapping(value = "/", method = RequestMethod.GET)

	public String mainPageGet() {
		System.out.println("main들어왔다");
		logger.info("메인페이지");
		System.out.println("main나간다");
		
		return "main";
		
	
}
	
	@GetMapping("/display")
	public ResponseEntity<byte[]> getImage(String fileName){
		
		logger.info("getImage().........."+fileName);
		
		File file = new File("c:\\upload\\" + fileName);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-type", Files.probeContentType(file.toPath()));
			
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			
		}catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	/* 이미지 정보 반환 */
	@GetMapping(value="/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<AttachImageVO>> getAttachList(int bookId){
		
		logger.info("getAttachList.........." + bookId);
		
		return new ResponseEntity<List<AttachImageVO>>(attachMapper.getAttachList(bookId), HttpStatus.OK);
		
	}
	
	
/* 아래의 방법이 안되서 리턴으로 함  (org.springframework.web.servlet.pagenotfound - no mapping for get) */

//@Controller
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
//		
//		
//	}

}

