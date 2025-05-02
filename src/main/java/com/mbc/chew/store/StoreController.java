package com.mbc.chew.store;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.apache.jasper.tagplugins.jstl.core.ForEach;
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
	String path="C:\\MBC12AI\\spring\\chewtopia\\src\\main\\webapp\\image";

	
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
		int cntPerPage=10; //한 페이지에 나타낼 레코드 수
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
		m.addAttribute("dto",dto);
		return "storedeleteview";
	
	}
	@RequestMapping(value ="/delete",method = RequestMethod.POST)
	public String delete(HttpServletRequest request)
	{
		int storecode   = Integer.parseInt(request.getParameter("storecode"));
		String img 		= request.getParameter("storeimage");
		StoreService ss = sqls.getMapper(StoreService.class);
		ss.delete(storecode);
		File ff 	 	= new File(path+"\\"+img);	
		ff.delete();
		return "redirect:/sout";
	}
	@RequestMapping(value ="/smodify")
	public String ff(HttpServletRequest request,Model m)
	{
		int storecode    = Integer.parseInt(request.getParameter("storecode"));
		StoreService ss  = sqls.getMapper(StoreService.class);
		StoreDTO dto 	 = ss.modify(storecode);
		m.addAttribute("dto",dto);
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
		MultipartFile mf 	 = mul.getFile("storeimage");
		StoreService ss 	 = sqls.getMapper(StoreService.class);
		if(mf.isEmpty()) { 
			ss.updatemodi1(storecode,storename,storeaddress,storecategory,storearea);
		}
		else {
			String fname = mf.getOriginalFilename();
			UUID uu 	 = UUID.randomUUID();
			fname		 = uu.toString()+"_"+fname;
	
			mf.transferTo(new File(path+"\\"+fname));
			ss.updatemodi2(storecode,storename,storeaddress,storecategory,storearea,fname);
		}
		return "redirect:/sout";
	}
	
	@RequestMapping(value="storemanage_detail")
	public String hh(HttpServletRequest request,Model m) {
		int num=Integer.parseInt(request.getParameter("num"));
		StoreService ss = sqls.getMapper(StoreService.class);
		StoreDTO dto= ss.selectOne(num);
		m.addAttribute("dto", dto);
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
		int cntPerPage=5; //한 페이지에 나타낼 레코드 수
		
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