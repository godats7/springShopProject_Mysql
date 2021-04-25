package com.lwj.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lwj.mapper.AuthorMapper;
import com.lwj.model.AuthorVO;

@Service
public class AuthorServiceImpl implements AuthorService{
	
	@Autowired
	AuthorMapper authorMapper;

	@Override
	public void authorEnroll(AuthorVO author) throws Exception {
		// TODO Auto-generated method stub
		
		authorMapper.authorEnroll(author);
		
	}
	
	
	

}
