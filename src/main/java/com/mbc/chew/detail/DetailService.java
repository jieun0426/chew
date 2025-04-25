package com.mbc.chew.detail;

import java.util.ArrayList;

public interface DetailService {

	ArrayList<DetailDTO> resout();

	DetailDTO dout1(String code);

	/* 페이징 처리 */
	ArrayList<DetailDTO> paging(int start, int end);

	int countAllRecords();
	/* 페이징 처리 끝*/
}
