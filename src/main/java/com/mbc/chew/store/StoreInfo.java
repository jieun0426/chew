package com.mbc.chew.store;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

public class StoreInfo {

	@RequestMapping("/detail")
	public String storeDetail(@RequestParam("storecode") int storecode, Model model) {
	    StoreDTO storeInfo = StoreService.getstoreInfo(storecode);

	    if (storeInfo != null) {
	        model.addAttribute("storeInfo", storeInfo);
	    } else {
	        return "errorPage";
	    }
	    return "storedetail";
	}
}