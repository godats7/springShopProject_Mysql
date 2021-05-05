package com.lwj.service;

import java.util.List;

import com.lwj.model.CategoryVO;
import com.lwj.model.Criteria;
import com.lwj.model.ImageVO;

public interface AdminService {
	
	/* 상품(이미지) 등록 */
	public void imageEnroll(ImageVO image);

	/* 카테고리 리스트 */
	public List<CategoryVO> catList();
	
	/* 상품 리스트 */
	public List<ImageVO> goodsGetList(Criteria criteria);
	
	/* 상품 총 개수 */
	public int goodsGetTotal(Criteria criteria);	
	
	/* 상품 조회 페이지 */
	public ImageVO goodsGetDetail(int imageId);	
	
	/* 상품 수정 */
	public int goodsModify(ImageVO image);
}
