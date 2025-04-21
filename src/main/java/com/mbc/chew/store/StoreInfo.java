package com.mbc.chew.store;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

public class StoreInfo {

	@RequestMapping("/detail")
	public String storeDetail(@RequestParam("storecode") int storecode, Model model) {
	    // storeService를 이용해 DB에서 storecode에 해당하는 가게 정보 조회
	    StoreDTO storeInfo = StoreService.getstoreInfo(storecode); // 이 메소드는 직접 구현 필요

	    if (storeInfo != null) {
	        model.addAttribute("storeInfo", storeInfo); // 모델에 가게 정보 추가
	    } else {
	        // 가게 정보가 없을 경우 처리 (예: 에러 페이지 이동)
	        return "errorPage";
	    }
	    return "storedetail"; // storeDetail.jsp 와 같은 View 이름 반환
	}
}