package com.mbc.chew.store;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class StoreController {
	@Autowired
	SqlSession sqls;
	String path="C:\\MBC12AI\\spring\\chew\\src\\main\\webapp\\image";

	
	@RequestMapping(value="/storein")
		public String storein()
	{
			return"storeinput";
	}
	
	@RequestMapping(value="/storesave", method = RequestMethod.POST)
	public String storesave(MultipartHttpServletRequest mul) throws IllegalStateException, IOException
	{
		
		int storecode         = Integer.parseInt(mul.getParameter("storecode"));
		String storename      = mul.getParameter("storename");
		String storeaddress   = mul.getParameter("storeaddress");
		String storecategory  = mul.getParameter("storecategory");
		String storearea	  = mul.getParameter("storearea");
		
		
		List<MultipartFile> files = mul.getFiles("storeimage");
		StoreService ss 	 = sqls.getMapper(StoreService.class);
		StringBuilder fn	  = new StringBuilder();
	
		for (MultipartFile mf : files) {
			if(!mf.isEmpty()) {
			String fname		 = mf.getOriginalFilename();
			UUID uu = UUID.randomUUID();
			fname= uu.toString()+"_"+fname;
			mf.transferTo(new File(path+"\\"+fname));
			fn.append(fname).append(",");
			}
		}
		if (fn.length()>0) {
			fn.setLength(fn.length()-1);
		}
		
		ss.insertstore(storecode,storename,storeaddress,storecategory,storearea,fn.toString());
		return "redirect:/sout";
	}
	
	@RequestMapping(value ="/sout")
	public String storeout(HttpServletRequest request,Model m)
	{
		int nowPage;
		try {
			nowPage=Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			nowPage=1;
		}
		int cntPerPage=10; //�븳 �럹�씠吏��뿉 �굹���궪 �젅肄붾뱶 �닔
		StoreService ss = sqls.getMapper(StoreService.class);
		int total=ss.countAllRecords();
		PageDTO pdto=new PageDTO(total, nowPage, cntPerPage);
		
		//ArrayList<StoreDTO>list = ss.outstore();
		
		ArrayList<StoreDTO> list = ss.paging(pdto.getStart(), pdto.getEnd());
		m.addAttribute("list",list);
		m.addAttribute("pdto", pdto);
		return "storeout";
	}
	@RequestMapping(value ="/sdelete")
	public String storedelete(HttpServletRequest request,Model m)
	{
		int storecode        = Integer.parseInt(request.getParameter("storecode"));
		StoreService ss  	 = sqls.getMapper(StoreService.class);
		StoreDTO dto 	  	 = ss.storedelete(storecode);
		StoreImageDTO oneImage = ss.selectOneDetailImage(storecode);  // 상세 이미지 1장 가져오기
	      m.addAttribute("dto",dto);
	      m.addAttribute("oneImage", oneImage);  // 모델에 이미지 추가
	      return "storedeleteview";
	
	}
	@RequestMapping(value ="/delete",method = RequestMethod.POST)
	public String delete(HttpServletRequest request)
	{
		int storecode   = Integer.parseInt(request.getParameter("storecode"));
		String img 		= request.getParameter("storeimage");
		StoreService ss = sqls.getMapper(StoreService.class);
		// 1. 리뷰 삭제
	       ss.deleteReviewsByStorecode(storecode);
	       
	       //2. 예약 삭제
	       ss.deleteReservationsByStorecode(storecode);
	       
	       //
	       ss.deletelikesByStorecode(storecode);

	       // 3. 상세 이미지 파일 삭제 + DB 삭제
	       List<StoreImageDTO> detailImages = ss.detailImages(storecode);
	       for (StoreImageDTO image : detailImages) {
	           File detailImg = new File(path + File.separator + image.getImage_filename());
	           if (detailImg.exists()) detailImg.delete();
	       }
	       ss.deleteDetailImages(storecode); 

	       // 4. 메인 이미지 파일 삭제
	       File mainImg = new File(path + File.separator + img);
	       if (mainImg.exists()) mainImg.delete();

	       // 5. 가게 정보 삭제
	       ss.delete(storecode);

	       return "redirect:/sout";

	}

	
	@RequestMapping(value ="/smodify")
	public String ff(HttpServletRequest request,Model m)
	{
		int storecode    = Integer.parseInt(request.getParameter("storecode"));
		StoreService ss  = sqls.getMapper(StoreService.class);
		StoreDTO dto 	 = ss.modify(storecode);
		List<StoreImageDTO> images = ss.detailImages(storecode);
	    m.addAttribute("dto",dto);
	    m.addAttribute("images", images);

		return "storemodifyview";
	}
	
	@RequestMapping(value="modify")
	public String gg(MultipartHttpServletRequest mul) throws IllegalStateException, IOException
	{
		int storecode   	 = Integer.parseInt(mul.getParameter("storecode"));
		String storename     = mul.getParameter("storename");
		String storeaddress  = mul.getParameter("storeaddress");
		String storecategory = mul.getParameter("storecategory");
		String storearea	 = mul.getParameter("storearea");
		// 메인 이미지 처리
	    MultipartFile mf = mul.getFile("storeimage");
	    StoreService ss = sqls.getMapper(StoreService.class);

	    if (mf.isEmpty()) {
	    	ss.updatemodi1(storecode, storename, storeaddress, storecategory, storearea);
	    } else {
	    	String fname = mf.getOriginalFilename();
	    	UUID uu = UUID.randomUUID();
	    	fname = uu.toString() + "_" + fname;

	    	mf.transferTo(new File(path + File.separator + fname));
	    	ss.updatemodi2(storecode, storename, storeaddress, storecategory, storearea, fname);
	    }
	       
       // 상세 이미지 수정 처리 (최대 4개 이미지 중 수정된 부분만 처리)
          for (int i = 0; i < 4; i++) {
              MultipartFile detailFile = mul.getFile("storeimage" + i);
              if (detailFile != null && !detailFile.isEmpty()) {
                  // 기존 이미지 filename을 폼에서 전달받음
                  String oldFilename = mul.getParameter("oldFilename" + i);
   
                  // 새 파일 이름 생성
                  String newFilename = UUID.randomUUID() + "_" + detailFile.getOriginalFilename();
                  detailFile.transferTo(new File(path + File.separator + newFilename));
   
                  if (oldFilename != null && !oldFilename.isEmpty()) {
                      // 기존 이미지가 있으면 update
                      ss.updateDetailImage(storecode, newFilename, oldFilename);
                  } else {
                      // 기존 이미지가 없으면 insert
                      ss.insertDetailImage(storecode, newFilename);
                  }
              }
          }
         
       return "redirect:/sout";
	}

	
	@RequestMapping(value="storemanage_detail")
	public String hh(HttpServletRequest request,Model m) {
		int num=Integer.parseInt(request.getParameter("num"));
		
		StoreService ss = sqls.getMapper(StoreService.class);
		StoreDTO dto= ss.selectOne(num);
		List<StoreImageDTO> images = ss.detailImages(num);
		
		m.addAttribute("dto", dto);
		m.addAttribute("images", images);
		
		return "storemanage_detail";

	}
	
	@RequestMapping(value="storemanage_search")
	public String hh2(HttpServletRequest request,Model m) {
		int nowPage;
		try {
			nowPage=Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			nowPage=1;
		}
		int cntPerPage=5; //�븳 �럹�씠吏��뿉 �굹���궪 �젅肄붾뱶 �닔
		
		String search=request.getParameter("search");
		StoreService ss = sqls.getMapper(StoreService.class);
		int total=ss.countSearchRecords(search);
		PageDTO pdto=new PageDTO(total, nowPage, cntPerPage);
		
		ArrayList<StoreDTO> list = ss.searchList(pdto.getStart(), pdto.getEnd(),search);
		m.addAttribute("list",list);
		m.addAttribute("pdto", pdto);
		m.addAttribute("search", search);
		return "storemanage_search";
	}
	
	@Transactional
	@ResponseBody
	@RequestMapping("/deleteSelectedItems")
	public String deleteSelectedItems(@RequestParam("ids") String ids) {
	    // 콤마로 구분된 문자열을 List<String>으로 변환
	    List<String> idList = Arrays.asList(ids.split(","));
	    StoreService ss = sqls.getMapper(StoreService.class);
	    
	    // 각 id에 대해 삭제 작업 수행
	    for (String id : idList) {
	    	try {
	    		int code = Integer.parseInt(id);
		        StoreDTO sdto = ss.selectOne(code);
		        if (sdto == null) continue;
		        System.out.println(code);
		        String image = sdto.getStoreimage();
		        System.out.println(image);
		        File ff = new File("C:\\MBC12AI\\spring\\chewtopia\\src\\main\\webapp\\image\\" + image);
		        ff.delete();
		         
		        
		        ss.deleteFromReview(code);
		        System.out.println("deleteFromReview");
		        
		        ss.deleteFromBooking(code);
		        System.out.println("deleteFromBooking");
		        
		        ss.deleteFromImage(code);
		        System.out.println("deleteFromImage");
		        
		        ss.deleteFromLikes(code);
		        System.out.println("deleteFromLikes");
		        
		        ss.deleteFromStore(code);
		        System.out.println("deleteFromStore");
		        
	    	}catch (Exception e) {
	    		System.out.println("예외 발생: " + e.getMessage());
	    	    e.printStackTrace(System.out);  // 확실하게 출력
	    	    return "삭제 중 오류가 발생했습니다. 관리자에게 문의하세요.";
	    	}
	        
	    }

	    return "ok";
	}
}