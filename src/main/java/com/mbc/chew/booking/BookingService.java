package com.mbc.chew.booking;

import java.util.Date;

import org.apache.ibatis.annotations.Param;

public interface BookingService {

	void insertbook(int tablenum, int storecode, String id, int saramsu, String state, Date bookingdate,
			String bookingtime);

	int countuserdup(@Param("storecode")int storecode, @Param("id") String id, @Param("bookingdate") Date bookingdate,@Param("bookingtime") String bookingtime,@Param("bookingmin") int bookingmin);   //�ش� ����� �νð��� ��ø���� �ȵ�

	int countstoredup(@Param("storecode") int storecode,@Param("bookingdate") Date bookingdate,@Param("bookingtime") String bookingtime,@Param("bookingmin") int bookingmin); //�ٸ� ����ڵ� ����ð� ����2�ð� ���� ����ȵ�
}
