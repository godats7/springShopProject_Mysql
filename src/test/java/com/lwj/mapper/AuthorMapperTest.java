package com.lwj.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.lwj.model.AuthorVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class AuthorMapperTest {

	@Autowired
    private AuthorMapper mapper;
    
    /* 작가 등록 테스트 */
    @Test
    public void authorEnroll() throws Exception{
        
        AuthorVO author = new AuthorVO();
        
        author.setGenreId("01");
        author.setAuthorName("테스트");
        author.setAuthorIntro("테스트 소개");
        
        mapper.authorEnroll(author);
        
    }   
}
