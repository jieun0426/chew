package com.mbc.chew.store;

import java.util.ArrayList;

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





}
