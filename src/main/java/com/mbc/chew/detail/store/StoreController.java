package com.mbc.chew.detail.store;




import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class StoreController {

	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/store/{storecode}") //
	public String s1(@PathVariable int storecode,Model model) {
		StoreService ss = sqlSession.getMapper(StoreService.class);
		StoreDTO sdto = ss.getStoreByCode(storecode);
		model.addAttribute("sdto",sdto);
		return "detailview";
	}
	
	
	
}
