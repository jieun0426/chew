package com.mbc.chew.likes;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/like")
public class LikesController {

    @Autowired
    private SqlSession sqlSession;

    @RequestMapping(value = "/toggle", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public Map<String, Object> toggleLike(@RequestBody Map<String, Integer> request, HttpSession session) {

        Integer storecode = request.get("storecode");
        String memberId = (String) session.getAttribute("id");

        Map<String, Object> result = new HashMap<>();
        if (memberId == null) {
            result.put("success", false);
            result.put("message", "로그인이 필요합니다.");
            return result;
        }

        LikesService ls = sqlSession.getMapper(LikesService.class);
        LikesDTO ldto = new LikesDTO(memberId, storecode);

        boolean liked;
        try {
            // ✅ 여기 수정됨! boolean → int → boolean 비교
            if (ls.isLiked(ldto) > 0) {
                ls.deleteLike(ldto);  // 좋아요 취소
                liked = false;
            } else {
                ls.insertLike(ldto);  // 좋아요 추가
                liked = true;
            }
            result.put("success", true);
            result.put("liked", liked);
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", "처리 중 오류 발생: " + e.getMessage());
        }

        return result;
    }
    
    @RequestMapping(value = "/check", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public Map<String, Object> checkLike(@RequestBody Map<String, Integer> request, HttpSession session) {
        Integer storecode = request.get("storecode");
        String memberId = (String) session.getAttribute("id");

        Map<String, Object> result = new HashMap<>();
        if (memberId == null) {
            result.put("success", false);
            result.put("liked", false);
            return result;
        }

        LikesService ls = sqlSession.getMapper(LikesService.class);
        LikesDTO ldto = new LikesDTO(memberId, storecode);

        try {
            result.put("success", true);
            result.put("liked", ls.isLiked(ldto) > 0);
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", "조회 실패: " + e.getMessage());
        }

        return result;
    }

    
    
    
}
