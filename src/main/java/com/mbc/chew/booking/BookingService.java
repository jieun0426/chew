package com.mbc.chew.booking;

import java.util.Date;

public interface BookingService {

	void insertbook(int tablenum, int storecode, String id, int saramsu, String state, Date bookingdate,
			Date bookingtime);

}
