package com.lwj.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lwj.mapper.AdminMapper;
import com.lwj.model.ImageVO;

import jdk.internal.jline.internal.Log;
import lombok.extern.log4j.Log4j;

@Service
//@Log4j
public class AdminServiceImpl implements AdminService{
	
	private static final Logger log = LoggerFactory.getLogger(AuthorServiceImpl.class);
	
	@Autowired
	private AdminMapper adminMapper;

	@Override
	public void imageEnroll(ImageVO image) {
		// TODO Auto-generated method stub
		
		log.info("service)imageEnroll.......");
		
		adminMapper.imageEnroll(image);
		
	}
	
	

}
