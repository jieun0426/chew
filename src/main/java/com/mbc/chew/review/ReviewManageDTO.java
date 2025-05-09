package com.mbc.chew.review;

public class ReviewManageDTO {
	
	 int storecode;
	 String storename;
	 int reviewCount;
	 double averageRating;
	public int getStorecode() {
		return storecode;
	}
	public void setStorecode(int storecode) {
		this.storecode = storecode;
	}
	public String getStorename() {
		return storename;
	}
	public void setStorename(String storename) {
		this.storename = storename;
	}
	public int getReviewCount() {
		return reviewCount;
	}
	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}
	public double getAverageRating() {
		return averageRating;
	}
	public void setAverageRating(double averageRating) {
		this.averageRating = averageRating;
	}
	 
	 
	

}
