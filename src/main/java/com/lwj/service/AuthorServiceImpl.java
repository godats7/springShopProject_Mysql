package com.lwj.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lwj.mapper.AuthorMapper;
import com.lwj.model.AuthorVO;
import com.lwj.model.Criteria;

@Service
public class AuthorServiceImpl implements AuthorService{
	
	private static final Logger log = LoggerFactory.getLogger(AuthorServiceImpl.class);
	
	@Autowired
	AuthorMapper authorMapper;
	
	// 작가등록
	@Override
	public void authorEnroll(AuthorVO author) throws Exception {
		// TODO Auto-generated method stub
		
		authorMapper.authorEnroll(author);
		
	}
	
	// 작가 목록
	@Override
	public List<AuthorVO> authorGetList(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		
		log.info("(service)authorGetList........"+criteria);
		
		return authorMapper.authorGetList(criteria);
	}

	// 작가 총 수
	@Override
	public int authorGetTotal(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		
		log.info("(service)authorGetTotalList........"+criteria);
		return authorMapper.authorGetTotal(criteria);
	}

	//  작가 상세
	@Override
	public AuthorVO authorGetDetail(int authorId) throws Exception {
		// TODO Auto-generated method stub
		log.info("authorGetDetail........" + authorId);
		return authorMapper.authorGetDetail(authorId);
	}

	// 작가정보 수정
	@Override
	public int authorModify(AuthorVO author) throws Exception {
		// TODO Auto-generated method stub
		log.info("(service) authorModify........." + author);
		return authorMapper.authorModify(author);
	}
	
	
	
	
	
	
	
	
	
	

}
