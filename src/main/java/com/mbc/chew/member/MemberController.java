package com.mbc.chew.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
			e.printStackTrace();
			m.addAttribute("errorMessage","오류발생");
		}
			return "memberlist";
		}//

    @RequestMapping(value = "/memberdelete", method = RequestMethod.POST)
    public String memberDelete(@RequestParam("id") String id, RedirectAttributes redirectAttributes) {
    	try {
        	int result = sqls.delete("com.mbc.chew.member.member.memberdelete", id);
            if (result > 0) {
                redirectAttributes.addFlashAttribute("successMessage", "회원정보가 삭제되었습니다.");
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

    // ID null값 감지 추가 해봄
    @RequestMapping(value = "/memberedit", method = RequestMethod.GET)
    public String memberEdit(@RequestParam("id") String id, Model m) {
        System.out.println("수정 요청 ID: " + id); // 로그 추가
        try {
            MemberDTO dto = sqls.selectOne("com.mbc.chew.member.member.findmembers", id);
            System.out.println("조회 결과: " + dto); // 로그 추가
            m.addAttribute("dto", dto);
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("errorMessage", "회원 정보 조회 중 오류 발생");
        }
        return "memberedit";
    }

    //자체적으로 edit 에서 회원정보수정
    @RequestMapping(value = "/memberupdate", method = RequestMethod.POST)
    public String memberUpdate(MemberDTO dto, RedirectAttributes rd) {
        try {
            int result = sqls.update("com.mbc.chew.member.member.memberupdate", dto);
            if (result > 0) {
                rd.addFlashAttribute("successMessage", "회원 정보가 수정되었습니다.");
            } else {
                rd.addFlashAttribute("errorMessage", "회원 정보 수정에 실패했습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            rd.addFlashAttribute("errorMessage", "회원 정보 수정 중 오류 발생");
        }
        return "redirect:/members";
    }

}

