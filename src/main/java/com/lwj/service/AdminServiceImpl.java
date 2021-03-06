package com.lwj.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lwj.mapper.AdminMapper;
import com.lwj.model.CategoryVO;
import com.lwj.model.Criteria;
import com.lwj.model.ImageVO;

import jdk.internal.jline.internal.Log;
import lombok.extern.log4j.Log4j;

@Service
//@Log4j
public class AdminServiceImpl implements AdminService{
	
	private static final Logger log = LoggerFactory.getLogger(AuthorServiceImpl.class);
	
	@Autowired
	private AdminMapper adminMapper;

	@Transactional
	@Override
	public void imageEnroll(ImageVO image) {
		// TODO Auto-generated method stub
		
		log.info("service)imageEnroll.......");
		
		adminMapper.imageEnroll(image);
		
		if(image.getImageList() == null || image.getImageList().size() <= 0) {
			return;
		}
		
//		image.getImageList().forEach(attach ->{
//			
//			attach.setImageId(image.getImageId());
//			adminMapper.imageEnroll(image);
//			
//		});
		
		// 일반적 for문
        for(int i = 0; i < image.getImageList().size(); i++) {
        	image.setImageId(image.getImageId());
        	adminMapper.imageEnroll(image);
		}
	}

	@Override
	public List<CategoryVO> catList() {
		// TODO Auto-generated method stub
		
		log.info("(service)catList........");
		
		return adminMapper.catList();
	}

	@Override
	public List<ImageVO> goodsGetList(Criteria criteria) {
		// TODO Auto-generated method stub
		log.info("goodsGetTotalList()..........");
		return adminMapper.goodsGetList(criteria);
	}

	@Override
	public int goodsGetTotal(Criteria criteria) {
		// TODO Auto-generated method stub
		log.info("goodsGetTotal().........");
		return adminMapper.goodsGetTotal(criteria);
	}

	@Override
	public ImageVO goodsGetDetail(int imageId) {
		// TODO Auto-generated method stub
		log.info("(service)bookGetDetail......." + imageId);
		return adminMapper.goodsGetDetail(imageId);
	}

	@Override
	public int goodsModify(ImageVO image) {
		// TODO Auto-generated method stub
		log.info("goodsModify........");		
		return adminMapper.goodsModify(image);
	}

	@Override
	public int goodsDelete(int imageId) {
		// TODO Auto-generated method stub
		log.info("goodsDelete........");
		return adminMapper.goodsDelete(imageId);
	}
	
	
	
	
	
	
	
	
	
	

}
