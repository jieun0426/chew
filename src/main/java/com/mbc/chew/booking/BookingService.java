package com.mbc.chew.booking;

import java.util.Date;

import org.apache.ibatis.annotations.Param;

public interface BookingService {

	void insertbook(int tablenum, int storecode, String id, int saramsu, String state, Date bookingdate,
			String bookingtime);


	int countuserdup(@Param("storecode")int storecode, @Param("id") String id, @Param("bookingdate") Date bookingdate,@Param("bookingtime") String bookingtime,@Param("bookingmin") int bookingmin);   //해당 사용자 두시간내 중첩예약 안됨

	int countstoredup(@Param("storecode") int storecode,@Param("bookingdate") Date bookingdate,@Param("bookingtime") String bookingtime,@Param("bookingmin") int bookingmin); //다른 사용자도 예약시간 기준2시간 까지 예약안됨
}
