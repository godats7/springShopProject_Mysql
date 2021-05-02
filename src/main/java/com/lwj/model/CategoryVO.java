package com.lwj.model;

public class CategoryVO {
	
	/* 카테고리 등급 */
	private int tier;
	
	/* 카테고리 이름 */
	private String catName;
	
	/* 카테고리 넘버 */
	private String catCode;
	
	/* 상위 카테고리 */
	private String catParent;

	public int getTier() {
		return tier;
	}

	public void setTier(int tier) {
		this.tier = tier;
	}

	public String getCatName() {
		return catName;
	}

	public void setCatName(String catName) {
		this.catName = catName;
	}

	public String getCatCode() {
		return catCode;
	}

	public void setCatCode(String catCode) {
		this.catCode = catCode;
	}

	public String getCatParent() {
		return catParent;
	}

	public void setCatParent(String catParent) {
		this.catParent = catParent;
	}

	@Override
	public String toString() {
		return "CategoryVO [tier=" + tier + ", catName=" + catName + ", catCode=" + catCode + ", catParent=" + catParent
				+ "]";
	}
	
	
	
	

}
