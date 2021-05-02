package com.lwj.service;

import java.util.List;

import com.lwj.model.CategoryVO;
import com.lwj.model.ImageVO;

public interface AdminService {
	
	/* 상품(이미지) 등록 */
	public void imageEnroll(ImageVO image);

	/* 카테고리 리스트 */
	public List<CategoryVO> catList();
}
