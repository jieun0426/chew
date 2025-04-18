package com.mbc.chew.review;

import java.util.ArrayList;

public interface ReviewService {

	void insertReview(ReviewDTO dto);

	ArrayList<ReviewDTO> reviewout(int storecode);

	
	 

}
