package com.mbc.chew.store;

import java.util.ArrayList;
import java.util.List;

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

	int countSearchRecords(String search);

	ArrayList<StoreDTO> searchList(int start, int end, String search);
	/* 검색 끝 */

	void deleteFromReview(@Param("code") int code);

	void deleteFromLikes(@Param("code") int code);

	void deleteFromBooking(@Param("code") int code);

	void deleteFromImage(@Param("code") int code);

	void deleteFromStore(@Param("code") int code);

	/* 寃��깋 �걹 */

	List<StoreImageDTO> detailImages(int storecode);

	/*void deleteDetailImages(@Param("storecode") int storecode);
    
	void insertDetailImage(@Param("storecode") int storecode, @Param("filename") String filename);*/

	void updateDetailImage(@Param("storecode") int storecode, @Param("newFilename") String newFilename, @Param("oldFilename") String oldFilename);

	void insertDetailImage(@Param("storecode") int storecode, @Param("filename") String filename);

	StoreImageDTO selectOneDetailImage(int storecode);

	void deleteReviewsByStorecode(int storecode);

	void deleteDetailImages(int storecode);

	void deleteReservationsByStorecode(int storecode);

	void deletelikesByStorecode(int storecode);

}
