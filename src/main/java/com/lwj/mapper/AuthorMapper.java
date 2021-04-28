package com.lwj.mapper;

import java.util.List;

import com.lwj.model.AuthorVO;
import com.lwj.model.Criteria;

public interface AuthorMapper {
	
	/* 작가 등록 */
	public void authorEnroll(AuthorVO author);
	
	/* 작가 목록 */
	public List<AuthorVO> authorGetList(Criteria criteria);
	
	/* 작가 총 수 */
    public int authorGetTotal(Criteria criteria);

}
