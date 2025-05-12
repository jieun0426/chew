package com.mbc.chew.detail;

import java.util.ArrayList;

public interface DetailService {

	DetailDTO dout1(String code);

	ArrayList<DetailDTO> paging(int start, int end);
	
	int countAllRecords();
	
	int countSearchRecords(String search);
	
	ArrayList<DetailDTO> searchPaging(int start, int end, String search);

}
