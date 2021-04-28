package com.lwj.model;

import java.util.Date;

public class AuthorVO {

	/* 작가 아이디 */
    private int authorId;
    
    /* 작가 이름 */
    private String authorName;
    
    /* 장르 id */
    private String genreId;
    
    /* 작가 장르 */
    private String genreName;
    
    /* 작가 소개 */
    private String authorIntro;
    
    /*등록 날짜*/
    private Date regDate;
    
    /* 수정 날짜 */
    private Date updateDate;

	public int getAuthorId() {
		return authorId;
	}

	public void setAuthorId(int authorId) {
		this.authorId = authorId;
	}

	public String getAuthorName() {
		return authorName;
	}

	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}

	public String getGenreId() {
		return genreId;
	}

	public void setGenreId(String genreId) {
		this.genreId = genreId;
		if(genreId.equals("01")) {
			this.genreName = "귀여운";
		} else if(genreId.equals("02")) {
			this.genreName = "신비로운";
		} else if(genreId.equals("03")) {
			this.genreName = "웅장한";
		} else if(genreId.equals("04")) {
			this.genreName = "무서운";
		} else if(genreId.equals("05")) {
			this.genreName = "자연의";
		} else if(genreId.equals("06")) {
			this.genreName = "우주의";
		}
	}

	public String getGenreName() {
		return genreName;
	}

	public void setGenreName(String genreName) {
		this.genreName = genreName;
	}

	public String getAuthorIntro() {
		return authorIntro;
	}

	public void setAuthorIntro(String authorIntro) {
		this.authorIntro = authorIntro;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	@Override
	public String toString() {
		return "AuthorVO [authorId=" + authorId + ", authorName=" + authorName + ", genreId=" + genreId + ", genreName="
				+ genreName + ", authorIntro=" + authorIntro + ", regDate=" + regDate + ", updateDate=" + updateDate
				+ "]";
	}

    
	
    
    
    
	
}
