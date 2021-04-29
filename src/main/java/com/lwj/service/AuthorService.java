package com.lwj.service;

import java.util.List;

import com.lwj.model.AuthorVO;
import com.lwj.model.Criteria;

public interface AuthorService {

	/* 작가 등록 */
    public void authorEnroll(AuthorVO author) throws Exception;
    
	/* 작가 목록 */
    public List<AuthorVO> authorGetList(Criteria criteria) throws Exception;
    
    /* 작가 총 수 */
    public int authorGetTotal(Criteria criteria) throws Exception;
    
	/* 작가상세 */
    public AuthorVO authorGetDetail(int authorId) throws Exception;
    
	/* 작가정보수정 */
    public int authorModify(AuthorVO author) throws Exception;
}
