package com.mbc.chew.main;

public class MainDTO {
	int storecode;
	String storeimage;
	String storename;
	String storearea;
	String storecategory;
	Double stars;
	
	public MainDTO() {}

	public int getStorecode() {
		return storecode;
	}

	public void setStorecode(int storecode) {
		this.storecode = storecode;
	}

	public String getStoreimage() {
		return storeimage;
	}

	public void setStoreimage(String storeimage) {
		this.storeimage = storeimage;
	}

	public String getStorename() {
		return storename;
	}

	public void setStorename(String storename) {
		this.storename = storename;
	}

	public String getStorearea() {
		return storearea;
	}

	public void setStorearea(String storearea) {
		this.storearea = storearea;
	}

	public String getStorecategory() {
		return storecategory;
	}

	public void setStorecategory(String storecategory) {
		this.storecategory = storecategory;
	}

	public Double getStars() {
		return stars;
	}

	public void setStars(Double stars) {
		this.stars = stars;
	}

	@Override
	public String toString() {
		return "MainDTO [storecode=" + storecode + ", storeimage=" + storeimage + ", storename=" + storename
				+ ", storearea=" + storearea + ", storecategory=" + storecategory + ", stars=" + stars + "]";
	}

}
