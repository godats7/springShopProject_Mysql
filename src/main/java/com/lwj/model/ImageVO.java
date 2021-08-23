package com.lwj.model;

import java.util.Date;
import java.util.List;

public class ImageVO {

	/* 상품 id */
	private int imageId;
	
	/* 상품 이름 */
	private String imageName;
	
	/* 작가 id */
	private int authorId;
	
	/* 작가 이름 */
	private String authorName;
	
	/* 출판일 */
	private String publeYear;
	
	/* 출판사 */
	private String publisher;
	
	/* 카테고리 코드 */
	private String catCode;
	
	/* 카테고리 이름 */
	private String catName;
	
	/* 상품 가격 */
	private int imagePrice;
	
	/* 상품 재고 */
	private int imageStock;
	
	/* 상품 할인률(백분율) */
	private double imageDiscount;
	
	/* 상품 소개 */
	private String imageIntro;
	
	/* 상품 목차 */
	private String imageContents;
	
	/* 등록 날짜 */
	private Date regDate;
	
	/* 수정 날짜 */
	private Date updateDate;

	/* 이미지 정보*/
	private List<AttachImageVO> imageList;

	public int getImageId() {
		return imageId;
	}

	public void setImageId(int imageId) {
		this.imageId = imageId;
	}

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

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

	public String getPubleYear() {
		return publeYear;
	}

	public void setPubleYear(String publeYear) {
		this.publeYear = publeYear;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getCatCode() {
		return catCode;
	}

	public void setCatCode(String catCode) {
		this.catCode = catCode;
	}

	public String getCatName() {
		return catName;
	}

	public void setCatName(String catName) {
		this.catName = catName;
	}

	public int getImagePrice() {
		return imagePrice;
	}

	public void setImagePrice(int imagePrice) {
		this.imagePrice = imagePrice;
	}

	public int getImageStock() {
		return imageStock;
	}

	public void setImageStock(int imageStock) {
		this.imageStock = imageStock;
	}

	public double getImageDiscount() {
		return imageDiscount;
	}

	public void setImageDiscount(double imageDiscount) {
		this.imageDiscount = imageDiscount;
	}

	public String getImageIntro() {
		return imageIntro;
	}

	public void setImageIntro(String imageIntro) {
		this.imageIntro = imageIntro;
	}

	public String getImageContents() {
		return imageContents;
	}

	public void setImageContents(String imageContents) {
		this.imageContents = imageContents;
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

	public List<AttachImageVO> getImageList() {
		return imageList;
	}

	public void setImageList(List<AttachImageVO> imageList) {
		this.imageList = imageList;
	}

	@Override
	public String toString() {
		return "ImageVO [imageId=" + imageId + ", imageName=" + imageName + ", authorId=" + authorId + ", authorName="
				+ authorName + ", publeYear=" + publeYear + ", publisher=" + publisher + ", catCode=" + catCode
				+ ", catName=" + catName + ", imagePrice=" + imagePrice + ", imageStock=" + imageStock
				+ ", imageDiscount=" + imageDiscount + ", imageIntro=" + imageIntro + ", imageContents=" + imageContents
				+ ", regDate=" + regDate + ", updateDate=" + updateDate + ", imageList=" + imageList + "]";
	}

//	@Override
//	public String toString() {
//		return "ImageVO [imageId=" + imageId + ", imageName=" + imageName + ", authorId=" + authorId + ", authorName="
//				+ authorName + ", publeYear=" + publeYear + ", publisher=" + publisher + ", catCode=" + catCode
//				+ ", catName=" + catName + ", imagePrice=" + imagePrice + ", imageStock=" + imageStock
//				+ ", imageDiscount=" + imageDiscount + ", imageIntro=" + imageIntro + ", imageContents=" + imageContents
//				+ ", regDate=" + regDate + ", updateDate=" + updateDate + "]";
//	}
	
	
	
	
	
	
	
	
	
}
