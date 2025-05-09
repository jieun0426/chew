package com.mbc.chew.review;

import java.util.ArrayList;

import com.mbc.chew.store.StoreDTO;

public interface ReviewService {

	void insertReview(ReviewDTO dto);

	ArrayList<ReviewDTO> reviewout(int storecode);
	
	Double getAverageStars(int storecode);

	ArrayList<ReviewDTO> getReviews(int storecode, int offset);

	void deleteReview(String id, int storecode);

	void updateReview(ReviewDTO dto);

//	ArrayList<ReviewManageDTO> getAllStoresWithReviewInfo();
//
//	int getReviewCountByStorecode(int storecode);
//
//	double getAverageRatingByStorecode(int storecode);

	

	 
	 

}
