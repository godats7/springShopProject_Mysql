package com.lwj.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lwj.mapper.MemberMapper;
import com.lwj.model.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	MemberMapper memberMapper;

	@Override
	public void memberJoin(MemberVO member) throws Exception {
		// TODO Auto-generated method stub
		
		memberMapper.memberJoin(member);
		
		
		
	}
	
	
	
	

}
