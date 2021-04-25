package com.lwj.service;

import com.lwj.model.AuthorVO;

public interface AuthorService {

	/* 작가 등록 */
    public void authorEnroll(AuthorVO author) throws Exception;
}
