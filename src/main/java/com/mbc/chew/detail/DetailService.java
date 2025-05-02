package com.mbc.chew.detail;

import java.util.ArrayList;

public interface DetailService {

	DetailDTO dout1(String code);

	/* 페이징 처리 */
	ArrayList<DetailDTO> paging(int start, int end);
	
	int countAllRecords();
	
	/* 검색*/
	int countSearchRecords(String search);
	
	ArrayList<DetailDTO> searchPaging(int start, int end, String search);
	/* 검색 끝*/
	
	/* 페이징 처리 끝*/
}
