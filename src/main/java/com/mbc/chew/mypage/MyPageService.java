package com.mbc.chew.mypage;


import java.sql.Date;
import java.util.List;
import java.util.Map;

import com.mbc.chew.detail.DetailDTO;
import com.mbc.chew.joinlogin.JoinLogDTO;
import com.mbc.chew.review.ReviewDTO;

public interface MyPageService {


	JoinLogDTO getUserById(String id);

	JoinLogDTO mymodify0423(String id);

	void mymodify042322(String name, String phone, Date birth, String id);

	JoinLogDTO delsave0424(String id);

	void deleteUserById0424(String id);


	List<DetailDTO> detailid0425(String id);


	int countUserReviews(String id);

	List<Map<String, Object>> pagingUserReviews(String id, int start, int end);


	List<Map<String, Object>> pagingUserBook(String id);

	void deleteUserBookings(String id);

	void deleteUserReviews(String id);

	void deleteUserLikes(String id);






}
