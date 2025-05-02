package com.mbc.chew.faq;

import java.util.ArrayList;

public interface FAQService {

	int countAllRecords();

	ArrayList<FAQDTO> paging(int start, int end);

	void insertFAQ(String id, String title, String content, int secret);

	int countMyFAQ(String id);

	ArrayList<FAQDTO> myPagingList(int start, int end, String id);

}
