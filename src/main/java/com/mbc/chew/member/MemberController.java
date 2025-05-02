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

//		@RequestMapping(value="/memberupdate",method = RequestMethod.GET)
//		public String memberGetForm(@RequestParam("id")String id,Model m) {
//			try {    //수정할 회원 정보 조회
//				MemberDTO dto = sqls.selectOne("com.mbc.chew.member.member.findmembers",id);
//				 if (dto == null) {
//		                m.addAttribute("errorMessage", "수정할 회원을 찾을 수 없습니다.");
//		               
//		                return "redirect:/members";
//				 	}
//				 		m.addAttribute("dto",dto);
//				 		return "memberedit";
//				
//			}catch (Exception e) {
//				// TODO: handle exception
//				e.printStackTrace();
//				m.addAttribute("errorMessage", "수정 요청중 오류 발생");
//			}	
//				return "redirect:/members";
//			}
//		
//		
//		 @RequestMapping(value = "/memberupdate", method = RequestMethod.POST)
//		    public String memberPostForm(MemberDTO dto, RedirectAttributes redirectAttributes) {
//		        try {
//		            int result = sqls.update("com.mbc.chew.member.member.memberupdate", dto);
//		            if (result > 0) {
//		                redirectAttributes.addFlashAttribute("successMessage", "회원 정보가 수정되었습니다.");
//		            } else {
//		                redirectAttributes.addFlashAttribute("errorMessage", "정보 수정에 실패했습니다.");
//		            }
//		        } catch (Exception e) {
//		            e.printStackTrace();
//		            redirectAttri	butes.addFlashAttribute("errorMessage", "수정처리 중 오류 발생");
//		        }
//		        return "redirect:/members";
//		    }///////////////////////

		 
	    @RequestMapping(value = "/memberdelete", method = RequestMethod.POST)
	    public String memberDelete(@RequestParam("id") String id, RedirectAttributes redirectAttributes) {
	        try {
	            int result = sqls.delete("com.mbc.chew.member.member.memberdelete", id);
	            if (result > 0) {
	                redirectAttributes.addFlashAttribute("successMessage", "회원 정보가 삭제되었습니다.");
	            } else {
	                redirectAttributes.addFlashAttribute("errorMessage", "정보삭제에 실패했습니다.");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            redirectAttributes.addFlashAttribute("errorMessage", "정보삭제처리 중 오류 발생");
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




