package com.lwj.mapper;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.lwj.model.AttachImageVO;
import com.lwj.model.ImageVO;
import com.lwj.service.AdminService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class AdminServiceTest {
	
	@Autowired
	private AdminService service;
	
	/* 상품 등록 & 상품 이미지 등록 테스트 */
	@Test
	public void imageEnrollTEsts() {

		ImageVO image = new ImageVO();
		// 상품 정보
		image.setImageName("service 테스트");
		image.setAuthorId(27);
		image.setPubleYear("2021-03-18");
		image.setPublisher("출판사");
		image.setCatCode("202001");
		image.setImagePrice(20000);
		image.setImageStock(300);
		image.setImageDiscount(0.23);
		image.setImageIntro("책 소개 ");
		image.setImageContents("책 목차 ");

		// 이미지 정보
		List<AttachImageVO> imageList = new ArrayList<AttachImageVO>(); 
		
		AttachImageVO image1 = new AttachImageVO();
		AttachImageVO image2 = new AttachImageVO();
		
		image1.setFileName("test Image 1");
		image1.setUploadPath("test image 1");
		image1.setUuid("test1111");
		
		image2.setFileName("test Image 2");
		image2.setUploadPath("test image 2");
		image2.setUuid("test2222");
		
		imageList.add(image1);
		imageList.add(image2);
		
		
		// imageEnroll() 메서드 호출
		service.imageEnroll(image);
		
		System.out.println("등록된 VO : " + image);
		
		
	}

}
