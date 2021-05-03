package com.lwj.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.lwj.model.Criteria;
import com.lwj.model.ImageVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class AdminMapperTest {
	
	@Autowired
	private AdminMapper mapper;
	
//	/* 상품 등록 */
//	@Test
//	public void imageEnrollTest() throws Exception{
//		
//		ImageVO image = new ImageVO();
//		
//		image.setImageName("mapper 테스트");
//		image.setAuthorId(123);
//		image.setPubleYear("2021-03-18");
//		image.setPublisher("출판사");
//		image.setCatCode("0231");
//		image.setImagePrice(20000);
//		image.setImageStock(300);
//		image.setImageDiscount(0.23);
//		image.setImageIntro("이미지 소개 ");
//		image.setImageContents("이미지 내용 ");
//		
//		mapper.imageEnroll(image);
//	}

//	/* 카테고리 리스트 */
//	@Test
//	public void catListTest() throws Exception{
//		
//		System.out.println("catList()..........." + mapper.catList());
//		
//	}
	
//	/* 상품 리스트 & 상품 총 갯수 */
//	@Test
//	public void goodsGetListTest() {
//		
//		Criteria criteria = new Criteria();
//		
//		/* 검색조건 */
//		criteria.setKeyword("테스트");
//		
//		/* 검색 리스트 */
//		List list = mapper.goodsGetList(criteria);
//		for(int i = 0; i < list.size(); i++) {
//			System.out.println("result......." + i + " : " + list.get(i));
//		}
//		
//		/* 상품 총 갯수 */
//		int result = mapper.goodsGetTotal(criteria);
//		System.out.println("result.........." + result);
//		
//		
//	}

	
	/* 상품 조회 페이지 */
	@Test
	public void goodsGetDetailTest() {
		
		int imageId = 1;
		
		ImageVO result = mapper.goodsGetDetail(imageId);
		
		System.out.println("상품 조회 데이터 : " + result);
		
		
	}
}
