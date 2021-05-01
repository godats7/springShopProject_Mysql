package com.lwj.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.lwj.model.ImageVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class AdminMapperTest {
	
	@Autowired
	private AdminMapper mapper;
	
	/* 상품 등록 */
	@Test
	public void imageEnrollTest() throws Exception{
		
		ImageVO image = new ImageVO();
		
		image.setImageName("mapper 테스트");
		image.setAuthorId(123);
		image.setPubleYear("2021-03-18");
		image.setPublisher("출판사");
		image.setCatCode("0231");
		image.setImagePrice(20000);
		image.setImageStock(300);
		image.setImageDiscount(0.23);
		image.setImageIntro("이미지 소개 ");
		image.setImageContents("이미지 내용 ");
		
		mapper.imageEnroll(image);
	}
	

}
