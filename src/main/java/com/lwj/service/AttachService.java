package com.lwj.service;

import java.util.List;

import com.lwj.model.AttachImageVO;

public interface AttachService {
	
	/* 이미지 데이터 반환 */
	public List<AttachImageVO> getAttachList(int imageId);
	

}
