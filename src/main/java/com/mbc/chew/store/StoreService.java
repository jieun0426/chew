package com.mbc.chew.store;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface StoreService {

	void insertstore(int storecode, String storename, String storeaddress, String storecategory,
			String storearea, String fname);

	ArrayList<StoreDTO> outstore();

	StoreDTO storedelete(int storecode);

	void delete(int storecode);
	
	StoreDTO modify(int storecode);

	void updatemodi1(int storecode, String storename, String storeaddress, String storecategory, 
			String storearea);

	void updatemodi2(int storecode, String storename, String storeaddress, String storecategory, 
			String storearea, String fname);

	static StoreDTO getstoreInfo(int storecode) {
		return null;
	}

	StoreDTO selectOne(int num);

	/* 페이징 처리 */
	ArrayList<StoreDTO> paging(int start, int end);

	int countAllRecords();
	/* 페이징 처리 끝 */

	/* 검색 */
	int countSearchRecords(String search);

	ArrayList<StoreDTO> searchList(int start, int end, String search);
	/* 검색 끝 */

	void deleteFromReview(@Param("code") int code);

	void deleteFromLikes(@Param("code") int code);

	void deleteFromBooking(@Param("code") int code);

	void deleteFromImage(@Param("code") int code);

	void deleteFromStore(@Param("code") int code);
}
