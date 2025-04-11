package com.mbc.chew.review;

import java.sql.Date;

public interface ReviewService {

	void insertreview(int tablenum, int storecode, String id, int saramsu, String state, Date bookingdate,
			Date bookingtime);

}
