package com.mbc.chew.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class MemberController {
	@Autowired
	SqlSessionTemplate sqls;
	
		@RequestMapping(value = "/members", method = RequestMethod.GET)
		public String memberList(Model m) {
			try {
				List<MemberDTO> memberList = sqls.selectList("com.mbc.chew.member.member.allmembers");
				m.addAttribute("memberList", memberList);
				
			}catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				m.addAttribute("errorMessage","오류발생");
			}
				return "memberlist";
			}//////////////////////

		
	    @RequestMapping(value = "/memberdelete", method = RequestMethod.POST)
	    public String memberDelete(@RequestParam("id") String id, RedirectAttributes redirectAttributes) {
	        try {
	            int result = sqls.delete("com.mbc.chew.member.member.memberdelete", id);
	            if (result > 0) {
	                redirectAttributes.addFlashAttribute("successMessage", "ȸ�� ������ �����Ǿ����ϴ�.");
	            } else {
	                redirectAttributes.addFlashAttribute("errorMessage", "���������� �����߽��ϴ�.");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            redirectAttributes.addFlashAttribute("errorMessage", "��������ó�� �� ���� �߻�");
	        }
	        return "redirect:/members";
	    }
		
	    @RequestMapping(value = "/membersearch", method = RequestMethod.GET)
	    		@ResponseBody
	    		public List<MemberDTO> memberSearch(
	    		    @RequestParam("searchKey") String searchKey,
	    		    @RequestParam("searchValue") String searchValue) {
	    		    Map<String, Object> paramMap = new HashMap<>();
	    		    paramMap.put("searchKey", searchKey);
	    		    paramMap.put("searchValue", searchValue);
	    		    return sqls.selectList("com.mbc.chew.member.member.searchmembers", paramMap);
	    		}

}




