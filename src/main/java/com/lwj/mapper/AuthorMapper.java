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

	/* 작가상세 */
    public AuthorVO authorGetDetail(int authorId);
    
	/* 작가 정보 수정 */
    public int authorModify(AuthorVO author);
    
    /* 작가 정보 삭제 */
	public int authorDelete(int authorId);

}
