package com.lwj.service;

import com.lwj.model.MemberVO;

public interface MemberService {
	
	public void memberJoin(MemberVO member) throws Exception;
	
	public int idCheck(String memberId) throws Exception;

	public MemberVO memberLogin(MemberVO member) throws Exception;
	
	
	
}
