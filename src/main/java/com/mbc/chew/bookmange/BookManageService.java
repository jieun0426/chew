package com.mbc.chew.bookmange;

import java.util.List;
import java.util.Map;

public interface BookManageService {

	int countAllBookings();

	List<Map<String, Object>> pagingBookings(int start, int end);

	void updateBooking(BookingDTO dto);

	int countBookingsById(String search);

	List<Map<String, Object>> pagingBookingsById(String search, int start, int end);

	Map<String, Object> select05077(Map<String, Object> params);

}
