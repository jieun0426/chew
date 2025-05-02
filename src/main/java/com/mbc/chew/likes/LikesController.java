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
            if (ls.isLiked(ldto) > 0) {
                // 이미 좋아요 했으면 취소
                ls.deleteLike(ldto);              // 좋아요 기록 삭제
                ls.decreaseLikes(storecode);      // 좋아요 수 -1
                liked = false;
            } else {
                // 좋아요 안한 상태면 추가
                ls.insertLike(ldto);              // 좋아요 기록 추가
                ls.increaseLikes(storecode);      // 좋아요 수 +1
                liked = true;
            }

            // store_3 테이블에서 좋아요 수 가져오기
            int updatedLikesCount = ls.getLikesCountFromStore3(storecode); // store_3에서 좋아요 수 가져오기
            result.put("success", true);
            result.put("liked", liked);
            result.put("storelikes", updatedLikesCount);  // 최신 좋아요 수 반환
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
            // store_3 테이블에서 좋아요 수 가져오기
            int storeLikes = ls.getLikesCountFromStore3(storecode);
            
            result.put("success", true);
            result.put("liked", ls.isLiked(ldto) > 0);
            result.put("storelikes", storeLikes);  // 좋아요 수 반환
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", "조회 실패: " + e.getMessage());
        }

        return result;
    }


}
